.class final Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardManifestBuilder;
.super Ljava/lang/Object;
.source "RingConnSyncPatch.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;

# direct methods
.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# virtual methods
.method public final invoke(Lapp/morphe/patcher/patch/ResourcePatchBuilder;)Lkotlin/Unit;
    .locals 1

    new-instance v0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardManifestExecute;
    invoke-direct {v0}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardManifestExecute;-><init>()V
    invoke-virtual {p1, v0}, Lapp/morphe/patcher/patch/ResourcePatchBuilder;->execute(Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    check-cast p1, Lapp/morphe/patcher/patch/ResourcePatchBuilder;
    invoke-virtual {p0, p1}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardManifestBuilder;->invoke(Lapp/morphe/patcher/patch/ResourcePatchBuilder;)Lkotlin/Unit;
    move-result-object p1
    return-object p1
.end method
