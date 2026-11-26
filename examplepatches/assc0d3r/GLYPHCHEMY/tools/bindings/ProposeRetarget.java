import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Proposes replacement targets for the bindings a Gboard release does not contain.
 *
 * {@code BindingAudit} answers "what moved" with a short reason per target - the class is gone, the
 * name is gone, or "method exists as ()I". Turning those reasons into a new binding is the slow part:
 * it means finding the member again by shape in a 42k-class APK, feature by feature. This tool does
 * that search and prints its work, so the port becomes a review of ranked candidates instead of a
 * fresh investigation.
 *
 * Usage:
 *   java -cp "libs/morphe-cli.jar" tools/bindings/ProposeRetarget.java \
 *       <GboardVersionBindings.kt> <gboard.apk> [--min 0.38] [--top 4]
 *       [--emit-audit <file.kt>] [--emit-min 0.85]
 *
 * Candidate generation, strongest first. "owner affinity" means the old class either still exists
 * (so the member was renamed on it) or is the subject of a class hypothesis; a hypothesis is built
 * from the names of the *other* unresolved bindings on the same old class: a class that declares
 * several of them is almost certainly its successor, which is how a reviewer finds the new owner of
 * a renamed class without re-deriving the whole feature.
 *
 *   same class, same name, prototype changed ......... 0.45  (the audit's "exists as" hint: the
 *                                                      name survived, but this is a different
 *                                                      member - obfuscated names are reused, so it
 *                                                      is listed, never pasted)
 *   same class, same parameter types, renamed ........ 0.72
 *   hypothesised class, same name, same params ....... 0.80 x hypothesis score
 *   hypothesised class, same name .................... 0.68 x hypothesis score
 *   hypothesised class, same params .................. 0.58 x hypothesis score
 *   whole apk, same name and params .................. 0.74, or 0.60 when several classes match
 *   whole apk, same full descriptor .................. 0.62, or 0.45 when several match
 *   same class or whole apk, same arity only ......... 0.45 / 0.38
 *   field: same class, same name, type changed ....... 0.90 x survival, where survival is the
 *                                                      fraction of the class's expected members
 *                                                      that the new APK still declares
 *
 * Two things make a class-level rename tractable. A descriptor that exists but declares none of
 * the members the bindings expect is treated as a *reused* name, not a survivor, so nothing is
 * proposed against a stranger. A descriptor that keeps only one of five expected members is barely
 * better evidence than a stranger, so the same-class field tier is scaled by that fraction instead
 * of paying out its full 0.90 as soon as anything survives. And a class that a probable proposal
 * already located becomes a
 * successor for every other binding that expected the old class: its members are then searched by
 * shape alone (identical parameter types 0.72, same return and arity 0.55, same field type 0.60),
 * because the member names of a renamed class are reused short names and prove nothing.
 *
 * Every score is a ranking aid, not a conclusion: the tool cannot tell which overload of a renamed
 * member is the one a patch meant, and a candidate that is a real member of the APK will be reported
 * as resolved by {@code BindingAudit} whether or not it is the right one. Read the reason column,
 * check the shape against the patch that consumes the binding, then re-audit the emitted file.
 *
 * {@code --emit-audit} writes the top candidate of every target at or above {@code --emit-min} as an
 * audit file in the format {@code BindingAudit} parses, so the proposals can be re-checked with one
 * command before any of them is copied into GboardVersionBindings.kt.
 *
 * Exits 0 when the report was written (including when every target still has no candidate), and 2 on
 * a usage or parse error.
 */
public final class ProposeRetarget {

    private enum Kind { METHOD, FIELD, TYPE }

    private record Target(
            String name,
            Kind kind,
            String classType,
            String memberName,
            List<String> parameterTypes,
            String returnType,
            String fieldType) {

        String descriptor() {
            return switch (kind) {
                case METHOD -> classType + "->" + memberName
                        + "(" + String.join("", parameterTypes) + ")" + returnType;
                case FIELD -> classType + "->" + memberName + ":" + fieldType;
                case TYPE -> classType;
            };
        }
    }

    /** One declared member of the APK, kept only for names the bindings ask about. */
    private record Hit(
            String owner,
            String name,
            List<String> params,
            String ret,
            String fieldType,
            boolean isField) {

        String shape() {
            return isField ? ":" + fieldType : "(" + String.join("", params) + ")" + ret;
        }
    }

    private record Hypothesis(String owner, double score, int matched, int expected, String names) {}

    private record Candidate(
            Hit hit,
            double confidence,
            String reason) {}

    private record Proposal(Target target, String hint, List<Candidate> candidates) {}

    private static final Pattern ENTRY = Pattern.compile(
            "^\\s*val\\s+`([^`]+)`\\s*=\\s*(GboardMethodTarget|GboardFieldTarget|GboardTypeTarget)\\((.*)$");
    private static final Pattern CONSTANT = Pattern.compile("const val (\\w+) = \"([^\"]*)\"");

    private static final double SAME_CLASS_SAME_NAME = 0.45;
    private static final double SAME_CLASS_SAME_PARAMS = 0.72;
    private static final double SAME_CLASS_SAME_ARITY = 0.45;
    private static final double HYPOTHESIS_SAME_NAME = 0.68;
    private static final double HYPOTHESIS_SAME_PARAMS = 0.58;
    private static final double GLOBAL_SAME_NAME_SAME_PARAMS = 0.74;
    private static final double GLOBAL_SAME_DESCRIPTOR = 0.62;
    private static final double GLOBAL_SAME_NAME_SAME_ARITY = 0.38;
    private static final double GLOBAL_SAME_RETURN_AND_ARITY = 0.42;
    private static final double AMBIGUITY_PENALTY = 0.15;
    /** Full weight only when every expected member of the class survives; scaled by ownerSurvival. */
    private static final double FIELD_SAME_CLASS_SAME_NAME = 0.90;
    private static final double FIELD_SAME_CLASS_SAME_TYPE = 0.60;
    private static final double FIELD_HYPOTHESIS_SAME_NAME = 0.70;
    private static final double FIELD_GLOBAL_SAME_NAME_SAME_TYPE = 0.72;
    private static final double TYPE_HYPOTHESIS = 0.80;

    private static final String USAGE = "usage: ProposeRetarget <GboardVersionBindings.kt> <gboard.apk>"
            + " [--min <confidence>] [--top <n>] [--emit-audit <file.kt>] [--emit-min <confidence>]";

