.class public final Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;
.super Ljava/lang/Object;
.source "RingConnSyncPatch.kt"

# static fields
.field private static final providerManifestPatch:Lapp/morphe/patcher/patch/ResourcePatch;
.field private static final providerPatch:Lapp/morphe/patcher/patch/BytecodePatch;
.field private static final dashboardManifestPatch:Lapp/morphe/patcher/patch/ResourcePatch;
.field private static final dashboardPatch:Lapp/morphe/patcher/patch/BytecodePatch;

# direct methods
.method static constructor <clinit>()V
    .locals 6

    # 1. Erzeuge providerManifestPatch (ResourcePatch)
    new-instance v3, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ProviderManifestBuilder;
    invoke-direct {v3}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ProviderManifestBuilder;-><init>()V
    const/4 v0, 0x0
    const/4 v1, 0x0
    const/4 v2, 0x1
    const/4 v4, 0x3
    const/4 v5, 0x0
    invoke-static/range {v0 .. v5}, Lapp/morphe/patcher/patch/PatchKt;->resourcePatch$default(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lapp/morphe/patcher/patch/ResourcePatch;
    move-result-object v0
    sput-object v0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->providerManifestPatch:Lapp/morphe/patcher/patch/ResourcePatch;

    # 2. Erzeuge providerPatch (BytecodePatch: RingConn Health Data Provider)
    new-instance v3, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ProviderBytecodeBuilder;
    invoke-direct {v3}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ProviderBytecodeBuilder;-><init>()V
    const-string v0, "RingConn Health Data Provider (v1.2.4)"
    const-string v1, "v1.2.4: Aktiviert lokalen SQLite-Zugriff fuer CyclingCoach und Companion-Apps."
    const/4 v2, 0x1
    const/4 v4, 0x0
    const/4 v5, 0x0
    invoke-static/range {v0 .. v5}, Lapp/morphe/patcher/patch/PatchKt;->bytecodePatch$default(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lapp/morphe/patcher/patch/BytecodePatch;
    move-result-object v0
    sput-object v0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->providerPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    # 3. Erzeuge dashboardManifestPatch (ResourcePatch)
    new-instance v3, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardManifestBuilder;
    invoke-direct {v3}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardManifestBuilder;-><init>()V
    const/4 v0, 0x0
    const/4 v1, 0x0
    const/4 v2, 0x1
    const/4 v4, 0x3
    const/4 v5, 0x0
    invoke-static/range {v0 .. v5}, Lapp/morphe/patcher/patch/PatchKt;->resourcePatch$default(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lapp/morphe/patcher/patch/ResourcePatch;
    move-result-object v0
    sput-object v0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->dashboardManifestPatch:Lapp/morphe/patcher/patch/ResourcePatch;

    # 4. Erzeuge dashboardPatch (BytecodePatch: Intervals.icu Quick-Sync Kachel)
    new-instance v3, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardBytecodeBuilder;
    invoke-direct {v3}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardBytecodeBuilder;-><init>()V
    const-string v0, "Intervals.icu Quick-Sync Kachel (v1.2.4)"
    const-string v1, "v1.2.4: Ultra-schlanke RingConn-Kachel im Discover-Tab fuer 1-Klick-Sync zu Intervals.icu (ohne Radsport-Metriken)."
    const/4 v2, 0x1
    const/4 v4, 0x0
    const/4 v5, 0x0
    invoke-static/range {v0 .. v5}, Lapp/morphe/patcher/patch/PatchKt;->bytecodePatch$default(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lapp/morphe/patcher/patch/BytecodePatch;
    move-result-object v0
    sput-object v0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->dashboardPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    return-void
.end method

.method public static final getProviderManifestPatch()Lapp/morphe/patcher/patch/ResourcePatch;
    .locals 1
    sget-object v0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->providerManifestPatch:Lapp/morphe/patcher/patch/ResourcePatch;
    return-object v0
.end method

.method public static final getProviderPatch()Lapp/morphe/patcher/patch/BytecodePatch;
    .locals 1
    sget-object v0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->providerPatch:Lapp/morphe/patcher/patch/BytecodePatch;
    return-object v0
.end method

.method public static final getDashboardManifestPatch()Lapp/morphe/patcher/patch/ResourcePatch;
    .locals 1
    sget-object v0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->dashboardManifestPatch:Lapp/morphe/patcher/patch/ResourcePatch;
    return-object v0
.end method

.method public static final getDashboardPatch()Lapp/morphe/patcher/patch/BytecodePatch;
    .locals 1
    sget-object v0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->dashboardPatch:Lapp/morphe/patcher/patch/BytecodePatch;
    return-object v0
.end method
