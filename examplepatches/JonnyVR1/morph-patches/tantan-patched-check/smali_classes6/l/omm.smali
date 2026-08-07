.class public Ll/omm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fmm;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field public c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public d:Lv/VHandleBar;

.field public e:Lv/VText;

.field public f:Lv/VRecyclerView;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/view/View;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VEditText;

.field public l:Landroid/widget/TextView;

.field public m:Lv/VLinear;

.field public n:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

.field public o:Landroid/view/View;

.field public p:Ll/fmm;

.field public q:Ll/rlm;

.field public r:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public s:Lcom/p1/mobile/android/app/Act;

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/bottomsheet/BottomSheetBehavior<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/omm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/omm;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ll/omm;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/omm;->B()V

    return-void
.end method

.method public static synthetic d(Ll/omm;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/omm;->C(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic e(Ll/omm;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/omm;->F()V

    return-void
.end method

.method public static synthetic f(Ll/omm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/omm;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/omm;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/omm;->A(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static bridge synthetic j(Ll/omm;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/omm;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omm;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method


# virtual methods
.method public final synthetic A(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/omm;->k:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/omm;->l:Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic B()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/omm;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic C(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x1

    .line 6
    const/4 v0, 0x0

    .line 7
    if-ne p1, p2, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/omm;->p:Ll/fmm;

    .line 10
    .line 11
    iget-boolean p2, p1, Ll/fmm;->l:Z

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->d3:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 18
    .line 19
    .line 20
    return v0

    .line 21
    :cond_0
    iget-boolean p1, p1, Ll/fmm;->m:Z

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Ll/omm;->k:Lv/VEditText;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/omm;->n()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return v0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/omm;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic F()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/omm;->q:Ll/rlm;

    .line 4
    .line 5
    iget-object p0, p0, Ll/omm;->p:Ll/fmm;

    .line 6
    .line 7
    iget-object p0, p0, Ll/fmm;->g:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 8
    .line 9
    invoke-virtual {v1, p0}, Ll/rlm;->k0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/omm;->p:Ll/fmm;

    .line 2
    .line 3
    iget-object v0, p0, Ll/omm;->k:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/omm;->k:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Ll/nmm;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/nmm;-><init>(Ll/omm;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0, v1, v2}, Ll/fmm;->W0(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/omm;->k:Lv/VEditText;

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public H(ZI)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/omm;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, v0, v0, v0, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public I(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/omm;->p:Ll/fmm;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/fmm;->l:Z

    .line 4
    .line 5
    const-string v2, "\u8bc4\u8bba 0"

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/omm;->q:Ll/rlm;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/rlm;->d0(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/omm;->e:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, v0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Ll/omm;->e:Lv/VText;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v2, "\u8bc4\u8bba "

    .line 38
    .line 39
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Ll/omm;->p:Ll/fmm;

    .line 43
    .line 44
    iget-object v2, v2, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 47
    .line 48
    iget v2, v2, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    iget-object p0, p0, Ll/omm;->q:Ll/rlm;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/rlm;->d0(Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public J(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/omm;->q:Ll/rlm;

    .line 8
    .line 9
    iget-object v0, v0, Ll/di5;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/omm;->q:Ll/rlm;

    .line 15
    .line 16
    iget-object v0, v0, Ll/di5;->d:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0, p1}, Ll/omm;->I(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omm;->q:Ll/rlm;

    .line 2
    .line 3
    iput-object p1, p0, Ll/rlm;->m:Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omm;->q:Ll/rlm;

    .line 2
    .line 3
    iput-object p1, p0, Ll/rlm;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omm;->q:Ll/rlm;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/di5;->e0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/omm;->q:Ll/rlm;

    .line 2
    .line 3
    iget-object v1, p0, Ll/omm;->p:Ll/fmm;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/fmm;->u0()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Ll/rlm;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object p0, p0, Ll/omm;->q:Ll/rlm;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public O(Ll/bkj0;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Music;",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;>;)Z"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    iget-object p1, p0, Ll/omm;->g:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 19
    .line 20
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/omm;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return v1
.end method

.method public P(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/omm;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/omm;->g:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$Forbidden;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    instance-of p1, p1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 25
    .line 26
    iget-object v0, p0, Ll/omm;->p:Ll/fmm;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/fmm;->u0()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Ll/ksg;->b0(Lcom/p1/mobile/putong/data/User;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    iget-object p1, p0, Ll/omm;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 51
    .line 52
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_0
    return-void
.end method

.method public Q(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omm;->o:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final R()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/omm;->p:Ll/fmm;

    .line 2
    .line 3
    iget-object v1, v0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-boolean v0, v0, Ll/fmm;->m:Z

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/omm;->g:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object v0, p0, Ll/omm;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v2, 0x4

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-object p0, p0, Ll/omm;->g:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v3, p0, Ll/omm;->p:Ll/fmm;

    .line 39
    .line 40
    invoke-virtual {v3}, Ll/fmm;->u0()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {v0, v3}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Ll/ksg;->b0(Lcom/p1/mobile/putong/data/User;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    iget-object p0, p0, Ll/omm;->g:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    new-instance v0, Landroid/graphics/Rect;

    .line 63
    .line 64
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 68
    .line 69
    invoke-virtual {v3, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget-object p0, p0, Ll/omm;->g:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/omm;->T(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/omm;->k:Lv/VEditText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object v1, p0, Ll/omm;->k:Lv/VEditText;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/omm;->k:Lv/VEditText;

    .line 15
    .line 16
    iget-object p0, p0, Ll/omm;->p:Ll/fmm;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Ll/fmm;->Y0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fmm;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/omm;->m(Ll/fmm;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/omm;->l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/omm;->u:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Ll/omm;->k:Lv/VEditText;

    .line 14
    .line 15
    iget-object v0, p0, Ll/omm;->u:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p2, "feed"

    .line 22
    .line 23
    iget-object v0, p0, Ll/omm;->t:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iget-object v0, p0, Ll/omm;->k:Lv/VEditText;

    .line 30
    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    const-string p2, "\u53cb\u5584\u8bc4\u8bba\uff0c\u8bf4\u70b9\u597d\u542c\u7684..."

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object p2, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 42
    .line 43
    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object p2, p0, Ll/omm;->k:Lv/VEditText;

    .line 51
    .line 52
    new-instance v0, Ll/gmm;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/gmm;-><init>(Ll/omm;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Ll/omm;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 61
    .line 62
    invoke-static {p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iput-object p2, p0, Ll/omm;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 67
    .line 68
    invoke-static {}, Ll/cmg;->P()Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-eqz p2, :cond_2

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/omm;->w(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    iget-object p2, p0, Ll/omm;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 78
    .line 79
    new-instance v0, Ll/omm$a;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ll/omm$a;-><init>(Ll/omm;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->addBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 85
    .line 86
    .line 87
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    iget p2, p2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 92
    .line 93
    int-to-float p2, p2

    .line 94
    const v0, 0x3f4ccccd    # 0.8f

    .line 95
    .line 96
    .line 97
    mul-float/2addr p2, v0

    .line 98
    float-to-int p2, p2

    .line 99
    iget-object v0, p0, Ll/omm;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 100
    .line 101
    invoke-virtual {v0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/omm;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 111
    .line 112
    iget-object p2, p0, Ll/omm;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 113
    .line 114
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Ll/omm;->b:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 118
    .line 119
    new-instance v0, Ll/hmm;

    .line 120
    .line 121
    invoke-direct {v0, p0}, Ll/hmm;-><init>(Ll/omm;)V

    .line 122
    .line 123
    .line 124
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Ll/omm;->h:Landroid/widget/LinearLayout;

    .line 128
    .line 129
    new-instance v0, Ll/imm;

    .line 130
    .line 131
    invoke-direct {v0}, Ll/imm;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ll/omm;->v()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Ll/omm;->act()Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    new-instance v0, Landroid/view/View;

    .line 145
    .line 146
    invoke-virtual {p0}, Ll/omm;->act()Lcom/p1/mobile/android/app/Act;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 151
    .line 152
    .line 153
    new-instance v1, Ll/jmm;

    .line 154
    .line 155
    invoke-direct {v1, p0}, Ll/jmm;-><init>(Ll/omm;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2, p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0
.end method

.method public l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pmm;->b(Ll/omm;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Ll/fmm;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/omm;->p:Ll/fmm;

    .line 2
    .line 3
    return-void
.end method

.method public final n()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/omm;->p:Ll/fmm;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    iput-object v0, p0, Ll/fmm;->i:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/fmm;->h:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/fmm;->g:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 11
    .line 12
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/omm;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/omm;->k:Lv/VEditText;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    iget-object v1, p0, Ll/omm;->k:Lv/VEditText;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v1, v2}, Lv/VEditText;->i(Z)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/kmm;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/kmm;-><init>(Ll/omm;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Ll/omm;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 43
    .line 44
    iget-object v1, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->e4:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/omm;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 58
    .line 59
    sget v1, Ll/lbc0;->h6:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/omm;->r:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 65
    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    new-instance v0, Ll/lmm;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/lmm;-><init>(Ll/omm;)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Ll/omm;->r:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 74
    .line 75
    iget-object v0, p0, Ll/omm;->g:Landroid/widget/LinearLayout;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object p0, p0, Ll/omm;->r:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void
.end method

.method public q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/omm;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/omm;->k:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/omm;->g:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v2, p0, Ll/omm;->r:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/omm;->r:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 24
    .line 25
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/omm;->q:Ll/rlm;

    .line 2
    .line 3
    iget-object p0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public u(Ll/n570;)V
    .locals 8

    .line 1
    new-instance v0, Ll/rlm;

    .line 2
    .line 3
    iget-object v6, p0, Ll/omm;->p:Ll/fmm;

    .line 4
    .line 5
    iget-boolean v1, v6, Ll/fmm;->l:Z

    .line 6
    .line 7
    iget-object v2, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iget-object v4, v6, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v5, v6, Ll/fmm;->k:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v7, p0, Ll/omm;->t:Ljava/lang/String;

    .line 14
    .line 15
    move-object v3, p1

    .line 16
    invoke-direct/range {v0 .. v7}, Ll/rlm;-><init>(ZLcom/p1/mobile/android/app/Act;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ll/fmm;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/omm;->q:Ll/rlm;

    .line 20
    .line 21
    iget-object p1, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/omm;->p:Ll/fmm;

    .line 27
    .line 28
    iget-boolean p1, p1, Ll/fmm;->l:Z

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/omm;->q:Ll/rlm;

    .line 33
    .line 34
    new-instance p1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/rlm;->d0(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public v()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$l;->setAddDuration(J)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$l;->setChangeDuration(J)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$l;->setMoveDuration(J)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$l;->setRemoveDuration(J)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/omm;->f:Lv/VRecyclerView;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Landroidx/recyclerview/widget/v;

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/v;->setSupportsChangeAnimations(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final w(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/omm;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/omm$b;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/omm$b;-><init>(Ll/omm;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/omm;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ll/mmm;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mmm;-><init>(Ll/omm;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/omm;->p:Ll/fmm;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/fmm;->z0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public y()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/omm;->z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/omm;->k:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/omm;->s:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object v1, p0, Ll/omm;->k:Lv/VEditText;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/omm;->k:Lv/VEditText;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Ll/omm;->p:Ll/fmm;

    .line 35
    .line 36
    const-string v0, ""

    .line 37
    .line 38
    iput-object v0, p0, Ll/fmm;->i:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Ll/fmm;->h:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v0, p0, Ll/fmm;->g:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 44
    .line 45
    :cond_0
    return-void
.end method
