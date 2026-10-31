package com.amplitude.android.utilities;

import androidx.compose.runtime.ComposeVersion;
import com.amplitude.common.Logger;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0003\bÀ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0019\u0010\t\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\u0002\u0010\rJ\u0014\u0010\u000e\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\fJ\u0014\u0010\u000f\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\fJ\u0012\u0010\u0010\u001a\u00020\u00112\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\fJ\u001e\u0010\u0012\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0013\u001a\u00020\u00042\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\fH\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0014"}, d2 = {"Lcom/amplitude/android/utilities/ComposeUtils;", b.f42142b, "()V", "COMPOSE_CLASS_NAME", b.f42142b, "COMPOSE_GESTURE_LOCATOR_CLASS_NAME", "COMPOSE_RUNTIME_VERSION_RESOURCE", "COMPOSE_UI_VERSION_RESOURCE", "COMPOSE_VERSION_CLASS", "getComposeRuntimeCompatibilityVersionCode", b.f42142b, "logger", "Lcom/amplitude/common/Logger;", "(Lcom/amplitude/common/Logger;)Ljava/lang/Integer;", "getComposeRuntimeVersion", "getComposeUiVersion", "isComposeAvailable", b.f42142b, "readVersionFromMetaInf", "resourcePath", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class ComposeUtils {

    @NotNull
    private static final String COMPOSE_CLASS_NAME = "androidx.compose.ui.node.Owner";

    @NotNull
    private static final String COMPOSE_GESTURE_LOCATOR_CLASS_NAME = "com.amplitude.android.internal.locators.ComposeViewTargetLocator";

    @NotNull
    private static final String COMPOSE_RUNTIME_VERSION_RESOURCE = "META-INF/androidx.compose.runtime_runtime.version";

    @NotNull
    private static final String COMPOSE_UI_VERSION_RESOURCE = "META-INF/androidx.compose.ui_ui.version";

    @NotNull
    private static final String COMPOSE_VERSION_CLASS = "androidx.compose.runtime.ComposeVersion";

    @NotNull
    public static final ComposeUtils INSTANCE = new ComposeUtils();

    private ComposeUtils() {
    }

    public static /* synthetic */ Integer getComposeRuntimeCompatibilityVersionCode$default(ComposeUtils composeUtils, Logger logger, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            logger = null;
        }
        return composeUtils.getComposeRuntimeCompatibilityVersionCode(logger);
    }

    public static /* synthetic */ String getComposeRuntimeVersion$default(ComposeUtils composeUtils, Logger logger, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            logger = null;
        }
        return composeUtils.getComposeRuntimeVersion(logger);
    }

    public static /* synthetic */ String getComposeUiVersion$default(ComposeUtils composeUtils, Logger logger, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            logger = null;
        }
        return composeUtils.getComposeUiVersion(logger);
    }

    public static /* synthetic */ boolean isComposeAvailable$default(ComposeUtils composeUtils, Logger logger, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            logger = null;
        }
        return composeUtils.isComposeAvailable(logger);
    }

    private final String readVersionFromMetaInf(String resourcePath, Logger logger) throws IOException {
        try {
            ClassLoader classLoader = ComposeUtils.class.getClassLoader();
            InputStream resourceAsStream = classLoader != null ? classLoader.getResourceAsStream(resourcePath) : null;
            if (resourceAsStream == null) {
                return null;
            }
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(resourceAsStream, Charsets.f72000b), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            try {
                String line = bufferedReader.readLine();
                String string = line != null ? k.u1(line).toString() : null;
                bufferedReader.close();
                return string;
            } finally {
            }
        } catch (Exception e3) {
            if (logger != null) {
                logger.debug("Failed to read version from " + resourcePath + ": " + e3);
            }
            return null;
        }
    }

    public static /* synthetic */ String readVersionFromMetaInf$default(ComposeUtils composeUtils, String str, Logger logger, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            logger = null;
        }
        return composeUtils.readVersionFromMetaInf(str, logger);
    }

    @Nullable
    public final Integer getComposeRuntimeCompatibilityVersionCode(@Nullable Logger logger) {
        try {
            return Integer.valueOf(ComposeVersion.class.getDeclaredField("version").getInt(null));
        } catch (Exception e3) {
            if (logger != null) {
                logger.debug("Failed to read ComposeVersion.version via reflection: " + e3);
            }
            return null;
        }
    }

    @Nullable
    public final String getComposeRuntimeVersion(@Nullable Logger logger) {
        return readVersionFromMetaInf(COMPOSE_RUNTIME_VERSION_RESOURCE, logger);
    }

    @Nullable
    public final String getComposeUiVersion(@Nullable Logger logger) {
        return readVersionFromMetaInf(COMPOSE_UI_VERSION_RESOURCE, logger);
    }

    public final boolean isComposeAvailable(@Nullable Logger logger) {
        LoadClass loadClass = LoadClass.INSTANCE;
        return loadClass.isClassAvailable(COMPOSE_CLASS_NAME, logger) && loadClass.isClassAvailable(COMPOSE_GESTURE_LOCATOR_CLASS_NAME, logger);
    }
}
