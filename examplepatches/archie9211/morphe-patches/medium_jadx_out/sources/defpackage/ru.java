package defpackage;

import android.graphics.Matrix;
import android.graphics.Path;
import android.net.ConnectivityManager;
import android.os.Build;
import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ru implements xu, xnf {
    public final /* synthetic */ int a;
    public ArrayList b;

    public ru(int i) {
        this.a = i;
        switch (i) {
            case 3:
                this.b = new ArrayList(20);
                break;
            case 4:
                this.b = new ArrayList();
                break;
            case 5:
            default:
                this.b = new ArrayList();
                break;
            case 6:
                this.b = new ArrayList(5);
                break;
            case 7:
                break;
            case 8:
                List<String> listR = d46.R("www.recaptcha.net", "www.gstatic.com/recaptcha", "www.gstatic.cn/recaptcha");
                ArrayList arrayList = new ArrayList(cu1.k0(listR, 10));
                for (String str : listR) {
                    StringBuilder sb = new StringBuilder(String.valueOf(str).length() + 9);
                    sb.append("https://");
                    sb.append(str);
                    sb.append("/");
                    arrayList.add(sb.toString());
                }
                this.b = arrayList;
                break;
        }
    }

    @Override // defpackage.xnf
    public xnf a(String str) throws zzabz {
        try {
            JSONObject jSONObject = new JSONObject(str);
            this.b = new ArrayList();
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("authorizedDomains");
            if (jSONArrayOptJSONArray != null) {
                for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
                    this.b.add(jSONArrayOptJSONArray.getString(i));
                }
            }
            return this;
        } catch (JSONException e) {
            throw to7.B(e, "ru", str);
        }
    }

    @Override // defpackage.xu
    public List a0() {
        return this.b;
    }

    public void b(aaf aafVar) {
        this.b.add(aafVar);
    }

    @Override // defpackage.xu
    public boolean b0() {
        ArrayList arrayList = this.b;
        return arrayList.size() == 1 && ((uk6) arrayList.get(0)).c();
    }

    public void c(String str, String str2) {
        str.getClass();
        str2.getClass();
        iq7.J(str);
        iq7.K(str2, str);
        iq7.B(this, str, str2);
    }

    public void d(String str) {
        int iY = muc.Y(str, ':', 1, 4);
        if (iY != -1) {
            iq7.B(this, str.substring(0, iY), str.substring(iY + 1));
        } else if (str.charAt(0) == ':') {
            iq7.B(this, "", str.substring(1));
        } else {
            iq7.B(this, "", str);
        }
    }

    public void e(Path path) {
        ArrayList arrayList = this.b;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            ntd ntdVar = (ntd) arrayList.get(size);
            Matrix matrix = gpe.a;
            if (ntdVar != null && !ntdVar.a) {
                gpe.a(path, ntdVar.d.i() / 100.0f, ntdVar.e.i() / 100.0f, ntdVar.f.i() / 360.0f);
            }
        }
    }

    public String f(String str) {
        str.getClass();
        ArrayList arrayList = this.b;
        int size = arrayList.size() - 2;
        int iU = hk7.u(size, 0, -2);
        if (iU > size) {
            return null;
        }
        while (!str.equalsIgnoreCase((String) arrayList.get(size))) {
            if (size == iU) {
                return null;
            }
            size -= 2;
        }
        return (String) arrayList.get(size + 1);
    }

    public synchronized List g() {
        return DesugarCollections.unmodifiableList(new ArrayList(this.b));
    }

    public aaf h(int i) {
        return (aaf) this.b.get(i);
    }

    public void i(String str) {
        str.getClass();
        ArrayList arrayList = this.b;
        int i = 0;
        while (i < arrayList.size()) {
            if (str.equalsIgnoreCase((String) arrayList.get(i))) {
                arrayList.remove(i);
                arrayList.remove(i);
                i -= 2;
            }
            i += 2;
        }
    }

    public bo4 j(c8f c8fVar) {
        c8fVar.getClass();
        ArrayList arrayList = this.b;
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : arrayList) {
            if (((o52) obj).c(c8fVar)) {
                arrayList2.add(obj);
            }
        }
        ArrayList arrayList3 = new ArrayList(cu1.k0(arrayList2, 10));
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            arrayList3.add(((o52) it2.next()).b(c8fVar.j));
        }
        return m40.J(new ll8((bo4[]) bu1.m1(arrayList3).toArray(new bo4[0]), 1));
    }

    public String toString() {
        int i;
        switch (this.a) {
            case 6:
                ArrayList arrayList = this.b;
                StringBuffer stringBuffer = new StringBuffer();
                for (int i2 = 1; i2 < arrayList.size(); i2++) {
                    stringBuffer.append(h(i2));
                    if (i2 < arrayList.size() - 1 && ((i = h(i2 + 1).b) == 1 || i == 2)) {
                        stringBuffer.append('/');
                    }
                }
                return stringBuffer.toString();
            default:
                return super.toString();
        }
    }

    @Override // defpackage.xu
    public rn0 w() {
        ArrayList arrayList = this.b;
        return ((uk6) arrayList.get(0)).c() ? new se5(arrayList, 1) : new n59(arrayList);
    }

    public ru(sqd sqdVar) {
        this.a = 5;
        sqdVar.getClass();
        String str = a7f.a;
        q62 q62Var = sqdVar.b;
        q62 q62Var2 = sqdVar.d;
        int i = 3;
        int i2 = 2;
        ArrayList arrayListT = d46.T(new iq0(q62Var, 0), new iq0(sqdVar.c, 1), new iq0(sqdVar.e, 4));
        if (Build.VERSION.SDK_INT >= 28) {
            Object systemService = sqdVar.a.getSystemService("connectivity");
            systemService.getClass();
            arrayListT.add(new me8((ConnectivityManager) systemService));
        } else {
            q62Var2.getClass();
            arrayListT.addAll(d46.R(new iq0(q62Var2, i2), new iq0(q62Var2, i), new je8(q62Var2), new ie8(q62Var2)));
        }
        this.b = arrayListT;
    }

    public ru(ArrayList arrayList) {
        this.a = 0;
        this.b = arrayList;
    }

    public ru(l44 l44Var) {
        this.a = 1;
        this.b = new ArrayList();
    }
}
