.class public Lcom/tencent/youtu/sdkkitframework/liveness/p;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:I

.field public final e:I

.field public f:Ljava/lang/String;

.field public g:Lorg/json/JSONArray;

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->f:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->c:I

    .line 9
    .line 10
    iput p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->d:I

    .line 11
    .line 12
    iput p4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->e:I

    .line 13
    .line 14
    new-instance p1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 15
    .line 16
    invoke-direct {p1}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 20
    .line 21
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->getMediaCodecInfo()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    :goto_0
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->j:Z

    .line 31
    .line 32
    return-void
.end method
