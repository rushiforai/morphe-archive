package ir;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ g[] f68009c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f68010d;

    /* renamed from: a, reason: collision with root package name */
    public final String f68011a;

    /* renamed from: b, reason: collision with root package name */
    public final String f68012b;

    static {
        g[] gVarArr = {new g("ReactNative", 0, "com.facebook.react.bridge.NativeModule", "react-native"), new g("Flutter", 1, "io.flutter.embedding.engine.FlutterEngine", "flutter"), new g("Cordova", 2, "org.apache.cordova.CordovaActivity", "cordova"), new g("Unity", 3, "com.unity3d.player.UnityPlayerActivity", "unity")};
        f68009c = gVarArr;
        f68010d = EnumEntriesKt.a(gVarArr);
    }

    public g(String str, int i5, String str2, String str3) {
        this.f68011a = str2;
        this.f68012b = str3;
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f68009c.clone();
    }
}
