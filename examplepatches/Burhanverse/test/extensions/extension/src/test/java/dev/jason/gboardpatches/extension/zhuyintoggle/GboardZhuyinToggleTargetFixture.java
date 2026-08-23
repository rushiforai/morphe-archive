package dev.jason.gboardpatches.extension.zhuyintoggle;

import android.content.Context;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

final class GboardZhuyinToggleTargetFixture {
    private static final String SOFT_KEY_VIEW_NAME =
            "com.google.android.libraries.inputmethod.widgets.SoftKeyView";
    private static final String SOFT_KEY_VIEW_INTERNAL_NAME =
            "com/google/android/libraries/inputmethod/widgets/SoftKeyView";
    private static final String[] TARGET_CLASS_NAMES = new String[] {
            "owd", "oth", "otk", "oud", "oti", "ovv", "ouc", "pbj", "pnp"
    };
    private static final FixtureClassLoader CLASS_LOADER = new FixtureClassLoader(
            GboardZhuyinToggleTargetFixture.class.getClassLoader(), buildSoftKeyViewClass());
    private static final Class<?> SOFT_KEY_VIEW_CLASS = loadSoftKeyViewClass();
    private static final Class<?> METADATA_CLASS = loadClass("owd");

    private GboardZhuyinToggleTargetFixture() {
    }

    static ClassLoader classLoader() {
        return CLASS_LOADER;
    }

    static Object newSoftKeyView(Context context) throws Exception {
        return SOFT_KEY_VIEW_CLASS.getConstructor(Context.class).newInstance(context);
    }

    static void bind(Object view, Object metadata, long token) throws Exception {
        Method method = SOFT_KEY_VIEW_CLASS.getMethod("q", METADATA_CLASS, long.class);
        method.invoke(view, metadata, Long.valueOf(token));
    }

    static Object boundMetadata(Object view) throws Exception {
        return field("e").get(view);
    }

    static long bindToken(Object view) throws Exception {
        return field("f").getLong(view);
    }

    static int bindCount(Object view) throws Exception {
        return field("bindCount").getInt(view);
    }

    static void setThrowOnBind(Object view, boolean shouldThrow) throws Exception {
        field("throwOnBind").setBoolean(view, shouldThrow);
    }

    private static Field field(String name) throws Exception {
        return SOFT_KEY_VIEW_CLASS.getField(name);
    }

    private static Class<?> loadSoftKeyViewClass() {
        return loadClass(SOFT_KEY_VIEW_NAME);
    }

    private static Class<?> loadClass(String name) {
        try {
            return Class.forName(name, true, CLASS_LOADER);
        } catch (ClassNotFoundException exception) {
            throw new AssertionError(exception);
        }
    }

