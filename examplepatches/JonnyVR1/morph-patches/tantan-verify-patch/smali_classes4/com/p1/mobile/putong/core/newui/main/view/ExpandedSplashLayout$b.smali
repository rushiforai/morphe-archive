.class public Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$b;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$b;->a:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$b;->a:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 5
    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$b;->a:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->e(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$b;->a:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->f(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onStep(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/tantan/library/svga/AnimListener;->onStep(I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    if-le p1, v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$b;->a:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->d(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)Lv/VImage;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$b;->a:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->c(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)Lv/VImage;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/high16 v0, 0x3f800000    # 1.0f

    .line 24
    .line 25
    const/16 v1, 0x28

    .line 26
    .line 27
    if-ge p1, v1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    sub-int/2addr p1, v1

    .line 31
    int-to-float p1, p1

    .line 32
    const/high16 v1, 0x41a00000    # 20.0f

    .line 33
    .line 34
    div-float/2addr p1, v1

    .line 35
    sub-float/2addr v0, p1

    .line 36
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
