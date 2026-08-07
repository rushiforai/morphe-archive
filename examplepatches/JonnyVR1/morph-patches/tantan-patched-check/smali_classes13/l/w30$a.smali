.class public Ll/w30$a;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w30;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/w30$c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VListCell$a;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/w30$d;

.field public d:I

.field public e:Z

.field public f:I

.field public g:I

.field public h:Landroid/graphics/Typeface;

.field public i:Landroid/graphics/Typeface;

.field public j:Landroid/util/SparseIntArray;

.field public k:Landroid/util/SparseIntArray;

.field public l:I

.field public m:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Ll/w30$d;IIILandroid/graphics/Typeface;Landroid/graphics/Typeface;[I[I[I[I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lv/VListCell$a;",
            ">;",
            "Ll/w30$d;",
            "III",
            "Landroid/graphics/Typeface;",
            "Landroid/graphics/Typeface;",
            "[I[I[I[I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    iput-object p1, p0, Ll/w30$a;->a:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Ll/w30$a;->b:Ljava/util/List;

    .line 4
    iput-object p3, p0, Ll/w30$a;->c:Ll/w30$d;

    const/4 p3, 0x0

    if-eqz p4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, p3

    .line 5
    :goto_0
    iput-boolean v0, p0, Ll/w30$a;->e:Z

    if-eqz v0, :cond_1

    goto :goto_1

    .line 6
    :cond_1
    sget p4, Ll/gec0;->f:I

    :goto_1
    iput p4, p0, Ll/w30$a;->d:I

    .line 7
    iput p5, p0, Ll/w30$a;->f:I

    .line 8
    iput p6, p0, Ll/w30$a;->g:I

    .line 9
    iput-object p7, p0, Ll/w30$a;->h:Landroid/graphics/Typeface;

    .line 10
    iput-object p8, p0, Ll/w30$a;->i:Landroid/graphics/Typeface;

    if-eqz p10, :cond_2

    .line 11
    new-instance p4, Landroid/util/SparseIntArray;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p5

    invoke-direct {p4, p5}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object p4, p0, Ll/w30$a;->j:Landroid/util/SparseIntArray;

    move p4, p3

    .line 12
    :goto_2
    array-length p5, p10

    if-ge p4, p5, :cond_2

    .line 13
    iget-object p5, p0, Ll/w30$a;->j:Landroid/util/SparseIntArray;

    aget p6, p10, p4

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p7

    aget p8, p9, p4

    invoke-virtual {p7, p8}, Landroid/content/res/Resources;->getColor(I)I

    move-result p7

    .line 15
    invoke-virtual {p5, p6, p7}, Landroid/util/SparseIntArray;->put(II)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_2

    :cond_2
    if-eqz p12, :cond_3

    .line 16
    new-instance p4, Landroid/util/SparseIntArray;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    invoke-direct {p4, p2}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object p4, p0, Ll/w30$a;->k:Landroid/util/SparseIntArray;

    .line 17
    :goto_3
    array-length p2, p12

    if-ge p3, p2, :cond_3

    .line 18
    iget-object p2, p0, Ll/w30$a;->k:Landroid/util/SparseIntArray;

    aget p4, p12, p3

    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p5

    aget p6, p11, p3

    invoke-virtual {p5, p6}, Landroid/content/res/Resources;->getColor(I)I

    move-result p5

    .line 20
    invoke-virtual {p2, p4, p5}, Landroid/util/SparseIntArray;->put(II)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_3

    :cond_3
    return-void
.end method

.method public static synthetic y(Ll/w30$a;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/w30$a;->z(ILandroid/view/View;)V

    return-void
.end method

.method private synthetic z(ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w30$a;->c:Ll/w30$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lv/VListCell;

    .line 6
    .line 7
    iget-object p0, p0, Ll/w30$a;->b:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lv/VListCell$a;

    .line 14
    .line 15
    invoke-interface {v0, p2, p0, p1}, Ll/w30$d;->a(Lv/VListCell;Lv/VListCell$a;I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public A(Ll/w30$c;I)V
    .locals 2
    .param p1    # Ll/w30$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/w30$a;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VListCell$a;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/w30$c;->b(Lv/VListCell$a;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/w30$a;->j:Landroid/util/SparseIntArray;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, p2}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-ltz v0, :cond_0

    .line 21
    .line 22
    invoke-static {p1}, Ll/w30$c;->a(Ll/w30$c;)Lv/VListCell;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Ll/w30$a;->j:Landroid/util/SparseIntArray;

    .line 27
    .line 28
    invoke-virtual {v1, p2}, Landroid/util/SparseIntArray;->get(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleColor(I)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {p1}, Ll/w30$c;->a(Ll/w30$c;)Lv/VListCell;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget v1, p0, Ll/w30$a;->l:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleColor(I)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Ll/w30$a;->k:Landroid/util/SparseIntArray;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {v0, p2}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-ltz v0, :cond_1

    .line 54
    .line 55
    invoke-static {p1}, Ll/w30$c;->a(Ll/w30$c;)Lv/VListCell;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p0, Ll/w30$a;->k:Landroid/util/SparseIntArray;

    .line 60
    .line 61
    invoke-virtual {v1, p2}, Landroid/util/SparseIntArray;->get(I)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {v0, v1}, Lv/VListCell;->setSubTitleColor(I)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    invoke-static {p1}, Ll/w30$c;->a(Ll/w30$c;)Lv/VListCell;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget v1, p0, Ll/w30$a;->m:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lv/VListCell;->setSubTitleColor(I)V

    .line 76
    .line 77
    .line 78
    :goto_1
    invoke-static {p1}, Ll/w30$c;->a(Ll/w30$c;)Lv/VListCell;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    new-instance v0, Ll/v30;

    .line 83
    .line 84
    invoke-direct {v0, p0, p2}, Ll/v30;-><init>(Ll/w30$a;I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public C(Landroid/view/ViewGroup;I)Ll/w30$c;
    .locals 3
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget p2, p0, Ll/w30$a;->d:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    move-object p2, p1

    .line 17
    check-cast p2, Lv/VListCell;

    .line 18
    .line 19
    invoke-virtual {p2}, Lv/VListCell;->getTitleColor()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Ll/w30$a;->l:I

    .line 24
    .line 25
    invoke-virtual {p2}, Lv/VListCell;->getSubTitleColor()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/w30$a;->m:I

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    const/4 v1, -0x1

    .line 40
    const/4 v2, -0x2

    .line 41
    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    iget-boolean v0, p0, Ll/w30$a;->e:Z

    .line 48
    .line 49
    if-nez v0, :cond_4

    .line 50
    .line 51
    iget v0, p0, Ll/w30$a;->f:I

    .line 52
    .line 53
    const v1, 0x7fffffff

    .line 54
    .line 55
    .line 56
    if-ne v0, v1, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Ll/w30$a;->a:Landroid/content/Context;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v2, Ll/z8c0;->c:I

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p2, v0}, Lv/VListCell;->setTitleColor(I)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {p2, v0}, Lv/VListCell;->setTitleColor(I)V

    .line 75
    .line 76
    .line 77
    :goto_0
    iget v0, p0, Ll/w30$a;->g:I

    .line 78
    .line 79
    if-ne v0, v1, :cond_2

    .line 80
    .line 81
    iget-object v0, p0, Ll/w30$a;->a:Landroid/content/Context;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sget v1, Ll/z8c0;->c:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {p2, v0}, Lv/VListCell;->setSubTitleColor(I)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    invoke-virtual {p2, v0}, Lv/VListCell;->setSubTitleColor(I)V

    .line 98
    .line 99
    .line 100
    :goto_1
    iget-object v0, p0, Ll/w30$a;->h:Landroid/graphics/Typeface;

    .line 101
    .line 102
    if-nez v0, :cond_3

    .line 103
    .line 104
    const/4 v0, 0x3

    .line 105
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const/4 v1, 0x1

    .line 110
    invoke-virtual {p2, v0, v1}, Lv/VListCell;->c(Landroid/graphics/Typeface;I)V

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    invoke-virtual {p2, v0}, Lv/VListCell;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 115
    .line 116
    .line 117
    :goto_2
    iget-object p0, p0, Ll/w30$a;->i:Landroid/graphics/Typeface;

    .line 118
    .line 119
    if-eqz p0, :cond_4

    .line 120
    .line 121
    invoke-virtual {p2, p0}, Lv/VListCell;->setSubTitleTypeface(Landroid/graphics/Typeface;)V

    .line 122
    .line 123
    .line 124
    :cond_4
    new-instance p0, Ll/w30$c;

    .line 125
    .line 126
    invoke-direct {p0, p1}, Ll/w30$c;-><init>(Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$a;->b:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/w30$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/w30$a;->A(Ll/w30$c;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w30$a;->C(Landroid/view/ViewGroup;I)Ll/w30$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
