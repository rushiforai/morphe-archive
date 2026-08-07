.class public final Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;",
        "Ljava/lang/Runnable;",
        "<init>",
        "(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;)V",
        "",
        "run",
        "()V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->c(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->d(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-long v1, v1

    .line 27
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
