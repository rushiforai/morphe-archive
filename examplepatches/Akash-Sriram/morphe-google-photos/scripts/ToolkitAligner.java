package app.morphe.scripts;

import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.MethodParameter;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;

import java.io.File;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Automated Google Photos Toolkit Obfuscation Aligner.
 * Scans any target Google Photos APK and dynamically resolves all obfuscated
 * classes, methods, and configurations required by the Morphe Toolkit.
 */
public class ToolkitAligner {

    public static class AlignmentResult {
        public String apkVersion = "Unknown";
        public String serviceLocatorClass = "cbnw";
        public String serviceLocatorMethod = "e";
        public String taskRunnerClass = "bbmd";
        public String taskRunnerSyncMethod = "c";
        public String addMediaToAlbumBuilderClass = "opc";
        public String addMediaToEnvelopeBuilderClass = "aphh";
        public String privateAlbumRemoveClass = "omn";
        public String privateAlbumRemoveMethod = "a";
        public String[] marsRemoveConfig = {"nyp", "bbmf", "ms", "snb", "w"};
        public String marsCollectionClass = "alrk";
        public String trashCollectionClass = "blja";
        public String trashFactoryClass = "bliu";
        public String trashFactoryMethod = "b";
        public String keysCollectionClass = "pti";
        public String keysCollectionMethod = "f";
        public String keysCollectionBuilder = "pth";
        public String coreMediaLoaderClass = "yrq";
        public String coreMediaLoaderMethod = "B";
        public String featuresRequestBuilderClass = "yqd";
        public String featuresRequestClass = "yqf";
        public String dedupKeyFeatureClass = "abmv";
        public String remoteMediaKeyFeatureClass = "nfl";
        public String actionFlusherClass = "aqgz";
        public String archiveServiceClass = "rsr";
        public String archiveServiceMethod = "a";
        public String archiveBuilderClass = "rsv";
        public String archiveActionClass = "rsw";
        public String moveToTrashActionClass = "bfjt";
        public String glideSingletonClass = "mdm";
        public String remoteMediaModelClass = "amrp";
        public String remoteMediaOptionsClass = "amrq";
    }

    private static String stripDescriptor(String type) {
        if (type == null) return "";
        if (type.startsWith("L") && type.endsWith(";")) {
            return type.substring(1, type.length() - 1).replace('/', '.');
        }
        return type;
    }

    private static String simpleClassName(String type) {
        String full = stripDescriptor(type);
        int idx = full.lastIndexOf('.');
        return idx >= 0 ? full.substring(idx + 1) : full;
    }

