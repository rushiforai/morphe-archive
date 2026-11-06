import com.reandroid.arsc.chunk.PackageBlock;
import com.reandroid.arsc.chunk.TableBlock;
import com.reandroid.arsc.container.SpecTypePair;
import com.reandroid.arsc.item.StringItem;
import com.reandroid.arsc.item.StyleSpan;
import com.reandroid.arsc.model.ResourceEntry;
import com.reandroid.arsc.value.Entry;
import com.reandroid.arsc.value.ResConfig;
import com.reandroid.arsc.value.ResTableMapEntry;
import com.reandroid.arsc.value.ResValueMap;
import com.reandroid.arsc.value.TableEntry;
import com.reandroid.arsc.value.ValueItem;
import com.reandroid.arsc.value.ValueType;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Holds a patched APK's resource table to the stock table it was built from, so a resource the
 * rebuild lost is named before a phone finds it.
 *
 * <p>A resource patch makes Morphe decode the app's whole resource table and build it again. An
 * app can carry several packages in that table, one per dynamic feature (TikTok, where this check
 * was written, carries twelve), and a layout that a rebuild drops from any of them only fails when
 * the app inflates it, as {@code Resources$NotFoundException: Resource ID #0x7e03004d} (a TikTok
 * search layout, Hushfeed upstream #84). Every resource of every stock package has to resolve in the patched table by its
 * id, with the same type and a value in every configuration the stock table gives it; every file
 * a patched value names has to be in the patched archive; and every value the patches changed has
 * to point at something the patched table has. A style keeps its parent, and a file keeps the bytes
 * the stock archive has for it, since no patch writes either. Every other archive entry patching
 * doesn't write keeps its stock bytes too (checkArchive). A failure names the id or entry and
 * exits 1.
 *
 * <p>What the patches changed is reported: each rewritten value with its old and new value (the
 * AMOLED dark theme's palette and sheet colors), each entry the rebuild renamed (it still resolves
 * by id, but a lookup by its old name finds nothing), each added one with every value it holds (a
 * bag's parent and items), and each file only the patched table names, with the SHA-256 of its
 * bytes. A resource a patch added is named by its label, never by the id the rebuild picked for it.
 * Given an allowlist, each of those has to be one it allows: under {@code [rebuild]}, which any
 * rebuild of the table does, or under a patch the run selected ({@code HUSHTUMBLR_PATCH_SELECTION},
 * one name a line). Each line allows one change, and a color a patch option sets is written
 * {@code #{option}}, or {@code #{option+13}} raised. Anything else fails, so a table or file
 * swapped into the CLI's copy of its input can't pass as something a patch did.
 *
 * <p>Usage: {@code java -cp <morphe desktop jar> ResourceTableCheck.java <stock.apk> <patched.apk>
 * [report.txt [allowlist.txt]]}. The report file gets every line; the console gets the counts and
 * the first lines of each list. A malformed allowlist, or one given with no selection, exits 2.
 */
public final class ResourceTableCheck {
    private static final int SHOWN = 40;
    /**
     * The files a signer writes at the top of META-INF. CASE_INSENSITIVE without UNICODE_CASE folds
     * ASCII letters alone, so a name such as META-INF/payload.ſf, which Locale.ROOT folds to .SF,
     * is an ordinary entry held to the stock archive like any other.
     */
    private static final Pattern SIGNATURE = Pattern.compile("META-INF/(MANIFEST\\.MF|[A-Za-z0-9._-]+\\.(SF|RSA|DSA|EC))",
            Pattern.CASE_INSENSITIVE);
    /** What an allowlist line can name, each the way the report lists it. */
    private static final Set<String> KINDS = Set.of("rewritten", "renamed", "dropped", "added", "moved", "file");
    private static final String SELECTION = "HUSHTUMBLR_PATCH_SELECTION";
    /**
     * In an allowlist line, the opaque color a patch option sets ({@code #{option}}), or that color
     * with a step added to each channel as far as white ({@code #{option+13}}). Every such line in
     * a run has to come out of one color.
     */
    private static final Pattern OPTION_COLOR = Pattern.compile("#\\{option(?:\\+([0-9]{1,3}))?\\}");

    private final Map<Integer, String> stockNames = new HashMap<>();
    /**
     * Every resource of each table by id, built by walking the table. ARSCLib's own
     * getResource(int) answers null for an entry id from 0x8000 up (0x7f0a8000 on TikTok 47.0.3), which
     * would read as thousands of lost ids.
     */
    private final Map<Integer, ResourceEntry> stockById = new HashMap<>();
    private final Map<Integer, ResourceEntry> patchedById = new HashMap<>();
    private final List<String> failures = new ArrayList<>();
    private final List<String> rewritten = new ArrayList<>();
    private final List<String> renamed = new ArrayList<>();
    /**
     * Resources a split bundle carries that merging it into one APK removes on purpose: the
     * split descriptor bundletool writes into base.apk (xml/splits0, which the manifest's
     * com.android.vending.splits entry names). A merged APK has no splits to describe.
     */
    private final List<String> droppedWithSplits = new ArrayList<>();
    private final List<String> added = new ArrayList<>();
    /**
     * What each added resource holds, a line a value: "type/name [config] value", and for a bag its
     * parent and each item. Without ids, which the rebuild picks for what a patch adds.
     */
    private final List<String> addedValues = new ArrayList<>();
    private final List<String> moved = new ArrayList<>();
    /** Files a patched value names that the stock table doesn't give it: ones a patch added. */
    private final List<String> addedFiles = new ArrayList<>();
    /** The allowlist's lines the run's sections hold and no change of this run matched. */
    private final List<String> unseen = new ArrayList<>();
    private final List<String> sectionsUsed = new ArrayList<>();
    private String allowlistName;
    private int deltaChecked;
    private final List<String> absentInStock = new ArrayList<>();
    /**
     * Archive paths the patched table names that the stock table doesn't, and stock paths a file
     * moved from or that went with the split descriptor.
     */
    private final Set<String> namedByPatches = new HashSet<>();
    private final Set<String> movedFrom = new HashSet<>();
    private int entriesCompared;
    private int signatureEntries;
    private int stockResources;
    private int stockValues;
    private int patchedResources;
    private int files;

    public static void main(String[] args) throws Exception {
        if (args.length < 2 || args.length > 4) {
            System.err.println("usage: ResourceTableCheck <stock.apk> <patched.apk> [report.txt [allowlist.txt]]");
            System.exit(2);
        }
        File stockFile = new File(args[0]);
        File patchedFile = new File(args[1]);
        Map<String, Set<String>> allowlist = null;
        Set<String> selected = null;
        if (args.length == 4) {
            String selection = System.getenv(SELECTION);
            if (selection == null) {
                System.err.println("An allowlist was given with no patch selection in " + SELECTION + ".");
                System.exit(2);
            }
            selected = new HashSet<>();
            for (String name : selection.split("\r?\n")) if (!name.isEmpty()) selected.add(name);
            try {
                allowlist = readAllowlist(new File(args[3]));
            } catch (IllegalArgumentException malformed) {
                System.err.println(malformed.getMessage());
                System.exit(2);
            }
        }
        ResourceTableCheck check = new ResourceTableCheck();
        try (ZipFile stockZip = new ZipFile(stockFile); ZipFile patchedZip = new ZipFile(patchedFile)) {
            check.run(table(stockZip), stockZip, table(patchedZip), patchedZip);
        }
        if (allowlist != null) check.holdToAllowlist(new File(args[3]).getName(), allowlist, selected);
        List<String> lines = check.lines(stockFile.getName(), patchedFile.getName());
        if (args.length >= 3) {
            Files.write(new File(args[2]).toPath(), lines, StandardCharsets.UTF_8);
        }
        PrintWriter out = new PrintWriter(System.out, true, StandardCharsets.UTF_8);
        for (String line : check.console(lines)) out.println(line);
        System.exit(check.failures.isEmpty() ? 0 : 1);
    }

    private static TableBlock table(ZipFile zip) throws IOException {
        ZipEntry arsc = zip.getEntry(TableBlock.FILE_NAME);
        if (arsc == null) throw new IOException(zip.getName() + " has no " + TableBlock.FILE_NAME);
        try (InputStream in = new BufferedInputStream(zip.getInputStream(arsc))) {
            // ARSCLib 675bed2de3 (patcher 2.3.0, desktop 2.1.x) reports read progress through a
            // callback here. The check reads one table at a time and reports nothing.
            return TableBlock.load(in, (read, total) -> { });
        }
    }

    private void run(TableBlock stock, ZipFile stockZip, TableBlock patched, ZipFile patchedZip) throws IOException {
        Map<Integer, PackageBlock> patchedPackages = new LinkedHashMap<>();
        for (PackageBlock block : patched.listPackages()) {
            patchedPackages.put(block.getId(), block);
            for (ResourceEntry resource : resources(block)) patchedById.put(resource.getResourceId(), resource);
        }
        for (PackageBlock block : stock.listPackages()) {
            for (ResourceEntry resource : resources(block)) {
                stockNames.put(resource.getResourceId(), label(resource));
                stockById.put(resource.getResourceId(), resource);
            }
        }

        Set<Integer> seen = new HashSet<>();
        for (PackageBlock stockPackage : stock.listPackages()) {
            PackageBlock patchedPackage = patchedPackages.get(stockPackage.getId());
            if (patchedPackage == null) {
                failures.add(String.format(Locale.ROOT, "package 0x%02x %s: not in the patched table",
                        stockPackage.getId(), stockPackage.getName()));
                continue;
            }
            for (ResourceEntry resource : resources(stockPackage)) {
                stockResources++;
                int id = resource.getResourceId();
                seen.add(id);
                ResourceEntry match = patchedById.get(id);
                if (match == null) {
                    if (isSplitDescriptor(resource)) {
                        droppedWithSplits.add(hex(id) + " " + label(resource));
                        // Its file goes with it, which the archive check allows.
                        for (Entry entry : values(resource)) {
                            if (entry.isComplex()) continue;
                            String path = filePath(entry.getResValue(), resource.getType());
                            if (path != null) movedFrom.add(path);
                        }
                        continue;
                    }
                    failures.add(hex(id) + " " + label(resource) + ": not in the patched table");
                    continue;
                }
                if (!resource.getType().equals(match.getType())) {
                    failures.add(hex(id) + " " + label(resource) + ": is " + label(match) + " in the patched table");
                    continue;
                }
                if (!resource.getName().equals(match.getName())) {
                    renamed.add(hex(id) + " " + label(resource) + " is " + label(match));
                }
                compareValues(resource, match, patched, patchedPackages.keySet());
            }
        }
        for (PackageBlock block : patched.listPackages()) {
            for (ResourceEntry resource : resources(block)) {
                patchedResources++;
                if (seen.contains(resource.getResourceId())) continue;
                added.add(hex(resource.getResourceId()) + " " + label(resource));
                for (Entry entry : values(resource)) {
                    String where = label(resource) + " [" + config(entry.getResConfig()) + "]";
                    if (entry.isComplex()) addedValues.addAll(bagLines(where + " ", (ResTableMapEntry) entry.getTableEntry()));
                    else addedValues.add(where + " " + value(entry.getResValue(), resource.getType()));
                    checkReferences(resource, entry, null, patched, patchedPackages.keySet());
                }
            }
        }
        checkFiles(stock, stockZip, patched, patchedZip);
        checkArchive(stockZip, patchedZip);
    }

    /**
     * Every entry patching doesn't write is the stock one, byte for byte, read and hashed rather
     * than taken from the archive's CRC fields. The desktop CLI copies its input into a folder of
     * its own and rebuilds that copy, so an entry no patch touches comes from a file nothing held
     * while it was copied; held to the stock merge here, a swap there is refused. Patching writes
     * the dex (changed or added), the resource table and the manifest, each checked on its own,
     * and the files the patched table names that the stock one doesn't. Signature files are the
     * signer's: an unsigned output leaves the bundle's out and a signed one has its own. A name
     * that appears twice in either archive is refused, since a reader would see only one of them.
     */
    private void checkArchive(ZipFile stockZip, ZipFile patchedZip) throws IOException {
        Map<String, ZipEntry> patchedEntries = entries(patchedZip, "patched");
        Map<String, ZipEntry> stockEntries = entries(stockZip, "stock");
        for (Map.Entry<String, ZipEntry> pair : stockEntries.entrySet()) {
            String name = pair.getKey();
            if (isWrittenByPatching(name)) continue;
            if (isSignature(name)) {
                signatureEntries++;
                continue;
            }
            ZipEntry patchedEntry = patchedEntries.get(name);
            if (patchedEntry == null) {
                if (!movedFrom.contains(name)) failures.add("archive entry " + name + ": not in the patched archive");
                continue;
            }
            entriesCompared++;
            if (!MessageDigest.isEqual(digest(stockZip, pair.getValue()), digest(patchedZip, patchedEntry))) {
                failures.add("archive entry " + name + ": not the bytes the stock archive holds");
            }
        }
        for (String name : patchedEntries.keySet()) {
            if (stockEntries.containsKey(name) || isWrittenByPatching(name) || isSignature(name) || namedByPatches.contains(name)) continue;
            failures.add("archive entry " + name + ": added, and patching writes no such file");
        }
    }

    private Map<String, ZipEntry> entries(ZipFile zip, String side) {
        Map<String, ZipEntry> entries = new LinkedHashMap<>();
        for (Enumeration<? extends ZipEntry> all = zip.entries(); all.hasMoreElements(); ) {
            ZipEntry entry = all.nextElement();
            if (entry.isDirectory()) continue;
            if (entries.put(entry.getName(), entry) != null) {
                failures.add("archive entry " + entry.getName() + ": appears more than once in the " + side + " archive");
            }
        }
        return entries;
    }

    private static boolean isWrittenByPatching(String name) {
        return name.matches("classes[0-9]*\\.dex") || name.equals(TableBlock.FILE_NAME) || name.equals("AndroidManifest.xml");
    }

    private static boolean isSignature(String name) {
        return SIGNATURE.matcher(name).matches();
    }

    /**
     * An allowlist: sections named in brackets, [rebuild] or a patch's name, each holding lines of
     * a kind and an item as the report lists it, except that an added resource and a file only
     * the patched table names are given without the id the rebuild picked for it. Blank lines and
     * lines starting with # are left out.
     */
    private static Map<String, Set<String>> readAllowlist(File file) throws IOException {
        Map<String, Set<String>> sections = new LinkedHashMap<>();
        Set<String> current = null;
        int number = 0;
        for (String raw : Files.readAllLines(file.toPath(), StandardCharsets.UTF_8)) {
            number++;
            String line = (number == 1 && raw.startsWith("﻿") ? raw.substring(1) : raw).stripTrailing();
            if (line.isEmpty() || line.startsWith("#")) continue;
            if (line.startsWith("[") && line.endsWith("]")) {
                String name = line.substring(1, line.length() - 1);
                if (name.isBlank() || !name.equals(name.strip()) || sections.containsKey(name)) {
                    throw new IllegalArgumentException(file.getName() + " line " + number + ": a section with no name or one named twice: " + line);
                }
                current = new LinkedHashSet<>();
                sections.put(name, current);
                continue;
            }
            int space = line.indexOf(' ');
            if (current == null || space < 0 || !KINDS.contains(line.substring(0, space)) || line.substring(space + 1).isBlank()) {
                throw new IllegalArgumentException(file.getName() + " line " + number
                        + ": not a kind (" + String.join(", ", new java.util.TreeSet<>(KINDS)) + ") and an item under a section: " + line);
            }
            current.add(line);
        }
        if (!sections.containsKey("rebuild")) throw new IllegalArgumentException(file.getName() + " has no [rebuild] section.");
        return sections;
    }

    /**
     * Every change this run reports has to be one [rebuild] or a selected patch's section allows,
     * and each line allows one change: a resource with the same label in two packages, or a line
     * whose placeholder two values fit, is two changes. A placeholder stands for an opaque color,
     * and the colors every placeholder of the run fits have to be one option color: that color for
     * {@code #{option}}, raised by the step for {@code #{option+13}}.
     */
    private void holdToAllowlist(String name, Map<String, Set<String>> allowlist, Set<String> selected) {
        allowlistName = name;
        Set<String> allowed = new LinkedHashSet<>();
        for (Map.Entry<String, Set<String>> section : allowlist.entrySet()) {
            if (!section.getKey().equals("rebuild") && !selected.contains(section.getKey())) continue;
            sectionsUsed.add(section.getKey());
            allowed.addAll(section.getValue());
        }
        Map<String, Pattern> placeholders = new LinkedHashMap<>();
        Map<String, List<Integer>> steps = new HashMap<>();
        for (String line : allowed) {
            Matcher placeholder = OPTION_COLOR.matcher(line);
            StringBuilder pattern = new StringBuilder();
            List<Integer> lineSteps = new ArrayList<>();
            int from = 0;
            while (placeholder.find()) {
                pattern.append(Pattern.quote(line.substring(from, placeholder.start()))).append("(#ff[0-9a-f]{6})");
                lineSteps.add(placeholder.group(1) == null ? 0 : Integer.parseInt(placeholder.group(1)));
                from = placeholder.end();
            }
            if (lineSteps.isEmpty()) continue;
            pattern.append(Pattern.quote(line.substring(from)));
            placeholders.put(line, Pattern.compile(pattern.toString()));
            steps.put(line, lineSteps);
        }
        Map<String, Integer> used = new LinkedHashMap<>();
        // Each color a placeholder took, with the change it came from and the step its line names.
        List<Object[]> colors = new ArrayList<>();
        for (String change : delta()) {
            deltaChecked++;
            String line = allowed.contains(change) ? change : null;
            for (Iterator<Map.Entry<String, Pattern>> it = placeholders.entrySet().iterator(); line == null && it.hasNext(); ) {
                Map.Entry<String, Pattern> placeholder = it.next();
                Matcher fit = placeholder.getValue().matcher(change);
                if (!fit.matches()) continue;
                line = placeholder.getKey();
                for (int group = 1; group <= fit.groupCount(); group++) {
                    colors.add(new Object[] { change, steps.get(line).get(group - 1), (int) Long.parseLong(fit.group(group).substring(1), 16) });
                }
            }
            if (line == null) {
                failures.add("resource delta " + change + ": allowed neither by [rebuild] nor by a selected patch in " + name);
            } else if (used.merge(line, 1, Integer::sum) == 2) {
                failures.add("resource delta " + line + ": a line of " + name + " allows one change, and more than one of this run fits it");
            }
        }
        Integer option = null;
        for (Object[] color : colors) if ((Integer) color[1] == 0 && option == null) option = (Integer) color[2];
        for (Object[] color : colors) {
            int step = (Integer) color[1];
            int found = (Integer) color[2];
            if (option == null) {
                failures.add("resource delta " + color[0] + ": a color raised from the option's, and no line of this run gives the option's own color");
            } else if (found != raised(option, step)) {
                failures.add("resource delta " + color[0] + String.format(Locale.ROOT, ": #%08x isn't the option color #%08x", found, option)
                        + (step == 0 ? "" : String.format(Locale.ROOT, " raised by %d, #%08x", step, raised(option, step)))
                        + ", which every #{option} line of a run comes from");
            }
        }
        for (String line : allowed) if (!used.containsKey(line)) unseen.add(line);
    }

    /** An opaque color with [step] added to each channel, as far as white, as the patch raises it. */
    private static int raised(int color, int step) {
        int result = 0xff000000;
        for (int shift = 0; shift <= 16; shift += 8) result |= Math.min(0xff, (color >>> shift & 0xff) + step) << shift;
        return result;
    }

    /** What this run changed, each as an allowlist line names it. */
    private List<String> delta() {
        List<String> changes = new ArrayList<>();
        for (String item : rewritten) changes.add("rewritten " + item);
        for (String item : renamed) changes.add("renamed " + item);
        for (String item : droppedWithSplits) changes.add("dropped " + item);
        for (String item : added) changes.add("added " + item.substring(item.indexOf(' ') + 1));
        for (String item : addedValues) changes.add("added " + item);
        for (String item : moved) changes.add("moved " + item);
        for (String item : addedFiles) changes.add("file " + item);
        return changes;
    }

    /** Each entry is read once, though the table and the archive check can both ask for it. */
    private final Map<String, byte[]> digests = new HashMap<>();

    private byte[] digest(ZipFile zip, ZipEntry entry) throws IOException {
        String key = zip.getName() + '\u0000' + entry.getName();
        byte[] known = digests.get(key);
        if (known == null) {
            known = sha256(zip, entry);
            digests.put(key, known);
        }
        return known;
    }

    private static byte[] sha256(ZipFile zip, ZipEntry entry) throws IOException {
        MessageDigest sha;
        try {
            sha = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException missing) {
            throw new IOException(missing);
        }
        try (InputStream in = zip.getInputStream(entry)) {
            byte[] buffer = new byte[1 << 16];
            for (int read; (read = in.read(buffer)) > 0; ) sha.update(buffer, 0, read);
        }
        return sha.digest();
    }

    /** Whether this is bundletool's split descriptor, which a merge into one APK drops. */
    private static boolean isSplitDescriptor(ResourceEntry resource) {
        return "xml".equals(resource.getType()) && resource.getName() != null
                && resource.getName().matches("splits[0-9]+");
    }

    private void compareValues(ResourceEntry resource, ResourceEntry match, TableBlock patched, Set<Integer> packages) {
        Set<ResConfig> matched = new HashSet<>();
        for (Entry entry : values(resource)) {
            stockValues++;
            ResConfig config = entry.getResConfig();
            Entry other = match.get(config);
            String where = hex(resource.getResourceId()) + " " + label(resource) + " [" + config(config) + "]";
            if (other == null || other.isNull()) {
                failures.add(where + ": the value is gone");
                continue;
            }
            matched.add(other.getResConfig());
            if (entry.isComplex() != other.isComplex()) {
                failures.add(where + ": was " + (entry.isComplex() ? "a bag" : "a value") + ", is "
                        + (other.isComplex() ? "a bag" : "a value"));
                continue;
            }
            if (!entry.isComplex()) {
                String before = value(entry.getResValue(), resource.getType());
                String after = value(other.getResValue(), resource.getType());
                if (!before.equals(after) && !(isFile(before) && isFile(after))) {
                    rewritten.add(where + " " + before + " -> " + after);
                    checkReference(where, other.getResValue(), patched, packages);
                }
                continue;
            }
            compareBag(where, entry, other, patched, packages);
        }
        for (Entry other : values(match)) {
            if (matched.contains(other.getResConfig())) continue;
            String where = hex(match.getResourceId()) + " " + label(match) + " [" + config(other.getResConfig()) + "] added ";
            if (other.isComplex()) rewritten.addAll(bagLines(where + "bag ", (ResTableMapEntry) other.getTableEntry()));
            else rewritten.add(where + value(other.getResValue(), match.getType()));
            checkReferences(match, other, null, patched, packages);
        }
    }

    /**
     * A bag as lines that each start with [prefix]: its parent, then each item by attribute, in the
     * bag's order. An attribute set again is numbered from its second time on.
     */
    private List<String> bagLines(String prefix, ResTableMapEntry bag) {
        List<String> lines = new ArrayList<>();
        lines.add(prefix + "parent " + reference(bag.getParentId()));
        Map<Integer, Integer> times = new HashMap<>();
        for (ResValueMap item : bag) {
            int time = times.merge(item.getNameId(), 1, Integer::sum);
            lines.add(prefix + "item" + (time == 1 ? "" : "#" + time) + " " + name(item.getNameId()) + " " + value(item, null));
        }
        return lines;
    }

    private void compareBag(String where, Entry entry, Entry other, TableBlock patched, Set<Integer> packages) {
        ResTableMapEntry before = (ResTableMapEntry) entry.getTableEntry();
        ResTableMapEntry after = (ResTableMapEntry) other.getTableEntry();
        if (before.getParentId() != after.getParentId()) {
            // A style inherits every item its parent sets, so a parent that goes or changes drops
            // or swaps all of them at once. No patch moves one, so it fails like a lost item.
            failures.add(where + ": its parent " + reference(before.getParentId()) + " became "
                    + reference(after.getParentId()) + ", which drops or swaps every item it inherits");
        }
        // Per attr, in order: a bag can set one attr more than once (TikTok 47.0.3's style/aed sets
        // windowBackground twice), and a map keyed by attr keeps only the last. Each time from the
        // second is numbered, as bagLines numbers it, so two of them changed alike are two lines.
        Map<Integer, List<ResValueMap>> beforeItems = items(before);
        Map<Integer, List<ResValueMap>> afterItems = items(after);
        for (Map.Entry<Integer, List<ResValueMap>> named : beforeItems.entrySet()) {
            int name = named.getKey();
            List<ResValueMap> was = named.getValue();
            List<ResValueMap> is = afterItems.getOrDefault(name, List.of());
            for (int index = 0; index < was.size(); index++) {
                String itemWhere = itemWhere(where, name, index);
                if (index >= is.size()) {
                    failures.add(itemWhere + ": the item is gone");
                    continue;
                }
                String old = value(was.get(index), null);
                String now = value(is.get(index), null);
                if (!old.equals(now)) {
                    rewritten.add(itemWhere + " " + old + " -> " + now);
                    checkReference(itemWhere, is.get(index), patched, packages);
                }
            }
            for (int index = was.size(); index < is.size(); index++) {
                String itemWhere = itemWhere(where, name, index);
                rewritten.add(itemWhere + " added " + value(is.get(index), null));
                checkReference(itemWhere, is.get(index), patched, packages);
            }
        }
        for (Map.Entry<Integer, List<ResValueMap>> named : afterItems.entrySet()) {
            if (beforeItems.containsKey(named.getKey())) continue;
            List<ResValueMap> is = named.getValue();
            for (int index = 0; index < is.size(); index++) {
                String itemWhere = itemWhere(where, named.getKey(), index);
                rewritten.add(itemWhere + " added " + value(is.get(index), null));
                checkReference(itemWhere, is.get(index), patched, packages);
            }
        }
    }

    /** An item of a bag by its attr, numbered from the second time the bag sets that attr. */
    private String itemWhere(String where, int name, int index) {
        return where + " item" + (index == 0 ? "" : "#" + (index + 1)) + " " + name(name);
    }

    /** Every file a patched value names is in the patched archive, unless the stock one lacked it too. */
    private void checkFiles(TableBlock stock, ZipFile stockZip, TableBlock patched, ZipFile patchedZip) throws IOException {
        for (PackageBlock block : patched.listPackages()) {
            for (ResourceEntry resource : resources(block)) {
                ResourceEntry original = stockById.get(resource.getResourceId());
                for (Entry entry : values(resource)) {
                    if (entry.isComplex()) continue;
                    String path = filePath(entry.getResValue(), resource.getType());
                    if (path == null) continue;
                    files++;
                    String where = hex(resource.getResourceId()) + " " + label(resource) + " [" + config(entry.getResConfig()) + "]";
                    String stockPath = null;
                    if (original != null) {
                        Entry stockEntry = original.get(entry.getResConfig());
                        if (stockEntry != null && !stockEntry.isNull() && !stockEntry.isComplex()) {
                            stockPath = filePath(stockEntry.getResValue(), original.getType());
                        }
                    }
                    ZipEntry file = patchedZip.getEntry(path);
                    ZipEntry stockFile = stockPath == null ? null : stockZip.getEntry(stockPath);
                    if (file == null) {
                        if (stockPath != null && stockFile == null) {
                            absentInStock.add(where + " " + path);
                        } else {
                            failures.add(where + ": names " + path + ", which is not in the patched archive");
                        }
                        continue;
                    }
                    if (stockPath == null || stockFile == null) {
                        // A file only the patched table names: one a patch added. Named without
                        // the id, which the rebuild picks for a resource a patch adds, and with
                        // the SHA-256 of its bytes, so a line allows that file and no other.
                        namedByPatches.add(path);
                        addedFiles.add(label(resource) + " [" + config(entry.getResConfig()) + "] " + path + " "
                                + java.util.HexFormat.of().formatHex(digest(patchedZip, file)));
                        continue;
                    }
                    if (!stockPath.equals(path)) {
                        moved.add(where + " " + stockPath + " -> " + path);
                        movedFrom.add(stockPath);
                        namedByPatches.add(path);
                    }
                    // No patch writes a resource file, so a file whose bytes changed is one the
                    // rebuild swapped or damaged (a path clash loses content as well as paths).
                    // Hashed, not taken from the CRC field: two files can share a CRC and a size.
                    if (!MessageDigest.isEqual(digest(stockZip, stockFile), digest(patchedZip, file))) {
                        failures.add(where + ": " + path + " is not the file the stock archive holds for it");
                    }
                }
            }
        }
    }

    private void checkReferences(ResourceEntry resource, Entry entry, String where, TableBlock patched, Set<Integer> packages) {
        String at = where != null ? where
                : hex(resource.getResourceId()) + " " + label(resource) + " [" + config(entry.getResConfig()) + "]";
        if (!entry.isComplex()) {
            checkReference(at, entry.getResValue(), patched, packages);
            return;
        }
        ResTableMapEntry bag = (ResTableMapEntry) entry.getTableEntry();
        checkId(at + " parent", bag.getParentId(), patched, packages);
        for (ResValueMap item : bag) checkReference(at + " item " + name(item.getNameId()), item, patched, packages);
    }

    private void checkReference(String where, ValueItem value, TableBlock patched, Set<Integer> packages) {
        if (value == null) return;
        ValueType type = value.getValueType();
        if (type == ValueType.REFERENCE || type == ValueType.DYNAMIC_REFERENCE
                || type == ValueType.ATTRIBUTE || type == ValueType.DYNAMIC_ATTRIBUTE) {
            checkId(where, value.getData(), patched, packages);
        }
    }

    /** An id in one of the table's own packages has to be in it; the framework's are Android's to answer. */
    private void checkId(String where, int id, TableBlock patched, Set<Integer> packages) {
        if (id == 0 || !packages.contains(id >>> 24)) return;
        if (!patchedById.containsKey(id)) failures.add(where + ": points at " + hex(id) + ", which is not in the patched table");
    }

    private static Map<Integer, List<ResValueMap>> items(ResTableMapEntry bag) {
        Map<Integer, List<ResValueMap>> items = new LinkedHashMap<>();
        for (ResValueMap item : bag) items.computeIfAbsent(item.getNameId(), name -> new ArrayList<>()).add(item);
        return items;
    }

    private static List<ResourceEntry> resources(PackageBlock block) {
        List<ResourceEntry> list = new ArrayList<>();
        for (SpecTypePair pair : block.listSpecTypePairs()) {
            Iterator<ResourceEntry> iterator = pair.getResources();
            while (iterator.hasNext()) {
                ResourceEntry resource = iterator.next();
                if (resource != null && !resource.isEmpty()) list.add(resource);
            }
        }
        return list;
    }

    private static List<Entry> values(ResourceEntry resource) {
        List<Entry> list = new ArrayList<>();
        Iterator<Entry> iterator = resource.iterator();
        while (iterator.hasNext()) {
            Entry entry = iterator.next();
            if (entry != null && !entry.isNull()) list.add(entry);
        }
        return list;
    }

    /**
     * A value as text that does not depend on where the rebuild put it in a string pool, or on the
     * id the rebuild picked for a resource a patch added. Two values render alike only when they
     * are alike: a string's backslashes and quotes are escaped along with its line breaks, so one
     * can't read as another or as the end of a report line, and a styled string's spans follow its
     * text one by one (tag and character range), so markup a span makes never reads as the same
     * markup typed into a plain string. Each color type and each dynamic kind is named (an 8-digit
     * color, the form a patch writes, stays bare for the #{option} lines), and an unreadable string
     * carries its pool index.
     */
    private String value(ValueItem value, String resourceType) {
        if (value == null) return "(none)";
        ValueType type = value.getValueType();
        int data = value.getData();
        if (type == null) return String.format(Locale.ROOT, "type 0x%02x 0x%08x", value.getType() & 0xff, data);
        switch (type) {
            case STRING:
                StringItem item = value.getDataAsPoolString();
                String text = item == null ? null : item.get();
                if (text == null) return String.format(Locale.ROOT, "string (unreadable, pool index %d)", data);
                List<String> spans = new ArrayList<>();
                if (item.hasStyle()) for (StyleSpan span : item.getStyle()) {
                    String tag = span.getString();
                    spans.add((tag == null ? "unreadable" : quoted(tag)) + " " + span.getFirstChar() + "-" + span.getLastChar());
                }
                if (spans.isEmpty() && resourceType != null && !"string".equals(resourceType) && text.startsWith("res/")) return "file " + text;
                return quoted(text) + (spans.isEmpty() ? "" : " with spans " + String.join(", ", spans));
            case REFERENCE:
                return reference(data);
            case DYNAMIC_REFERENCE:
                return "dynamic " + reference(data);
            case ATTRIBUTE:
                return "?" + id(data);
            case DYNAMIC_ATTRIBUTE:
                return "dynamic ?" + id(data);
            case COLOR_ARGB8:
                return String.format(Locale.ROOT, "#%08x", data);
            case COLOR_RGB8:
            case COLOR_ARGB4:
            case COLOR_RGB4:
                return type.name().toLowerCase(Locale.ROOT) + String.format(Locale.ROOT, " #%08x", data);
            default:
                return type.name().toLowerCase(Locale.ROOT) + String.format(Locale.ROOT, " 0x%08x", data);
        }
    }

    private static String quoted(String text) {
        return "\"" + text.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") + "\"";
    }

    private String filePath(ValueItem value, String resourceType) {
        String text = value(value, resourceType);
        return isFile(text) ? text.substring("file ".length()) : null;
    }

    private static boolean isFile(String value) {
        return value.startsWith("file ");
    }

    private String reference(int id) {
        return id == 0 ? "@null" : "@" + id(id);
    }

    /** An id by number, or by its label in braces for a resource only the patched table has, whose number the rebuild picked. */
    private String id(int id) {
        ResourceEntry added = stockById.containsKey(id) ? null : patchedById.get(id);
        return added == null ? hex(id) : "{" + label(added) + "}";
    }

    private String name(int id) {
        String known = stockNames.get(id);
        return known == null ? id(id) : hex(id) + " " + known;
    }

    private static String label(ResourceEntry resource) {
        return resource.getType() + "/" + resource.getName();
    }

    private static String config(ResConfig config) {
        if (config == null) return "default";
        String qualifiers = config.getQualifiers();
        if (qualifiers == null || qualifiers.isEmpty()) return "default";
        return qualifiers.startsWith("-") ? qualifiers.substring(1) : qualifiers;
    }

    private static String hex(int id) {
        return String.format(Locale.ROOT, "0x%08x", id);
    }

    private List<String> lines(String stockName, String patchedName) {
        List<String> lines = new ArrayList<>();
        lines.add(String.format(Locale.ROOT, "[resources] %s: %d resources with %d values; %s: %d resources",
                stockName, stockResources, stockValues, patchedName, patchedResources));
        section(lines, "rewritten values", byType(rewritten));
        section(lines, "renamed by the rebuild (still resolved by id; a lookup by the old name finds nothing)", renamed);
        section(lines, "dropped with the split metadata when the bundle was merged", droppedWithSplits);
        section(lines, "added resources", added);
        section(lines, "what the added resources hold, a value a line (a bag's parent and items)", addedValues);
        lines.add(String.format(Locale.ROOT, "[resources] files named by the patched table: %d, moved %d, absent from the stock archive too %d",
                files, moved.size(), absentInStock.size()));
        for (String line : moved) lines.add("  moved " + line);
        for (String line : absentInStock) lines.add("  absent in both " + line);
        section(lines, "files only the patched table names", addedFiles);
        lines.add(String.format(Locale.ROOT, "[resources] archive: %d entries patching doesn't write hold the stock bytes, %d stock signature files left to the signer",
                entriesCompared, signatureEntries));
        if (allowlistName != null) {
            lines.add(String.format(Locale.ROOT, "[resources] resource delta: %d changes held to %s, sections %s",
                    deltaChecked, allowlistName, String.join(", ", sectionsUsed)));
            section(lines, "allowed in those sections and not seen in this run", unseen);
        }
        if (failures.isEmpty()) {
            lines.add(String.format(Locale.ROOT, "[resources] every one of the stock table's %d resources resolves in the patched table, with its type and a value in each of its configurations, and every file and reference the patched values name is there",
                    stockResources));
        } else {
            for (String failure : failures) lines.add("[resources] FAIL " + failure);
            lines.add("[resources] " + failures.size() + " failure(s)");
        }
        return lines;
    }

    /** Colors, then styles, then every other type by name, strings last: the lines start "0x... type/name". */
    private static List<String> byType(List<String> items) {
        List<String> sorted = new ArrayList<>(items);
        sorted.sort(java.util.Comparator.comparingInt((String line) -> typeRank(line)).thenComparing(line -> typeOf(line)));
        return sorted;
    }

    private static String typeOf(String line) {
        int space = line.indexOf(' ');
        int slash = line.indexOf('/', space + 1);
        return space < 0 || slash < 0 ? "" : line.substring(space + 1, slash);
    }

    private static int typeRank(String line) {
        switch (typeOf(line)) {
            case "color": return 0;
            case "style": return 1;
            case "string": return 3;
            default: return 2;
        }
    }

    private static void section(List<String> lines, String title, List<String> items) {
        lines.add("[resources] " + title + ": " + items.size());
        for (String item : items) lines.add("  " + item);
    }

    /** The console keeps every heading and failure, and the first lines under each heading. */
    private List<String> console(List<String> lines) {
        List<String> shown = new ArrayList<>();
        int under = 0;
        int hidden = 0;
        for (String line : lines) {
            if (!line.startsWith("  ")) {
                if (hidden > 0) shown.add("  ... " + hidden + " more in the report");
                under = 0;
                hidden = 0;
                shown.add(line);
                continue;
            }
            if (under++ < SHOWN) shown.add(line);
            else hidden++;
        }
        if (hidden > 0) shown.add("  ... " + hidden + " more in the report");
        return shown;
    }
}
