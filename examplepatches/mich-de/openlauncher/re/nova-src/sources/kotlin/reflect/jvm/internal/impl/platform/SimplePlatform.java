package kotlin.reflect.jvm.internal.impl.platform;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public abstract class SimplePlatform {

    @NotNull
    private final String platformName;

    @NotNull
    private final TargetPlatformVersion targetPlatformVersion;

    @NotNull
    public String getTargetName() {
        return getTargetPlatformVersion().getDescription();
    }

    @NotNull
    public TargetPlatformVersion getTargetPlatformVersion() {
        return this.targetPlatformVersion;
    }

    @NotNull
    public String toString() {
        String targetName = getTargetName();
        if (targetName.length() <= 0) {
            return this.platformName;
        }
        return this.platformName + " (" + targetName + ')';
    }
}
