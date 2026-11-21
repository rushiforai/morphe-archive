package app.morphe.patches.maps;

import com.reandroid.apk.ApkModule;
import com.reandroid.archive.ByteInputSource;
import com.reandroid.archive.InputSource;
import com.reandroid.archive.ZipEntryMap;
import com.reandroid.arsc.chunk.PackageBlock;
import com.reandroid.arsc.chunk.TableBlock;
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock;
import com.reandroid.arsc.chunk.xml.ResXmlAttribute;
import com.reandroid.arsc.chunk.xml.ResXmlElement;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Embeds a MicroG-RE build (built with -PgmsPackageName=&lt;maps package&gt; -PresPackageId=0x7e) into a patched
 * Google Maps NMAX APK: MicroG's resources become a second resource package, its components join Maps'
 * manifest in MicroG-only processes, and its dex and native libraries go to assets/nmaxgms/ for
 * EmbeddedGmsFactory to load with its own class loader (455 class names clash with Maps').
 *
 * NmaxConnect's in-app patcher calls {@link #embed} with the MicroG build bundled at {@link #MICROG_RESOURCE}.
 * Desktop: tools/embed-gms/build.sh.
 */
public class EmbedGms {
    static final int NAME = 0x01010003, PROCESS = 0x01010011, AUTHORITIES = 0x01010018, THEME = 0x01010000,
            TARGET_ACTIVITY = 0x01010202, APP_COMPONENT_FACTORY = 0x0101057a, REQUIRED = 0x0101028e,
            ENABLED = 0x0101000e;
    static final String FACTORY = "app.morphe.extension.maps.patches.EmbeddedGmsFactory";
    static final String ALIAS = "nmaxgms."; // EmbeddedGmsFactory strips it
    static final String RES_DIR = "res/nmaxgms/";
    static final String RELOCATED = "nmaxwork."; // not ALIAS: EmbeddedGmsFactory strips that one
    static final Set<String> COMPONENTS = Set.of("activity", "activity-alias", "service", "receiver", "provider");
    // MicroG-only processes; EmbeddedGmsFactory swaps the class loader in these.
    static final Set<String> GMS_PROCESSES = Set.of(":gms", ":persistent", ":ui", ":unstable");
    // Features Maps NMAX never asks MicroG for (Maps API for other apps, barcode scanning): ~32 MB of native code.
    static final Set<String> SKIP_LIBS = Set.of("libmapbox-gl.so", "libvtm-jni.so", "libopencv_java4.so");

    /** MicroG-RE built for Maps NMAX (see build.sh), without the {@link #SKIP_LIBS}; a class-path resource of this bundle. */
    public static final String MICROG_RESOURCE = "/nmaxgms/microg.apk";

    public static void main(String[] args) throws Exception {
        embed(new File(args[0]), new File(args[1]), new File(args[2]));
    }

    /** Writes {@code out}: the patched Maps APK {@code mapsApk} with the MicroG APK {@code microgApk} inside, unsigned. */
    public static void embed(File mapsApk, File microgApk, File out) throws Exception {
        ApkModule maps = ApkModule.loadApkFile(mapsApk);
        ApkModule gms = ApkModule.loadApkFile(microgApk);

        mergeResources(maps, gms);
        mergeManifest(maps, gms);
        packCode(maps, gms);

        maps.writeApk(out);
        System.out.println("wrote " + out);
    }

    static void mergeResources(ApkModule maps, ApkModule gms) {
        TableBlock table = maps.getTableBlock();
        TableBlock gmsTable = gms.getTableBlock();
        for (PackageBlock p : gmsTable) {
            if (p.getId() == 0x7f) throw new IllegalStateException("MicroG must be built with -PresPackageId=0x7e");
            if (table.getPackageBlockById(p.getId()) != null) throw new IllegalStateException("package id taken: " + p.getId());
        }
        // Both release builds shorten res paths (res/Ad1.xml), so MicroG's files move under res/nmaxgms/.
        Set<String> gmsFiles = new HashSet<>();
        for (InputSource src : gms.getZipEntryMap().toArray()) if (src.getAlias().startsWith("res/")) gmsFiles.add(src.getAlias());
        int renamed = 0;
        for (com.reandroid.arsc.item.TableString item : gmsTable.getStringPool()) {
            String v = item.get();
            if (v != null && gmsFiles.contains(v)) {
                item.set(RES_DIR + v.substring(4));
                renamed++;
            }
        }
        System.out.println("res paths renamed in table: " + renamed + " of " + gmsFiles.size());
        table.merge(gmsTable);
        table.refreshFull();
        for (PackageBlock p : table) System.out.printf("package 0x%02x %s%n", p.getId(), p.getName());

        ZipEntryMap zip = maps.getZipEntryMap();
        int copied = 0;
        for (InputSource src : gms.getZipEntryMap().toArray()) {
            String name = src.getAlias();
            if (!name.startsWith("res/")) continue;
            String to = RES_DIR + name.substring(4);
            if (zip.getInputSource(to) != null) throw new IllegalStateException("res file clash: " + to);
            maps.add(new com.reandroid.archive.RenamedInputSource<>(to, src));
            copied++;
        }
        System.out.println("res files copied: " + copied);
    }

    static void mergeManifest(ApkModule maps, ApkModule gms) {
        AndroidManifestBlock manifest = maps.getAndroidManifest();
        AndroidManifestBlock gmsManifest = gms.getAndroidManifest();
        ResXmlElement root = manifest.getManifestElement();
        ResXmlElement app = manifest.getApplicationElement();
        ResXmlElement gmsRoot = gmsManifest.getManifestElement();
        ResXmlElement gmsApp = gmsManifest.getApplicationElement();

        // Top level: permissions, features, queries Maps does not already have.
        for (ResXmlElement child : children(gmsRoot)) {
            String tag = child.getName();
            if (tag.equals("application") || tag.equals("uses-sdk")) continue;
            String name = androidValue(child, NAME);
            if (name != null && findChild(root, tag, name) != null) continue;
            if (tag.equals("queries") && name == null) {
                copyInto(firstChild(root, "queries", true), child, true);
                continue;
            }
            copy(root, child);
        }

        Set<String> mapsNames = new HashSet<>();
        Set<String> mapsAuthorities = new HashSet<>();
        for (ResXmlElement child : children(app)) {
            String n = androidValue(child, NAME);
            if (n != null) mapsNames.add(child.getName() + "/" + n);
            String a = androidValue(child, AUTHORITIES);
            if (a != null) for (String s : a.split(";")) mapsAuthorities.add(s);
        }

        ResXmlAttribute gmsTheme = gmsApp.searchAttributeByResourceId(THEME);
        Set<String> aliased = new HashSet<>();
        int components = 0;
        for (ResXmlElement child : children(gmsApp)) {
            String tag = child.getName();
            String name = androidValue(child, NAME);
            // <library> declares a shared library (system apps only); in Maps it blocks installing.
            if (tag.equals("library")) continue;
            if (!COMPONENTS.contains(tag)) {
                if (tag.equals("meta-data") && name != null && findChild(app, tag, name) != null) continue;
                if (tag.equals("uses-library") && name != null && findChild(app, tag, name) != null) continue;
                ResXmlElement copied = copy(app, child);
                if (tag.equals("uses-library")) copied.getOrCreateAndroidAttribute("required", REQUIRED).setValueAsBoolean(false);
                continue;
            }
            ResXmlElement c = copy(app, child);
            components++;
            relocateNames(c);
            dropInfoCategory(c);
            name = androidValue(c, NAME);
            if (mapsNames.contains(tag + "/" + name) || (tag.equals("activity") && mapsNames.contains("activity-alias/" + name))) {
                c.searchAttributeByResourceId(NAME).setValueAsString(ALIAS + name);
                aliased.add(name);
            }
            ResXmlAttribute process = c.searchAttributeByResourceId(PROCESS);
            String p = process == null ? null : process.getValueAsString();
            String gmsProcess = p == null ? ":gms" : p.startsWith(":") ? p : ":" + p.substring(p.lastIndexOf('.') + 1);
            if (!GMS_PROCESSES.contains(gmsProcess)) throw new IllegalStateException("unknown MicroG process " + p);
            c.getOrCreateAndroidAttribute("process", PROCESS).setValueAsString(gmsProcess);
            ResXmlAttribute authorities = c.searchAttributeByResourceId(AUTHORITIES);
            if (authorities != null) {
                List<String> renamed = new ArrayList<>();
                for (String a : authorities.getValueAsString().split(";")) renamed.add(mapsAuthorities.contains(a) ? a + ".nmaxgms" : a);
                String v = String.join(";", renamed);
                if (!v.equals(authorities.getValueAsString())) System.out.println("authority renamed: " + v);
                authorities.setValueAsString(v);
            }
            if (tag.equals("activity") && gmsTheme != null && c.searchAttributeByResourceId(THEME) == null) {
                ResXmlAttribute t = c.getOrCreateAndroidAttribute("theme", THEME);
                t.setTypeAndData(gmsTheme.getValueType(), gmsTheme.getData());
            }
        }
        // Aliases that point at a renamed activity.
        for (ResXmlElement c : children(app)) {
            ResXmlAttribute target = c.searchAttributeByResourceId(TARGET_ACTIVITY);
            if (target != null && aliased.contains(target.getValueAsString()) && isGmsProcess(c)) {
                target.setValueAsString(ALIAS + target.getValueAsString());
            }
        }
        System.out.println("components merged: " + components + ", aliased: " + aliased);

        app.getOrCreateAndroidAttribute("appComponentFactory", APP_COMPONENT_FACTORY).setValueAsString(FACTORY);
        manifest.refresh();
    }

    /**
     * MicroG's settings activity is CATEGORY_INFO, which getLaunchIntentForPackage prefers over the launcher activity:
     * the installer's "Open" and NmaxConnect would open MicroG's settings instead of Maps.
     */
    static void dropInfoCategory(ResXmlElement component) {
        for (ResXmlElement filter : children(component)) {
            if (!filter.getName().equals("intent-filter")) continue;
            for (ResXmlElement c : children(filter)) {
                if (c.getName().equals("category") && "android.intent.category.INFO".equals(androidValue(c, NAME))) c.removeSelf();
            }
        }
    }

    /** Component and meta-data names under MicroG's relocated androidx.work (see relocate). */
    static void relocateNames(ResXmlElement e) {
        ResXmlAttribute n = e.searchAttributeByResourceId(NAME);
        if (n != null && n.getValueAsString() != null) {
            String v = relocate(n.getValueAsString());
            if (v != null) n.setValueAsString(v);
        }
        for (ResXmlElement c : children(e)) relocateNames(c);
    }

    /**
     * MicroG's own androidx.work moves to nmaxwork.androidx.work: Maps runs WorkManager too, and two copies in one app
     * share the database file and the SystemJobService component, so each would cancel the other's jobs.
     */
    static String relocate(String value) {
        if (value.startsWith("androidx.work.")) return RELOCATED + value;
        int i = value.indexOf("Landroidx/work/");
        if (i >= 0 && value.substring(0, i).replace("[", "").isEmpty()) return value.substring(0, i) + "L" + RELOCATED.replace('.', '/') + value.substring(i + 1);
        return null;
    }

    static byte[] relocateDex(byte[] dex) throws Exception {
        com.android.tools.smali.dexlib2.Opcodes opcodes = com.android.tools.smali.dexlib2.Opcodes.getDefault();
        com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile file =
                new com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile(opcodes, java.nio.ByteBuffer.wrap(dex));
        com.android.tools.smali.dexlib2.rewriter.DexRewriter rewriter = new com.android.tools.smali.dexlib2.rewriter.DexRewriter(
                new com.android.tools.smali.dexlib2.rewriter.RewriterModule() {
            @Override
            public com.android.tools.smali.dexlib2.rewriter.Rewriter<String> getTypeRewriter(com.android.tools.smali.dexlib2.rewriter.Rewriters r) {
                return value -> { String v = relocate(value); return v == null ? value : v; };
            }

            @Override
            public com.android.tools.smali.dexlib2.rewriter.Rewriter<com.android.tools.smali.dexlib2.iface.instruction.Instruction> getInstructionRewriter(com.android.tools.smali.dexlib2.rewriter.Rewriters r) {
                com.android.tools.smali.dexlib2.rewriter.InstructionRewriter base = new com.android.tools.smali.dexlib2.rewriter.InstructionRewriter(r);
                return insn -> {
                    if (insn instanceof com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
                            && ((com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction) insn).getReferenceType() == com.android.tools.smali.dexlib2.ReferenceType.STRING) {
                        com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c i = (com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c) insn;
                        String v = relocate(((com.android.tools.smali.dexlib2.iface.reference.StringReference) i.getReference()).getString());
                        if (v != null) return new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c(
                                i.getOpcode(), i.getRegisterA(), new com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference(v));
                    }
                    if (insn instanceof com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c) {
                        com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c i = (com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c) insn;
                        String v = relocate(((com.android.tools.smali.dexlib2.iface.reference.StringReference) i.getReference()).getString());
                        if (v != null) return new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31c(
                                i.getOpcode(), i.getRegisterA(), new com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference(v));
                    }
                    return base.rewrite(insn);
                };
            }

            @Override
            public com.android.tools.smali.dexlib2.rewriter.Rewriter<com.android.tools.smali.dexlib2.iface.value.EncodedValue> getEncodedValueRewriter(com.android.tools.smali.dexlib2.rewriter.Rewriters r) {
                com.android.tools.smali.dexlib2.rewriter.EncodedValueRewriter base = new com.android.tools.smali.dexlib2.rewriter.EncodedValueRewriter(r);
                return value -> {
                    if (value instanceof com.android.tools.smali.dexlib2.iface.value.StringEncodedValue) {
                        String v = relocate(((com.android.tools.smali.dexlib2.iface.value.StringEncodedValue) value).getValue());
                        if (v != null) return new com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue(v);
                    }
                    return base.rewrite(value);
                };
            }
        });
        com.android.tools.smali.dexlib2.writer.io.MemoryDataStore out = new com.android.tools.smali.dexlib2.writer.io.MemoryDataStore();
        com.android.tools.smali.dexlib2.writer.pool.DexPool.writeTo(out, rewriter.getDexFileRewriter().rewrite(file));
        return java.util.Arrays.copyOf(out.getBuffer(), out.getSize());
    }

    static boolean isGmsProcess(ResXmlElement c) {
        String p = androidValue(c, PROCESS);
        return p != null && GMS_PROCESSES.contains(p);
    }

    /** MicroG's dex as one stored jar, and its native libraries, under assets/nmaxgms/. */
    static void packCode(ApkModule maps, ApkModule gms) throws Exception {
        ByteArrayOutputStream jar = new ByteArrayOutputStream();
        int dexCount = 0;
        try (ZipOutputStream out = new ZipOutputStream(jar)) {
            for (InputSource src : gms.getZipEntryMap().toArray()) {
                String name = src.getAlias();
                if (!name.matches("classes\\d*\\.dex")) continue;
                byte[] bytes = relocateDex(read(src));
                ZipEntry e = new ZipEntry(name);
                e.setMethod(ZipEntry.STORED);
                e.setSize(bytes.length);
                CRC32 crc = new CRC32();
                crc.update(bytes);
                e.setCrc(crc.getValue());
                out.putNextEntry(e);
                out.write(bytes);
                out.closeEntry();
                dexCount++;
            }
        }
        maps.add(new ByteInputSource(jar.toByteArray(), "assets/nmaxgms/gms.jar"));
        System.out.println("dex files packed: " + dexCount + " (" + jar.size() / 1024 / 1024 + " MB)");
        for (InputSource src : gms.getZipEntryMap().toArray()) {
            String name = src.getAlias();
            if (!name.startsWith("lib/arm64-v8a/")) continue;
            String lib = name.substring(name.lastIndexOf('/') + 1);
            if (SKIP_LIBS.contains(lib)) continue;
            maps.add(new ByteInputSource(read(src), "assets/nmaxgms/lib/" + lib));
            System.out.println("lib: " + lib);
        }
    }

    static byte[] read(InputSource src) throws Exception {
        try (InputStream in = src.openStream()) {
            return in.readAllBytes();
        }
    }

    static List<ResXmlElement> children(ResXmlElement e) {
        List<ResXmlElement> list = new ArrayList<>();
        Iterator<ResXmlElement> it = e.getElements(x -> true);
        while (it.hasNext()) list.add(it.next());
        return list;
    }

    static String androidValue(ResXmlElement e, int id) {
        ResXmlAttribute a = e.searchAttributeByResourceId(id);
        return a == null ? null : a.getValueAsString();
    }

    static ResXmlElement findChild(ResXmlElement parent, String tag, String name) {
        for (ResXmlElement c : children(parent)) {
            if (c.getName().equals(tag) && name.equals(androidValue(c, NAME))) return c;
        }
        return null;
    }

    static ResXmlElement firstChild(ResXmlElement parent, String tag, boolean create) {
        for (ResXmlElement c : children(parent)) if (c.getName().equals(tag)) return c;
        return create ? parent.newElement(tag) : null;
    }

    static ResXmlElement copy(ResXmlElement parent, ResXmlElement source) {
        ResXmlElement e = parent.newElement();
        e.merge(source);
        return e;
    }

    /** Copies source's children into target, skipping ones target already has. */
    static void copyInto(ResXmlElement target, ResXmlElement source, boolean dedupe) {
        for (ResXmlElement c : children(source)) {
            String name = androidValue(c, NAME);
            if (dedupe && name != null && findChild(target, c.getName(), name) != null) continue;
            copy(target, c);
        }
    }
}