    public static void main(String[] args) throws Exception {
        List<String> positional = new ArrayList<>();
        // The weakest tier the header advertises. A higher default filters the arity-only
        // candidates out before they are ranked, so they can never be seen at all.
        double minConfidence = GLOBAL_SAME_NAME_SAME_ARITY;
        int top = 4;
        Path emitAudit = null;
        double emitMin = 0.85;
        for (int index = 0; index < args.length; index++) {
            switch (args[index]) {
                case "--min" -> minConfidence = number(args, ++index, "--min");
                case "--top" -> top = (int) number(args, ++index, "--top");
                case "--emit-min" -> emitMin = number(args, ++index, "--emit-min");
                case "--emit-audit" -> {
                    if (index + 1 >= args.length) {
                        System.err.println(USAGE);
                        System.exit(2);
                    }
                    emitAudit = Path.of(args[++index]);
                }
                default -> positional.add(args[index]);
            }
        }
        if (positional.size() != 2) {
            System.err.println(USAGE);
            System.exit(2);
        }
        Path bindingsFile = Path.of(positional.get(0));
        File apk = new File(positional.get(1));
        if (!Files.isRegularFile(bindingsFile)) {
            System.err.println("error: bindings file not found: " + bindingsFile);
            System.exit(2);
            return;
        }
        if (!apk.isFile()) {
            System.err.println("error: apk not found: " + apk);
            System.exit(2);
            return;
        }

        List<String> lines = Files.readAllLines(bindingsFile, StandardCharsets.UTF_8);
        Map<String, String> constants = new LinkedHashMap<>();
        for (String line : lines) {
            Matcher matcher = CONSTANT.matcher(line.trim());
            if (matcher.find()) constants.put(matcher.group(1), matcher.group(2));
        }
        List<Target> targets;
        try {
            targets = parseTargets(lines);
        } catch (IllegalStateException broken) {
            System.err.println("error: " + broken.getMessage());
            System.exit(2);
            return;
        }
        if (targets.isEmpty()) {
            System.err.println("error: " + bindingsFile + " declares no targets");
            System.exit(2);
            return;
        }

        Index index = loadIndex(apk, targets);
        Map<String, ClassDef> classes = index.classes();

        List<Target> unresolved = new ArrayList<>();
        Map<String, String> hints = new LinkedHashMap<>();
        for (Target target : targets) {
            String hint = hint(target, classes);
            if (hint != null) {
                unresolved.add(target);
                hints.put(target.name(), hint);
            }
        }

        Map<String, List<Hypothesis>> hypotheses = hypothesise(unresolved, index);
        // Obfuscated names are reused across releases: a class descriptor can be present in the new
        // APK and mean a completely different class. A name that declares none of the members the
        // bindings expect of it is treated as gone, so its bindings are searched for a successor
        // instead of being pointed at an unrelated class that merely took the name.
        Map<String, Boolean> ownerSurvives = new LinkedHashMap<>();
        Map<String, Double> ownerSurvival = new LinkedHashMap<>();
        List<String> reused = new ArrayList<>();
        Map<String, List<Target>> targetsByClass = new LinkedHashMap<>();
        for (Target target : unresolved) {
            targetsByClass.computeIfAbsent(target.classType(), key -> new ArrayList<>()).add(target);
        }
        targetsByClass.forEach((classType, members) -> {
            if (!classes.containsKey(classType)) {
                ownerSurvives.put(classType, false);
                return;
            }
            int present = 0;
            for (Target member : members) {
                if (member.kind() == Kind.TYPE) {
                    present++;
                    continue;
                }
                boolean found = index.byName().getOrDefault(member.memberName(), List.of()).stream()
                        .anyMatch(hit -> hit.owner().equals(classType)
                                && hit.isField() == (member.kind() == Kind.FIELD));
                if (found) present++;
            }
            ownerSurvives.put(classType, present > 0);
            // Present out of expected, not a boolean: one surviving member out of five says much
            // less than five out of five, and the field tier is weighted by that difference.
            ownerSurvival.put(classType, (double) present / Math.max(1, members.size()));
            boolean hasMemberExpectation = members.stream()
                    .anyMatch(member -> member.kind() != Kind.TYPE);
            if (present == 0 && hasMemberExpectation) {
                reused.add(classType + " (" + members.size() + " expected members)");
            }
        });

        List<Proposal> proposals = new ArrayList<>();
        for (Target target : unresolved) {
            List<Candidate> candidates = propose(
                    target,
                    hypotheses.getOrDefault(target.classType(), List.of()),
                    index,
                    minConfidence,
                    ownerSurvival.getOrDefault(target.classType(), 0.0));
            proposals.add(new Proposal(target, hints.get(target.name()), candidates));
        }

        // A class that a sibling already identified is the most useful thing this tool can carry
        // forward: once one member of Lqck; is proven to live on Lagyw;, the rest of that class's
        // bindings are worth looking for there by shape even though every name changed.
        Map<String, Successor> successors = confirmedSuccessors(proposals, ownerSurvives);
        List<Proposal> merged = new ArrayList<>();
        for (Proposal proposal : proposals) {
            Successor successor = successors.get(proposal.target().classType());
            if (successor == null) {
                merged.add(proposal);
                continue;
            }
            List<Candidate> candidates = new ArrayList<>(proposal.candidates());
            candidates.addAll(proposeInSuccessor(proposal.target(), successor, index));
            merged.add(new Proposal(proposal.target(), proposal.hint(), rank(candidates, minConfidence)));
        }

        report(System.out, bindingsFile, apk, constants, targets.size(), merged, hypotheses,
                successors, reused);

        if (emitAudit != null) {
            emit(emitAudit, apk, proposals, emitMin);
        }
    }

    private static double number(String[] args, int index, String flag) {
        if (index >= args.length) {
            System.err.println(USAGE);
            System.exit(2);
        }
        try {
            return Double.parseDouble(args[index]);
        } catch (NumberFormatException broken) {
            System.err.println("error: " + flag + " needs a number, got " + args[index]);
            System.exit(2);
            return 0;
        }
    }

    // ---------------------------------------------------------------- indexing

