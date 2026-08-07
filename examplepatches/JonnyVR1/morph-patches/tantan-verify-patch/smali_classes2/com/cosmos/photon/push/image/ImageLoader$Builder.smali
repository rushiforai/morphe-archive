.class public final Lcom/cosmos/photon/push/image/ImageLoader$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/image/ImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private diskCacheDirectory:Ljava/io/File;

.field private maxDiskSize:J

.field private maxMemSize:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000(Lcom/cosmos/photon/push/image/ImageLoader$Builder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->maxMemSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$100(Lcom/cosmos/photon/push/image/ImageLoader$Builder;)Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->diskCacheDirectory:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/cosmos/photon/push/image/ImageLoader$Builder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->maxDiskSize:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public build()Lcom/cosmos/photon/push/image/ImageLoader;
    .locals 2

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/image/ImageLoader;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/cosmos/photon/push/image/ImageLoader;-><init>(Lcom/cosmos/photon/push/image/ImageLoader$Builder;Lcom/cosmos/photon/push/image/ImageLoader$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public diskCacheDirectory(Ljava/io/File;)Lcom/cosmos/photon/push/image/ImageLoader$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->diskCacheDirectory:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public maxDiskSize(J)Lcom/cosmos/photon/push/image/ImageLoader$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->maxDiskSize:J

    .line 2
    .line 3
    return-object p0
.end method

.method public maxMemSize(J)Lcom/cosmos/photon/push/image/ImageLoader$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->maxMemSize:J

    .line 2
    .line 3
    return-object p0
.end method
