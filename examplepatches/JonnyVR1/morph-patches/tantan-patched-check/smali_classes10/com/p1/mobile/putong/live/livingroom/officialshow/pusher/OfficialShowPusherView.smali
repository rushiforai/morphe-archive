.class public Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/d4m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/qf50;",
        ">;",
        "Ll/d4m;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VImage;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VText;

.field public h:Landroid/widget/ImageView;

.field public i:Landroid/view/ViewStub;

.field public j:Landroid/view/ViewStub;

.field public k:Landroid/widget/LinearLayout;

.field public l:Ll/qf50;

.field public m:Landroid/widget/PopupWindow;

.field public n:I

.field public o:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x42480000    # 50.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    neg-int p1, p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->n:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x42480000    # 50.0f

    .line 15
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    neg-int p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->n:I

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

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x42480000    # 50.0f

    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    neg-int p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->n:I

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->f(ILandroid/view/View;)V

    return-void
.end method

.method private synthetic f(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->l:Ll/qf50;

    .line 2
    .line 3
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;->ClickError:Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ll/qf50;->q1(Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public a(Ljava/lang/String;I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->i(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->k:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->j:Landroid/view/ViewStub;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroid/widget/LinearLayout;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->k:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->k:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    sget v1, Ll/mdc0;->q1:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/rf50;

    .line 31
    .line 32
    invoke-direct {v1, p0, p2}, Ll/rf50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->k:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    sget v1, Ll/mdc0;->t1:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/TextView;

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->k:Landroid/widget/LinearLayout;

    .line 52
    .line 53
    sget v0, Ll/mdc0;->F3:I

    .line 54
    .line 55
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p1, v0, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->k:Landroid/widget/LinearLayout;

    .line 63
    .line 64
    const/4 p1, 0x1

    .line 65
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->k:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sf50;->a(Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->i(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e(Ll/qf50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->l:Ll/qf50;

    .line 2
    .line 3
    return-void
.end method

.method public getErrorCode()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->k:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    sget v1, Ll/mdc0;->F3:I

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v1, p0, Ljava/lang/Integer;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast p0, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_1
    return v0
.end method

.method public i(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->j(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->m:Landroid/widget/PopupWindow;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_2

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->m:Landroid/widget/PopupWindow;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->C0()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Ll/yec0;->yb:I

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Ll/abc0;->r6:I

    .line 37
    .line 38
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ll/vwt;->W3()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Ll/lu6;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const v3, 0x102000b

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Landroid/widget/TextView;

    .line 65
    .line 66
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    new-instance v1, Landroid/widget/PopupWindow;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->C0()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-direct {v1, v3}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    .line 76
    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->m:Landroid/widget/PopupWindow;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->m:Landroid/widget/PopupWindow;

    .line 84
    .line 85
    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->m:Landroid/widget/PopupWindow;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->m:Landroid/widget/PopupWindow;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    :cond_2
    return-void

    .line 102
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->m:Landroid/widget/PopupWindow;

    .line 103
    .line 104
    const/16 v1, 0x11

    .line 105
    .line 106
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->n:I

    .line 107
    .line 108
    invoke-virtual {v0, p0, v1, p1, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qf50;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->e(Ll/qf50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j(Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->o:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->o:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->i:Landroid/view/ViewStub;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->o:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->o:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->o:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->g()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->h()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->i:Landroid/view/ViewStub;

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/base/pusher/a;->Companion:Lcom/p1/mobile/putong/live/livingroom/base/pusher/a$a;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->h:Landroid/widget/ImageView;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/base/pusher/a$a;->a(Landroid/widget/ImageView;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setWaterMarkUserId(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->g:Lv/VText;

    .line 2
    .line 3
    const-string v0, "%s"

    .line 4
    .line 5
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setWaterMarkVisible(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->f:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
