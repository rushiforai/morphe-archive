.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->T()Landroidx/recyclerview/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/w;

.field public final synthetic b:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public final synthetic c:Ll/ywg;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/a;Landroidx/recyclerview/widget/w;Landroidx/recyclerview/widget/LinearLayoutManager;Ll/ywg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;->d:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;->a:Landroidx/recyclerview/widget/w;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;->b:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;->c:Ll/ywg;

    .line 8
    .line 9
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;->a:Landroidx/recyclerview/widget/w;

    .line 4
    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;->b:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/w;->h(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;->c:Ll/ywg;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$p;->a()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;->c:Ll/ywg;

    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ll/ywg;->K(I)Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$a;->c:Ll/ywg;

    .line 34
    .line 35
    iget-object p0, p0, Ll/ywg;->f:Ll/y20;

    .line 36
    .line 37
    new-instance v0, Ll/bkj0;

    .line 38
    .line 39
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-direct {v0, p2, p1, v1}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
