.class public Ll/du2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z = false

.field public static b:Ll/syv; = null

.field public static c:Ll/cjk0; = null

.field public static d:Z = false

.field public static e:Landroid/content/Context; = null

.field public static f:J = 0x0L

.field public static g:I = 0x0

.field public static h:Ljava/lang/String; = ""

.field public static i:Z

.field public static j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field public static k:Ll/hvl;

.field public static l:Ljava/lang/String;

.field public static m:Ll/q3k0;

.field public static n:Ll/yqf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yqf0<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static volatile o:Z

.field public static p:Ljava/lang/String;

.field public static q:Ljava/lang/String;

.field public static r:Ll/ywd0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/du2;->j:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v0, Ll/du2$a;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/du2$a;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/du2;->n:Ll/yqf0;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(Ljava/util/Date;Ljava/lang/String;JLl/b3k0;)V
    .locals 6
    .param p4    # Ll/b3k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/du2;->b:Ll/syv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string p1, "Please init Beatles!!!"

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    move-object v1, p0

    .line 15
    move-object v2, p1

    .line 16
    move-wide v3, p2

    .line 17
    move-object v5, p4

    .line 18
    invoke-virtual/range {v0 .. v5}, Ll/syv;->m(Ljava/util/Date;Ljava/lang/String;JLl/b3k0;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static B(Ljava/util/List;Ljava/lang/String;JLl/b3k0;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/b3k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Date;",
            ">;",
            "Ljava/lang/String;",
            "J",
            "Ll/b3k0;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/util/Date;

    .line 26
    .line 27
    invoke-static {v0, p1, p2, p3, p4}, Ll/du2;->A(Ljava/util/Date;Ljava/lang/String;JLl/b3k0;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    :goto_1
    return-void
.end method

.method public static C(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/du2;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public static D(Ll/hvl;)V
    .locals 0

    .line 1
    sput-object p0, Ll/du2;->k:Ll/hvl;

    .line 2
    .line 3
    return-void
.end method

.method public static E(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/du2;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public static F(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Ll/du2;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static G(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Ll/du2;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static H(I)V
    .locals 0

    .line 1
    sput p0, Ll/du2;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public static I(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Ll/du2;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static varargs a([Ljava/lang/Class;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Ll/du2;->j:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static varargs b([Ll/ioi0;)V
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    sget-boolean v0, Ll/du2;->d:Z

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string p0, "Please init Beatles first!"

    .line 10
    .line 11
    new-array v0, v1, [Ljava/lang/Object;

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    array-length v0, p0

    .line 18
    :goto_0
    if-ge v1, v0, :cond_2

    .line 19
    .line 20
    aget-object v2, p0, v1

    .line 21
    .line 22
    sget-object v3, Ll/du2;->c:Ll/cjk0;

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/cjk0;->k()Ljava/util/HashSet;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    sget-object v3, Ll/du2;->e:Landroid/content/Context;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ll/ioi0;->n(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/m1c;->b()Ll/m1c;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v2}, Ll/ioi0;->k()Ll/f6m;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v3, v2}, Ll/m1c;->a(Ll/f6m;)V

    .line 45
    .line 46
    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    :goto_1
    return-void
.end method

.method public static c()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/du2;->b:Ll/syv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v1, "Please init Beatles and Enable log!!!"

    .line 9
    .line 10
    invoke-static {v1, v0}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    return-object v0

    .line 15
    :cond_0
    invoke-virtual {v0}, Ll/syv;->j()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static d()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static e()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->e:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static f()Ljava/lang/String;
    .locals 2

    .line 1
    sget-boolean v0, Ll/du2;->d:Z

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    sget-object v0, Ll/du2;->c:Ll/cjk0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/cjk0;->d()Ll/r4f;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ll/r4f;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0

    .line 21
    :cond_1
    return-object v1
.end method

.method public static g()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/du2;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object v0
.end method

.method public static h()Ll/rg50;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->k:Ll/hvl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ll/hvl;->a()Ll/rg50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static i()Ll/hvl;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->k:Ll/hvl;

    .line 2
    .line 3
    return-object v0
.end method

.method public static j()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static k()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static l(Ljava/lang/String;)Ll/c610;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-boolean v0, Ll/du2;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    sget-object v0, Ll/du2;->c:Ll/cjk0;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/cjk0;->h(Ljava/lang/String;)Ll/c610;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static m()Ll/j5m;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/j5m<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/du2;->c:Ll/cjk0;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/cjk0;->j:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Ll/cjk0;->k:Ll/j5m;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return-object v0
.end method

.method public static n()Ll/ywd0;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->r:Ll/ywd0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static o()Ll/q3k0;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->m:Ll/q3k0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static p()Ll/cjk0;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->c:Ll/cjk0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static q()I
    .locals 1

    .line 1
    sget v0, Ll/du2;->g:I

    .line 2
    .line 3
    return v0
.end method

.method public static r()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static s(Landroid/content/Context;Ljava/lang/String;Ll/cjk0;ZLl/ywd0;)V
    .locals 1
    .param p2    # Ll/cjk0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-boolean v0, Ll/du2;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sput-object p4, Ll/du2;->r:Ll/ywd0;

    .line 7
    .line 8
    sput-boolean p3, Ll/du2;->a:Z

    .line 9
    .line 10
    sput-object p1, Ll/du2;->l:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p3}, Ll/f610;->e(Z)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    const-string p0, "[init] context of init() is null, check it."

    .line 19
    .line 20
    new-array p1, p1, [Ljava/lang/Object;

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    if-nez p2, :cond_2

    .line 27
    .line 28
    const-string p0, "[init] userStrategy of init() is null, check it."

    .line 29
    .line 30
    new-array p1, p1, [Ljava/lang/Object;

    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-virtual {p2}, Ll/cjk0;->e()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    if-eqz p3, :cond_3

    .line 45
    .line 46
    const-string p0, "[init] fileDir is invalid, check it."

    .line 47
    .line 48
    new-array p1, p1, [Ljava/lang/Object;

    .line 49
    .line 50
    invoke-static {p0, p1}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_3
    sput-object p0, Ll/du2;->e:Landroid/content/Context;

    .line 55
    .line 56
    sput-object p2, Ll/du2;->c:Ll/cjk0;

    .line 57
    .line 58
    invoke-static {p0}, Ll/vc60;->g(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    new-instance p1, Ll/q3k0;

    .line 62
    .line 63
    invoke-virtual {p2}, Ll/cjk0;->f()Ll/yul;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-direct {p1, p3}, Ll/q3k0;-><init>(Ll/yul;)V

    .line 68
    .line 69
    .line 70
    sput-object p1, Ll/du2;->m:Ll/q3k0;

    .line 71
    .line 72
    move-object p1, p0

    .line 73
    check-cast p1, Landroid/app/Application;

    .line 74
    .line 75
    invoke-static {p1}, Ll/zy0;->f(Landroid/app/Application;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2}, Ll/cjk0;->i()Ljava/util/HashSet;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result p3

    .line 90
    if-eqz p3, :cond_4

    .line 91
    .line 92
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p3

    .line 96
    check-cast p3, Ll/c610;

    .line 97
    .line 98
    invoke-virtual {p2}, Ll/cjk0;->c()Ll/x3f;

    .line 99
    .line 100
    .line 101
    move-result-object p4

    .line 102
    invoke-virtual {p3, p0, p4}, Ll/c610;->g(Landroid/content/Context;Ll/x3f;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p3}, Ll/du2;->x(Ll/c610;)V

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_4
    sget-object p1, Ll/du2;->c:Ll/cjk0;

    .line 110
    .line 111
    invoke-virtual {p1}, Ll/cjk0;->b()Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_5

    .line 116
    .line 117
    sget-object p1, Ll/du2;->c:Ll/cjk0;

    .line 118
    .line 119
    invoke-virtual {p1}, Ll/cjk0;->g()Ll/qyv;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    if-eqz p1, :cond_5

    .line 124
    .line 125
    new-instance p1, Ll/syv;

    .line 126
    .line 127
    sget-object p2, Ll/du2;->c:Ll/cjk0;

    .line 128
    .line 129
    invoke-direct {p1, p0, p2}, Ll/syv;-><init>(Landroid/content/Context;Ll/cjk0;)V

    .line 130
    .line 131
    .line 132
    sput-object p1, Ll/du2;->b:Ll/syv;

    .line 133
    .line 134
    sget-object p1, Ll/du2;->c:Ll/cjk0;

    .line 135
    .line 136
    invoke-virtual {p1}, Ll/cjk0;->i()Ljava/util/HashSet;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    if-eqz p2, :cond_5

    .line 149
    .line 150
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    check-cast p2, Ll/c610;

    .line 155
    .line 156
    new-instance p3, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-interface {p2}, Ll/f0m;->a()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p4

    .line 165
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string p4, " inited:"

    .line 169
    .line 170
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p2}, Ll/c610;->h()Z

    .line 174
    .line 175
    .line 176
    move-result p2

    .line 177
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    const-string p3, "[beatles]"

    .line 185
    .line 186
    invoke-static {p3, p2}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_5
    invoke-static {}, Ll/a5f;->m()Ll/a5f;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p1}, Ll/a5f;->l()V

    .line 195
    .line 196
    .line 197
    invoke-static {p0}, Lcom/tantanapp/beatles/NetConnectivityReceiver;->registerConnectivityReceiver(Landroid/content/Context;)V

    .line 198
    .line 199
    .line 200
    const/4 p0, 0x1

    .line 201
    sput-boolean p0, Ll/du2;->d:Z

    .line 202
    .line 203
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 204
    .line 205
    .line 206
    move-result-wide p0

    .line 207
    sput-wide p0, Ll/du2;->f:J

    .line 208
    .line 209
    return-void
.end method

.method public static t()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/du2;->o:Z

    .line 2
    .line 3
    return v0
.end method

.method public static u()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/du2;->a:Z

    .line 2
    .line 3
    return v0
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/du2;->b:Ll/syv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string p1, "Please init Beatles and Enable log!!!"

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {v0, p0, p1}, Ll/syv;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static w()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/du2;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/a5f;->m()Ll/a5f;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/a5f;->o()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static x(Ll/c610;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/c610;->d()Ll/x2f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Ll/w2f;->b(Ll/x2f;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-interface {p0}, Ll/f0m;->getEventType()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    sget-object v0, Ll/du2;->m:Ll/q3k0;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/q3k0;->n(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public static y(Ljava/lang/String;J)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p0, p1, p2}, Ll/fki;->b(Ljava/lang/String;J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static z(Ljava/util/List;J)V
    .locals 0
    .param p1    # J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;J)V"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p0, p1, p2}, Ll/fki;->c(Ljava/util/List;J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
