.class public Ll/taf$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/taf;->l(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

.field public final synthetic b:Ll/taf;


# direct methods
.method public constructor <init>(Ll/taf;Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/taf$a;->b:Ll/taf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/taf$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/taf$a;->b:Ll/taf;

    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ll/taf;->k(Ll/taf;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/taf$a;->b:Ll/taf;

    .line 12
    .line 13
    invoke-static {p1}, Ll/taf;->d(Ll/taf;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/taf$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->R(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/taf$a;->b:Ll/taf;

    .line 28
    .line 29
    invoke-static {p0, p2}, Ll/taf;->j(Ll/taf;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-static {p1}, Ll/taf;->f(Ll/taf;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Ll/taf$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 40
    .line 41
    const/4 p2, 0x0

    .line 42
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->R(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/taf$a;->b:Ll/taf;

    .line 46
    .line 47
    invoke-static {p1}, Ll/taf;->h(Ll/taf;)Landroidx/recyclerview/widget/RecyclerView;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p0, p0, Ll/taf$a;->b:Ll/taf;

    .line 52
    .line 53
    invoke-static {p0}, Ll/taf;->g(Ll/taf;)Landroidx/recyclerview/widget/RecyclerView$t;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/taf$a;->b:Ll/taf;

    .line 5
    .line 6
    invoke-static {p1}, Ll/taf;->e(Ll/taf;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/taf$a;->b:Ll/taf;

    .line 13
    .line 14
    iget-object p0, p0, Ll/taf$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->O()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p1, p0}, Ll/taf;->i(Ll/taf;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
