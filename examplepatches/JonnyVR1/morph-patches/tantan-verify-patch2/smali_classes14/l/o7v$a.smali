.class public Ll/o7v$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o7v;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public final synthetic c:Ll/o7v;


# direct methods
.method public constructor <init>(Ll/o7v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o7v$a;->c:Ll/o7v;

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
    if-nez p2, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/o7v$a;->a:I

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/o7v$a;->b:Z

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Ll/o7v$a;->a:I

    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    if-ltz p3, :cond_1

    .line 10
    .line 11
    :cond_0
    if-gez p1, :cond_2

    .line 12
    .line 13
    if-lez p3, :cond_2

    .line 14
    .line 15
    :cond_1
    iput p2, p0, Ll/o7v$a;->a:I

    .line 16
    .line 17
    iput-boolean p2, p0, Ll/o7v$a;->b:Z

    .line 18
    .line 19
    :cond_2
    iget p1, p0, Ll/o7v$a;->a:I

    .line 20
    .line 21
    add-int/2addr p1, p3

    .line 22
    iput p1, p0, Ll/o7v$a;->a:I

    .line 23
    .line 24
    iget-boolean p3, p0, Ll/o7v$a;->b:Z

    .line 25
    .line 26
    if-nez p3, :cond_4

    .line 27
    .line 28
    sget p3, Ll/qa00;->R:I

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    if-lt p1, p3, :cond_3

    .line 32
    .line 33
    iput-boolean v0, p0, Ll/o7v$a;->b:Z

    .line 34
    .line 35
    iget-object p0, p0, Ll/o7v$a;->c:Ll/o7v;

    .line 36
    .line 37
    invoke-static {p0}, Ll/o7v;->d(Ll/o7v;)Ll/j7v;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0, v0}, Ll/j7v;->Q2(Z)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    sget p3, Ll/qa00;->B:I

    .line 46
    .line 47
    neg-int p3, p3

    .line 48
    if-gt p1, p3, :cond_4

    .line 49
    .line 50
    iput-boolean v0, p0, Ll/o7v$a;->b:Z

    .line 51
    .line 52
    iget-object p0, p0, Ll/o7v$a;->c:Ll/o7v;

    .line 53
    .line 54
    invoke-static {p0}, Ll/o7v;->d(Ll/o7v;)Ll/j7v;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, p2}, Ll/j7v;->Q2(Z)V

    .line 59
    .line 60
    .line 61
    :cond_4
    return-void
.end method
