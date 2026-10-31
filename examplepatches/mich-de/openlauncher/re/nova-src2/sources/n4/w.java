package n4;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.PorterDuff;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import androidx.core.graphics.drawable.IconCompat;
import java.util.ArrayList;
import l1.a2;
import ninja.sesame.lib.bridge.v1.ActionCategory;

/* loaded from: classes2.dex */
public final class w extends g0 {

    /* renamed from: e, reason: collision with root package name */
    public int f77875e;

    /* renamed from: f, reason: collision with root package name */
    public q0 f77876f;

    /* renamed from: g, reason: collision with root package name */
    public PendingIntent f77877g;

    /* renamed from: h, reason: collision with root package name */
    public PendingIntent f77878h;

    /* renamed from: i, reason: collision with root package name */
    public PendingIntent f77879i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f77880j;

    /* renamed from: k, reason: collision with root package name */
    public Integer f77881k;

    /* renamed from: l, reason: collision with root package name */
    public Integer f77882l;

    /* renamed from: m, reason: collision with root package name */
    public IconCompat f77883m;
    public CharSequence n;

    @Override // n4.g0
    public final void a(Bundle bundle) {
        super.a(bundle);
        bundle.putInt("android.callType", this.f77875e);
        bundle.putBoolean("android.callIsVideo", this.f77880j);
        q0 q0Var = this.f77876f;
        if (q0Var != null) {
            if (Build.VERSION.SDK_INT >= 28) {
                bundle.putParcelable("android.callPerson", u.b(h0.d(q0Var)));
            } else {
                bundle.putParcelable("android.callPersonCompat", q0Var.b());
            }
        }
        IconCompat iconCompat = this.f77883m;
        if (iconCompat != null) {
            bundle.putParcelable("android.verificationIcon", t.a(iconCompat.f(this.f77807a.f77854a)));
        }
        bundle.putCharSequence("android.verificationText", this.n);
        bundle.putParcelable("android.answerIntent", this.f77877g);
        bundle.putParcelable("android.declineIntent", this.f77878h);
        bundle.putParcelable("android.hangUpIntent", this.f77879i);
        Integer num = this.f77881k;
        if (num != null) {
            bundle.putInt("android.answerColor", num.intValue());
        }
        Integer num2 = this.f77882l;
        if (num2 != null) {
            bundle.putInt("android.declineColor", num2.intValue());
        }
    }

    @Override // n4.g0
    public final void b(a2 a2Var) throws Resources.NotFoundException {
        Notification.Builder builder = (Notification.Builder) a2Var.f73008b;
        int i5 = Build.VERSION.SDK_INT;
        String string = null;
        Notification.CallStyle callStyleA = null;
        if (i5 < 31) {
            q0 q0Var = this.f77876f;
            builder.setContentTitle(q0Var != null ? q0Var.f77848a : null);
            Bundle bundle = this.f77807a.n;
            CharSequence charSequence = (bundle == null || !bundle.containsKey("android.text")) ? null : this.f77807a.n.getCharSequence("android.text");
            if (charSequence == null) {
                int i11 = this.f77875e;
                if (i11 == 1) {
                    string = this.f77807a.f77854a.getResources().getString(2132017598);
                } else if (i11 == 2) {
                    string = this.f77807a.f77854a.getResources().getString(2132017599);
                } else if (i11 == 3) {
                    string = this.f77807a.f77854a.getResources().getString(2132017600);
                }
                charSequence = string;
            }
            builder.setContentText(charSequence);
            q0 q0Var2 = this.f77876f;
            if (q0Var2 != null) {
                IconCompat iconCompat = q0Var2.f77849b;
                if (iconCompat != null) {
                    t.b(builder, iconCompat.f(this.f77807a.f77854a));
                }
                if (i5 >= 28) {
                    q0 q0Var3 = this.f77876f;
                    q0Var3.getClass();
                    u.a(builder, h0.d(q0Var3));
                } else {
                    s.a(builder, this.f77876f.f77850c);
                }
            }
            s.b(builder, ActionCategory.CALL);
            return;
        }
        int i12 = this.f77875e;
        if (i12 == 1) {
            q0 q0Var4 = this.f77876f;
            q0Var4.getClass();
            callStyleA = v.a(h0.d(q0Var4), this.f77878h, this.f77877g);
        } else if (i12 == 2) {
            q0 q0Var5 = this.f77876f;
            q0Var5.getClass();
            callStyleA = v.b(h0.d(q0Var5), this.f77879i);
        } else if (i12 == 3) {
            q0 q0Var6 = this.f77876f;
            q0Var6.getClass();
            callStyleA = v.c(h0.d(q0Var6), this.f77879i, this.f77877g);
        }
        if (callStyleA != null) {
            callStyleA.setBuilder(builder);
            Integer num = this.f77881k;
            if (num != null) {
                v.d(callStyleA, num.intValue());
            }
            Integer num2 = this.f77882l;
            if (num2 != null) {
                v.e(callStyleA, num2.intValue());
            }
            v.h(callStyleA, this.n);
            IconCompat iconCompat2 = this.f77883m;
            if (iconCompat2 != null) {
                v.g(callStyleA, iconCompat2.f(this.f77807a.f77854a));
            }
            v.f(callStyleA, this.f77880j);
        }
    }

