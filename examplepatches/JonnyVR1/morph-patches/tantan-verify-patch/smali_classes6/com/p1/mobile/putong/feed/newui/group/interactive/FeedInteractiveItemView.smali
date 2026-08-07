.class public Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->s(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->s(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->s(Landroid/content/Context;)V

    return-void
.end method

.method private s(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jah;->b(Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/feed/data/Interactive;)V
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->c:Landroid/widget/TextView;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Interactive;->title:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->b:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/Interactive;->icon:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v7, 0x0

    .line 18
    const/4 v8, 0x0

    .line 19
    const/4 v5, 0x1

    .line 20
    const/4 v6, 0x0

    .line 21
    invoke-virtual/range {v2 .. v8}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
