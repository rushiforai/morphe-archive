.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public e:Lv/VText;

.field public f:Lv/VDraweeView;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VDraweeView;

.field public k:Lv/VDraweeView;

.field public l:Lv/VText;

.field public m:Ll/x3t;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jm10;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->g:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/16 v1, 0x8

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->e:Lv/VText;

    .line 23
    .line 24
    invoke-static {v0, v1, p0, p1}, Ll/okc0;->c(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VText;I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final k0(D)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->l:Lv/VText;

    .line 2
    .line 3
    sget v1, Ll/n9c0;->l1:I

    .line 4
    .line 5
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    cmpg-double v0, p1, v0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->l:Lv/VText;

    .line 17
    .line 18
    if-gtz v0, :cond_0

    .line 19
    .line 20
    const-string p1, "\u672a\u52a9\u529b"

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public l0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;Ll/cm0;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;",
            "Ll/cm0;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->e:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->rank:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->j0(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->f:Lv/VDraweeView;

    .line 18
    .line 19
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->userImage:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "context_single_room"

    .line 22
    .line 23
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->h:Lv/VText;

    .line 27
    .line 28
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->userName:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->m0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;Ll/cm0;)V

    .line 34
    .line 35
    .line 36
    iget p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->amount:I

    .line 37
    .line 38
    int-to-double v0, p3

    .line 39
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->k0(D)V

    .line 40
    .line 41
    .line 42
    new-instance p3, Ll/im10;

    .line 43
    .line 44
    invoke-direct {p3, p1, p2}, Ll/im10;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final m0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;Ll/cm0;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/cm0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->j:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->k:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->m:Ll/x3t;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/x3t;

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ll/x3t;-><init>(Z)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->m:Ll/x3t;

    .line 23
    .line 24
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ll/x3t;->C(Ll/ner;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->m:Ll/x3t;

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Ll/x3t;->E(Ll/cm0;)V

    .line 36
    .line 37
    .line 38
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->hierarchyGrade:I

    .line 39
    .line 40
    if-gtz p2, :cond_2

    .line 41
    .line 42
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->fanbaseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseInfo;

    .line 43
    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseInfo;->fanbaseGrade:I

    .line 47
    .line 48
    if-lez p2, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->i:Landroid/widget/LinearLayout;

    .line 52
    .line 53
    const/16 p1, 0x8

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->i:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->m:Ll/x3t;

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->j:Lv/VDraweeView;

    .line 67
    .line 68
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->hierarchyGrade:I

    .line 69
    .line 70
    invoke-virtual {p2, v0, v1}, Ll/x3t;->A(Lv/VDraweeView;I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->fanbaseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseInfo;

    .line 74
    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->m:Ll/x3t;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->k:Lv/VDraweeView;

    .line 80
    .line 81
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseInfo;->fanbaseGrade:I

    .line 82
    .line 83
    invoke-virtual {p2, p0, p1}, Ll/x3t;->w(Lv/VDraweeView;I)V

    .line 84
    .line 85
    .line 86
    :cond_3
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
