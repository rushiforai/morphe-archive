package defpackage;

import com.medium.reader.R;
import java.util.List;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vq7 {
    public static final uq7 Companion;
    public static final vq7 FEATURES;
    public static final vq7 MARKETING;
    public static final vq7 MEDIUM;
    public static final vq7 RECOMMENDATIONS;
    public static final vq7 SOCIAL;
    public static final List c;
    public static final /* synthetic */ vq7[] d;
    public static final /* synthetic */ i04 e;
    public final String a;
    public final int b;

    static {
        vq7 vq7Var = new vq7("SOCIAL", 0, R.string.notification_channel_group_social, "SOCIAL_GROUP_ID");
        SOCIAL = vq7Var;
        vq7 vq7Var2 = new vq7("RECOMMENDATIONS", 1, R.string.notification_channel_group_recommendations, "RECOMMENDATIONS_GROUP_ID");
        RECOMMENDATIONS = vq7Var2;
        vq7 vq7Var3 = new vq7("FEATURES", 2, R.string.notification_channel_group_features, "FEATURES_GROUP_ID");
        FEATURES = vq7Var3;
        vq7 vq7Var4 = new vq7("MARKETING", 3, R.string.notification_channel_group_marketing, "MARKETING_GROUP_ID");
        MARKETING = vq7Var4;
        vq7 vq7Var5 = new vq7("MEDIUM", 4, R.string.notification_channel_group_medium, "MEDIUM_GROUP_ID");
        MEDIUM = vq7Var5;
        vq7[] vq7VarArr = {vq7Var, vq7Var2, vq7Var3, vq7Var4, vq7Var5};
        d = vq7VarArr;
        e = new i04(vq7VarArr);
        Companion = new uq7();
        c = d46.Q("PLAYBACK_GROUP_ID");
    }

    public vq7(String str, int i, int i2, String str2) {
        this.a = str2;
        this.b = i2;
    }

    public static g04 getEntries() {
        return e;
    }

    public static vq7 valueOf(String str) {
        return (vq7) Enum.valueOf(vq7.class, str);
    }

    public static vq7[] values() {
        return (vq7[]) d.clone();
    }

    public final String getId() {
        return this.a;
    }

    public final int getNameResId() {
        return this.b;
    }
}
