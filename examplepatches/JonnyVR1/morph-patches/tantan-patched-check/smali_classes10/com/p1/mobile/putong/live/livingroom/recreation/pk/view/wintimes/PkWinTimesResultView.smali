.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;

.field public c:Lv/VImage;

.field public d:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oc80;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->e()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    cmp-long p1, p1, v0

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->d:Lv/VImage;

    .line 11
    .line 12
    sget p2, Ll/obc0;->X4:I

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->d:Lv/VImage;

    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->a:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public c(J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->e()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    cmp-long p1, p1, v0

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->d:Lv/VImage;

    .line 11
    .line 12
    sget p2, Ll/obc0;->M5:I

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->d:Lv/VImage;

    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->a:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public d(J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->e()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x2

    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    if-ltz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->c(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;

    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesNumView;->setNumber(J)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->c:Lv/VImage;

    .line 22
    .line 23
    sget p2, Ll/obc0;->H5:I

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->a:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    const/4 p2, 0x1

    .line 31
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->d:Lv/VImage;

    .line 35
    .line 36
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->d:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->a:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
