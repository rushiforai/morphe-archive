.class public final Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ExtensionSupplier;
.super Ljava/lang/Object;
.source "RingConnSyncPatch.kt"

# interfaces
.implements Ljava/util/function/Supplier;

# instance fields
.field private final classLoader:Ljava/lang/ClassLoader;
.field private final extension:Ljava/lang/String;

# direct methods
.method public constructor <init>(Ljava/lang/ClassLoader;Ljava/lang/String;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ExtensionSupplier;->classLoader:Ljava/lang/ClassLoader;
    iput-object p2, p0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ExtensionSupplier;->extension:Ljava/lang/String;
    return-void
.end method

# virtual methods
.method public final get()Ljava/io/InputStream;
    .locals 3

    iget-object v0, p0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ExtensionSupplier;->classLoader:Ljava/lang/ClassLoader;
    iget-object v1, p0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ExtensionSupplier;->extension:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    move-result-object v0

    if-eqz v0, :cond_0
    return-object v0

    :cond_0
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "Extension \""
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-object v2, p0, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ExtensionSupplier;->extension:Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "\" not found"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-direct {v0, v1}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V
    throw v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1
    invoke-virtual {p0}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ExtensionSupplier;->get()Ljava/io/InputStream;
    move-result-object v0
    return-object v0
.end method
