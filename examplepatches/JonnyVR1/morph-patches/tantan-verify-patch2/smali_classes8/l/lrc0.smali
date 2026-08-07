.class public Ll/lrc0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;

.field public final b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final c:I

.field public d:Ll/ner;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Ll/ner;Landroidx/recyclerview/widget/RecyclerView;Ll/y20;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Landroidx/recyclerview/widget/RecyclerView;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/lrc0;->e:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/lrc0;->f:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/lrc0;->d:Ll/ner;

    .line 11
    .line 12
    iput-object p2, p0, Ll/lrc0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    iput-object p3, p0, Ll/lrc0;->b:Ll/y20;

    .line 15
    .line 16
    iput p4, p0, Ll/lrc0;->c:I

    .line 17
    .line 18
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    instance-of p0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 23
    .line 24
    invoke-static {p0}, Ll/u11;->h(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Ll/lrc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lrc0;->f()V

    return-void
.end method

.method public static synthetic b(Ll/lrc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lrc0;->e()V

    return-void
.end method


# virtual methods
.method public final c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lrc0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lrc0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic e()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/lrc0;->e:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lrc0;->c()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-virtual {p0}, Ll/lrc0;->i()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    iget v3, p0, Ll/lrc0;->c:I

    .line 13
    .line 14
    sub-int v3, v1, v3

    .line 15
    .line 16
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    :goto_0
    if-ge v0, v1, :cond_0

    .line 21
    .line 22
    iget-object v3, p0, Ll/lrc0;->b:Ll/y20;

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-interface {v3, v4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    add-int/2addr v1, v2

    .line 35
    add-int/lit8 v0, v1, 0x1

    .line 36
    .line 37
    :goto_1
    iget v2, p0, Ll/lrc0;->c:I

    .line 38
    .line 39
    add-int/2addr v2, v1

    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/lrc0;->d()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-ge v0, v2, :cond_1

    .line 51
    .line 52
    iget-object v2, p0, Ll/lrc0;->b:Ll/y20;

    .line 53
    .line 54
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-interface {v2, v3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    return-void
.end method

.method public final synthetic f()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/lrc0;->e:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lrc0;->c()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-virtual {p0}, Ll/lrc0;->i()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    iget v3, p0, Ll/lrc0;->c:I

    .line 13
    .line 14
    sub-int v3, v1, v3

    .line 15
    .line 16
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    :goto_0
    if-ge v0, v1, :cond_0

    .line 21
    .line 22
    iget-object v3, p0, Ll/lrc0;->b:Ll/y20;

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-interface {v3, v4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    add-int/2addr v1, v2

    .line 35
    add-int/lit8 v0, v1, 0x1

    .line 36
    .line 37
    :goto_1
    iget v2, p0, Ll/lrc0;->c:I

    .line 38
    .line 39
    add-int/2addr v2, v1

    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/lrc0;->d()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-ge v0, v2, :cond_1

    .line 51
    .line 52
    iget-object v2, p0, Ll/lrc0;->b:Ll/y20;

    .line 53
    .line 54
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-interface {v2, v3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    return-void
.end method

.method public g(I)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/lrc0;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/lrc0;->f:Z

    .line 6
    .line 7
    if-nez p1, :cond_3

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/lrc0;->f:Z

    .line 11
    .line 12
    iget-object p1, p0, Ll/lrc0;->d:Ll/ner;

    .line 13
    .line 14
    instance-of v0, p1, Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    const-wide/16 v1, 0xfa

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    new-instance v0, Ll/jrc0;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/jrc0;-><init>(Ll/lrc0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/android/app/Frag;

    .line 32
    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/android/app/Frag;

    .line 36
    .line 37
    new-instance v0, Ll/krc0;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/krc0;-><init>(Ll/lrc0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    invoke-virtual {p0}, Ll/lrc0;->c()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p0}, Ll/lrc0;->i()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    add-int/2addr v1, v0

    .line 55
    sub-int/2addr v1, p1

    .line 56
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    sub-int/2addr v0, p1

    .line 61
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iget v2, p0, Ll/lrc0;->c:I

    .line 66
    .line 67
    if-ge v1, v0, :cond_2

    .line 68
    .line 69
    add-int/2addr v2, p1

    .line 70
    invoke-virtual {p0}, Ll/lrc0;->d()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-ge v2, v0, :cond_3

    .line 75
    .line 76
    iget-object v0, p0, Ll/lrc0;->b:Ll/y20;

    .line 77
    .line 78
    iget p0, p0, Ll/lrc0;->c:I

    .line 79
    .line 80
    add-int/2addr p1, p0

    .line 81
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    sub-int v0, p1, v2

    .line 90
    .line 91
    if-ltz v0, :cond_3

    .line 92
    .line 93
    iget-object p0, p0, Ll/lrc0;->b:Ll/y20;

    .line 94
    .line 95
    sub-int/2addr p1, v2

    .line 96
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    :cond_3
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/lrc0;->e:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/lrc0;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public final i()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lrc0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
