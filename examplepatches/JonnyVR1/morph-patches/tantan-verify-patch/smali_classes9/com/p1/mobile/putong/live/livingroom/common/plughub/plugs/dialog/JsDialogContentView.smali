.class public Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/LinearLayout;


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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;Ll/z20;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;->f(Ll/z20;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->canCloseDialogTouchOutSide:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pqq;->a(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f(Ll/z20;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V
    .locals 0

    .line 1
    iput-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->actionListener:Ll/z20;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1, p3, p2}, Ll/tqq;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Ljava/lang/String;)Ll/crq;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;->b:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/crq;->b()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p1}, Ll/crq;->a()Landroid/widget/LinearLayout$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;Ljava/lang/String;Ll/z20;Ll/x20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->types:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/mqq;

    .line 4
    .line 5
    invoke-direct {v1, p0, p3, p2}, Ll/mqq;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;Ll/z20;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;->a:Landroid/view/View;

    .line 12
    .line 13
    new-instance p3, Ll/nqq;

    .line 14
    .line 15
    invoke-direct {p3, p1, p4}, Ll/nqq;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;Ll/x20;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;->b:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    new-instance p1, Ll/oqq;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/oqq;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