    /**
     * Members are indexed twice, by the names the bindings mention and by the parameter lists they
     * expect. The second index is what makes a renamed member findable at all: an obfuscator reuses
     * short names, so the replacement for `s(J)V` is usually called something the bindings never
     * mention, and a name-only index would never see it.
     */
    private record Index(
            Map<String, ClassDef> classes,
            Map<String, List<Hit>> byName,
            Map<String, List<Hit>> byParams) {}

    private static Index loadIndex(File apk, List<Target> targets) throws IOException {
        Set<String> wantedNames = new TreeSet<>();
        Set<String> wantedParams = new TreeSet<>();
        for (Target target : targets) {
            if (target.kind() != Kind.METHOD) continue;
            wantedNames.add(target.memberName());
            wantedParams.add(String.join("", target.parameterTypes()));
        }
        for (Target target : targets) {
            if (target.kind() == Kind.FIELD) wantedNames.add(target.memberName());
        }

        Map<String, ClassDef> classes = new TreeMap<>();
        Map<String, List<Hit>> byName = new LinkedHashMap<>();
        Map<String, List<Hit>> byParams = new LinkedHashMap<>();
        try (ZipFile zip = new ZipFile(apk)) {
            for (ZipEntry entry : Collections.list(zip.entries())) {
                if (!entry.getName().endsWith(".dex")) continue;
                byte[] bytes;
                try (InputStream stream = zip.getInputStream(entry)) {
                    bytes = stream.readAllBytes();
                }
                DexBackedDexFile dex = DexBackedDexFile.fromInputStream(
                        Opcodes.getDefault(), new ByteArrayInputStream(bytes));
                for (ClassDef classDef : dex.getClasses()) {
                    classes.putIfAbsent(classDef.getType(), classDef);
                    for (Field field : classDef.getFields()) {
                        if (!wantedNames.contains(field.getName())) continue;
                        byName.computeIfAbsent(field.getName(), key -> new ArrayList<>())
                                .add(new Hit(classDef.getType(), field.getName(), List.of(),
                                        null, field.getType(), true));
                    }
                    for (Method method : classDef.getMethods()) {
                        List<String> params = new ArrayList<>();
                        for (CharSequence parameter : method.getParameterTypes()) {
                            params.add(parameter.toString());
                        }
                        String paramKey = String.join("", params);
                        boolean shaped = wantedParams.contains(paramKey);
                        boolean named = wantedNames.contains(method.getName());
                        if (!shaped && !named) continue;
                        Hit hit = new Hit(classDef.getType(), method.getName(), params,
                                method.getReturnType(), null, false);
                        if (named) {
                            byName.computeIfAbsent(method.getName(), key -> new ArrayList<>()).add(hit);
                        }
                        if (shaped) {
                            byParams.computeIfAbsent(paramKey, key -> new ArrayList<>()).add(hit);
                        }
                    }
                }
            }
        }
        return new Index(classes, byName, byParams);
    }

    // ------------------------------------------------------------ class guesses

    /**
     * Builds old-class to new-class hypotheses from member names alone.
     *
     * A renamed class keeps its members' names far more often than its own, so counting how many of
     * one old class's binding names a candidate class declares is a cheap, checkable guess: three of
     * five names on one class is not proof, but it is exactly the list a reviewer wants to see.
     */
    private static Map<String, List<Hypothesis>> hypothesise(
            List<Target> unresolved,
            Index index) {
        Map<String, List<String>> expectedMethodNames = new LinkedHashMap<>();
        Map<String, List<String>> expectedFieldNames = new LinkedHashMap<>();
        for (Target target : unresolved) {
            Map<String, List<String>> bucket = target.kind() == Kind.FIELD
                    ? expectedFieldNames
                    : expectedMethodNames;
            if (target.kind() == Kind.TYPE) continue;
            bucket.computeIfAbsent(target.classType(), key -> new ArrayList<>())
                    .add(target.memberName());
        }

        // Members of a candidate class that the bindings ask about, by kind.
        Map<String, Set<String>> methodNamesByClass = new LinkedHashMap<>();
        Map<String, Set<String>> fieldNamesByClass = new LinkedHashMap<>();
        index.byName().forEach((name, hits) -> {
            for (Hit hit : hits) {
                Map<String, Set<String>> bucket = hit.isField() ? fieldNamesByClass : methodNamesByClass;
                bucket.computeIfAbsent(hit.owner(), key -> new LinkedHashSet<>()).add(name);
            }
        });

        Map<String, List<Hypothesis>> hypotheses = new LinkedHashMap<>();
        for (String oldClass : new LinkedHashSet<>(concat(expectedMethodNames.keySet(),
                expectedFieldNames.keySet()))) {
            if (index.classes().containsKey(oldClass)) continue;
            List<String> methods = expectedMethodNames.getOrDefault(oldClass, List.of());
            List<String> fields = expectedFieldNames.getOrDefault(oldClass, List.of());
            int expected = methods.size() + fields.size();
            if (expected == 0) continue;

            Set<String> candidates = new TreeSet<>();
            methods.forEach(name -> collectOwners(index.byName(), name, false, candidates));
            fields.forEach(name -> collectOwners(index.byName(), name, true, candidates));

            List<Hypothesis> scored = new ArrayList<>();
            for (String candidate : candidates) {
                Set<String> matched = new LinkedHashSet<>();
                Set<String> declaredMethods = methodNamesByClass.getOrDefault(candidate, Set.of());
                Set<String> declaredFields = fieldNamesByClass.getOrDefault(candidate, Set.of());
                for (String name : methods) {
                    if (declaredMethods.contains(name)) matched.add("m:" + name);
                }
                for (String name : fields) {
                    if (declaredFields.contains(name)) matched.add("f:" + name);
                }
                if (matched.isEmpty()) continue;
                double score = (double) matched.size() / expected;
                if (score < 0.2) continue;
                List<String> shown = new ArrayList<>();
                matched.stream()
                        .sorted(Comparator.comparing((String key) -> key.substring(2)))
                        .limit(6)
                        .forEach(key -> shown.add(key.substring(2)));
                scored.add(new Hypothesis(candidate, score, matched.size(), expected,
                        String.join(", ", shown)));
            }
            scored.sort(Comparator.comparingDouble(Hypothesis::score).reversed()
                    .thenComparing(Hypothesis::owner));
            if (!scored.isEmpty()) hypotheses.put(oldClass, scored.subList(0, Math.min(3, scored.size())));
        }
        return hypotheses;
    }

