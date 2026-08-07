.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b;
.super Landroid/os/CountDownTimer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->d(JLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;JJLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;

    .line 2
    .line 3
    iput-object p6, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 0

    return-void
.end method

.method public onTick(J)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 p2, 0x1

    .line 18
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b$a;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
