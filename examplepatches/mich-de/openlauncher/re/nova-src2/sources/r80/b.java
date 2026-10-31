package r80;

import android.content.Context;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    @NotNull
    public static final a Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final List f85648a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f85649b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f85650c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f85651d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f85652e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ b[] f85653f;

    static {
        b bVar = new b("VIEW_CONTACT", 0);
        f85649b = bVar;
        b bVar2 = new b("PHONE_DIAL", 1);
        f85650c = bVar2;
        b bVar3 = new b("PHONE_SMS", 2);
        f85651d = bVar3;
        b bVar4 = new b("EMAIL", 3);
        f85652e = bVar4;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4, new b("WHATSAPP", 4), new b("WHATSAPP_4B", 5), new b("SIGNAL", 6), new b("VIBER", 7), new b("TELEGRAM", 8)};
        f85653f = bVarArr;
        EnumEntriesKt.a(bVarArr);
        Companion = new a();
        f85648a = kotlin.collections.c.u0(1, values());
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f85653f.clone();
    }

    public final String a(Context context) {
        String string;
        switch (ordinal()) {
            case 0:
                string = context.getString(2132019550);
                break;
            case 1:
                string = context.getString(2132019551);
                break;
            case 2:
                string = context.getString(2132019554);
                break;
            case 3:
                string = context.getString(2132019552);
                break;
            case 4:
                string = context.getString(2132019557);
                break;
            case 5:
                string = context.getString(2132019558);
                break;
            case 6:
                string = context.getString(2132019553);
                break;
            case 7:
                string = context.getString(2132019556);
                break;
            case 8:
                string = context.getString(2132019555);
                break;
            default:
                throw new NoWhenBranchMatchedException();
        }
        Intrinsics.d(string);
        return string;
    }
}
