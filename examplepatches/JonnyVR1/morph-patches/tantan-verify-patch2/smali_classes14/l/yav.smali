.class public Ll/yav;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/uav;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Landroid/view/View;

.field public b:Lv/VDraweeView;

.field public c:Ll/uav;

.field public d:Z

.field public e:Landroid/view/View;

.field public f:Lv/VLinear;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVoiceView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/yav;->d:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/yav;->g:Ljava/util/List;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVoiceView;->d:Lv/VDraweeView;

    .line 15
    .line 16
    iput-object v0, p0, Ll/yav;->b:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVoiceView;->e:Lv/VText;

    .line 19
    .line 20
    iput-object v1, p0, Ll/yav;->e:Landroid/view/View;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVoiceView;->f:Landroid/view/View;

    .line 23
    .line 24
    iput-object v1, p0, Ll/yav;->a:Landroid/view/View;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVoiceView;->c:Lv/VLinear;

    .line 27
    .line 28
    iput-object p1, p0, Ll/yav;->f:Lv/VLinear;

    .line 29
    .line 30
    new-instance p1, Ll/vav;

    .line 31
    .line 32
    invoke-direct {p1, p0}, Ll/vav;-><init>(Ll/yav;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/yav;->e:Landroid/view/View;

    .line 39
    .line 40
    new-instance v0, Ll/wav;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/wav;-><init>(Ll/yav;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Ll/yav;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yav;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V

    return-void
.end method

.method public static synthetic b(Ll/yav;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yav;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/yav;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yav;->k(Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yav;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/yav;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/g9v;->p(Landroid/content/Context;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/yav;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "create-room-btn"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "upper_right_button"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p0, p1}, Ll/iqn0;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yav;->c:Ll/uav;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ll/uav;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yav;->c:Ll/uav;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yav;->a:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Ll/yav;->d:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/yav;->b:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/yav;->e:Landroid/view/View;

    .line 17
    .line 18
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {}, Ll/mqr;->m()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v2, p0, Ll/yav;->b:Lv/VDraweeView;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/yav;->e:Landroid/view/View;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/yav;->f:Lv/VLinear;

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/yav;->a:Landroid/view/View;

    .line 44
    .line 45
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/yav;->e:Landroid/view/View;

    .line 53
    .line 54
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/yav;->f:Lv/VLinear;

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)Landroid/view/View;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 7
    .line 8
    const/4 v0, -0x2

    .line 9
    invoke-direct {p1, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    .line 14
    .line 15
    const/high16 p1, 0x40c00000    # 6.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public final i(Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->type:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v3, p0, Ll/yav;->g:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    .line 24
    .line 25
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->type:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    return v0

    .line 34
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uav;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yav;->d(Ll/uav;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final j(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/yav;->g:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/yav;->i(Ljava/util/List;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public final synthetic m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yav;->f:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/yav;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final n(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Ll/yav;->f:Lv/VLinear;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ge v0, v1, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Ll/yav;->f:Lv/VLinear;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    .line 27
    .line 28
    instance-of v3, v1, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

    .line 29
    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    check-cast v1, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

    .line 33
    .line 34
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->type:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;->c(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->showRedDot:Z

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;->e(Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method

.method public p(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/yav;->j(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/yav;->g:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/yav;->f:Lv/VLinear;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/yav;->g:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Ll/yav;->g:Ljava/util/List;

    .line 29
    .line 30
    new-instance v0, Ll/xav;

    .line 31
    .line 32
    invoke-direct {v0, p0, p1}, Ll/xav;-><init>(Ll/yav;Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0, p2}, Ll/yav;->n(Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method