    private static void collectOwners(
            Map<String, List<Hit>> byName,
            String name,
            boolean field,
            Set<String> owners) {
        for (Hit hit : byName.getOrDefault(name, List.of())) {
            if (hit.isField() == field) owners.add(hit.owner());
        }
    }

    private static List<String> concat(Set<String> left, Set<String> right) {
        List<String> all = new ArrayList<>(left);
        all.addAll(right);
        return all;
    }

    // -------------------------------------------------------------- candidates

    private static List<Candidate> propose(
            Target target,
            List<Hypothesis> hypotheses,
            Index index,
            double minConfidence,
            double ownerSurvival) {
        List<Candidate> found = switch (target.kind()) {
            case TYPE -> proposeType(hypotheses);
            case FIELD -> proposeField(target, index, hypotheses, ownerSurvival);
            case METHOD -> proposeMethod(target, index, hypotheses, ownerSurvival);
        };
        return rank(found, minConfidence);
    }

    private static List<Candidate> rank(List<Candidate> found, double minConfidence) {
        List<Candidate> ranked = new ArrayList<>(found.stream()
                .filter(candidate -> candidate.confidence() >= minConfidence)
                .distinct()
                .sorted(Comparator.comparingDouble(Candidate::confidence).reversed()
                        .thenComparing(candidate -> candidate.hit().owner())
                        .thenComparing(candidate -> candidate.hit().shape()))
                .toList());
        if (ranked.size() > 4) ranked = ranked.subList(0, 4);
        return ranked;
    }

    /** A new class that a probable proposal already proved is the old class's successor. */
    private record Successor(String owner, List<String> witnesses) {}

    private static final double SUCCESSOR_TYPE = 0.80;
    // Above the whole-APK name tiers on purpose: the class is proven, so a member there that takes
    // the same parameters outranks a same-named member of some unrelated class.
    private static final double SUCCESSOR_SAME_PARAMS = 0.72;
    private static final double SUCCESSOR_SAME_RETURN_AND_ARITY = 0.55;
    private static final double SUCCESSOR_FIELD_SAME_TYPE = 0.60;

    /**
     * Votes a successor class per missing old class, using only proposal-grade candidates. One
     * witness is enough, but the report always names them so the reviewer can judge the count.
     */
    private static Map<String, Successor> confirmedSuccessors(
            List<Proposal> proposals,
            Map<String, Boolean> ownerSurvives) {
        Map<String, Map<String, List<String>>> votes = new LinkedHashMap<>();
        Map<String, Map<String, Double>> weights = new LinkedHashMap<>();
        for (Proposal proposal : proposals) {
            String oldClass = proposal.target().classType();
            if (ownerSurvives.getOrDefault(oldClass, false)) continue;
            if (proposal.candidates().isEmpty()) continue;
            Candidate best = proposal.candidates().get(0);
            if (best.confidence() < 0.60) continue;
            if (best.hit().owner().equals(oldClass)) continue;
            votes.computeIfAbsent(oldClass, key -> new LinkedHashMap<>())
                    .computeIfAbsent(best.hit().owner(), key -> new ArrayList<>())
                    .add(proposal.target().name());
            weights.computeIfAbsent(oldClass, key -> new LinkedHashMap<>())
                    .merge(best.hit().owner(), best.confidence(), Double::sum);
        }

        Map<String, Successor> successors = new LinkedHashMap<>();
        votes.forEach((oldClass, byOwner) -> {
            Map<String, Double> totals = weights.get(oldClass);
            String winner = null;
            double bestTotal = 0;
            boolean tied = false;
            for (Map.Entry<String, Double> entry : totals.entrySet()) {
                double total = entry.getValue();
                if (total > bestTotal + 1e-9) {
                    bestTotal = total;
                    winner = entry.getKey();
                    tied = false;
                } else if (Math.abs(total - bestTotal) <= 1e-9) {
                    tied = true;
                }
            }
            if (winner == null || tied) return;
            successors.put(oldClass, new Successor(winner, byOwner.get(winner)));
        });
        return successors;
    }

    /**
     * Looks for the target's member on a class a sibling already identified. Names are meaningless
     * here and most of them changed, so the search is by shape; every candidate says which witness
     * put the class on the shortlist.
     */
    private static List<Candidate> proposeInSuccessor(
            Target target,
            Successor successor,
            Index index) {
        List<Candidate> candidates = new ArrayList<>();
        String witness = String.join(", ", successor.witnesses());
        String reason = "successor of " + target.classType() + " (proved by " + witness + ")";

        if (target.kind() == Kind.TYPE) {
            candidates.add(new Candidate(
                    new Hit(successor.owner(), null, List.of(), null, null, false),
                    SUCCESSOR_TYPE, reason));
            return candidates;
        }

        boolean field = target.kind() == Kind.FIELD;
        ClassDef successorClass = index.classes().get(successor.owner());
        if (successorClass == null) return candidates;
        List<Hit> members = new ArrayList<>();
        for (Field candidate : successorClass.getFields()) {
            members.add(new Hit(successor.owner(), candidate.getName(), List.of(), null,
                    candidate.getType(), true));
        }
        for (Method candidate : successorClass.getMethods()) {
            List<String> params = new ArrayList<>();
            for (CharSequence parameter : candidate.getParameterTypes()) {
                params.add(parameter.toString());
            }
            members.add(new Hit(successor.owner(), candidate.getName(), params,
                    candidate.getReturnType(), null, false));
        }
        {
            for (Hit hit : members) {
                if (hit.isField() != field) continue;
                // The old member name is not evidence on a renamed class: the obfuscator reuses
                // short names, so Lagyw;->r and Lagyw;->s exist for unrelated members. Only the
                // shape carries across a class rename.
                if (field) {
                    if (!hit.fieldType().equals(target.fieldType())) continue;
                    candidates.add(new Candidate(hit, SUCCESSOR_FIELD_SAME_TYPE,
                            reason + ", same field type"));
                    continue;
                }
                if (hit.owner().equals(target.classType())) continue;
                if (hit.params().equals(target.parameterTypes())) {
                    candidates.add(new Candidate(hit, SUCCESSOR_SAME_PARAMS,
                            reason + ", identical parameter types"));
                } else if (hit.ret().equals(target.returnType())
                        && hit.params().size() == target.parameterTypes().size()) {
                    candidates.add(new Candidate(hit, SUCCESSOR_SAME_RETURN_AND_ARITY,
                            reason + ", same return type and arity"));
                }
            }
        }
        // The successor narrows the search but does not disambiguate it: a class with six
        // argument-less void methods says nothing about which one a binding meant, so those
        // candidates drop as their number grows, exactly like the whole-APK tiers.
        Map<Double, Integer> counts = new LinkedHashMap<>();
        for (Candidate candidate : candidates) {
            counts.merge(candidate.confidence(), 1, Integer::sum);
        }
        List<Candidate> damped = new ArrayList<>();
        for (Candidate candidate : candidates) {
            int matches = counts.get(candidate.confidence());
            if (matches <= 1) {
                damped.add(candidate);
            } else if (matches <= 4) {
                // Kept, not dropped: a confirmed class with three same-shaped members is still a
                // short list worth dumping, unlike a name that matches in six thousand classes.
                damped.add(new Candidate(candidate.hit(),
                        round(candidate.confidence() - 0.10),
                        candidate.reason()));
            }
        }
        return damped;
    }

