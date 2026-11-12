.class public final Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[B

.field public final b:[B

.field public final c:Ljava/lang/String;

.field public final d:I


# direct methods
.method public constructor <init>([B[BLjava/lang/String;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->a:[B

    iput-object p2, p0, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->b:[B

    iput-object p3, p0, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->c:Ljava/lang/String;

    iput p4, p0, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->d:I

    return-void
.end method

.method public static create([B[BLjava/lang/String;I)Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;
    .registers 5

    new-instance v0, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;-><init>([B[BLjava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public final emeId()[B
    .registers 1

    iget-object p0, p0, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->a:[B

    return-object p0
.end method

.method public final keySetId()[B
    .registers 1

    iget-object p0, p0, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->b:[B

    return-object p0
.end method

.method public final keyType()I
    .registers 1

    iget p0, p0, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->d:I

    return p0
.end method

.method public final mimeType()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->c:Ljava/lang/String;

    return-object p0
.end method
