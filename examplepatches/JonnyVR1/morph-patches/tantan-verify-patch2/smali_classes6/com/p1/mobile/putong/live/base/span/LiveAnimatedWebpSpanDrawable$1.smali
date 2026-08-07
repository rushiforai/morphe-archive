.class Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/DefaultLifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->k(Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable$1;->this$0:Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onResume(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable$1;->this$0:Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onStop(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable$1;->this$0:Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->c(Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;)Ll/wp0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/wp0;->stop()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
