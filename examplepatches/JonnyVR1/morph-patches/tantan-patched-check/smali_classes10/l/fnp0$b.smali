.class public Ll/fnp0$b;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fnp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VRecyclerView;

.field public d:Ll/dnp0;


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->Y7:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Ll/fnp0$b;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->Z7:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Ll/fnp0$b;->b:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->a8:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lv/VRecyclerView;

    .line 31
    .line 32
    iput-object p1, p0, Ll/fnp0$b;->c:Lv/VRecyclerView;

    .line 33
    .line 34
    new-instance v0, Ll/fnp0$b$a;

    .line 35
    .line 36
    invoke-direct {v0, p0, p2}, Ll/fnp0$b$a;-><init>(Ll/fnp0$b;Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 40
    .line 41
    .line 42
    new-instance p1, Ll/dnp0;

    .line 43
    .line 44
    invoke-direct {p1}, Ll/dnp0;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Ll/fnp0$b;->d:Ll/dnp0;

    .line 48
    .line 49
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 50
    .line 51
    iget-object p2, p0, Ll/fnp0$b;->c:Lv/VRecyclerView;

    .line 52
    .line 53
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const/4 v0, 0x3

    .line 58
    const/4 v1, 0x0

    .line 59
    invoke-direct {p1, p2, v0, v1, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Ll/fnp0$b;->c:Lv/VRecyclerView;

    .line 63
    .line 64
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/fnp0$b;->c:Lv/VRecyclerView;

    .line 68
    .line 69
    iget-object p0, p0, Ll/fnp0$b;->d:Ll/dnp0;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method
