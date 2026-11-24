package santodan.patches;

import software.santodan.nuvio.NuvioNative;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.*;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.ZipFile;

/** Read-only migration report. Candidate matches never authorize a hook or update contracts. */
public final class ReportNuvioUpdate {
    static Map<String, ClassDef> load(Path apk) throws Exception {
        Map<String, ClassDef> classes = new TreeMap<>();
        try (ZipFile zip = new ZipFile(apk.toFile())) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (ClassDef owner : DexBackedDexFile.fromInputStream(null, input).getClasses())
                        if (classes.put(owner.getType(), owner) != null) throw new IllegalStateException("Duplicate class: " + owner.getType());
                }
        }
        if (classes.isEmpty()) throw new IllegalStateException("No original DEX in " + apk);
        return classes;
    }
    static String normalize(String reference) {
        return reference.replaceAll("L(?:[a-z][a-z0-9]*/[A-Za-z0-9_$]+|com/nuvio/tv/data/local/[a-z][a-z0-9]*);", "L?;")
            .replaceAll("L\\?;->[A-Za-z0-9_$]+", "L?;->?");
    }
    static Map<String, Integer> features(ClassDef owner) {
        Map<String, Integer> values = new HashMap<>();
        add(values, "super:" + normalize(String.valueOf(owner.getSuperclass())));
        for (String type : owner.getInterfaces()) add(values, "interface:" + normalize(type));
        for (Field field : owner.getFields()) add(values, "field:" + (field.getAccessFlags() & 8) + ":" + normalize(field.getType()));
        for (Method method : owner.getMethods()) {
            String name = method.getName().matches("[A-Za-z][A-Za-z0-9]?") ? "?" : method.getName();
            add(values, "method:" + name + ":" + (method.getAccessFlags() & 8) + ":" + normalize(method.getParameterTypes() + ":" + method.getReturnType()));
            if (method.getImplementation() == null) continue;
            for (Instruction instruction : method.getImplementation().getInstructions()) {
                add(values, "opcode:" + instruction.getOpcode());
                if (!(instruction instanceof ReferenceInstruction)) continue;
                Reference reference = ((ReferenceInstruction) instruction).getReference();
                if (reference instanceof StringReference) add(values, "string:" + ((StringReference) reference).getString());
                else add(values, "ref:" + normalize(reference.toString()));
            }
        }
        return values;
    }
    private static void add(Map<String, Integer> values, String key) { values.merge(key, 1, Integer::sum); }
    static double similarity(Map<String, Integer> left, Map<String, Integer> right) {
        Set<String> keys = new HashSet<>(left.keySet()); keys.addAll(right.keySet());
        double overlap = 0, total = 0;
        for (String key : keys) {
            double weight = key.startsWith("string:") ? 30 : key.startsWith("method:") ? 5 : 1;
            overlap += weight * Math.min(left.getOrDefault(key, 0), right.getOrDefault(key, 0));
            total += weight * Math.max(left.getOrDefault(key, 0), right.getOrDefault(key, 0));
        }
        return total == 0 ? 1 : overlap / total;
    }
    static String sha256(Path path) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (InputStream input = Files.newInputStream(path)) {
            byte[] buffer = new byte[65536]; int read;
            while ((read = input.read(buffer)) != -1) digest.update(buffer, 0, read);
        }
        StringBuilder result = new StringBuilder(); for (byte value : digest.digest()) result.append(String.format("%02x", value & 255));
        return result.toString();
    }
    public static void main(String[] args) throws Exception {
        Path baseline = Path.of(args[0]), candidate = Path.of(args[1]), output = Path.of(args[2]);
        if (!sha256(baseline).equals(NuvioNative.ORIGINAL_SHA256)) throw new IllegalStateException("Baseline APK does not match the reviewed native contract");
        Map<String, ClassDef> old = load(baseline), target = load(candidate);
        Map<String, Map<String, Integer>> targetFeatures = new TreeMap<>();
        target.forEach((name, owner) -> targetFeatures.put(name, features(owner)));
        StringBuilder report = new StringBuilder("# Nuvio update inspection\n\n");
        report.append("Reviewed baseline: `").append(NuvioNative.VERSION).append("` / `").append(NuvioNative.ORIGINAL_SHA256).append("`.\n\n");
        report.append("Candidate SHA-256: `").append(sha256(candidate)).append("`.\n\n");
        report.append("Read-only suggestions. Confirm the candidate manifest/version, inspect changed behavior, update native.properties, then run verification. Exact structural matches are evidence, not automatic compatibility approval.\n\n");
        report.append("| Contract | Baseline | Status | Candidate(s) |\n| --- | --- | --- | --- |\n");
        int exactCount = 0, reviewCount = 0;
        Map<String, String> classMatches = new HashMap<>();
        List<java.lang.reflect.Field> symbols = new ArrayList<>(Arrays.asList(NuvioNative.class.getFields()));
        symbols.sort(Comparator.comparing(java.lang.reflect.Field::getName));
        for (var symbol : symbols) {
            if (!symbol.getName().endsWith("_TYPE") || symbol.getName().startsWith("REF_")) continue;
            String type = (String) symbol.get(null);
            if (!old.containsKey(type)) throw new IllegalStateException("Contract class absent from baseline: " + symbol.getName());
            Map<String, Integer> expected = features(old.get(type));
            List<String> exact = new ArrayList<>();
            for (var entry : targetFeatures.entrySet()) if (expected.equals(entry.getValue())) exact.add(entry.getKey());
            String status, matches;
            if (exact.size() == 1) { status = "unique structural match"; matches = exact.get(0); classMatches.put(type, matches); exactCount++; }
            else if (exact.size() > 1) { status = "AMBIGUOUS"; matches = String.join(", ", exact.subList(0, Math.min(3, exact.size()))); reviewCount++; }
            else {
                List<String> ranked = new ArrayList<>(target.keySet());
                Map<String, Double> scores = new HashMap<>();
                for (String name : ranked) scores.put(name, similarity(expected, targetFeatures.get(name)));
                ranked.sort(Comparator.<String>comparingDouble(scores::get).reversed().thenComparing(name -> name));
                status = "REVIEW changed/missing"; reviewCount++;
                List<String> choices = new ArrayList<>();
                for (String name : ranked.subList(0, Math.min(3, ranked.size()))) choices.add(name + " (" + String.format(Locale.ROOT, "%.3f", scores.get(name)) + ")");
                matches = String.join(", ", choices);
            }
            report.append('|').append(symbol.getName()).append('|').append(type).append('|').append(status).append('|').append(matches).append("|\n");
        }
        report.append("\n## Semantic field hints\n\nThese require unique class matches and unique semantic anchors; ambiguous hints remain unresolved.\n\n");
        String state = classMatches.get(NuvioNative.PLAYER_STATE_TYPE);
        if (state != null) {
            for (String label : List.of(", currentSeason=", ", currentEpisode=", ", currentVideoId=", ", nextEpisode=", ", error=")) {
                Set<String> fields = new TreeSet<>();
                for (Method method : target.get(state).getMethods()) {
                    if (!method.getName().equals("toString") || method.getImplementation() == null) continue;
                    List<Instruction> body = new ArrayList<>(); method.getImplementation().getInstructions().forEach(body::add);
                    for (int i = 0; i < body.size(); i++) {
                        Reference value = body.get(i) instanceof ReferenceInstruction ? ((ReferenceInstruction) body.get(i)).getReference() : null;
                        if (!(value instanceof StringReference) || !((StringReference) value).getString().equals(label)) continue;
                        for (int next = i + 1; next < Math.min(i + 6, body.size()); next++) {
                            Reference ref = body.get(next) instanceof ReferenceInstruction ? ((ReferenceInstruction) body.get(next)).getReference() : null;
                            if (ref instanceof FieldReference && ((FieldReference) ref).getDefiningClass().equals(state)) { fields.add(ref.toString()); break; }
                        }
                    }
                }
                report.append("- `").append(label).append("`: ").append(fields.size() == 1 ? "`" + fields.iterator().next() + "`" : "UNRESOLVED " + fields).append("\n");
            }
        } else report.append("Player-state class requires review before suggesting fields.\n");
        String component = classMatches.get(NuvioNative.HILT_COMPONENT_TYPE);
        if (component != null) for (String nativeType : List.of(NuvioNative.PROFILE_STORE_TYPE, NuvioNative.STREAM_REPOSITORY_TYPE, NuvioNative.TRACKING_COORDINATOR_TYPE)) {
            String produced = classMatches.get(nativeType); Set<String> providers = new TreeSet<>();
            if (produced != null) for (ClassDef owner : target.values()) for (Method method : owner.getMethods()) {
                if (!method.getName().equals("get") || method.getImplementation() == null) continue;
                List<Instruction> body = new ArrayList<>(); method.getImplementation().getInstructions().forEach(body::add);
                for (int i = 0; i < body.size(); i++) {
                    Reference ref = body.get(i) instanceof ReferenceInstruction ? ((ReferenceInstruction) body.get(i)).getReference() : null;
                    if (!(ref instanceof FieldReference) || !((FieldReference) ref).getDefiningClass().equals(component)) continue;
                    for (int next = i + 1; next < Math.min(i + 6, body.size()); next++)
                        if (body.get(next).getOpcode() == com.android.tools.smali.dexlib2.Opcode.CHECK_CAST &&
                            ((ReferenceInstruction) body.get(next)).getReference().toString().equals(produced)) providers.add(ref.toString());
                }
            }
            report.append("- Hilt provider for `").append(nativeType).append("`: ").append(providers.size() == 1 ? "`" + providers.iterator().next() + "`" : "UNRESOLVED " + providers).append("\n");
        }
        Set<String> definitions = new HashSet<>();
        for (ClassDef owner : target.values()) {
            for (Method method : owner.getMethods()) definitions.add(method.toString());
            for (Field field : owner.getFields()) definitions.add(field.toString());
        }
        report.append("\n## Explicit native references needing review\n\n");
        int stale = 0;
        for (var symbol : symbols) {
            String value = (String) symbol.get(null);
            if (value.equals(NuvioNative.REF_LOCAL_HOME_RESUME)) continue; // Generated observer clone, audited by the merge verifier.
            if (!value.matches("L[^;]+;->.+") || !value.contains("(") && !value.contains(":")) continue;
            if (value.contains("(") && !value.matches(".+\\([^)]*\\).+")) continue; // A return-type prefix is composed at its call site.
            if (!definitions.contains(value)) { report.append("- `").append(symbol.getName()).append("`: `").append(value).append("`\n"); stale++; }
        }
        if (stale == 0) report.append("All explicit method and field references exist in the candidate.\n");
        report.append("\nUnique class matches: ").append(exactCount).append("; classes needing review: ").append(reviewCount).append("; missing explicit references: ").append(stale).append(".\n");
        Files.createDirectories(output.toAbsolutePath().getParent()); Files.writeString(output, report.toString());
        System.out.println("Wrote " + output + ": " + exactCount + " unique matches, " + reviewCount + " classes needing review, " + stale + " missing native references. No source files changed.");
    }
}
