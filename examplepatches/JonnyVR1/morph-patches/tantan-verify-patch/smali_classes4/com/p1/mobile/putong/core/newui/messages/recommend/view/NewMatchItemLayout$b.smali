.class public Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$b;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->q(Lcom/tantan/library/svga/SVGAnimationView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/SVGAnimationView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$b;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$b;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
