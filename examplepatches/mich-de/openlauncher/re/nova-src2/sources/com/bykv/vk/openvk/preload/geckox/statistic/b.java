package com.bykv.vk.openvk.preload.geckox.statistic;

import android.content.Context;
import android.net.Uri;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Pair;
import com.bykv.vk.openvk.preload.a.d;
import com.bykv.vk.openvk.preload.geckox.c.b.b.f;
import com.bykv.vk.openvk.preload.geckox.c.e;
import com.bykv.vk.openvk.preload.geckox.c.g;
import com.bykv.vk.openvk.preload.geckox.c.h;
import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;
import com.bykv.vk.openvk.preload.geckox.statistic.model.StatisticModel;
import java.util.Map;

/* loaded from: classes2.dex */
public final class b {
    private static com.bykv.vk.openvk.preload.a.b.a a(final com.bykv.vk.openvk.preload.geckox.b bVar) {
        return new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.1
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.a(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onStart"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onEnd"), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    if ((dVar instanceof e) && (dVar.f() instanceof Map)) {
                        bVar.f().put(dVar.getClass().getSimpleName(), ((Map) dVar.f()).get("f36c832c8dbb162c49b46a7a6dd47fbd"));
                    }
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void c(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.c(bVar2, dVar);
                try {
                    c.a(bVar, a.a(dVar.b()));
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onException"), th2.toString());
                    c.a(bVar, a.a(dVar.b()));
                } catch (Throwable unused) {
                }
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.b(bVar2, dVar, th2);
                try {
                    bVar.f().put(dVar.getClass().getSimpleName().concat("onChainException"), th2.toString());
                    c.a(bVar, a.a(dVar.b()));
                } catch (Throwable unused) {
                }
            }
        };
    }

    private static com.bykv.vk.openvk.preload.a.b.a b(final Context context) {
        return new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.5
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar, d dVar) {
                super.a(bVar, dVar);
                Pair pair = (Pair) bVar.b(h.class);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) pair.second).getChannel());
                aVarA.f22134d = ((Uri) pair.first).toString();
                aVarA.n = com.bykv.vk.openvk.preload.geckox.utils.e.a(context);
                aVarA.f22136f = SystemClock.uptimeMillis();
                aVarA.o = Long.valueOf(((UpdatePackage) pair.second).getPatch().getId());
                aVarA.f22144p = Long.valueOf(((UpdatePackage) pair.second).getFullPackage().getId());
                aVarA.f22133c = ((UpdatePackage) pair.second).getChannel();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar, d dVar) {
                super.b(bVar, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar.b(h.class)).second).getChannel());
                aVarA.f22138h = true;
                aVarA.f22137g = SystemClock.uptimeMillis();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar, d dVar, Throwable th2) {
                super.a(bVar, dVar, th2);
                Pair pair = (Pair) bVar.b(h.class);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) pair.second).getChannel());
                String string = ((Uri) pair.first).toString();
                aVarA.f22138h = false;
                aVarA.f22137g = SystemClock.uptimeMillis();
                aVarA.f22135e.add(new StatisticModel.PackageStatisticModel.DownloadFailRecords(string, th2.getMessage()));
            }
        };
    }

    private static com.bykv.vk.openvk.preload.a.b.a a(final Context context) {
        return new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.4
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar, d dVar) {
                super.a(bVar, dVar);
                Pair pair = (Pair) bVar.b(g.class);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) pair.second).getChannel());
                aVarA.f22148t = ((Uri) pair.first).toString();
                aVarA.n = com.bykv.vk.openvk.preload.geckox.utils.e.a(context);
                aVarA.f22150v = SystemClock.uptimeMillis();
                aVarA.f22144p = Long.valueOf(((UpdatePackage) pair.second).getFullPackage().getId());
                aVarA.f22133c = ((UpdatePackage) pair.second).getChannel();
                if (!TextUtils.isEmpty(((UpdatePackage) pair.second).getAccessKey())) {
                    aVarA.f22131a = ((UpdatePackage) pair.second).getAccessKey();
                }
                if (TextUtils.isEmpty(((UpdatePackage) pair.second).getGroupName())) {
                    return;
                }
                aVarA.f22132b = ((UpdatePackage) pair.second).getGroupName();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar, d dVar) {
                super.b(bVar, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar.b(g.class)).second).getChannel());
                aVarA.f22154z = true;
                aVarA.f22151w = SystemClock.uptimeMillis();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar, d dVar, Throwable th2) {
                super.a(bVar, dVar, th2);
                Pair pair = (Pair) bVar.b(g.class);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) pair.second).getChannel());
                String string = ((Uri) pair.first).toString();
                aVarA.f22154z = false;
                aVarA.f22151w = SystemClock.uptimeMillis();
                aVarA.f22149u.add(new StatisticModel.PackageStatisticModel.DownloadFailRecords(string, th2.getMessage()));
            }
        };
    }

    public static void a(com.bykv.vk.openvk.preload.geckox.a aVar, com.bykv.vk.openvk.preload.geckox.b bVar) {
        aVar.a(e.class, a(bVar));
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.d.class, a(bVar));
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.a.b.c.class, b(bVar.a()));
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.a.b.b.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.6
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22139i = false;
                SystemClock.uptimeMillis();
                aVarA.f22145q = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel()).f22139i = true;
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.a.b.d.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.7
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22140j = false;
                SystemClock.uptimeMillis();
                aVarA.f22146r = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel()).f22140j = true;
                SystemClock.uptimeMillis();
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.a.b.a.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.8
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22140j = false;
                aVarA.f22142l = SystemClock.uptimeMillis();
                aVarA.f22146r = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22140j = true;
                aVarA.f22142l = SystemClock.uptimeMillis();
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.a.b.e.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.11
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22141k = false;
                aVarA.f22147s = th2.getMessage();
                aVarA.f22143m = SystemClock.uptimeMillis();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22141k = true;
                aVarA.f22143m = SystemClock.uptimeMillis();
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.a.a.b.class, a(bVar.a()));
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.a.a.a.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.9
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(g.class)).second).getChannel());
                aVarA.A = false;
                aVarA.f22152x = SystemClock.uptimeMillis();
                aVarA.C = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(g.class)).second).getChannel());
                aVarA.A = true;
                aVarA.f22152x = SystemClock.uptimeMillis();
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.a.a.c.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.10
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(g.class)).second).getChannel());
                aVarA.B = false;
                aVarA.f22153y = SystemClock.uptimeMillis();
                aVarA.D = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(g.class)).second).getChannel());
                aVarA.B = true;
                aVarA.f22153y = SystemClock.uptimeMillis();
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.b.b.c.class, b(bVar.a()));
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.b.b.b.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.6
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22139i = false;
                SystemClock.uptimeMillis();
                aVarA.f22145q = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel()).f22139i = true;
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.b.b.d.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.7
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22140j = false;
                SystemClock.uptimeMillis();
                aVarA.f22146r = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel()).f22140j = true;
                SystemClock.uptimeMillis();
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.b.b.a.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.8
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22140j = false;
                aVarA.f22142l = SystemClock.uptimeMillis();
                aVarA.f22146r = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22140j = true;
                aVarA.f22142l = SystemClock.uptimeMillis();
            }
        });
        aVar.a(f.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.3
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22141k = false;
                aVarA.f22143m = SystemClock.uptimeMillis();
                aVarA.f22147s = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void c(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.c(bVar2, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22141k = true;
                aVarA.f22143m = SystemClock.uptimeMillis();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.b(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(h.class)).second).getChannel());
                aVarA.f22141k = false;
                aVarA.f22143m = SystemClock.uptimeMillis();
                aVarA.D = th2.getMessage();
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.b.a.b.class, a(bVar.a()));
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.b.a.a.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.9
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(g.class)).second).getChannel());
                aVarA.A = false;
                aVarA.f22152x = SystemClock.uptimeMillis();
                aVarA.C = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.b(bVar2, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(g.class)).second).getChannel());
                aVarA.A = true;
                aVarA.f22152x = SystemClock.uptimeMillis();
            }
        });
        aVar.a(com.bykv.vk.openvk.preload.geckox.c.b.a.d.class, new com.bykv.vk.openvk.preload.a.b.a() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.b.2
            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void a(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.a(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(g.class)).second).getChannel());
                aVarA.B = false;
                aVarA.f22153y = SystemClock.uptimeMillis();
                aVarA.D = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void b(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar, Throwable th2) {
                super.b(bVar2, dVar, th2);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(g.class)).second).getChannel());
                aVarA.B = false;
                aVarA.f22153y = SystemClock.uptimeMillis();
                aVarA.D = th2.getMessage();
            }

            @Override // com.bykv.vk.openvk.preload.a.b.a
            public final <T> void c(com.bykv.vk.openvk.preload.a.b<T> bVar2, d dVar) {
                super.c(bVar2, dVar);
                com.bykv.vk.openvk.preload.geckox.statistic.model.a aVarA = a.a(dVar.b()).a(((UpdatePackage) ((Pair) bVar2.b(g.class)).second).getChannel());
                aVarA.B = true;
                aVarA.f22153y = SystemClock.uptimeMillis();
            }
        });
    }
}
