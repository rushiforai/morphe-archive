package n4;

import android.app.Notification;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import com.tiktok.util.TTConst;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class e0 {

    /* renamed from: a, reason: collision with root package name */
    public final CharSequence f77795a;

    /* renamed from: b, reason: collision with root package name */
    public final long f77796b;

    /* renamed from: c, reason: collision with root package name */
    public final q0 f77797c;

    /* renamed from: d, reason: collision with root package name */
    public final Bundle f77798d = new Bundle();

    /* renamed from: e, reason: collision with root package name */
    public String f77799e;

    /* renamed from: f, reason: collision with root package name */
    public Uri f77800f;

    public e0(CharSequence charSequence, long j11, q0 q0Var) {
        this.f77795a = charSequence;
        this.f77796b = j11;
        this.f77797c = q0Var;
    }

    public static Bundle[] a(ArrayList arrayList) {
        Bundle[] bundleArr = new Bundle[arrayList.size()];
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            e0 e0Var = (e0) arrayList.get(i5);
            q0 q0Var = e0Var.f77797c;
            Bundle bundle = new Bundle();
            CharSequence charSequence = e0Var.f77795a;
            if (charSequence != null) {
                bundle.putCharSequence("text", charSequence);
            }
            bundle.putLong("time", e0Var.f77796b);
            if (q0Var != null) {
                bundle.putCharSequence("sender", q0Var.f77848a);
                if (Build.VERSION.SDK_INT >= 28) {
                    bundle.putParcelable("sender_person", d0.a(h0.d(q0Var)));
                } else {
                    bundle.putBundle("person", q0Var.b());
                }
            }
            String str = e0Var.f77799e;
            if (str != null) {
                bundle.putString(TTConst.TRACK_TYPE, str);
            }
            Uri uri = e0Var.f77800f;
            if (uri != null) {
                bundle.putParcelable("uri", uri);
            }
            Bundle bundle2 = e0Var.f77798d;
            if (bundle2 != null) {
                bundle.putBundle("extras", bundle2);
            }
            bundleArr[i5] = bundle;
        }
        return bundleArr;
    }

    public static ArrayList b(Parcelable[] parcelableArr) {
        q0 q0VarB;
        ArrayList arrayList = new ArrayList(parcelableArr.length);
        for (Parcelable parcelable : parcelableArr) {
            if (parcelable instanceof Bundle) {
                Bundle bundle = (Bundle) parcelable;
                e0 e0Var = null;
                try {
                    if (bundle.containsKey("text") && bundle.containsKey("time")) {
                        if (bundle.containsKey("person")) {
                            q0VarB = q0.a(bundle.getBundle("person"));
                        } else if (bundle.containsKey("sender_person") && Build.VERSION.SDK_INT >= 28) {
                            q0VarB = h0.b(l2.m.d(bundle.getParcelable("sender_person")));
                        } else if (bundle.containsKey("sender")) {
                            CharSequence charSequence = bundle.getCharSequence("sender");
                            q0 q0Var = new q0();
                            q0Var.f77848a = charSequence;
                            q0Var.f77849b = null;
                            q0Var.f77850c = null;
                            q0Var.f77851d = null;
                            q0Var.f77852e = false;
                            q0Var.f77853f = false;
                            q0VarB = q0Var;
                        } else {
                            q0VarB = null;
                        }
                        e0 e0Var2 = new e0(bundle.getCharSequence("text"), bundle.getLong("time"), q0VarB);
                        if (bundle.containsKey(TTConst.TRACK_TYPE) && bundle.containsKey("uri")) {
                            String string = bundle.getString(TTConst.TRACK_TYPE);
                            Uri uri = (Uri) bundle.getParcelable("uri");
                            e0Var2.f77799e = string;
                            e0Var2.f77800f = uri;
                        }
                        if (bundle.containsKey("extras")) {
                            e0Var2.f77798d.putAll(bundle.getBundle("extras"));
                        }
                        e0Var = e0Var2;
                    }
                } catch (ClassCastException unused) {
                }
                if (e0Var != null) {
                    arrayList.add(e0Var);
                }
            }
        }
        return arrayList;
    }

    public final Notification.MessagingStyle.Message c() {
        Notification.MessagingStyle.Message messageA;
        int i5 = Build.VERSION.SDK_INT;
        long j11 = this.f77796b;
        CharSequence charSequence = this.f77795a;
        q0 q0Var = this.f77797c;
        if (i5 >= 28) {
            messageA = d0.b(charSequence, j11, q0Var != null ? h0.d(q0Var) : null);
        } else {
            messageA = c0.a(charSequence, j11, q0Var != null ? q0Var.f77848a : null);
        }
        String str = this.f77799e;
        if (str != null) {
            c0.b(messageA, str, this.f77800f);
        }
        return messageA;
    }
}
