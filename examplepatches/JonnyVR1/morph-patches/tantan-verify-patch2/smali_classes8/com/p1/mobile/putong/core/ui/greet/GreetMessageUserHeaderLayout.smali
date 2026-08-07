.class public Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Landroid/view/View;

.field public g:Lv/VDraweeView;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VText;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VText;

.field public o:Landroid/widget/LinearLayout;

.field public p:Lv/VText;

.field public q:Z

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/CharSequence;

.field public t:Ljava/lang/CharSequence;

.field public u:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->q:Z

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->r:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->s:Ljava/lang/CharSequence;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->t:Ljava/lang/CharSequence;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->u:Ljava/lang/CharSequence;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->q:Z

    .line 20
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->r:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->s:Ljava/lang/CharSequence;

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->t:Ljava/lang/CharSequence;

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->u:Ljava/lang/CharSequence;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->q:Z

    .line 26
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->r:Ljava/lang/String;

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->s:Ljava/lang/CharSequence;

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->t:Ljava/lang/CharSequence;

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->u:Ljava/lang/CharSequence;

    return-void
.end method


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uck;->b(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
