.class public Ll/r9y;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(I)Ll/czl;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p0, v0, :cond_3

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p0, v0, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x5

    .line 12
    if-eq p0, v0, :cond_0

    .line 13
    .line 14
    move-object v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v0, Ll/hq30;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/hq30;-><init>()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    new-instance v0, Ll/bay;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/bay;-><init>()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    new-instance v0, Ll/bby;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/bby;-><init>()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_3
    new-instance v0, Ll/y9y;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/y9y;-><init>()V

    .line 37
    .line 38
    .line 39
    :goto_0
    if-eqz v0, :cond_4

    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_4
    const-string v0, "viewType: "

    .line 43
    .line 44
    const-string v2, " not support"

    .line 45
    .line 46
    invoke-static {v0, p0, v2}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-object v1
.end method

.method public static b(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/pec0;->h0:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;

    .line 17
    .line 18
    invoke-static {p1}, Ll/r9y;->a(I)Ll/czl;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->setMainContentItemView(Ll/czl;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->s:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->s:Landroid/widget/FrameLayout;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->s:Landroid/widget/FrameLayout;

    .line 44
    .line 45
    invoke-interface {p1, p0, v2}, Ll/czl;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-object v0
.end method