    private static List<Candidate> proposeType(List<Hypothesis> hypotheses) {
        List<Candidate> candidates = new ArrayList<>();
        for (Hypothesis hypothesis : hypotheses) {
            candidates.add(new Candidate(
                    new Hit(hypothesis.owner(), null, List.of(), null, null, false),
                    round(TYPE_HYPOTHESIS * hypothesis.score()),
                    "class hypothesis: declares " + hypothesis.matched() + " of "
                            + hypothesis.expected() + " expected members ("
                            + hypothesis.names() + ")"));
        }
        return candidates;
    }

    private static List<Candidate> proposeField(
            Target target,
            Index index,
            List<Hypothesis> hypotheses,
            double ownerSurvival) {
        List<Hit> fields = new ArrayList<>();
        for (Hit hit : index.byName().getOrDefault(target.memberName(), List.of())) {
            if (hit.isField()) fields.add(hit);
        }
        List<Candidate> candidates = new ArrayList<>();

        if (ownerSurvival > 0) {
            List<Hit> sameClass = new ArrayList<>();
            for (Hit hit : fields) {
                if (hit.owner().equals(target.classType())) sameClass.add(hit);
            }
            double sameClassConfidence =
                    round(FIELD_SAME_CLASS_SAME_NAME * ownerSurvival);
            String survivalNote = " (" + Math.round(ownerSurvival * 100)
                    + "% of the class's expected members survive)";
            for (Hit hit : sameClass) {
                candidates.add(new Candidate(hit, sameClassConfidence,
                        "same class, same name, field type changed "
                                + target.fieldType() + " -> " + hit.fieldType() + survivalNote));
            }
            // A renamed field on the same class can only be found by its type, and a class with
            // many same-typed fields says nothing, so the tier is damped like the global ones.
            List<Hit> sameType = new ArrayList<>();
            Set<String> seen = new LinkedHashSet<>();
            for (List<Hit> hits : index.byName().values()) {
                for (Hit hit : hits) {
                    if (!hit.isField() || !hit.owner().equals(target.classType())) continue;
                    if (!hit.fieldType().equals(target.fieldType())) continue;
                    if (!seen.add(hit.name())) continue;
                    sameType.add(hit);
                }
            }
            addAll(candidates, sameType, FIELD_SAME_CLASS_SAME_TYPE,
                    "same class, same field type");
        }

        candidates.addAll(hypothesisMatches(
                fields, true, hypotheses, FIELD_HYPOTHESIS_SAME_NAME,
                "hypothesised class, same field name"));

        List<Hit> globalSameNameAndType = new ArrayList<>();
        for (Hit hit : fields) {
            if (hit.owner().equals(target.classType())) continue;
            if (inHypothesis(hypotheses, hit.owner())) continue;
            if (!hit.fieldType().equals(target.fieldType())) continue;
            globalSameNameAndType.add(hit);
        }
        addAll(candidates, globalSameNameAndType, FIELD_GLOBAL_SAME_NAME_SAME_TYPE,
                "whole apk, same field name and type");
        return candidates;
    }

    /**
     * Adds one tier of candidates at a count-damped weight. A name that matches in six thousand
     * classes carries no information, so the tier's weight falls with the number of matches instead
     * of reporting them all as equally plausible.
     */
    private static void addAll(
            List<Candidate> candidates,
            List<Hit> hits,
            double base,
            String reason) {
        if (hits.isEmpty()) return;
        double confidence = damp(base, hits.size());
        if (confidence <= 0) return;
        String suffix = hits.size() == 1 ? " (unique)" : " (of " + hits.size() + ")";
        List<Hit> shown = hits.size() > 8 ? hits.subList(0, 8) : hits;
        for (Hit hit : shown) {
            candidates.add(new Candidate(hit, confidence, reason + suffix));
        }
    }

    private static double damp(double base, int matches) {
        if (matches <= 1) return base;
        if (matches <= 4) return round(base - AMBIGUITY_PENALTY);
        return round(base * 4.0 / matches);
    }

