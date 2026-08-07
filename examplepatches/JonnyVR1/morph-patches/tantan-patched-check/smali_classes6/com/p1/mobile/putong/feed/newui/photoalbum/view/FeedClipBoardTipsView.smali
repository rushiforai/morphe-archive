.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Ljava/lang/String;

.field public c:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->c(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->c(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->c(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->e(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dwg;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->d()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->a:Lv/VFrame;

    .line 2
    .line 3
    new-instance v1, Ll/cwg;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/cwg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/l51;->q(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->F0:I

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->c:Ll/x20;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->c:Ll/x20;

    .line 28
    .line 29
    invoke-interface {p0}, Ll/x20;->call()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public f(Ljava/lang/String;ZLl/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->b:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->c:Ll/x20;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->a:Lv/VFrame;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    sget p1, Ll/lbc0;->E0:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget p1, Ll/lbc0;->D0:I

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
