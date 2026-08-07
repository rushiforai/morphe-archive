.class Lcom/tencent/iliveroom/a/a$25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setEffectsVolume(D)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:D

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;D)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$25;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/iliveroom/a/a$25;->a:D

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$25;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a$25;->a:D

    .line 4
    .line 5
    const-wide/high16 v3, 0x4059000000000000L    # 100.0

    .line 6
    .line 7
    mul-double/2addr v1, v3

    .line 8
    double-to-int v1, v1

    .line 9
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->n(Lcom/tencent/iliveroom/a/a;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$25;->b:Lcom/tencent/iliveroom/a/a;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->l(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;

    .line 37
    .line 38
    iget-wide v5, p0, Lcom/tencent/iliveroom/a/a$25;->a:D

    .line 39
    .line 40
    mul-double/2addr v5, v3

    .line 41
    double-to-int v2, v5

    .line 42
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;->volume:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-void
.end method
