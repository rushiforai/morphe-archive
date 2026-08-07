.class public Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationArticleFeedView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ty50;->a(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationArticleFeedView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationArticleFeedView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationArticleFeedView;->d:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-virtual {p1, v0, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ll/sy50;

    .line 14
    .line 15
    invoke-direct {p1, p3}, Ll/sy50;-><init>(Ll/x20;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationArticleFeedView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