    public static String extractVersionName(File apk) {
        try (ZipFile zf = new ZipFile(apk)) {
            ZipEntry ze = zf.getEntry("AndroidManifest.xml");
            if (ze != null) {
                try (InputStream is = zf.getInputStream(ze)) {
                    byte[] data = is.readAllBytes();
                    ByteBuffer buf = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN);
                    int magic = buf.getInt();
                    int fileSize = buf.getInt();
                    int stringPoolType = buf.getInt();
                    int stringPoolSize = buf.getInt();
                    int stringCount = buf.getInt();
                    int styleCount = buf.getInt();
                    int flags = buf.getInt();
                    int stringsStart = buf.getInt();
                    int stylesStart = buf.getInt();

                    boolean isUtf8 = (flags & (1 << 8)) != 0;
                    int[] stringOffsets = new int[stringCount];
                    for (int i = 0; i < stringCount; i++) {
                        stringOffsets[i] = buf.getInt();
                    }

                    int poolBase = 8 + stringsStart;
                    boolean foundVersionNameTag = false;
                    for (int i = 0; i < stringCount; i++) {
                        int offset = poolBase + stringOffsets[i];
                        buf.position(offset);
                        String str;
                        if (isUtf8) {
                            int len1 = buf.get() & 0xFF;
                            if ((len1 & 0x80) != 0) len1 = ((len1 & 0x7F) << 8) | (buf.get() & 0xFF);
                            int len2 = buf.get() & 0xFF;
                            if ((len2 & 0x80) != 0) len2 = ((len2 & 0x7F) << 8) | (buf.get() & 0xFF);
                            byte[] sBytes = new byte[len2];
                            buf.get(sBytes);
                            str = new String(sBytes, "UTF-8");
                        } else {
                            int len = buf.getShort() & 0xFFFF;
                            if ((len & 0x8000) != 0) len = ((len & 0x7FFF) << 16) | (buf.getShort() & 0xFFFF);
                            char[] chars = new char[len];
                            for (int c = 0; c < len; c++) chars[c] = buf.getChar();
                            str = new String(chars);
                        }
                        if (str.matches("^\\d+\\.\\d+\\.\\d+\\.\\d+$")) {
                            return str;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}

        // Fallback: extract from filename
        String name = apk.getName();
        java.util.regex.Matcher m = java.util.regex.Pattern.compile("(\\d+\\.\\d+\\.\\d+\\.\\d+)").matcher(name);
        if (m.find()) {
            return m.group(1);
        }
        return "Unknown";
    }

    public static AlignmentResult alignApk(File apk) throws Exception {
        AlignmentResult res = new AlignmentResult();
        res.apkVersion = extractVersionName(apk);

        System.out.println("==================================================================");
        System.out.println("  Morphe Toolkit Aligner: Analyzing " + apk.getName());
        System.out.println("  Detected Google Photos Version: " + res.apkVersion);
        System.out.println("==================================================================");

        MultiDexContainer<? extends DexFile> container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());

        Map<String, ClassDef> allClasses = new HashMap<>();
        List<ClassDef> classList = new ArrayList<>();
        for (String entryName : container.getDexEntryNames()) {
            DexFile dex = container.getEntry(entryName).getDexFile();
            for (ClassDef cd : dex.getClasses()) {
                allClasses.put(cd.getType(), cd);
                classList.add(cd);
            }
        }
        System.out.println("Loaded " + classList.size() + " total classes from APK dex files.");

        // 1. Service Locator: method e(Context, Class) returning Object
        for (ClassDef cd : classList) {
            if (cd.getType().startsWith("Lapp/morphe")) continue;
            for (Method m : cd.getMethods()) {
                if (m.getName().equals("e") && m.getParameters().size() == 2 &&
                    m.getParameters().get(0).getType().equals("Landroid/content/Context;") &&
                    m.getParameters().get(1).getType().equals("Ljava/lang/Class;") &&
                    m.getReturnType().equals("Ljava/lang/Object;")) {
                    res.serviceLocatorClass = simpleClassName(cd.getType());
                    res.serviceLocatorMethod = m.getName();
                    break;
                }
            }
        }

        // 2. AddMediaToAlbumTask Builder
        ClassDef addMediaToAlbumTask = allClasses.get("Lcom/google/android/apps/photos/album/tasks/AddMediaToAlbumTask;");
        if (addMediaToAlbumTask != null) {
            for (Method m : addMediaToAlbumTask.getMethods()) {
                if (m.getName().equals("<init>") && m.getParameters().size() == 1) {
                    res.addMediaToAlbumBuilderClass = simpleClassName(m.getParameters().get(0).getType());
                    break;
                }
            }
        }

        // 3. AddMediaToEnvelopeTask Builder
        ClassDef addMediaToEnvelopeTask = allClasses.get("Lcom/google/android/apps/photos/envelope/tasks/AddMediaToEnvelopeTask;");
        if (addMediaToEnvelopeTask != null) {
            for (Method m : addMediaToEnvelopeTask.getMethods()) {
                if (m.getName().equals("<init>") && m.getParameters().size() == 1) {
                    res.addMediaToEnvelopeBuilderClass = simpleClassName(m.getParameters().get(0).getType());
                    break;
                }
            }
        }

        // 4. MoveToTrashActionWrapper constructor parameter
        ClassDef moveToTrashWrapper = allClasses.get("Lcom/google/android/apps/photos/trash/MoveToTrashActionWrapper;");
        if (moveToTrashWrapper != null) {
            for (Method m : moveToTrashWrapper.getMethods()) {
                if (m.getName().equals("<init>") && m.getParameters().size() >= 2) {
                    res.moveToTrashActionClass = simpleClassName(m.getParameters().get(1).getType());
                    break;
                }
            }
        }

        // 5. TaskRunner: call in UpdateFolderStatusTask
        ClassDef updateFolderStatus = allClasses.get("Lcom/google/android/apps/photos/folderstatus/mixin/UpdateFolderStatusTask;");
        if (updateFolderStatus != null) {
            for (Method m : updateFolderStatus.getMethods()) {
                MethodImplementation impl = m.getImplementation();
                if (impl == null) continue;
                for (Instruction inst : impl.getInstructions()) {
                    if (inst instanceof ReferenceInstruction) {
                        Object ref = ((ReferenceInstruction) inst).getReference();
                        if (ref instanceof MethodReference) {
                            MethodReference mr = (MethodReference) ref;
                            if (mr.getParameterTypes().size() == 2 && mr.getParameterTypes().get(0).equals("Landroid/content/Context;")) {
                                res.taskRunnerClass = simpleClassName(mr.getDefiningClass());
                                res.taskRunnerSyncMethod = mr.getName();
                                break;
                            }
                        }
                    }
                }
            }
        }

        // 6. MediaCollections scan via stable e() string identifiers
        for (ClassDef cd : classList) {
            if (cd.getInterfaces().contains("Lbypn;")) {
                for (Method m : cd.getMethods()) {
                    if (m.getName().equals("e") && m.getParameters().isEmpty() && m.getReturnType().equals("Ljava/lang/String;")) {
                        MethodImplementation impl = m.getImplementation();
                        if (impl != null) {
                            for (Instruction inst : impl.getInstructions()) {
                                if (inst instanceof ReferenceInstruction) {
                                    Object ref = ((ReferenceInstruction) inst).getReference();
                                    if (ref instanceof StringReference) {
                                        String s = ((StringReference) ref).getString();
                                        if ("com.google.android.apps.photos.mars.data.core".equals(s)) {
                                            for (Method ctor : cd.getMethods()) {
                                                if (ctor.getName().equals("<init>") && ctor.getParameters().size() == 1 && ctor.getParameters().get(0).getType().equals("I")) {
                                                    res.marsCollectionClass = simpleClassName(cd.getType());
                                                }
                                            }
                                        } else if ("com.google.android.apps.photos.trash.data.TrashCore".equals(s)) {
                                            for (Method ctor : cd.getMethods()) {
                                                if (ctor.getName().equals("<init>") && ctor.getParameters().size() == 1 && ctor.getParameters().get(0).getType().equals("I")) {
                                                    res.trashCollectionClass = simpleClassName(cd.getType());
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // 7. KeysMediaCollection: class in p* implementing bypn with static method f(int, List)
        for (ClassDef cd : classList) {
            if (cd.getType().startsWith("Lp") && cd.getInterfaces().contains("Lbypn;")) {
                for (Method m : cd.getMethods()) {
                    if (java.lang.reflect.Modifier.isStatic(m.getAccessFlags()) &&
                        m.getReturnType().equals("Lbypn;") &&
                        m.getParameters().size() == 2 &&
                        m.getParameters().get(0).getType().equals("I") &&
                        (m.getParameters().get(1).getType().equals("Ljava/util/List;") || m.getParameters().get(1).getType().equals("Ljava/util/Collection;"))) {
                        res.keysCollectionClass = simpleClassName(cd.getType());
                        res.keysCollectionMethod = m.getName();
                        // Find builder: constructor parameter
                        for (Method ctor : cd.getMethods()) {
                            if (ctor.getName().equals("<init>") && ctor.getParameters().size() == 1 && !ctor.getParameters().get(0).getType().equals("Landroid/os/Parcel;")) {
                                res.keysCollectionBuilder = simpleClassName(ctor.getParameters().get(0).getType());
                                break;
                            }
                        }
                        break;
                    }
                }
            }
        }

        // 8. CoreMediaLoader & FeaturesRequest
        for (ClassDef cd : classList) {
            if (cd.getType().length() > 8) continue;
            for (Method m : cd.getMethods()) {
                if (java.lang.reflect.Modifier.isStatic(m.getAccessFlags()) &&
                    m.getReturnType().equals("Ljava/util/List;") &&
                    m.getParameters().size() == 3 &&
                    m.getParameters().get(0).getType().equals("Landroid/content/Context;") &&
                    m.getParameters().get(1).getType().equals("Lbypn;") &&
                    !m.getParameters().get(2).getType().startsWith("Ljava/")) {
                    String featReqType = m.getParameters().get(2).getType();
                    ClassDef featReqClass = allClasses.get(featReqType);
                    if (featReqClass != null && featReqClass.getInterfaces().contains("Landroid/os/Parcelable;")) {
                        res.coreMediaLoaderClass = simpleClassName(cd.getType());
                        res.coreMediaLoaderMethod = m.getName();
                        res.featuresRequestClass = simpleClassName(featReqType);

                        // Find FeaturesRequestBuilder
                        for (ClassDef bCand : classList) {
                            if (bCand.getType().length() > 8) continue;
                            boolean hasBoolCtor = false;
                            boolean returnsFeatReq = false;
                            for (Method bm : bCand.getMethods()) {
                                if (bm.getName().equals("<init>") && bm.getParameters().size() == 1 && bm.getParameters().get(0).getType().equals("Z")) {
                                    hasBoolCtor = true;
                                }
                                if (bm.getName().equals("a") && bm.getParameters().isEmpty() && bm.getReturnType().equals(featReqType)) {
                                    returnsFeatReq = true;
                                }
                            }
                            if (hasBoolCtor && returnsFeatReq) {
                                res.featuresRequestBuilderClass = simpleClassName(bCand.getType());
                                break;
                            }
                        }
                        break;
                    }
                }
            }
            if (!"yrq".equals(res.coreMediaLoaderClass) && !"yul".equals(res.coreMediaLoaderClass)) break;
        }

        // 9. DedupKeyFeature & RemoteMediaKeyFeature (implementing bypk)
        for (ClassDef cd : classList) {
            if (cd.getInterfaces().contains("Lbypk;")) {
                for (Method m : cd.getMethods()) {
                    if (m.getName().equals("toString")) {
                        MethodImplementation impl = m.getImplementation();
                        if (impl == null) continue;
                        for (Instruction inst : impl.getInstructions()) {
                            if (inst instanceof ReferenceInstruction) {
                                Object ref = ((ReferenceInstruction) inst).getReference();
                                if (ref instanceof StringReference) {
                                    String s = ((StringReference) ref).getString();
                                    if (s.contains("DedupKeyFeature")) {
                                        res.dedupKeyFeatureClass = simpleClassName(cd.getType());
                                    } else if (s.contains("CloudKeyFeature")) {
                                        res.remoteMediaKeyFeatureClass = simpleClassName(cd.getType());
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // 10. Private Album Remove: method referencing "RemoveMediaFromPrivateAlbumTask"
        for (ClassDef cd : classList) {
            if (cd.getType().startsWith("Lapp/morphe")) continue;
            for (Method m : cd.getMethods()) {
                MethodImplementation impl = m.getImplementation();
                if (impl == null) continue;
                for (Instruction inst : impl.getInstructions()) {
                    if (inst instanceof ReferenceInstruction) {
                        Object ref = ((ReferenceInstruction) inst).getReference();
                        if (ref instanceof StringReference && "RemoveMediaFromPrivateAlbumTask".equals(((StringReference) ref).getString())) {
                            if (m.getParameters().size() == 3 && m.getParameters().get(0).getType().equals("I") &&
                                (m.getParameters().get(2).getType().equals("Ljava/util/List;") || m.getParameters().get(2).getType().equals("Ljava/util/Collection;"))) {
                                res.privateAlbumRemoveClass = simpleClassName(cd.getType());
                                res.privateAlbumRemoveMethod = m.getName();
                                break;
                            }
                        }
                    }
                }
            }
        }

        // 11. Mars Remove Task Config: method referencing "mars_remove_result"
        for (ClassDef cd : classList) {
            for (Method m : cd.getMethods()) {
                MethodImplementation impl = m.getImplementation();
                if (impl == null) continue;
                boolean hasMarsRemoveResult = false;
                for (Instruction inst : impl.getInstructions()) {
                    if (inst instanceof ReferenceInstruction) {
                        Object ref = ((ReferenceInstruction) inst).getReference();
                        if (ref instanceof StringReference && "mars_remove_result".equals(((StringReference) ref).getString())) {
                            hasMarsRemoveResult = true;
                            break;
                        }
                    }
                }
                if (hasMarsRemoveResult) {
                    String argClass = null;
                    String enumClass = null;
                    String enumField = null;
                    String builderClass = null;
                    String builderMethod = null;

                    for (Instruction inst : impl.getInstructions()) {
                        if (inst instanceof ReferenceInstruction) {
                            Object ref = ((ReferenceInstruction) inst).getReference();
                            if (ref instanceof MethodReference) {
                                MethodReference mr = (MethodReference) ref;
                                if (mr.getName().equals("<init>") && mr.getParameterTypes().size() == 3 &&
                                    mr.getParameterTypes().get(0).equals("Ljava/lang/Object;") &&
                                    mr.getParameterTypes().get(1).equals("I") && mr.getParameterTypes().get(2).equals("I")) {
                                    argClass = simpleClassName(mr.getDefiningClass());
                                } else if (mr.getParameterTypes().size() == 4 && mr.getParameterTypes().get(0).equals("Ljava/lang/String;") &&
                                           mr.getParameterTypes().get(2).equals("Ljava/lang/String;")) {
                                    builderClass = simpleClassName(mr.getDefiningClass());
                                    builderMethod = mr.getName();
                                }
                            } else if (ref instanceof FieldReference) {
                                FieldReference fr = (FieldReference) ref;
                                if (fr.getType().startsWith("L") && fr.getType().equals(fr.getDefiningClass())) {
                                    enumClass = simpleClassName(fr.getDefiningClass());
                                    enumField = fr.getName();
                                }
                            }
                        }
                    }
                    if (argClass != null && enumClass != null && enumField != null && builderClass != null && builderMethod != null) {
                        res.marsRemoveConfig = new String[]{argClass, enumClass, enumField, builderClass, builderMethod};
                        break;
                    }
                }
            }
        }

        // 12. ActionQueue Flusher: class with (int, long) and a(Context)
        for (ClassDef cd : classList) {
            if (cd.getType().length() > 8) continue;
            boolean hasCtor = false;
            boolean hasMethod = false;
            for (Method m : cd.getMethods()) {
                if (m.getName().equals("<init>") && m.getParameters().size() == 2 &&
                    m.getParameters().get(0).getType().equals("I") && m.getParameters().get(1).getType().equals("J")) {
                    hasCtor = true;
                }
                if (m.getName().equals("a") && m.getParameters().size() == 1 &&
                    m.getParameters().get(0).getType().equals("Landroid/content/Context;")) {
                    hasMethod = true;
                }
            }
            if (hasCtor && hasMethod) {
                res.actionFlusherClass = simpleClassName(cd.getType());
                break;
            }
        }

        // 13. Trash Factory (e.g. bliu.b)
        ClassDef trashCollDef = allClasses.get("L" + res.trashCollectionClass.replace('.', '/') + ";");
        if (trashCollDef != null) {
            for (ClassDef cd : classList) {
                if (cd.getType().length() > 8) continue;
                for (Method m : cd.getMethods()) {
                    if (java.lang.reflect.Modifier.isStatic(m.getAccessFlags()) &&
                        m.getParameters().size() == 1 && m.getParameters().get(0).getType().equals("I") &&
                        (m.getReturnType().equals("Lbypn;") || m.getReturnType().equals("L" + res.trashCollectionClass.replace('.', '/') + ";"))) {
                        res.trashFactoryClass = simpleClassName(cd.getType());
                        res.trashFactoryMethod = m.getName();
                        break;
                    }
                }
            }
        }

        // 14. Archive Service & Builder
        for (ClassDef cd : classList) {
            boolean hasArchiveMixin = false;
            for (Method m : cd.getMethods()) {
                MethodImplementation impl = m.getImplementation();
                if (impl == null) continue;
                for (Instruction inst : impl.getInstructions()) {
                    if (inst instanceof ReferenceInstruction) {
                        Object ref = ((ReferenceInstruction) inst).getReference();
                        if (ref instanceof StringReference && ((StringReference) ref).getString().contains("UndoableSetArchiveStateAction")) {
                            hasArchiveMixin = true;
                            break;
                        }
                    }
                }
                if (hasArchiveMixin) break;
            }
            if (hasArchiveMixin) {
                // Inspect method g
                for (Method m : cd.getMethods()) {
                    if (m.getName().equals("g") && m.getParameters().size() == 2) {
                        MethodImplementation impl = m.getImplementation();
                        if (impl == null) continue;
                        for (Instruction inst : impl.getInstructions()) {
                            if (inst instanceof ReferenceInstruction) {
                                Object ref = ((ReferenceInstruction) inst).getReference();
                                if (ref instanceof MethodReference) {
                                    MethodReference mr = (MethodReference) ref;
                                    if (mr.getName().equals("<init>") && mr.getParameterTypes().size() == 5 &&
                                        mr.getParameterTypes().get(0).equals("I") && mr.getParameterTypes().get(1).equals("Z")) {
                                        String rtcClassType = mr.getDefiningClass();
                                        ClassDef rtcDef = allClasses.get(rtcClassType);
                                        if (rtcDef != null) {
                                            for (Method rm : rtcDef.getMethods()) {
                                                if (rm.getName().equals("h")) {
                                                    MethodImplementation rimpl = rm.getImplementation();
                                                    if (rimpl != null) {
                                                        for (Instruction rinst : rimpl.getInstructions()) {
                                                            if (rinst instanceof ReferenceInstruction) {
                                                                Object rref = ((ReferenceInstruction) rinst).getReference();
                                                                if (rref instanceof MethodReference) {
                                                                    MethodReference rmr = (MethodReference) rref;
                                                                    if (rmr.getName().equals("a") && rmr.getParameterTypes().size() == 4 &&
                                                                        rmr.getParameterTypes().get(0).equals("I") &&
                                                                        rmr.getParameterTypes().get(2).equals("Z")) {
                                                                        res.archiveServiceClass = simpleClassName(rmr.getDefiningClass());
                                                                        res.archiveServiceMethod = rmr.getName();
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                break;
            }
        }

        // 15. Remote Media Model & Options (class with toString containing "RemoteMediaModel")
        for (ClassDef cd : classList) {
            for (Method m : cd.getMethods()) {
                if (m.getName().equals("toString")) {
                    MethodImplementation impl = m.getImplementation();
                    if (impl == null) continue;
                    for (Instruction inst : impl.getInstructions()) {
                        if (inst instanceof ReferenceInstruction) {
                            Object ref = ((ReferenceInstruction) inst).getReference();
                            if (ref instanceof StringReference) {
                                String s = ((StringReference) ref).getString();
                                if (s.contains("RemoteMediaModel")) {
                                    res.remoteMediaModelClass = simpleClassName(cd.getType());
                                    for (Method ctor : cd.getMethods()) {
                                        if (ctor.getName().equals("<init>") && ctor.getParameters().size() == 3) {
                                            String p0 = ctor.getParameters().get(0).getType();
                                            String p1 = ctor.getParameters().get(1).getType();
                                            String p2 = ctor.getParameters().get(2).getType();
                                            if (p0.equals("Ljava/lang/String;") && p1.equals("I") && p2.startsWith("L")) {
                                                res.remoteMediaOptionsClass = simpleClassName(p2);
                                                break;
                                            }
                                        }
                                    }
                                    break;
                                }
                            }
                        }
                    }
                }
                if (res.remoteMediaOptionsClass != null && !res.remoteMediaOptionsClass.isEmpty()) break;
            }
            if (res.remoteMediaOptionsClass != null && !res.remoteMediaOptionsClass.isEmpty()) break;
        }

        // 16. Glide Singleton (Class with static e(Context) calling RequestManagerRetriever)
        String retrieverClass = null;
        String retrieverMethod = null;
        String requestManagerType = null;
        for (ClassDef cd : classList) {
            for (Method m : cd.getMethods()) {
                MethodImplementation impl = m.getImplementation();
                if (impl == null) continue;
                for (Instruction inst : impl.getInstructions()) {
                    if (inst instanceof ReferenceInstruction) {
                        Object ref = ((ReferenceInstruction) inst).getReference();
                        if (ref instanceof StringReference) {
                            String s = ((StringReference) ref).getString();
                            if ("You cannot start a load on a null Context".equals(s)) {
                                retrieverClass = cd.getType();
                                retrieverMethod = m.getName();
                                requestManagerType = m.getReturnType();
                                break;
                            }
                        }
                    }
                }
                if (retrieverClass != null) break;
            }
            if (retrieverClass != null) break;
        }

        if (retrieverClass != null && retrieverMethod != null) {
            for (ClassDef cd : classList) {
                if (cd.getType().equals(retrieverClass)) continue;
                for (Method m : cd.getMethods()) {
                    if (java.lang.reflect.Modifier.isStatic(m.getAccessFlags()) &&
                        m.getParameters().size() == 1 &&
                        m.getParameters().get(0).getType().equals("Landroid/content/Context;") &&
                        m.getReturnType().equals(requestManagerType)) {
                        MethodImplementation impl = m.getImplementation();
                        if (impl == null) continue;
                        for (Instruction inst : impl.getInstructions()) {
                            if (inst instanceof ReferenceInstruction) {
                                Object ref = ((ReferenceInstruction) inst).getReference();
                                if (ref instanceof MethodReference) {
                                    MethodReference mr = (MethodReference) ref;
                                    if (mr.getDefiningClass().equals(retrieverClass) && mr.getName().equals(retrieverMethod)) {
                                        res.glideSingletonClass = simpleClassName(cd.getType());
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    if (res.glideSingletonClass != null && !res.glideSingletonClass.equals("mdm") || (res.glideSingletonClass != null && cd.getType().equals("Lmdm;"))) {
                        break;
                    }
                }
                if (res.glideSingletonClass != null && !res.glideSingletonClass.equals("mdm")) break;
            }
        }

        return res;
    }

    private static String formatArray(String first, String... others) {
        Set<String> set = new LinkedHashSet<>();
        if (first != null && !first.isEmpty()) set.add(first);
        for (String o : others) {
            if (o != null && !o.isEmpty()) set.add(o);
        }
        StringBuilder sb = new StringBuilder("{");
        boolean firstItem = true;
        for (String s : set) {
            if (!firstItem) sb.append(", ");
            sb.append("\"").append(s).append("\"");
            firstItem = false;
        }
        sb.append("}");
        return sb.toString();
    }

    public static void generateMappingsFile(AlignmentResult res, File targetFile) throws Exception {
        StringBuilder sb = new StringBuilder();
        sb.append("package app.morphe.extension.shared.patches.toolkit;\n\n");
        sb.append("/**\n");
        sb.append(" * Mappings for Google Photos obfuscated internal symbols.\n");
        sb.append(" * Auto-generated and verified by ToolkitAligner for Google Photos ").append(res.apkVersion).append(".\n");
        sb.append(" */\n");
        sb.append("public final class ToolkitMappings {\n\n");
        sb.append("    public static final String TARGET_VERSION = \"").append(res.apkVersion).append("\";\n\n");

        sb.append("    // Service Locator (bzoq in 7.97, cbnw in 7.98)\n");
        sb.append("    public static final String SERVICE_LOCATOR_CLASS = \"").append(res.serviceLocatorClass).append("\";\n");
        sb.append("    public static final String SERVICE_LOCATOR_METHOD = \"").append(res.serviceLocatorMethod).append("\";\n");
        sb.append("    public static final String[] SERVICE_LOCATOR_CLASSES = ").append(formatArray(res.serviceLocatorClass, "bzoq", "bxoe")).append(";\n\n");

        sb.append("    // Task Runner (Sync task execution via static helper)\n");
        sb.append("    public static final String TASK_RUNNER_CLASS = \"").append(res.taskRunnerClass).append("\";\n");
        sb.append("    public static final String TASK_RUNNER_SYNC_METHOD = \"").append(res.taskRunnerSyncMethod).append("\";\n");
        sb.append("    public static final String[] TASK_RUNNER_CLASSES = ").append(formatArray(res.taskRunnerClass, "bztw", "cbsq", "cagl", "cant", "bxue")).append(";\n\n");

        sb.append("    // Add Media To Album (Private Album creation builder)\n");
        sb.append("    public static final String ADD_MEDIA_TO_ALBUM_BUILDER_CLASS = \"").append(res.addMediaToAlbumBuilderClass).append("\";\n");
        sb.append("    public static final String[] ADD_MEDIA_TO_ALBUM_BUILDER_CLASSES = ").append(formatArray(res.addMediaToAlbumBuilderClass, "otz", "orn", "ovo", "mtl", "mqw")).append(";\n\n");

        sb.append("    // Add Media To Envelope (Shared Album addition builder)\n");
        sb.append("    public static final String ADD_MEDIA_TO_ENVELOPE_BUILDER_CLASS = \"").append(res.addMediaToEnvelopeBuilderClass).append("\";\n");
        sb.append("    public static final String[] ADD_MEDIA_TO_ENVELOPE_BUILDER_CLASSES = ").append(formatArray(res.addMediaToEnvelopeBuilderClass, "aphh", "apfz", "apjt", "amwa")).append(";\n\n");

        sb.append("    // Remove Media From Private Album Task\n");
        sb.append("    public static final String PRIVATE_ALBUM_REMOVE_CLASS = \"").append(res.privateAlbumRemoveClass).append("\";\n");
        sb.append("    public static final String PRIVATE_ALBUM_REMOVE_METHOD = \"").append(res.privateAlbumRemoveMethod).append("\";\n");
        sb.append("    public static final String[] PRIVATE_ALBUM_REMOVE_CLASSES = ").append(formatArray(res.privateAlbumRemoveClass, "osi", "iyo")).append(";\n\n");

        sb.append("    // Mars Remove Task Config: {argClass, enumClass, enumField, builderClass, builderMethod}\n");
        sb.append("    public static final String[] MARS_REMOVE_CONFIG_CURRENT = {\"")
          .append(res.marsRemoveConfig[0]).append("\", \"")
          .append(res.marsRemoveConfig[1]).append("\", \"")
          .append(res.marsRemoveConfig[2]).append("\", \"")
          .append(res.marsRemoveConfig[3]).append("\", \"")
          .append(res.marsRemoveConfig[4]).append("\"};\n");
        sb.append("    public static final String[][] MARS_REMOVE_CONFIGS = {\n");
        sb.append("        {\"").append(res.marsRemoveConfig[0]).append("\", \"")
          .append(res.marsRemoveConfig[1]).append("\", \"")
          .append(res.marsRemoveConfig[2]).append("\", \"")
          .append(res.marsRemoveConfig[3]).append("\", \"")
          .append(res.marsRemoveConfig[4]).append("\"}, // ").append(res.apkVersion).append("\n");
        sb.append("        {\"odi\", \"bdft\", \"ms\", \"stk\", \"s\"}, // 7.97.0 arm64\n");
        sb.append("        {\"oax\", \"bbzi\", \"ms\", \"sgz\", \"n\"}, // 7.97.0 univ\n");
        sb.append("        {\"ofl\", \"bcdu\", \"ms\", \"tfb\", \"p\"}, // 7.97.0 univ\n");
        sb.append("        {\"mbj\", \"azlk\", \"mu\", \"rga\", \"l\"}  // 7.96.0 nodpi\n");
        sb.append("    };\n\n");

        sb.append("    // Mars Collection (MediaCollection for Locked Folder)\n");
        sb.append("    public static final String MARS_COLLECTION_CLASS = \"").append(res.marsCollectionClass).append("\";\n");
        sb.append("    public static final String[] MARS_COLLECTION_CLASSES = ").append(formatArray(res.marsCollectionClass, "alsd", "alqt", "alww", "ajhx")).append(";\n\n");

        sb.append("    // Trash Collection (MediaCollection for Trash/Bin)\n");
        sb.append("    public static final String TRASH_COLLECTION_CLASS = \"").append(res.trashCollectionClass).append("\";\n");
        sb.append("    public static final String TRASH_FACTORY_CLASS = \"").append(res.trashFactoryClass).append("\";\n");
        sb.append("    public static final String TRASH_FACTORY_METHOD = \"").append(res.trashFactoryMethod).append("\";\n");
        sb.append("    public static final String[] TRASH_COLLECTION_CLASSES = ").append(formatArray(res.trashCollectionClass, res.trashFactoryClass, "bnew", "blvo", "bmcu", "bjjo", "bjjq")).append(";\n\n");

        sb.append("    // Keys Media Collection (Loads items given remote media keys)\n");
        sb.append("    public static final String KEYS_COLLECTION_CLASS = \"").append(res.keysCollectionClass).append("\";\n");
        sb.append("    public static final String KEYS_COLLECTION_METHOD = \"").append(res.keysCollectionMethod).append("\";\n");
        sb.append("    public static final String KEYS_COLLECTION_BUILDER = \"").append(res.keysCollectionBuilder).append("\";\n");
        sb.append("    public static final String[][] KEYS_COLLECTION_FACTORIES = {\n");
        sb.append("        {\"").append(res.keysCollectionClass).append("\", \"").append(res.keysCollectionMethod).append("\"}, // ").append(res.apkVersion).append("\n");
        sb.append("        {\"pyk\", \"f\"}, // 7.97.0 arm64\n");
        sb.append("        {\"pvv\", \"f\"}, // 7.97.0 univ\n");
        sb.append("        {\"pzv\", \"f\"}, // 7.97.0 univ\n");
        sb.append("        {\"num\", \"f\"}  // 7.96.0\n");
        sb.append("    };\n");
        sb.append("    public static final String[] KEYS_COLLECTION_BUILDERS = ").append(formatArray(res.keysCollectionBuilder, "pyj", "pvu", "pzu", "nul")).append(";\n\n");

        sb.append("    // Core Media Loader & Features Request\n");
        sb.append("    public static final String CORE_MEDIA_LOADER_CLASS = \"").append(res.coreMediaLoaderClass).append("\";\n");
        sb.append("    public static final String CORE_MEDIA_LOADER_METHOD = \"").append(res.coreMediaLoaderMethod).append("\";\n");
        sb.append("    public static final String[] CORE_MEDIA_LOADER_CLASSES = ").append(formatArray(res.coreMediaLoaderClass, "yul", "yxq", "zap", "wrl")).append(";\n\n");

        sb.append("    public static final String FEATURES_REQUEST_BUILDER_CLASS = \"").append(res.featuresRequestBuilderClass).append("\";\n");
        sb.append("    public static final String FEATURES_REQUEST_CLASS = \"").append(res.featuresRequestClass).append("\";\n");
        sb.append("    public static final String[][] FEATURES_REQUEST_PAIRS = {\n");
        sb.append("        {\"").append(res.featuresRequestBuilderClass).append("\", \"").append(res.featuresRequestClass).append("\"}, // ").append(res.apkVersion).append("\n");
        sb.append("        {\"wqa\", \"wqb\"}, // 7.97.0\n");
        sb.append("        {\"yta\", \"ytc\"}, // 7.97.0\n");
        sb.append("        {\"yyq\", \"yyr\"}  // 7.97.0 univ\n");
        sb.append("    };\n\n");

        sb.append("    // DedupKey Feature & RemoteMediaKey Feature\n");
        sb.append("    public static final String DEDUP_KEY_FEATURE_CLASS = \"").append(res.dedupKeyFeatureClass).append("\";\n");
        sb.append("    public static final String[] DEDUP_KEY_FEATURE_CLASSES = ").append(formatArray(res.dedupKeyFeatureClass, "zon", "zoi", "zog", "zkr")).append(";\n\n");

        sb.append("    public static final String REMOTE_MEDIA_KEY_FEATURE_CLASS = \"").append(res.remoteMediaKeyFeatureClass).append("\";\n");
        sb.append("    public static final String[] REMOTE_MEDIA_KEY_FEATURE_CLASSES = ").append(formatArray(res.remoteMediaKeyFeatureClass, "nfl", "bams", "bamo", "bamk", "azxs")).append(";\n\n");

        sb.append("    // Action Queue Flusher (flushes local action mutations)\n");
        sb.append("    public static final String ACTION_FLUSHER_CLASS = \"").append(res.actionFlusherClass).append("\";\n");
        sb.append("    public static final String[] ACTION_FLUSHER_CLASSES = ").append(formatArray(res.actionFlusherClass, "aqgz", "aqgr", "aokq", "amwa")).append(";\n\n");

        sb.append("    // Archive Service & Actions\n");
        sb.append("    public static final String ARCHIVE_SERVICE_CLASS = \"").append(res.archiveServiceClass).append("\";\n");
        sb.append("    public static final String ARCHIVE_SERVICE_METHOD = \"").append(res.archiveServiceMethod).append("\";\n");
        sb.append("    public static final String[] ARCHIVE_SERVICE_CLASSES = ").append(formatArray(res.archiveServiceClass, "rsr", "psu")).append(";\n\n");

        sb.append("    public static final String ARCHIVE_BUILDER_CLASS = \"").append(res.archiveBuilderClass).append("\";\n");
        sb.append("    public static final String ARCHIVE_ACTION_CLASS = \"").append(res.archiveActionClass).append("\";\n");
        sb.append("    public static final String[] ARCHIVE_BUILDER_CLASSES = ").append(formatArray(res.archiveBuilderClass, "rsv", "psy")).append(";\n\n");

        sb.append("    // Move to Trash Action\n");
        sb.append("    public static final String MOVE_TO_TRASH_ACTION_CLASS = \"").append(res.moveToTrashActionClass).append("\";\n");
        sb.append("    public static final String[] MOVE_TO_TRASH_ACTION_CLASSES = ").append(formatArray(res.moveToTrashActionClass, "bfjt", "bjir")).append(";\n\n");

        // Glide Singleton (mdm in 7.98)
        sb.append("    // Glide Singleton\n");
        sb.append("    public static final String GLIDE_SINGLETON_CLASS = \"").append(res.glideSingletonClass).append("\";\n");
        sb.append("    public static final String[] GLIDE_SINGLETON_CLASSES = ").append(formatArray(res.glideSingletonClass, "mdm", "mil", "khc", "mgg", "mkp", "kjo")).append(";\n\n");

        // Remote Media Model & Options (amrp/amrq in 7.98)
        sb.append("    // Remote Media Model & Options\n");
        sb.append("    public static final String REMOTE_MEDIA_MODEL_CLASS = \"").append(res.remoteMediaModelClass).append("\";\n");
        sb.append("    public static final String REMOTE_MEDIA_OPTIONS_CLASS = \"").append(res.remoteMediaOptionsClass).append("\";\n");
        sb.append("    public static final String[][] REMOTE_MEDIA_MODEL_PAIRS = {\n");
        sb.append("        {\"").append(res.remoteMediaModelClass).append("\", \"").append(res.remoteMediaOptionsClass).append("\"}, // ").append(res.apkVersion).append("\n");
        sb.append("        {\"amsr\", \"amss\"}, // 7.97.0 arm64\n");
        sb.append("        {\"amri\", \"amrj\"}, // 7.97.0 univ\n");
        sb.append("        {\"amxw\", \"amxx\"}, // 7.97.0 univ\n");
        sb.append("        {\"akin\", \"akio\"}, // 7.96.0 nodpi\n");
        sb.append("        {\"aklr\", \"akls\"}  // 7.96.0 Samsung\n");
        sb.append("    };\n\n");

        sb.append("    private ToolkitMappings() {}\n");
        sb.append("}\n");

        Files.writeString(targetFile.toPath(), sb.toString());
        System.out.println("Updated: " + targetFile.getAbsolutePath());
    }

    public static void printReport(AlignmentResult res) {
        System.out.println("==================================================================");
        System.out.println("               ALIGNMENT RESULTS FOR v" + res.apkVersion);
        System.out.println("==================================================================");
        System.out.printf("  %-32s : %s->%s()%n", "Service Locator", res.serviceLocatorClass, res.serviceLocatorMethod);
        System.out.printf("  %-32s : %s->%s()%n", "Task Runner", res.taskRunnerClass, res.taskRunnerSyncMethod);
        System.out.printf("  %-32s : %s%n", "Add Media To Album Builder", res.addMediaToAlbumBuilderClass);
        System.out.printf("  %-32s : %s%n", "Add Media To Envelope Builder", res.addMediaToEnvelopeBuilderClass);
        System.out.printf("  %-32s : %s->%s()%n", "Private Album Remove", res.privateAlbumRemoveClass, res.privateAlbumRemoveMethod);
        System.out.printf("  %-32s : [%s, %s.%s, %s.%s()]%n", "Mars Remove Config",
                res.marsRemoveConfig[0], res.marsRemoveConfig[1], res.marsRemoveConfig[2], res.marsRemoveConfig[3], res.marsRemoveConfig[4]);
        System.out.printf("  %-32s : %s%n", "Mars Collection Class", res.marsCollectionClass);
        System.out.printf("  %-32s : %s (%s->%s())%n", "Trash Collection Class", res.trashCollectionClass, res.trashFactoryClass, res.trashFactoryMethod);
        System.out.printf("  %-32s : %s->%s() (builder: %s)%n", "Keys Collection Class", res.keysCollectionClass, res.keysCollectionMethod, res.keysCollectionBuilder);
        System.out.printf("  %-32s : %s->%s()%n", "Core Media Loader", res.coreMediaLoaderClass, res.coreMediaLoaderMethod);
        System.out.printf("  %-32s : %s (builder: %s)%n", "Features Request", res.featuresRequestClass, res.featuresRequestBuilderClass);
        System.out.printf("  %-32s : %s%n", "DedupKey Feature", res.dedupKeyFeatureClass);
        System.out.printf("  %-32s : %s%n", "RemoteMediaKey Feature", res.remoteMediaKeyFeatureClass);
        System.out.printf("  %-32s : %s%n", "Action Queue Flusher", res.actionFlusherClass);
        System.out.printf("  %-32s : %s->%s()%n", "Archive Service", res.archiveServiceClass, res.archiveServiceMethod);
        System.out.printf("  %-32s : %s (action: %s)%n", "Archive Builder", res.archiveBuilderClass, res.archiveActionClass);
        System.out.printf("  %-32s : %s%n", "Move To Trash Action", res.moveToTrashActionClass);
        System.out.printf("  %-32s : %s%n", "Glide Singleton", res.glideSingletonClass);
        System.out.printf("  %-32s : %s (options: %s)%n", "Remote Media Model", res.remoteMediaModelClass, res.remoteMediaOptionsClass);
        System.out.println("==================================================================");
    }

    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java ToolkitAligner <path-to-google-photos.apk> [path-to-ToolkitMappings.java]");
            System.exit(1);
        }
        File apk = new File(args[0]);
        if (!apk.exists()) {
            System.err.println("Error: APK not found at " + apk.getAbsolutePath());
            System.exit(1);
        }

        File targetFile = null;
        if (args.length >= 2) {
            targetFile = new File(args[1]);
        } else {
            targetFile = new File("extensions/shared/library/src/main/java/app/morphe/extension/shared/patches/toolkit/ToolkitMappings.java");
            if (!targetFile.exists()) {
                targetFile = new File("patches/morphe-google-photos/extensions/shared/library/src/main/java/app/morphe/extension/shared/patches/toolkit/ToolkitMappings.java");
            }
        }

        try {
            AlignmentResult result = alignApk(apk);
            printReport(result);
            if (targetFile != null && targetFile.getParentFile().exists()) {
                generateMappingsFile(result, targetFile);
            } else {
                System.out.println("Note: Target mappings file path not found: " + (targetFile != null ? targetFile.getAbsolutePath() : "null"));
            }
            System.out.println("Alignment completed successfully!");
        } catch (Throwable t) {
            System.err.println("Alignment failed: " + t.getMessage());
            t.printStackTrace();
            System.exit(2);
        }
    }
}
