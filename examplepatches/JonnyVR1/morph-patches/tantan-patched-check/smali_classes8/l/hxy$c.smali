.class public Ll/hxy$c;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Ll/hxy;


# direct methods
.method public constructor <init>(Ll/hxy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hxy$c;->a:Ll/hxy;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 4
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
    iget-object p0, p0, Ll/hxy$c;->a:Ll/hxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hxy;->q()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    add-int/lit8 p3, p3, -0x1

    .line 16
    .line 17
    const/4 p4, 0x0

    .line 18
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 19
    .line 20
    invoke-virtual {p1, p4, p4, p4, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/h39;->G()Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    const/high16 v0, 0x41800000    # 16.0f

    .line 28
    .line 29
    const/high16 v1, 0x41200000    # 10.0f

    .line 30
    .line 31
    const/high16 v2, 0x41400000    # 12.0f

    .line 32
    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    if-eqz p4, :cond_0

    .line 36
    .line 37
    if-nez p0, :cond_0

    .line 38
    .line 39
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    :goto_0
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    goto :goto_4

    .line 51
    :cond_1
    if-eqz p0, :cond_2

    .line 52
    .line 53
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    iput v3, p1, Landroid/graphics/Rect;->left:I

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_2
    if-eqz p4, :cond_3

    .line 61
    .line 62
    const/high16 v3, 0x41000000    # 8.0f

    .line 63
    .line 64
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    goto :goto_1

    .line 69
    :cond_3
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    :goto_1
    iput v3, p1, Landroid/graphics/Rect;->left:I

    .line 74
    .line 75
    :goto_2
    if-ne p2, p3, :cond_5

    .line 76
    .line 77
    if-eqz p4, :cond_4

    .line 78
    .line 79
    if-nez p0, :cond_4

    .line 80
    .line 81
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    goto :goto_3

    .line 86
    :cond_4
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    :goto_3
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 91
    .line 92
    :cond_5
    :goto_4
    if-eqz p0, :cond_6

    .line 93
    .line 94
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 99
    .line 100
    return-void

    .line 101
    :cond_6
    if-eqz p4, :cond_7

    .line 102
    .line 103
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    goto :goto_5

    .line 108
    :cond_7
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    :goto_5
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 113
    .line 114
    return-void
.end method
