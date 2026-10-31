package vh;

import android.app.Activity;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.StreetViewPanoramaFragment;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.SupportStreetViewPanoramaFragment;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import ps.k;

/* loaded from: classes3.dex */
public final class e extends ah.a {

    /* renamed from: f, reason: collision with root package name */
    public a5.d f92775f;

    /* renamed from: g, reason: collision with root package name */
    public Activity f92776g;

    /* renamed from: i, reason: collision with root package name */
    public final Object f92778i;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f92774e = 0;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f92777h = new ArrayList();

    public e(MapFragment mapFragment) {
        this.f92778i = mapFragment;
    }

    @Override // ah.a
    public final void b(a5.d dVar) {
        switch (this.f92774e) {
            case 0:
                this.f92775f = dVar;
                n();
                break;
            case 1:
                this.f92775f = dVar;
                n();
                break;
            case 2:
                this.f92775f = dVar;
                n();
                break;
            default:
                this.f92775f = dVar;
                n();
                break;
        }
    }

    public final void n() {
        switch (this.f92774e) {
            case 0:
                ArrayList arrayList = this.f92777h;
                Activity activity = this.f92776g;
                if (activity == null || this.f92775f == null || ((ah.c) this.f12803a) != null) {
                    return;
                }
                try {
                    a.B(activity);
                    wh.i iVarG0 = k.A(this.f92776g).g0(new ah.d(this.f92776g));
                    if (iVarG0 == null) {
                        return;
                    }
                    this.f92775f.G(new d((MapFragment) this.f92778i, iVarG0));
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        if (it.next() != null) {
                            throw new ClassCastException();
                        }
                        ((d) ((ah.c) this.f12803a)).d();
                    }
                    arrayList.clear();
                    return;
                } catch (RemoteException e3) {
                    throw new RuntimeRemoteException(e3);
                } catch (GooglePlayServicesNotAvailableException unused) {
                    return;
                }
            case 1:
                ArrayList arrayList2 = this.f92777h;
                Activity activity2 = this.f92776g;
                if (activity2 == null || this.f92775f == null || ((ah.c) this.f12803a) != null) {
                    return;
                }
                try {
                    a.B(activity2);
                    this.f92775f.G(new g((StreetViewPanoramaFragment) this.f92778i, k.A(this.f92776g).h0(new ah.d(this.f92776g))));
                    Iterator it2 = arrayList2.iterator();
                    while (it2.hasNext()) {
                        if (it2.next() != null) {
                            throw new ClassCastException();
                        }
                        ((g) ((ah.c) this.f12803a)).d();
                    }
                    arrayList2.clear();
                    return;
                } catch (RemoteException e11) {
                    throw new RuntimeRemoteException(e11);
                } catch (GooglePlayServicesNotAvailableException unused2) {
                    return;
                }
            case 2:
                ArrayList arrayList3 = this.f92777h;
                Activity activity3 = this.f92776g;
                if (activity3 == null || this.f92775f == null || ((ah.c) this.f12803a) != null) {
                    return;
                }
                try {
                    a.B(activity3);
                    wh.i iVarG02 = k.A(this.f92776g).g0(new ah.d(this.f92776g));
                    if (iVarG02 == null) {
                        return;
                    }
                    this.f92775f.G(new h((SupportMapFragment) this.f92778i, iVarG02));
                    Iterator it3 = arrayList3.iterator();
                    while (it3.hasNext()) {
                        if (it3.next() != null) {
                            throw new ClassCastException();
                        }
                        ((h) ((ah.c) this.f12803a)).d();
                    }
                    arrayList3.clear();
                    return;
                } catch (RemoteException e12) {
                    throw new RuntimeRemoteException(e12);
                } catch (GooglePlayServicesNotAvailableException unused3) {
                    return;
                }
            default:
                ArrayList arrayList4 = this.f92777h;
                Activity activity4 = this.f92776g;
                if (activity4 == null || this.f92775f == null || ((ah.c) this.f12803a) != null) {
                    return;
                }
                try {
                    a.B(activity4);
                    this.f92775f.G(new i((SupportStreetViewPanoramaFragment) this.f92778i, k.A(this.f92776g).h0(new ah.d(this.f92776g))));
                    Iterator it4 = arrayList4.iterator();
                    while (it4.hasNext()) {
                        if (it4.next() != null) {
                            throw new ClassCastException();
                        }
                        ((i) ((ah.c) this.f12803a)).d();
                    }
                    arrayList4.clear();
                    return;
                } catch (RemoteException e13) {
                    throw new RuntimeRemoteException(e13);
                } catch (GooglePlayServicesNotAvailableException unused4) {
                    return;
                }
        }
    }

    public e(StreetViewPanoramaFragment streetViewPanoramaFragment) {
        this.f92778i = streetViewPanoramaFragment;
    }

    public e(SupportMapFragment supportMapFragment) {
        this.f92778i = supportMapFragment;
    }

    public e(SupportStreetViewPanoramaFragment supportStreetViewPanoramaFragment) {
        this.f92778i = supportStreetViewPanoramaFragment;
    }
}
