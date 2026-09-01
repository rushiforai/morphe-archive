package defpackage;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.facebook.CustomTabActivity;
import com.facebook.CustomTabMainActivity;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import java.util.Set;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ys0 extends BroadcastReceiver {
    public static ys0 c;
    public final /* synthetic */ int a;
    public final Object b;

    public ys0(Context context) {
        this.a = 0;
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        this.b = applicationContext;
    }

    public static final ys0 a() {
        if (ec2.a.contains(ys0.class)) {
            return null;
        }
        try {
            return c;
        } catch (Throwable th) {
            ec2.a(ys0.class, th);
            return null;
        }
    }

    public void finalize() throws Throwable {
        switch (this.a) {
            case 0:
                Set set = ec2.a;
                if (!set.contains(this)) {
                    try {
                        if (!set.contains(this)) {
                            try {
                                iq1.C((Context) this.b).T(this);
                            } catch (Throwable th) {
                                ec2.a(this, th);
                                return;
                            }
                            break;
                        }
                    } catch (Throwable th2) {
                        ec2.a(this, th2);
                        return;
                    }
                }
                break;
            default:
                super.finalize();
                break;
        }
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                if (!ec2.a.contains(this)) {
                    try {
                        g50 g50Var = new g50(context, (String) null);
                        StringBuilder sb = new StringBuilder("bf_");
                        sb.append(intent != null ? intent.getStringExtra("event_name") : null);
                        String string = sb.toString();
                        Bundle bundleExtra = intent != null ? intent.getBundleExtra("event_args") : null;
                        Bundle bundle = new Bundle();
                        Set<String> setKeySet = bundleExtra != null ? bundleExtra.keySet() : null;
                        if (setKeySet != null) {
                            for (String str : setKeySet) {
                                str.getClass();
                                Pattern patternCompile = Pattern.compile("[^0-9a-zA-Z _-]");
                                patternCompile.getClass();
                                String strReplaceAll = patternCompile.matcher(str).replaceAll("-");
                                strReplaceAll.getClass();
                                Pattern patternCompile2 = Pattern.compile("^[ -]*");
                                patternCompile2.getClass();
                                String strReplaceAll2 = patternCompile2.matcher(strReplaceAll).replaceAll("");
                                strReplaceAll2.getClass();
                                Pattern patternCompile3 = Pattern.compile("[ -]*$");
                                patternCompile3.getClass();
                                String strReplaceAll3 = patternCompile3.matcher(strReplaceAll2).replaceAll("");
                                strReplaceAll3.getClass();
                                bundle.putString(strReplaceAll3, (String) bundleExtra.get(str));
                            }
                        }
                        f94 f94Var = f94.a;
                        if (mme.c()) {
                            g50Var.d(string, bundle);
                        }
                    } catch (Throwable th) {
                        ec2.a(this, th);
                        return;
                    }
                    break;
                }
                break;
            case 1:
                ((n4) obj).q();
                break;
            case 2:
                context.getClass();
                intent.getClass();
                ((az0) obj).h(intent);
                break;
            case 3:
                context.getClass();
                intent.getClass();
                ((CustomTabActivity) obj).finish();
                break;
            default:
                context.getClass();
                intent.getClass();
                CustomTabMainActivity customTabMainActivity = (CustomTabMainActivity) obj;
                Intent intent2 = new Intent(customTabMainActivity, (Class<?>) CustomTabMainActivity.class);
                int i2 = CustomTabMainActivity.c;
                intent2.setAction("CustomTabMainActivity.action_refresh");
                String str2 = ziYqbdHrAXvj.JUIZpTfGGxwfI;
                intent2.putExtra(str2, intent.getStringExtra(str2));
                intent2.addFlags(603979776);
                customTabMainActivity.startActivity(intent2);
                break;
        }
    }

    public /* synthetic */ ys0(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
