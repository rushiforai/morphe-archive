package j;

import java.util.ArrayList;
import java.util.LinkedHashMap;

/* loaded from: classes.dex */
public final class h extends c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68427a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i f68428b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f68429c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ k.b f68430d;

    public /* synthetic */ h(i iVar, String str, k.b bVar, int i5) {
        this.f68427a = i5;
        this.f68428b = iVar;
        this.f68429c = str;
        this.f68430d = bVar;
    }

    @Override // j.c
    public final void a(Object obj, n4.c cVar) throws Exception {
        switch (this.f68427a) {
            case 0:
                i iVar = this.f68428b;
                ArrayList arrayList = iVar.f68434d;
                LinkedHashMap linkedHashMap = iVar.f68432b;
                String str = this.f68429c;
                Object obj2 = linkedHashMap.get(str);
                k.b bVar = this.f68430d;
                if (obj2 == null) {
                    throw new IllegalStateException(("Attempting to launch an unregistered ActivityResultLauncher with contract " + bVar + " and input " + obj + ". You must ensure the ActivityResultLauncher is registered before calling launch().").toString());
                }
                int iIntValue = ((Number) obj2).intValue();
                arrayList.add(str);
                try {
                    iVar.b(iIntValue, bVar, obj, cVar);
                    return;
                } catch (Exception e3) {
                    arrayList.remove(str);
                    throw e3;
                }
            default:
                i iVar2 = this.f68428b;
                ArrayList arrayList2 = iVar2.f68434d;
                LinkedHashMap linkedHashMap2 = iVar2.f68432b;
                String str2 = this.f68429c;
                Object obj3 = linkedHashMap2.get(str2);
                k.b bVar2 = this.f68430d;
                if (obj3 == null) {
                    throw new IllegalStateException(("Attempting to launch an unregistered ActivityResultLauncher with contract " + bVar2 + " and input " + obj + ". You must ensure the ActivityResultLauncher is registered before calling launch().").toString());
                }
                int iIntValue2 = ((Number) obj3).intValue();
                arrayList2.add(str2);
                try {
                    iVar2.b(iIntValue2, bVar2, obj, cVar);
                    return;
                } catch (Exception e11) {
                    arrayList2.remove(str2);
                    throw e11;
                }
        }
    }

    @Override // j.c
    public final void b() {
        switch (this.f68427a) {
            case 0:
                this.f68428b.f(this.f68429c);
                break;
            default:
                this.f68428b.f(this.f68429c);
                break;
        }
    }
}
