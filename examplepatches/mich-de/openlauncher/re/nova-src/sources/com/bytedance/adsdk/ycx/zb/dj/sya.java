package com.bytedance.adsdk.ycx.zb.dj;

import com.amplitude.core.events.Identify;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* loaded from: classes2.dex */
public enum sya implements lud {
    QUESTION("?", 0),
    COLON(":", 0),
    DOUBLE_AMP("&&", 1),
    DOUBLE_BAR("||", 1),
    EQ("==", 2),
    GT(">", 2),
    LT("<", 2),
    LT_EQ("<=", 2),
    GT_EQ(">=", 2),
    NOT_EQ("!=", 2),
    PLUS("+", 3),
    MINUS(Identify.UNSET_VALUE, 3),
    MULTI("*", 4),
    DIVISION("/", 4),
    MOD("%", 4);

    private final String pmi;

    /* renamed from: uh, reason: collision with root package name */
    private final int f22818uh;

    /* renamed from: dy, reason: collision with root package name */
    private static final Map<String, sya> f22809dy = new HashMap(128);
    private static final Set<sya> wie = new HashSet();

    static {
        for (sya syaVar : values()) {
            f22809dy.put(syaVar.ycx(), syaVar);
            wie.add(syaVar);
        }
    }

    sya(String str, int i5) {
        this.pmi = str;
        this.f22818uh = i5;
    }

    public static sya ycx(String str) {
        return f22809dy.get(str);
    }

    public int zb() {
        return this.f22818uh;
    }

    public static boolean ycx(lud ludVar) {
        return ludVar instanceof sya;
    }

    public String ycx() {
        return this.pmi;
    }
}
