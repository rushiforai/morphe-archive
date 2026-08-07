.class public Ll/dpr;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/widget/ListView;

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

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/widget/ListView;Ll/y20;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/ListView;",
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
    iput-boolean v0, p0, Ll/dpr;->d:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/dpr;->e:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/dpr;->a:Landroid/widget/ListView;

    .line 11
    .line 12
    iput-object p2, p0, Ll/dpr;->b:Ll/y20;

    .line 13
    .line 14
    iput p3, p0, Ll/dpr;->c:I

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Ll/dpr;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dpr;->d()V

    return-void
.end method


# virtual methods
.method public final b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dpr;->a:Landroid/widget/ListView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final c()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dpr;->a:Landroid/widget/ListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/dpr;->a:Landroid/widget/ListView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int/2addr v0, v1

    .line 14
    iget-object p0, p0, Ll/dpr;->a:Landroid/widget/ListView;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/ListView;->getFooterViewsCount()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    sub-int/2addr v0, p0

    .line 21
    return v0
.end method

.method public final synthetic d()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/dpr;->d:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dpr;->b()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-virtual {p0}, Ll/dpr;->g()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    iget v3, p0, Ll/dpr;->c:I

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
    iget-object v3, p0, Ll/dpr;->b:Ll/y20;

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
    iget v2, p0, Ll/dpr;->c:I

    .line 38
    .line 39
    add-int/2addr v2, v1

    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/dpr;->c()I

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
    iget-object v2, p0, Ll/dpr;->b:Ll/y20;

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

.method public e(I)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/dpr;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/dpr;->e:Z

    .line 6
    .line 7
    if-nez p1, :cond_2

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/dpr;->e:Z

    .line 11
    .line 12
    iget-object p1, p0, Ll/dpr;->a:Landroid/widget/ListView;

    .line 13
    .line 14
    new-instance v0, Ll/cpr;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/cpr;-><init>(Ll/dpr;)V

    .line 17
    .line 18
    .line 19
    const-wide/16 v1, 0xfa

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/dpr;->b()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0}, Ll/dpr;->g()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v1, v0

    .line 34
    sub-int/2addr v1, p1

    .line 35
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    sub-int/2addr v0, p1

    .line 40
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget v2, p0, Ll/dpr;->c:I

    .line 45
    .line 46
    if-ge v1, v0, :cond_1

    .line 47
    .line 48
    add-int/2addr v2, p1

    .line 49
    invoke-virtual {p0}, Ll/dpr;->c()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-ge v2, v0, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Ll/dpr;->b:Ll/y20;

    .line 56
    .line 57
    iget p0, p0, Ll/dpr;->c:I

    .line 58
    .line 59
    add-int/2addr p1, p0

    .line 60
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    sub-int v0, p1, v2

    .line 69
    .line 70
    if-ltz v0, :cond_2

    .line 71
    .line 72
    iget-object p0, p0, Ll/dpr;->b:Ll/y20;

    .line 73
    .line 74
    sub-int/2addr p1, v2

    .line 75
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/dpr;->d:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/dpr;->e:Z

    .line 6
    .line 7
    return-void
.end method

.method public final g()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dpr;->a:Landroid/widget/ListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/dpr;->a:Landroid/widget/ListView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int/2addr v0, v1

    .line 14
    iget-object p0, p0, Ll/dpr;->a:Landroid/widget/ListView;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/ListView;->getFooterViewsCount()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    sub-int/2addr v0, p0

    .line 21
    return v0
.end method
