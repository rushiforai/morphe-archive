.class public Ll/n5g0;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Z

.field public final f:I


# direct methods
.method public constructor <init>(IIIIZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x42c80000    # 100.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/n5g0;->f:I

    .line 11
    .line 12
    iput p1, p0, Ll/n5g0;->a:I

    .line 13
    .line 14
    iput p2, p0, Ll/n5g0;->b:I

    .line 15
    .line 16
    iput p3, p0, Ll/n5g0;->c:I

    .line 17
    .line 18
    iput p4, p0, Ll/n5g0;->d:I

    .line 19
    .line 20
    iput-boolean p5, p0, Ll/n5g0;->e:Z

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 6
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroidx/recyclerview/widget/RecyclerView$a0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$n;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    iget p4, p0, Ll/n5g0;->a:I

    .line 17
    .line 18
    rem-int v0, p3, p4

    .line 19
    .line 20
    add-int/lit8 v1, p2, 0x1

    .line 21
    .line 22
    rem-int v2, v1, p4

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    iget v2, p0, Ll/n5g0;->d:I

    .line 28
    .line 29
    mul-int/lit8 v2, v2, 0x2

    .line 30
    .line 31
    div-int/lit8 v2, v2, 0x3

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    rem-int v2, p2, p4

    .line 35
    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget v2, p0, Ll/n5g0;->d:I

    .line 39
    .line 40
    div-int/lit8 v2, v2, 0x3

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v2, v3

    .line 44
    :goto_0
    if-lt p2, p4, :cond_2

    .line 45
    .line 46
    iget v4, p0, Ll/n5g0;->c:I

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move v4, v3

    .line 50
    :goto_1
    rem-int v5, p2, p4

    .line 51
    .line 52
    if-nez v5, :cond_3

    .line 53
    .line 54
    iget p4, p0, Ll/n5g0;->d:I

    .line 55
    .line 56
    mul-int/lit8 p4, p4, 0x2

    .line 57
    .line 58
    div-int/lit8 p4, p4, 0x3

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_3
    rem-int/2addr v1, p4

    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    iget p4, p0, Ll/n5g0;->d:I

    .line 65
    .line 66
    div-int/lit8 p4, p4, 0x3

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_4
    move p4, v3

    .line 70
    :goto_2
    add-int v1, p2, v0

    .line 71
    .line 72
    if-lt v1, p3, :cond_5

    .line 73
    .line 74
    iget v3, p0, Ll/n5g0;->b:I

    .line 75
    .line 76
    :cond_5
    iget-boolean v1, p0, Ll/n5g0;->e:Z

    .line 77
    .line 78
    if-eqz v1, :cond_7

    .line 79
    .line 80
    add-int/lit8 v1, p3, -0x1

    .line 81
    .line 82
    if-eq p2, v1, :cond_6

    .line 83
    .line 84
    const/4 v1, 0x1

    .line 85
    if-eq v0, v1, :cond_7

    .line 86
    .line 87
    add-int/lit8 p3, p3, -0x2

    .line 88
    .line 89
    if-ne p2, p3, :cond_7

    .line 90
    .line 91
    :cond_6
    iget v3, p0, Ll/n5g0;->f:I

    .line 92
    .line 93
    :cond_7
    invoke-virtual {p1, v2, v4, p4, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 94
    .line 95
    .line 96
    return-void
.end method
