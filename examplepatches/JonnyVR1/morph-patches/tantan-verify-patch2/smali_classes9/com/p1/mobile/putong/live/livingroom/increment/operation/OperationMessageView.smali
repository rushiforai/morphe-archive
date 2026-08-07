.class public Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings<",
        "Ll/t160;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ll/t160;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;Landroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->j(Landroid/text/SpannableStringBuilder;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->f:Ll/t160;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t160;->i4()V

    .line 4
    .line 5
    .line 6
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

.method public d(Ll/t160;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->f:Ll/t160;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 2
    .line 3
    const/16 v1, 0x4b0

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setAnimDuration(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 9
    .line 10
    const/16 v0, 0x3e8

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->c(ILjava/lang/Runnable;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getOperationIconPos()Ll/bnl0$g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/t160;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->d(Ll/t160;)V

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

.method public final synthetic j(Landroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->l(Landroid/text/SpannableStringBuilder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->f:Ll/t160;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/t160;->t4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->f:Ll/t160;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->shading:Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/cz50;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->d:Lv/VDraweeView;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->iconUrl:Ljava/lang/String;

    .line 42
    .line 43
    const/high16 v1, 0x42000000    # 32.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const-string v2, "context_livingAct"

    .line 50
    .line 51
    invoke-static {v2, v0, p1, v1}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 55
    .line 56
    const/4 p2, 0x0

    .line 57
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Landroid/text/SpannableStringBuilder;

    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->f:Ll/t160;

    .line 64
    .line 65
    new-instance v0, Ll/v160;

    .line 66
    .line 67
    invoke-direct {v0, p0, p1}, Ll/v160;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;Landroid/text/SpannableStringBuilder;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2, p1, v0}, Ll/t160;->s4(Landroid/text/SpannableStringBuilder;Ll/x20;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->l(Landroid/text/SpannableStringBuilder;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    return-void
.end method

.method public l(Landroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setMarqueeText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->f:Ll/t160;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->messageIconTrans()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/q260$a;

    .line 14
    .line 15
    const/16 v2, 0x1fa4

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ll/q260$a;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {p1, v1}, Ll/q260$a;->b(Z)Ll/q260$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->getOperationIconPos()Ll/bnl0$g;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Ll/q260$a;->g(Ll/bnl0$g;)Ll/q260$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/q260$a;->a()Ll/q260;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->f:Ll/t160;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->messageOpen()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/q260$a;

    .line 14
    .line 15
    const/16 v1, 0x1fa4

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/q260$a;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->a(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 8
    .line 9
    new-instance v1, Ll/u160;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/u160;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
