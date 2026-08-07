.class public Ll/dgq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dgq0$j;,
        Ll/dgq0$k;,
        Ll/dgq0$i;,
        Ll/dgq0$h;,
        Ll/dgq0$g;,
        Ll/dgq0$f;,
        Ll/dgq0$l;,
        Ll/dgq0$a;,
        Ll/dgq0$m;,
        Ll/dgq0$d;,
        Ll/dgq0$c;,
        Ll/dgq0$b;,
        Ll/dgq0$e;
    }
.end annotation


# static fields
.field public static final b:Ll/dgq0;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# instance fields
.field public final a:Ll/dgq0$k;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/dgq0$j;->q:Ll/dgq0;

    .line 8
    .line 9
    sput-object v0, Ll/dgq0;->b:Ll/dgq0;

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Ll/dgq0$k;->b:Ll/dgq0;

    .line 13
    .line 14
    sput-object v0, Ll/dgq0;->b:Ll/dgq0;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/view/WindowInsets;)V
    .locals 2
    .param p1    # Landroid/view/WindowInsets;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x14
    .end annotation

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 118
    new-instance v0, Ll/dgq0$j;

    invoke-direct {v0, p0, p1}, Ll/dgq0$j;-><init>(Ll/dgq0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    return-void

    :cond_0
    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1

    .line 119
    new-instance v0, Ll/dgq0$i;

    invoke-direct {v0, p0, p1}, Ll/dgq0$i;-><init>(Ll/dgq0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    return-void

    :cond_1
    const/16 v1, 0x1c

    if-lt v0, v1, :cond_2

    .line 120
    new-instance v0, Ll/dgq0$h;

    invoke-direct {v0, p0, p1}, Ll/dgq0$h;-><init>(Ll/dgq0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    return-void

    .line 121
    :cond_2
    new-instance v0, Ll/dgq0$g;

    invoke-direct {v0, p0, p1}, Ll/dgq0$g;-><init>(Ll/dgq0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    return-void
.end method

.method public constructor <init>(Ll/dgq0;)V
    .locals 2
    .param p1    # Ll/dgq0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_5

    .line 5
    .line 6
    iget-object p1, p1, Ll/dgq0;->a:Ll/dgq0$k;

    .line 7
    .line 8
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    const/16 v1, 0x1e

    .line 11
    .line 12
    if-lt v0, v1, :cond_0

    .line 13
    .line 14
    instance-of v1, p1, Ll/dgq0$j;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v0, Ll/dgq0$j;

    .line 19
    .line 20
    move-object v1, p1

    .line 21
    check-cast v1, Ll/dgq0$j;

    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Ll/dgq0$j;-><init>(Ll/dgq0;Ll/dgq0$j;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/16 v1, 0x1d

    .line 30
    .line 31
    if-lt v0, v1, :cond_1

    .line 32
    .line 33
    instance-of v1, p1, Ll/dgq0$i;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    new-instance v0, Ll/dgq0$i;

    .line 38
    .line 39
    move-object v1, p1

    .line 40
    check-cast v1, Ll/dgq0$i;

    .line 41
    .line 42
    invoke-direct {v0, p0, v1}, Ll/dgq0$i;-><init>(Ll/dgq0;Ll/dgq0$i;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/16 v1, 0x1c

    .line 49
    .line 50
    if-lt v0, v1, :cond_2

    .line 51
    .line 52
    instance-of v0, p1, Ll/dgq0$h;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    new-instance v0, Ll/dgq0$h;

    .line 57
    .line 58
    move-object v1, p1

    .line 59
    check-cast v1, Ll/dgq0$h;

    .line 60
    .line 61
    invoke-direct {v0, p0, v1}, Ll/dgq0$h;-><init>(Ll/dgq0;Ll/dgq0$h;)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    instance-of v0, p1, Ll/dgq0$g;

    .line 68
    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    new-instance v0, Ll/dgq0$g;

    .line 72
    .line 73
    move-object v1, p1

    .line 74
    check-cast v1, Ll/dgq0$g;

    .line 75
    .line 76
    invoke-direct {v0, p0, v1}, Ll/dgq0$g;-><init>(Ll/dgq0;Ll/dgq0$g;)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    instance-of v0, p1, Ll/dgq0$f;

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    new-instance v0, Ll/dgq0$f;

    .line 87
    .line 88
    move-object v1, p1

    .line 89
    check-cast v1, Ll/dgq0$f;

    .line 90
    .line 91
    invoke-direct {v0, p0, v1}, Ll/dgq0$f;-><init>(Ll/dgq0;Ll/dgq0$f;)V

    .line 92
    .line 93
    .line 94
    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    new-instance v0, Ll/dgq0$k;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Ll/dgq0$k;-><init>(Ll/dgq0;)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 103
    .line 104
    :goto_0
    invoke-virtual {p1, p0}, Ll/dgq0$k;->e(Ll/dgq0;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_5
    new-instance p1, Ll/dgq0$k;

    .line 109
    .line 110
    invoke-direct {p1, p0}, Ll/dgq0$k;-><init>(Ll/dgq0;)V

    .line 111
    .line 112
    .line 113
    iput-object p1, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 114
    .line 115
    return-void
.end method

.method public static n(Ll/svm;IIII)Ll/svm;
    .locals 5
    .param p0    # Ll/svm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Ll/svm;->a:I

    .line 2
    .line 3
    sub-int/2addr v0, p1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v2, p0, Ll/svm;->b:I

    .line 10
    .line 11
    sub-int/2addr v2, p2

    .line 12
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget v3, p0, Ll/svm;->c:I

    .line 17
    .line 18
    sub-int/2addr v3, p3

    .line 19
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    iget v4, p0, Ll/svm;->d:I

    .line 24
    .line 25
    sub-int/2addr v4, p4

    .line 26
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-ne v0, p1, :cond_0

    .line 31
    .line 32
    if-ne v2, p2, :cond_0

    .line 33
    .line 34
    if-ne v3, p3, :cond_0

    .line 35
    .line 36
    if-ne v1, p4, :cond_0

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_0
    invoke-static {v0, v2, v3, v1}, Ll/svm;->b(IIII)Ll/svm;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static w(Landroid/view/WindowInsets;)Ll/dgq0;
    .locals 1
    .param p0    # Landroid/view/WindowInsets;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x14
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/dgq0;->x(Landroid/view/WindowInsets;Landroid/view/View;)Ll/dgq0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static x(Landroid/view/WindowInsets;Landroid/view/View;)Ll/dgq0;
    .locals 1
    .param p0    # Landroid/view/WindowInsets;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x14
    .end annotation

    .line 1
    new-instance v0, Ll/dgq0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/yn80;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/WindowInsets;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/dgq0;-><init>(Landroid/view/WindowInsets;)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Ll/kkl0;->D(Landroid/view/View;)Ll/dgq0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ll/dgq0;->t(Ll/dgq0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Ll/dgq0;->d(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-object v0
.end method


# virtual methods
.method public a()Ll/dgq0;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->a()Ll/dgq0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Ll/dgq0;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->b()Ll/dgq0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Ll/dgq0;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->c()Ll/dgq0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgq0$k;->d(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Ll/t5e;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->f()Ll/t5e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Ll/dgq0;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    check-cast p1, Ll/dgq0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 14
    .line 15
    iget-object p1, p1, Ll/dgq0;->a:Ll/dgq0$k;

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/l950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public f(I)Ll/svm;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgq0$k;->g(I)Ll/svm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->i()Ll/svm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Ll/svm;->b:I

    .line 8
    .line 9
    return p0
.end method

.method public h()Ll/svm;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->i()Ll/svm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

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
    invoke-virtual {p0}, Ll/dgq0$k;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public i()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->k()Ll/svm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Ll/svm;->d:I

    .line 8
    .line 9
    return p0
.end method

.method public j()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->k()Ll/svm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Ll/svm;->a:I

    .line 8
    .line 9
    return p0
.end method

.method public k()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->k()Ll/svm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Ll/svm;->c:I

    .line 8
    .line 9
    return p0
.end method

.method public l()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->k()Ll/svm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Ll/svm;->b:I

    .line 8
    .line 9
    return p0
.end method

.method public m()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->k()Ll/svm;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Ll/svm;->e:Ll/svm;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/svm;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$k;->m()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgq0$k;->o(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public q(IIII)Ll/dgq0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ll/dgq0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dgq0$a;-><init>(Ll/dgq0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2, p3, p4}, Ll/svm;->b(IIII)Ll/svm;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ll/dgq0$a;->c(Ll/svm;)Ll/dgq0$a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/dgq0$a;->a()Ll/dgq0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public r([Ll/svm;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgq0$k;->p([Ll/svm;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ll/svm;)V
    .locals 0
    .param p1    # Ll/svm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgq0$k;->q(Ll/svm;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Ll/dgq0;)V
    .locals 0
    .param p1    # Ll/dgq0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgq0$k;->r(Ll/dgq0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Ll/svm;)V
    .locals 0
    .param p1    # Ll/svm;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgq0$k;->s(Ll/svm;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v()Landroid/view/WindowInsets;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x14
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0;->a:Ll/dgq0$k;

    .line 2
    .line 3
    instance-of v0, p0, Ll/dgq0$f;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/dgq0$f;

    .line 8
    .line 9
    iget-object p0, p0, Ll/dgq0$f;->c:Landroid/view/WindowInsets;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method