    private static List<Candidate> proposeMethod(
            Target target,
            Index index,
            List<Hypothesis> hypotheses,
            double ownerSurvival) {
        List<Hit> methods = new ArrayList<>();
        for (Hit hit : index.byName().getOrDefault(target.memberName(), List.of())) {
            if (!hit.isField()) methods.add(hit);
        }
        List<Candidate> candidates = new ArrayList<>();

        if (ownerSurvival > 0) {
            // The audit's own hint: the name survived on the class, only the prototype moved. Every
            // overload is listed, because only the patch that consumes the binding knows which one
            // it meant.
            List<Hit> sameClassSameName = new ArrayList<>();
            for (Hit hit : methods) {
                if (hit.owner().equals(target.classType())) sameClassSameName.add(hit);
            }
            for (Hit hit : sameClassSameName) {
                candidates.add(new Candidate(hit, SAME_CLASS_SAME_NAME,
                        "same class, same name, prototype changed "
                                + "(" + String.join("", target.parameterTypes()) + ")"
                                + target.returnType() + " -> " + hit.shape()));
            }

            List<Hit> renamedSameParams = new ArrayList<>();
            for (List<Hit> hits : index.byName().values()) {
                for (Hit hit : hits) {
                    if (hit.isField() || !hit.owner().equals(target.classType())) continue;
                    if (hit.name().equals(target.memberName())) continue;
                    if (!hit.params().equals(target.parameterTypes())) continue;
                    renamedSameParams.add(hit);
                }
            }
            addAll(candidates, renamedSameParams, SAME_CLASS_SAME_PARAMS,
                    "same class, identical parameter types");

            if (renamedSameParams.isEmpty()) {
                List<Hit> sameArity = new ArrayList<>();
                for (List<Hit> hits : index.byName().values()) {
                    for (Hit hit : hits) {
                        if (hit.isField() || !hit.owner().equals(target.classType())) continue;
                        if (hit.params().size() != target.parameterTypes().size()) continue;
                        sameArity.add(hit);
                    }
                }
                addAll(candidates, sameArity, SAME_CLASS_SAME_ARITY,
                        "same class, same arity, different types or name");
            }
        }

        candidates.addAll(hypothesisMatches(
                methods, false, hypotheses, HYPOTHESIS_SAME_NAME,
                "hypothesised class, same method name"));

        List<Hit> sameParams = new ArrayList<>();
        for (Hit hit : index.byParams().getOrDefault(
                String.join("", target.parameterTypes()), List.of())) {
            if (hit.owner().equals(target.classType())) continue;
            sameParams.add(hit);
        }
        candidates.addAll(hypothesisMatches(
                sameParams, false, hypotheses, HYPOTHESIS_SAME_PARAMS,
                "hypothesised class, identical parameter types"));

        List<Hit> globalSameNameAndParams = new ArrayList<>();
        for (Hit hit : methods) {
            if (hit.owner().equals(target.classType())) continue;
            if (inHypothesis(hypotheses, hit.owner())) continue;
            if (!hit.params().equals(target.parameterTypes())) continue;
            globalSameNameAndParams.add(hit);
        }
        addAll(candidates, globalSameNameAndParams, GLOBAL_SAME_NAME_SAME_PARAMS,
                "whole apk, same name and parameter types");

        List<Hit> globalSameDescriptor = new ArrayList<>();
        for (Hit hit : sameParams) {
            if (hit.name().equals(target.memberName())) continue;
            if (inHypothesis(hypotheses, hit.owner())) continue;
            if (!hit.ret().equals(target.returnType())) continue;
            globalSameDescriptor.add(hit);
        }
        addAll(candidates, globalSameDescriptor, GLOBAL_SAME_DESCRIPTOR,
                "whole apk, identical descriptor");
        List<Hit> sameReturnSameArity = new ArrayList<>();
        for (Hit hit : sameParams) {
            if (hit.params().size() != target.parameterTypes().size()) continue;
            if (!hit.ret().equals(target.returnType())) continue;
            if (hit.name().equals(target.memberName())) continue;
            if (inHypothesis(hypotheses, hit.owner())) continue;
            sameReturnSameArity.add(hit);
        }
        addAll(candidates, sameReturnSameArity, GLOBAL_SAME_RETURN_AND_ARITY,
                "whole apk, same return type and arity");

        if (ownerSurvival <= 0) {
            List<Hit> globalSameName = new ArrayList<>();
            for (Hit hit : methods) {
                if (inHypothesis(hypotheses, hit.owner())) continue;
                if (hit.params().size() != target.parameterTypes().size()) continue;
                globalSameName.add(hit);
            }
            addAll(candidates, globalSameName, GLOBAL_SAME_NAME_SAME_ARITY,
                    "whole apk, same name and arity");
        }

        return candidates;
    }

    private static List<Candidate> hypothesisMatches(
            List<Hit> hits,
            boolean field,
            List<Hypothesis> hypotheses,
            double weight,
            String reason) {
        List<Candidate> candidates = new ArrayList<>();
        for (Hypothesis hypothesis : hypotheses) {
            for (Hit hit : hits) {
                if (hit.isField() != field) continue;
                if (!hit.owner().equals(hypothesis.owner())) continue;
                candidates.add(new Candidate(hit, round(weight * hypothesis.score()),
                        reason + " on " + hypothesis.owner() + " (" + hypothesis.matched()
                                + " of " + hypothesis.expected() + " names)"));
            }
        }
        return candidates;
    }

    private static boolean inHypothesis(List<Hypothesis> hypotheses, String owner) {
        for (Hypothesis hypothesis : hypotheses) {
            if (hypothesis.owner().equals(owner)) return true;
        }
        return false;
    }

    /** Two digits is the resolution a reviewer needs; more would imply precision the score lacks. */
    private static double round(double value) {
        return Math.round(value * 100.0) / 100.0;
    }

    // ------------------------------------------------------------------ report

