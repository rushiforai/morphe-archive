.class Lcom/tencent/iliveroom/a/a$26;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setVolumeOfEffect(ID)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:D

.field final synthetic c:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;ID)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$26;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$26;->a:I

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/tencent/iliveroom/a/a$26;->b:D

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$26;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/iliveroom/a/a$26;->a:I

    .line 4
    .line 5
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/a$26;->b:D

    .line 6
    .line 7
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 8
    .line 9
    mul-double/2addr v2, v4

    .line 10
    double-to-int v2, v2

    .line 11
    invoke-static {v0, v1, v2}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;II)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$26;->c:Lcom/tencent/iliveroom/a/a;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->l(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget v1, p0, Lcom/tencent/iliveroom/a/a$26;->a:I

    .line 21
    .line 22
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a$26;->b:D

    .line 35
    .line 36
    mul-double/2addr v1, v4

    .line 37
    double-to-int p0, v1

    .line 38
    iput p0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;->volume:I

    .line 39
    .line 40
    :cond_0
    return-void
.end method