    private static byte[] buildSoftKeyViewClass() {
        ClassWriter writer = new ClassWriter(
                ClassWriter.COMPUTE_FRAMES | ClassWriter.COMPUTE_MAXS) {
            @Override
            protected String getCommonSuperClass(String left, String right) {
                return "java/lang/Object";
            }
        };
        writer.visit(
                Opcodes.V1_8,
                Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL,
                SOFT_KEY_VIEW_INTERNAL_NAME,
                null,
                "android/view/View",
                null);
        writer.visitField(Opcodes.ACC_PUBLIC, "e", "Lowd;", null, null).visitEnd();
        writer.visitField(Opcodes.ACC_PUBLIC, "f", "J", null, null).visitEnd();
        writer.visitField(Opcodes.ACC_PUBLIC, "throwOnBind", "Z", null, null).visitEnd();
        writer.visitField(Opcodes.ACC_PUBLIC, "bindCount", "I", null, null).visitEnd();

        MethodVisitor constructor = writer.visitMethod(
                Opcodes.ACC_PUBLIC,
                "<init>",
                "(Landroid/content/Context;)V",
                null,
                null);
        constructor.visitCode();
        constructor.visitVarInsn(Opcodes.ALOAD, 0);
        constructor.visitVarInsn(Opcodes.ALOAD, 1);
        constructor.visitMethodInsn(
                Opcodes.INVOKESPECIAL,
                "android/view/View",
                "<init>",
                "(Landroid/content/Context;)V",
                false);
        constructor.visitInsn(Opcodes.RETURN);
        constructor.visitMaxs(0, 0);
        constructor.visitEnd();

        MethodVisitor bind = writer.visitMethod(
                Opcodes.ACC_PUBLIC | Opcodes.ACC_FINAL,
                "q",
                "(Lowd;J)Z",
                null,
                null);
        bind.visitCode();
        Label bindNormally = new Label();
        bind.visitVarInsn(Opcodes.ALOAD, 0);
        bind.visitFieldInsn(
                Opcodes.GETFIELD,
                SOFT_KEY_VIEW_INTERNAL_NAME,
                "throwOnBind",
                "Z");
        bind.visitJumpInsn(Opcodes.IFEQ, bindNormally);
        bind.visitTypeInsn(Opcodes.NEW, "java/lang/IllegalStateException");
        bind.visitInsn(Opcodes.DUP);
        bind.visitLdcInsn("fixture bind failure");
        bind.visitMethodInsn(
                Opcodes.INVOKESPECIAL,
                "java/lang/IllegalStateException",
                "<init>",
                "(Ljava/lang/String;)V",
                false);
        bind.visitInsn(Opcodes.ATHROW);
        bind.visitLabel(bindNormally);
        bind.visitVarInsn(Opcodes.ALOAD, 0);
        bind.visitVarInsn(Opcodes.ALOAD, 1);
        bind.visitFieldInsn(Opcodes.PUTFIELD, SOFT_KEY_VIEW_INTERNAL_NAME, "e", "Lowd;");
        bind.visitVarInsn(Opcodes.ALOAD, 0);
        bind.visitVarInsn(Opcodes.LLOAD, 2);
        bind.visitFieldInsn(Opcodes.PUTFIELD, SOFT_KEY_VIEW_INTERNAL_NAME, "f", "J");
        bind.visitVarInsn(Opcodes.ALOAD, 0);
        bind.visitInsn(Opcodes.DUP);
        bind.visitFieldInsn(
                Opcodes.GETFIELD,
                SOFT_KEY_VIEW_INTERNAL_NAME,
                "bindCount",
                "I");
        bind.visitInsn(Opcodes.ICONST_1);
        bind.visitInsn(Opcodes.IADD);
        bind.visitFieldInsn(
                Opcodes.PUTFIELD,
                SOFT_KEY_VIEW_INTERNAL_NAME,
                "bindCount",
                "I");
        bind.visitInsn(Opcodes.ICONST_1);
        bind.visitInsn(Opcodes.IRETURN);
        bind.visitMaxs(0, 0);
        bind.visitEnd();
        writer.visitEnd();
        return writer.toByteArray();
    }

    private static final class FixtureClassLoader extends ClassLoader {
        private final byte[] softKeyViewClass;

        FixtureClassLoader(ClassLoader parent, byte[] softKeyViewClass) {
            super(parent);
            this.softKeyViewClass = softKeyViewClass;
        }

        @Override
        protected Class<?> findClass(String name) throws ClassNotFoundException {
            if (SOFT_KEY_VIEW_NAME.equals(name)) {
                return defineClass(name, softKeyViewClass, 0, softKeyViewClass.length);
            }
            if (isTargetClass(name)) {
                byte[] classBytes = readParentClassBytes(name);
                return defineClass(name, classBytes, 0, classBytes.length);
            }
            throw new ClassNotFoundException(name);
        }

        @Override
        protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
            if (!SOFT_KEY_VIEW_NAME.equals(name) && !isTargetClass(name)) {
                return super.loadClass(name, resolve);
            }
            synchronized (this) {
                Class<?> loaded = findLoadedClass(name);
                if (loaded == null) {
                    loaded = findClass(name);
                }
                if (resolve) {
                    resolveClass(loaded);
                }
                return loaded;
            }
        }

        private byte[] readParentClassBytes(String name) throws ClassNotFoundException {
            String resourceName = name.replace('.', '/') + ".class";
            InputStream input = getParent().getResourceAsStream(resourceName);
            if (input == null) {
                throw new ClassNotFoundException(name);
            }
            try {
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    output.write(buffer, 0, read);
                }
                return output.toByteArray();
            } catch (IOException exception) {
                throw new ClassNotFoundException(name, exception);
            } finally {
                try {
                    input.close();
                } catch (IOException ignored) {
                    // Test fixture cleanup only.
                }
            }
        }

        private boolean isTargetClass(String name) {
            for (String targetClassName : TARGET_CLASS_NAMES) {
                if (targetClassName.equals(name)) {
                    return true;
                }
            }
            return false;
        }
    }
}