    private static void report(
            PrintStream out,
            Path bindingsFile,
            File apk,
            Map<String, String> constants,
            int totalTargets,
            List<Proposal> proposals,
            Map<String, List<Hypothesis>> hypotheses,
            Map<String, Successor> successors,
            List<String> reused) {
        long probable = proposals.stream()
                .filter(proposal -> best(proposal) >= 0.85).count();
        long review = proposals.stream()
                .filter(proposal -> best(proposal) >= 0.60 && best(proposal) < 0.85).count();
        long weak = proposals.stream()
                .filter(proposal -> best(proposal) > 0 && best(proposal) < 0.60).count();
        long none = proposals.stream().filter(proposal -> best(proposal) == 0).count();

        out.println("bindings: " + bindingsFile);
        out.println("target:   " + constants.getOrDefault("targetVersion", "unknown")
                + " (profile " + constants.getOrDefault("profileVersion", "unknown") + ")");
        out.println("apk:      " + apk.getName());
        out.println("targets:  " + totalTargets + ", unresolved " + proposals.size());
        out.println("bands:    probable " + probable + " (>=0.85), review " + review
                + " (0.60-0.85), weak " + weak + " (<0.60), no candidate " + none);
        out.println();

        if (!hypotheses.isEmpty()) {
            out.println("## Class hypotheses");
            out.println();
            out.println("Old classes this release does not contain, with the classes that declare the");
            out.println("most binding names expected of them.");
            out.println();
            for (Map.Entry<String, List<Hypothesis>> entry : hypotheses.entrySet()) {
                out.println("  " + entry.getKey());
                for (Hypothesis hypothesis : entry.getValue()) {
                    out.printf("    -> %-14s %.2f  %d/%d names: %s%n",
                            hypothesis.owner(), hypothesis.score(),
                            hypothesis.matched(), hypothesis.expected(), hypothesis.names());
                }
            }
            out.println();
        }

        if (!reused.isEmpty()) {
            out.println("## Reused class names");
            out.println();
            out.println("These descriptors exist in this APK but declare none of the members the");
            out.println("bindings expect of them - a different class took the name - so their targets");
            out.println("are treated as missing here rather than matched against the stranger:");
            out.println();
            reused.forEach(line -> out.println("  " + line));
            out.println();
        }

        if (!successors.isEmpty()) {
            out.println("## Successor classes");
            out.println();
            out.println("Missing classes a probable proposal already located, reused for every other");
            out.println("binding that expected the old class.");
            out.println();
            successors.forEach((oldClass, successor) -> out.println("  " + oldClass + " -> "
                    + successor.owner() + "  (proved by "
                    + String.join(", ", successor.witnesses()) + ")"));
            out.println();
        }

        for (Proposal proposal : proposals) {
            double top = best(proposal);
            if (top == 0) continue;
            out.println("## " + proposal.target().name() + "  [" + band(top) + "]");
            out.println("  " + proposal.target().kind() + " " + proposal.target().descriptor());
            out.println("  audit: " + proposal.hint());
            for (Candidate candidate : proposal.candidates()) {
                Hit hit = candidate.hit();
                out.printf("  %.2f  %s%s  %s%n",
                        candidate.confidence(),
                        hit.owner(),
                        hit.name() == null ? "" : "->" + hit.name(),
                        candidate.reason());
            }
            Candidate accepted = proposal.candidates().isEmpty() ? null : proposal.candidates().get(0);
            // Paste only when one candidate clearly leads: a tie means the tool found the shape but
            // cannot choose between members, and handing over the alphabetically first one would
            // dress a coin flip up as an answer.
            boolean led = accepted != null && (proposal.candidates().size() == 1
                    || proposal.candidates().get(1).confidence() < accepted.confidence());
            if (accepted != null && led && accepted.confidence() >= 0.60) {
                out.println("  paste: " + kotlin(accepted.hit()));
            } else if (accepted != null && accepted.confidence() >= 0.60) {
                out.println("  tie: pick by dumping the class, not by this order");
            }
            out.println();
        }

        List<Proposal> withoutCandidates = proposals.stream()
                .filter(proposal -> best(proposal) == 0).toList();
        if (!withoutCandidates.isEmpty()) {
            out.println("## No candidate");
            out.println();
            out.println("Nothing in this APK matches even loosely. These need the feature's own");
            out.println("anchor - the patch that consumes the binding, or a sibling that resolved.");
            out.println();
            for (Proposal proposal : withoutCandidates) {
                out.println("  " + proposal.target().name() + ": "
                        + proposal.target().descriptor() + " (" + proposal.hint() + ")");
            }
            out.println();
        }
    }

    private static String band(double confidence) {
        if (confidence >= 0.85) return "probable";
        if (confidence >= 0.60) return "review";
        return "weak";
    }

    private static double best(Proposal proposal) {
        return proposal.candidates().isEmpty() ? 0 : proposal.candidates().get(0).confidence();
    }

    /** The one-line shape shown in the report so a whole candidate reads on one row. */
    private static String kotlin(Hit hit) {
        if (hit.name() == null) {
            return "GboardTypeTarget(\"" + hit.owner() + "\")";
        }
        StringBuilder text = new StringBuilder("GboardMethodTarget(");
        if (hit.isField()) {
            text = new StringBuilder("GboardFieldTarget(");
        }
        text.append("classType = \"").append(hit.owner()).append("\", name = \"")
                .append(hit.name()).append("\", ");
        if (hit.isField()) {
            text.append("type = \"").append(hit.fieldType()).append('"');
        } else {
            text.append("parameterTypes = ").append(parameters(hit.params()))
                    .append(", returnType = \"").append(hit.ret()).append('"');
        }
        return text.append(')').toString();
    }

    /**
     * The block shape the bindings file and the audit parser both use: named arguments on their own
     * lines and the closing parenthesis alone, with parameter types kept on a single line.
     */
    private static String kotlinBlock(String bindingName, Hit hit) {
        if (hit.name() == null) {
            return "    val `" + bindingName + "` = GboardTypeTarget(\"" + hit.owner() + "\")";
        }
        StringBuilder text = new StringBuilder("    val `" + bindingName + "` = ")
                .append(hit.isField() ? "GboardFieldTarget(\n" : "GboardMethodTarget(\n")
                .append("        classType = \"").append(hit.owner()).append("\",\n")
                .append("        name = \"").append(hit.name()).append("\",\n");
        if (hit.isField()) {
            text.append("        type = \"").append(hit.fieldType()).append("\",\n");
        } else {
            text.append("        parameterTypes = ").append(parameters(hit.params())).append(",\n")
                    .append("        returnType = \"").append(hit.ret()).append("\",\n");
        }
        return text.append("    )").toString();
    }

    private static String parameters(List<String> params) {
        if (params.isEmpty()) return "emptyList()";
        List<String> quoted = new ArrayList<>();
        params.forEach(param -> quoted.add('"' + param + '"'));
        return "listOf(" + String.join(", ", quoted) + ")";
    }

    /**
     * Writes the accepted proposals as an audit file, in the exact declaration shape
     * {@code BindingAudit} parses: one entry per target, parameter types on a single line.
     */
    private static void emit(Path path, File apk, List<Proposal> proposals, double emitMin)
            throws IOException {
        List<String> emitted = new ArrayList<>();
        int count = 0;
        for (Proposal proposal : proposals) {
            if (proposal.candidates().isEmpty()) continue;
            Candidate accepted = proposal.candidates().get(0);
            if (accepted.confidence() < emitMin) continue;
            emitted.add(kotlinBlock(proposal.target().name(), accepted.hit()));
            count++;
        }

        StringBuilder text = new StringBuilder();
        text.append("// Generated by tools/bindings/ProposeRetarget.java from ").append(apk.getName())
                .append('\n');
        text.append("// Do not merge before review: a proposal is a candidate that outranked the\n");
        text.append("// others, not a verified binding. Re-check with BindingAudit, then check the\n");
        text.append("// shape against the patch that consumes it.\n\n");
        text.append("package audits\n\nclass ProposedRecipe {\n");
        if (emitted.isEmpty()) {
            text.append("    // Nothing reached the emit threshold.\n");
        } else {
            text.append(String.join("\n\n", emitted)).append('\n');
        }
        text.append("}\n");
        Files.writeString(path, text.toString(), StandardCharsets.UTF_8);
        System.out.println("emitted " + count + " proposals at >= " + emitMin + " to " + path);
    }

