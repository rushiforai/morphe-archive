.class final Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardBytecodeBuilder;
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
.method public final invoke(Lapp/morphe/patcher/patch/BytecodePatchBuilder;)Lkotlin/Unit;
    .locals 12

    # 1. Compatibility
    new-instance v1, Lapp/morphe/patcher/patch/Compatibility;
    const-string v2, "com.gdjztech.ringconn"
    const-string v3, "RingConn"
    const/4 v4, 0x0
    const/4 v5, 0x0
    const/4 v6, 0x0
    const/4 v7, 0x0
    const/4 v8, 0x0
    const/16 v9, 0x7c
    const/4 v10, 0x0
    invoke-direct/range {v1 .. v10}, Lapp/morphe/patcher/patch/Compatibility;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lapp/morphe/patcher/patch/ApkFileType;Ljava/lang/Integer;Ljava/util/Set;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    const/4 v0, 0x1
    new-array v2, v0, [Lapp/morphe/patcher/patch/Compatibility;
    const/4 v3, 0x0
    aput-object v1, v2, v3
    invoke-virtual {p1, v2}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->compatibleWith([Lapp/morphe/patcher/patch/Compatibility;)V

    # 2. Dependency: DashboardManifestPatch & ProviderPatch
    const/4 v0, 0x2
    new-array v1, v0, [Lapp/morphe/patcher/patch/Patch;
    invoke-static {}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->getDashboardManifestPatch()Lapp/morphe/patcher/patch/ResourcePatch;
    move-result-object v2
    aput-object v2, v1, v3
    invoke-static {}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt;->getProviderPatch()Lapp/morphe/patcher/patch/BytecodePatch;
    move-result-object v2
    const/4 v4, 0x1
    aput-object v2, v1, v4
    invoke-virtual {p1, v1}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->dependsOn([Lapp/morphe/patcher/patch/Patch;)V

    # 3. Extension: extensions/HealthDataProvider.dex
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;
    move-result-object v1

    new-instance v2, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ExtensionSupplier;
    const-string v3, "extensions/HealthDataProvider.dex"
    invoke-direct {v2, v1, v3}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ExtensionSupplier;-><init>(Ljava/lang/ClassLoader;Ljava/lang/String;)V
    check-cast v2, Ljava/util/function/Supplier;
    invoke-virtual {p1, v2}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->setExtensionInputStream(Ljava/util/function/Supplier;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    check-cast p1, Lapp/morphe/patcher/patch/BytecodePatchBuilder;
    invoke-virtual {p0, p1}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$DashboardBytecodeBuilder;->invoke(Lapp/morphe/patcher/patch/BytecodePatchBuilder;)Lkotlin/Unit;
    move-result-object p1
    return-object p1
.end method
