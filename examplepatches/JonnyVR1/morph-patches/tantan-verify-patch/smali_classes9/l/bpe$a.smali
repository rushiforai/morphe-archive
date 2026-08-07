.class public Ll/bpe$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bpe;->T()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bpe;


# direct methods
.method public constructor <init>(Ll/bpe;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bpe$a;->a:Ll/bpe;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/bpe$a;->a:Ll/bpe;

    .line 5
    .line 6
    iget-object p2, p2, Ll/bpe;->E:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Ll/bpe$a;->a:Ll/bpe;

    .line 15
    .line 16
    iget-object p2, p2, Ll/bpe;->E:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    const/16 v0, 0xa

    .line 23
    .line 24
    if-le p2, v0, :cond_0

    .line 25
    .line 26
    const/4 p2, 0x1

    .line 27
    invoke-virtual {p1, p2}, Landroid/view/View;->canScrollHorizontally(I)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/bpe$a;->a:Ll/bpe;

    .line 34
    .line 35
    invoke-static {p0}, Ll/bpe;->R(Ll/bpe;)Ll/q320;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, p2}, Ll/q320;->L(Z)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method
