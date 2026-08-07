.class Lcom/tencent/iliveroom/a/a$43;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->onCapturedRawAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$43;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$43;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->l(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a$43;->a:Lcom/tencent/iliveroom/a/a;

    .line 28
    .line 29
    invoke-static {v2, v1}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$43;->a:Lcom/tencent/iliveroom/a/a;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->l(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 40
    .line 41
    .line 42
    return-void
.end method
