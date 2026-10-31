package com.bykv.vk.openvk.preload.geckox.g;

import android.util.Pair;
import com.bykv.vk.openvk.preload.a.b;
import com.bykv.vk.openvk.preload.a.d;
import com.bykv.vk.openvk.preload.a.h;
import com.bykv.vk.openvk.preload.a.l;
import com.bykv.vk.openvk.preload.geckox.c.c;
import com.bykv.vk.openvk.preload.geckox.c.e;
import com.bykv.vk.openvk.preload.geckox.c.f;
import com.bykv.vk.openvk.preload.geckox.c.g;
import com.bykv.vk.openvk.preload.geckox.c.i;
import com.bykv.vk.openvk.preload.geckox.model.CheckRequestBodyModel;
import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public final class a {
    public static b<Object> a(final com.bykv.vk.openvk.preload.geckox.d.a aVar, File file, final com.bykv.vk.openvk.preload.geckox.b bVar, com.bykv.vk.openvk.preload.falconx.a.a aVar2, Map<String, Map<String, Object>> map, Map<String, List<CheckRequestBodyModel.TargetChannel>> map2, String str) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(h.a.a().a(e.class).a(file, bVar.d()).a(aVar2.a(e.class)).b());
        arrayList.add(h.a.a().a(c.class).a(bVar, map, map2, aVar, str).a(new com.bykv.vk.openvk.preload.a.b.b(new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.g.a.6
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar) {
                super.a(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onStart"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                List<UpdatePackage> list = (List) bVar2.b(c.class);
                bVar2.a(c.class);
                HashMap map3 = new HashMap();
                for (UpdatePackage updatePackage : list) {
                    String accessKey = updatePackage.getAccessKey();
                    List arrayList2 = (List) map3.get(accessKey);
                    if (arrayList2 == null) {
                        arrayList2 = new ArrayList();
                    }
                    arrayList2.add(updatePackage);
                    map3.put(accessKey, arrayList2);
                }
                try {
                    bVar.f().put(dVar.getClass().getSimpleName() + "onEnd", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                bVar2.a(c.class);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar, Throwable th2) {
                super.b(bVar2, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onChainException"), th2.toString());
                } catch (Throwable unused) {
                }
            }
        }, aVar2.a(c.class))).b());
        arrayList.add(h.a.a().a(f.class).a(com.bykv.vk.openvk.preload.geckox.b.g()).a(new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.g.a.1
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                if (aVar != null) {
                    ((UpdatePackage) bVar2.b(f.class)).getChannel();
                }
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar, Throwable th2) {
                super.b(bVar2, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onChainException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void c(b<T> bVar2, d dVar) {
                super.c(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onPipelineEnd"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onEnd"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar) {
                super.a(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onStart"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }
        }).b());
        l.b bVar2 = new l.b();
        l.a aVarA = bVar2.a("branch_zip");
        l.b bVar3 = new l.b();
        l.a aVarA2 = bVar3.a("patch");
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.h.class).b());
        arrayList2.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.b.c.class).a(bVar, file).a(new com.bykv.vk.openvk.preload.a.b.b(b(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.b.c.class))).b());
        arrayList2.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.b.b.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.b.b.class))).b());
        arrayList2.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.b.d.class).a(bVar).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.b.d.class))).b());
        arrayList2.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.b.a.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.b.a.class))).b());
        arrayList2.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.b.f.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.b.f.class))).b());
        arrayList2.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.b.e.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar))).b());
        aVarA2.a(arrayList2);
        l.a aVarA3 = bVar3.a("full");
        ArrayList arrayList3 = new ArrayList();
        arrayList3.add(h.a.a().a(g.class).b());
        arrayList3.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.a.b.class).a(bVar, file).a(new com.bykv.vk.openvk.preload.a.b.b(b(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.a.b.class))).b());
        arrayList3.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.a.a.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.a.a.class))).b());
        arrayList3.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.a.d.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.a.d.class))).b());
        arrayList3.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.b.a.c.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar))).b());
        aVarA3.a(arrayList3);
        aVarA.a(bVar3.a(com.bykv.vk.openvk.preload.geckox.c.b.class)).a(h.a.a().a(com.bykv.vk.openvk.preload.a.f.class).a(a(bVar)).b());
        l.a aVarA4 = bVar2.a("branch_single_file");
        l.b bVar4 = new l.b();
        l.a aVarA5 = bVar4.a("patch");
        ArrayList arrayList4 = new ArrayList();
        arrayList4.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.h.class).b());
        arrayList4.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.a.b.c.class).a(bVar, file).a(new com.bykv.vk.openvk.preload.a.b.b(b(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.a.b.c.class))).b());
        arrayList4.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.a.b.b.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.a.b.b.class))).b());
        arrayList4.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.a.b.d.class).a(bVar).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.a.b.d.class))).b());
        arrayList4.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.a.b.a.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.a.b.a.class))).b());
        arrayList4.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.a.b.e.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.a.b.e.class))).b());
        aVarA5.a(arrayList4);
        l.a aVarA6 = bVar4.a("full");
        ArrayList arrayList5 = new ArrayList();
        arrayList5.add(h.a.a().a(g.class).b());
        arrayList5.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.a.a.b.class).a(bVar, file).a(new com.bykv.vk.openvk.preload.a.b.b(b(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.a.a.b.class))).b());
        arrayList5.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.a.a.a.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar, bVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.a.a.a.class))).b());
        arrayList5.add(h.a.a().a(com.bykv.vk.openvk.preload.geckox.c.a.a.c.class).a(new com.bykv.vk.openvk.preload.a.b.b(a(aVar), aVar2.a(com.bykv.vk.openvk.preload.geckox.c.a.a.c.class))).b());
        aVarA6.a(arrayList5);
        aVarA4.a(bVar4.a(com.bykv.vk.openvk.preload.geckox.c.b.class)).a(h.a.a().a(com.bykv.vk.openvk.preload.a.f.class).a(a(bVar)).b());
        l.a aVarA7 = bVar2.a("branch_myarchive_file");
        l.b bVar5 = new l.b();
        l.a aVarA8 = bVar5.a("patch");
        List<h> list = Collections.EMPTY_LIST;
        aVarA8.a(list);
        bVar5.a("full").a(list);
        aVarA7.a(bVar5.a(com.bykv.vk.openvk.preload.geckox.c.b.class)).a(h.a.a().a(com.bykv.vk.openvk.preload.a.f.class).a(a(bVar)).b());
        arrayList.add(bVar2.a(com.bykv.vk.openvk.preload.geckox.c.a.class));
        arrayList.add(h.a.a().a(i.class).a(new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.g.a.2
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar6, d dVar, Throwable th2) {
                super.a(bVar6, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar6, d dVar, Throwable th2) {
                super.b(bVar6, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onChainException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void c(b<T> bVar6, d dVar) {
                super.c(bVar6, dVar);
                Pair pair = (Pair) bVar6.a(i.class);
                if (aVar != null) {
                    Object obj = pair.first;
                    ((Long) pair.second).getClass();
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar6, d dVar) {
                super.a(bVar6, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onStart"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar6, d dVar) {
                super.b(bVar6, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onEnd"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }
        }).b());
        return com.bykv.vk.openvk.preload.a.c.a(arrayList, null);
    }

    private static com.bykv.vk.openvk.preload.a.b.a b(final com.bykv.vk.openvk.preload.geckox.d.a aVar, final com.bykv.vk.openvk.preload.geckox.b bVar) {
        return new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.g.a.5
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar) {
                super.a(bVar2, dVar);
                if (aVar != null) {
                    bVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.class);
                }
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onStart"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                if (aVar != null) {
                    bVar2.b(com.bykv.vk.openvk.preload.geckox.c.b.class);
                }
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onEnd"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                if (aVar != null) {
                    bVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.class);
                }
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar, Throwable th2) {
                super.b(bVar2, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onChainException"), th2.toString());
                } catch (Throwable unused) {
                }
            }
        };
    }

    private static com.bykv.vk.openvk.preload.a.b.a a(com.bykv.vk.openvk.preload.geckox.d.a aVar) {
        if (aVar == null) {
            return null;
        }
        return new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.g.a.3
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar, d dVar, Throwable th2) {
                super.a(bVar, dVar, th2);
                bVar.a(com.bykv.vk.openvk.preload.geckox.c.b.class);
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar, d dVar) {
                super.b(bVar, dVar);
                bVar.b(com.bykv.vk.openvk.preload.geckox.c.b.class);
            }
        };
    }

    private static com.bykv.vk.openvk.preload.a.b.a a(final com.bykv.vk.openvk.preload.geckox.d.a aVar, final com.bykv.vk.openvk.preload.geckox.b bVar) {
        return new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.g.a.4
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                if (aVar != null) {
                    bVar2.a(com.bykv.vk.openvk.preload.geckox.c.b.class);
                }
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onEnd"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar, Throwable th2) {
                super.b(bVar2, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onChainException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar) {
                super.a(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onStart"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }
        };
    }

    private static com.bykv.vk.openvk.preload.a.b.a a(final com.bykv.vk.openvk.preload.geckox.b bVar) {
        return new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.g.a.7
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar, Throwable th2) {
                super.b(bVar2, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onChainException"), th2.toString());
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(b<T> bVar2, d dVar) {
                super.a(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onStart"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onEnd"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }
        };
    }
}