    // ------------------------------------------------------------- resolution

    /**
     * Returns null when the target resolves, otherwise the audit's own reason, so a report can be
     * read beside the log it came from.
     */
    private static String hint(Target target, Map<String, ClassDef> classes) {
        ClassDef owner = classes.get(target.classType());
        if (owner == null) return "class is not in this apk";
        if (target.kind() == Kind.TYPE) return null;

        if (target.kind() == Kind.FIELD) {
            List<String> sameName = new ArrayList<>();
            for (Field field : owner.getFields()) {
                if (!field.getName().equals(target.memberName())) continue;
                if (field.getType().equals(target.fieldType())) return null;
                sameName.add(field.getType());
            }
            return sameName.isEmpty()
                    ? "no field of that name in the class"
                    : "field exists with type " + String.join(", ", sameName);
        }

        List<String> sameName = new ArrayList<>();
        for (Method method : owner.getMethods()) {
            if (!method.getName().equals(target.memberName())) continue;
            StringBuilder descriptor = new StringBuilder("(");
            for (CharSequence parameter : method.getParameterTypes()) {
                descriptor.append(parameter);
            }
            descriptor.append(')').append(method.getReturnType());
            List<String> params = new ArrayList<>();
            for (CharSequence parameter : method.getParameterTypes()) {
                params.add(parameter.toString());
            }
            if (params.equals(target.parameterTypes())
                    && method.getReturnType().equals(target.returnType())) {
                return null;
            }
            sameName.add(descriptor.toString());
        }
        return sameName.isEmpty()
                ? "no method of that name in the class"
                : "method exists as " + String.join(", ", sameName);
    }

    // ------------------------------------------------------------------ parse

    /**
     * Reads the generated file the way the generator writes it - and the way an emitted proposal
     * file is written back - with the same strictness as BindingAudit: an unreadable entry is an
     * error, never a skipped target.
     */
    private static List<Target> parseTargets(List<String> lines) {
        List<Target> targets = new ArrayList<>();
        for (int index = 0; index < lines.size(); index++) {
            Matcher entry = ENTRY.matcher(lines.get(index));
            if (!entry.find()) continue;

            String name = entry.group(1);
            String type = entry.group(2);
            if (type.equals("GboardTypeTarget")) {
                String classType = quoted(entry.group(3), name);
                if (classType == null || classType.isBlank()) {
                    throw new IllegalStateException("binding `" + name + "` has no class descriptor");
                }
                targets.add(new Target(name, Kind.TYPE, classType, null, List.of(), null, null));
                continue;
            }

            List<String> body = new ArrayList<>();
            body.add(entry.group(3));
            int cursor = index;
            while (!bodyCloses(body)) {
                cursor++;
                if (cursor >= lines.size()) {
                    throw new IllegalStateException("unterminated binding entry `" + name + "`");
                }
                body.add(lines.get(cursor));
            }
            index = cursor;

            String memberName = null;
            String returnType = null;
            String fieldType = null;
            List<String> parameterTypes = null;
            for (String raw : body) {
                String line = raw.trim();
                if (line.startsWith("name = ")) {
                    memberName = quoted(line.substring("name = ".length()), name);
                } else if (line.startsWith("returnType = ")) {
                    returnType = quoted(line.substring("returnType = ".length()), name);
                } else if (line.startsWith("type = ")) {
                    fieldType = quoted(line.substring("type = ".length()), name);
                } else if (line.startsWith("parameterTypes = ")) {
                    parameterTypes = quotedList(line.substring("parameterTypes = ".length()), name);
                }
            }

            String owner = classTypeOf(body, name);
            if (type.equals("GboardMethodTarget")) {
                checkPresent(name, "name", memberName);
                checkPresent(name, "parameterTypes", parameterTypes);
                checkPresent(name, "returnType", returnType);
                targets.add(new Target(name, Kind.METHOD, owner, memberName, parameterTypes,
                        returnType, null));
            } else {
                checkPresent(name, "name", memberName);
                checkPresent(name, "type", fieldType);
                targets.add(new Target(name, Kind.FIELD, owner, memberName, List.of(), null,
                        fieldType));
            }
        }
        return targets;
    }

    private static String classTypeOf(List<String> body, String name) {
        for (String raw : body) {
            String line = raw.trim();
            if (line.startsWith("classType = ")) {
                String value = quoted(line.substring("classType = ".length()), name);
                if (value == null || value.isBlank()) {
                    throw new IllegalStateException("binding `" + name + "` has an empty classType");
                }
                return value;
            }
        }
        throw new IllegalStateException("binding `" + name + "` has no classType");
    }

    private static void checkPresent(String name, String key, Object value) {
        if (value == null) throw new IllegalStateException("binding `" + name + "` has no " + key);
    }

    private static boolean bodyCloses(List<String> body) {
        String last = body.get(body.size() - 1).trim();
        return body.size() > 1 && last.equals(")");
    }

    private static String quoted(String text, String name) {
        int open = text.indexOf('"');
        int close = text.lastIndexOf('"');
        if (open < 0 || close <= open) {
            throw new IllegalStateException("binding `" + name + "` has an unreadable literal: " + text);
        }
        return text.substring(open + 1, close).replace("${'$'}", "$");
    }

    private static List<String> quotedList(String text, String name) {
        if (text.startsWith("emptyList()")) return List.of();
        int open = text.indexOf("listOf(");
        if (open < 0) {
            throw new IllegalStateException("binding `" + name
                    + "` has an unreadable parameterTypes: " + text);
        }
        List<String> values = new ArrayList<>();
        boolean inString = false;
        StringBuilder current = new StringBuilder();
        for (int index = open + "listOf(".length(); index < text.length(); index++) {
            char character = text.charAt(index);
            if (character == '"') {
                if (inString) {
                    values.add(current.toString().replace("${'$'}", "$"));
                    current.setLength(0);
                }
                inString = !inString;
            } else if (inString) {
                current.append(character);
            }
        }
        return values;
    }
}
