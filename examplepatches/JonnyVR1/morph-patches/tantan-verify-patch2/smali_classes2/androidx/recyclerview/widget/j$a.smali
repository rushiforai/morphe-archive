.class public Landroidx/recyclerview/widget/j$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroidx/recyclerview/widget/j$c;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/j$c;Landroidx/recyclerview/widget/j$c;)I
    .locals 5

    .line 1
    iget-object p0, p1, Landroidx/recyclerview/widget/j$c;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    move v2, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v2, v0

    .line 10
    :goto_0
    iget-object v3, p2, Landroidx/recyclerview/widget/j$c;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    move v3, v1

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    move v3, v0

    .line 17
    :goto_1
    const/4 v4, -0x1

    .line 18
    if-eq v2, v3, :cond_3

    .line 19
    .line 20
    if-nez p0, :cond_2

    .line 21
    .line 22
    return v1

    .line 23
    :cond_2
    return v4

    .line 24
    :cond_3
    iget-boolean p0, p1, Landroidx/recyclerview/widget/j$c;->a:Z

    .line 25
    .line 26
    iget-boolean v2, p2, Landroidx/recyclerview/widget/j$c;->a:Z

    .line 27
    .line 28
    if-eq p0, v2, :cond_5

    .line 29
    .line 30
    if-eqz p0, :cond_4

    .line 31
    .line 32
    return v4

    .line 33
    :cond_4
    return v1

    .line 34
    :cond_5
    iget p0, p2, Landroidx/recyclerview/widget/j$c;->b:I

    .line 35
    .line 36
    iget v1, p1, Landroidx/recyclerview/widget/j$c;->b:I

    .line 37
    .line 38
    sub-int/2addr p0, v1

    .line 39
    if-eqz p0, :cond_6

    .line 40
    .line 41
    return p0

    .line 42
    :cond_6
    iget p0, p1, Landroidx/recyclerview/widget/j$c;->c:I

    .line 43
    .line 44
    iget p1, p2, Landroidx/recyclerview/widget/j$c;->c:I

    .line 45
    .line 46
    sub-int/2addr p0, p1

    .line 47
    if-eqz p0, :cond_7

    .line 48
    .line 49
    return p0

    .line 50
    :cond_7
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Landroidx/recyclerview/widget/j$c;

    .line 2
    .line 3
    check-cast p2, Landroidx/recyclerview/widget/j$c;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/j$a;->a(Landroidx/recyclerview/widget/j$c;Landroidx/recyclerview/widget/j$c;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