    @Override // n4.g0
    public final String c() {
        return "androidx.core.app.NotificationCompat$CallStyle";
    }

    @Override // n4.g0
    public final void d(Bundle bundle) {
        super.d(bundle);
        this.f77875e = bundle.getInt("android.callType");
        this.f77880j = bundle.getBoolean("android.callIsVideo");
        if (Build.VERSION.SDK_INT >= 28 && bundle.containsKey("android.callPerson")) {
            this.f77876f = h0.b(l2.m.d(bundle.getParcelable("android.callPerson")));
        } else if (bundle.containsKey("android.callPersonCompat")) {
            this.f77876f = q0.a(bundle.getBundle("android.callPersonCompat"));
        }
        if (bundle.containsKey("android.verificationIcon")) {
            this.f77883m = IconCompat.b((Icon) bundle.getParcelable("android.verificationIcon"));
        } else if (bundle.containsKey("android.verificationIconCompat")) {
            this.f77883m = IconCompat.a(bundle.getBundle("android.verificationIconCompat"));
        }
        this.n = bundle.getCharSequence("android.verificationText");
        this.f77877g = (PendingIntent) bundle.getParcelable("android.answerIntent");
        this.f77878h = (PendingIntent) bundle.getParcelable("android.declineIntent");
        this.f77879i = (PendingIntent) bundle.getParcelable("android.hangUpIntent");
        this.f77881k = bundle.containsKey("android.answerColor") ? Integer.valueOf(bundle.getInt("android.answerColor")) : null;
        this.f77882l = bundle.containsKey("android.declineColor") ? Integer.valueOf(bundle.getInt("android.declineColor")) : null;
    }

    public final l e(int i5, int i11, Integer num, int i12, PendingIntent pendingIntent) {
        if (num == null) {
            num = Integer.valueOf(this.f77807a.f77854a.getColor(i12));
        }
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        spannableStringBuilder.append((CharSequence) this.f77807a.f77854a.getResources().getString(i11));
        spannableStringBuilder.setSpan(new ForegroundColorSpan(num.intValue()), 0, spannableStringBuilder.length(), 18);
        Context context = this.f77807a.f77854a;
        PorterDuff.Mode mode = IconCompat.f14224k;
        context.getClass();
        IconCompat iconCompatC = IconCompat.c(i5, context.getResources(), context.getPackageName());
        Bundle bundle = new Bundle();
        CharSequence charSequenceC = r.c(spannableStringBuilder);
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        l lVar = new l(iconCompatC, charSequenceC, pendingIntent, bundle, arrayList2.isEmpty() ? null : (s0[]) arrayList2.toArray(new s0[arrayList2.size()]), arrayList.isEmpty() ? null : (s0[]) arrayList.toArray(new s0[arrayList.size()]));
        lVar.f77818a.putBoolean("key_action_priority", true);
        return lVar;
    }
}
