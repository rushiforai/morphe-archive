.class public Ll/pio$c;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pio;->Y()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pio;


# direct methods
.method public constructor <init>(Ll/pio;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pio$c;->a:Ll/pio;

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
    .locals 3
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/pio$c;->a:Ll/pio;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq p2, v1, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    if-ne p2, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v1, v0

    .line 15
    :cond_1
    :goto_0
    invoke-static {p1, v1}, Ll/pio;->v(Ll/pio;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/pio$c;->a:Ll/pio;

    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/pio;->w(Ll/pio;I)V

    .line 21
    .line 22
    .line 23
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
    iget-object p1, p0, Ll/pio$c;->a:Ll/pio;

    .line 5
    .line 6
    invoke-static {p1}, Ll/pio;->p(Ll/pio;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/pio$c;->a:Ll/pio;

    .line 13
    .line 14
    invoke-static {p1}, Ll/pio;->q(Ll/pio;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/joa;->i4()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/pio$c;->a:Ll/pio;

    .line 27
    .line 28
    invoke-static {p1}, Ll/pio;->u(Ll/pio;)I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    add-int/2addr p2, p3

    .line 33
    invoke-static {p1, p2}, Ll/pio;->w(Ll/pio;I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/pio$c;->a:Ll/pio;

    .line 37
    .line 38
    invoke-static {p1}, Ll/pio;->u(Ll/pio;)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/high16 p2, 0x42c80000    # 100.0f

    .line 43
    .line 44
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-le p1, p2, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Ll/pio$c;->a:Ll/pio;

    .line 51
    .line 52
    invoke-static {p0}, Ll/pio;->x(Ll/pio;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method
