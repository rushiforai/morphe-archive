.class public final Lcom/google/android/exoplayer2/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/n$e;,
        Lcom/google/android/exoplayer2/n$h;,
        Lcom/google/android/exoplayer2/n$g;,
        Lcom/google/android/exoplayer2/n$i;,
        Lcom/google/android/exoplayer2/n$c;,
        Lcom/google/android/exoplayer2/n$d;,
        Lcom/google/android/exoplayer2/n$j;,
        Lcom/google/android/exoplayer2/n$k;,
        Lcom/google/android/exoplayer2/n$b;,
        Lcom/google/android/exoplayer2/n$f;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final i:Lcom/google/android/exoplayer2/n;

.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;

.field public static final l:Ljava/lang/String;

.field public static final m:Ljava/lang/String;

.field public static final n:Ljava/lang/String;

.field public static final o:Ljava/lang/String;

.field public static final p:Lcom/google/android/exoplayer2/e$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/e$a<",
            "Lcom/google/android/exoplayer2/n;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/google/android/exoplayer2/n$h;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Lcom/google/android/exoplayer2/n$h;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final d:Lcom/google/android/exoplayer2/n$g;

.field public final e:Lcom/google/android/exoplayer2/o;

.field public final f:Lcom/google/android/exoplayer2/n$d;

.field public final g:Lcom/google/android/exoplayer2/n$e;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final h:Lcom/google/android/exoplayer2/n$i;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$c;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/exoplayer2/n$c;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$c;->a()Lcom/google/android/exoplayer2/n;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/google/android/exoplayer2/n;->i:Lcom/google/android/exoplayer2/n;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/google/android/exoplayer2/n;->j:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Lcom/google/android/exoplayer2/n;->k:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/google/android/exoplayer2/n;->l:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lcom/google/android/exoplayer2/n;->m:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v0, 0x4

    .line 41
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/google/android/exoplayer2/n;->n:Ljava/lang/String;

    .line 46
    .line 47
    const/4 v0, 0x5

    .line 48
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sput-object v0, Lcom/google/android/exoplayer2/n;->o:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v0, Ll/ssx;

    .line 55
    .line 56
    invoke-direct {v0}, Ll/ssx;-><init>()V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/google/android/exoplayer2/n;->p:Lcom/google/android/exoplayer2/e$a;

    .line 60
    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer2/n$e;Lcom/google/android/exoplayer2/n$h;Lcom/google/android/exoplayer2/n$g;Lcom/google/android/exoplayer2/o;Lcom/google/android/exoplayer2/n$i;)V
    .locals 0
    .param p3    # Lcom/google/android/exoplayer2/n$h;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/n;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/google/android/exoplayer2/n;->c:Lcom/google/android/exoplayer2/n$h;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/google/android/exoplayer2/n;->e:Lcom/google/android/exoplayer2/o;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/google/android/exoplayer2/n;->g:Lcom/google/android/exoplayer2/n$e;

    .line 17
    .line 18
    iput-object p6, p0, Lcom/google/android/exoplayer2/n;->h:Lcom/google/android/exoplayer2/n$i;

    .line 19
    .line 20
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer2/n$e;Lcom/google/android/exoplayer2/n$h;Lcom/google/android/exoplayer2/n$g;Lcom/google/android/exoplayer2/o;Lcom/google/android/exoplayer2/n$i;Lcom/google/android/exoplayer2/n$a;)V
    .locals 0

    .line 21
    invoke-direct/range {p0 .. p6}, Lcom/google/android/exoplayer2/n;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/n$e;Lcom/google/android/exoplayer2/n$h;Lcom/google/android/exoplayer2/n$g;Lcom/google/android/exoplayer2/o;Lcom/google/android/exoplayer2/n$i;)V

    return-void
.end method

.method public static synthetic a(Landroid/os/Bundle;)Lcom/google/android/exoplayer2/n;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/android/exoplayer2/n;->c(Landroid/os/Bundle;)Lcom/google/android/exoplayer2/n;

    move-result-object p0

    return-object p0
.end method

.method public static c(Landroid/os/Bundle;)Lcom/google/android/exoplayer2/n;
    .locals 8

    .line 1
    sget-object v0, Lcom/google/android/exoplayer2/n;->j:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    move-object v2, v0

    .line 14
    check-cast v2, Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Lcom/google/android/exoplayer2/n;->k:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    sget-object v0, Lcom/google/android/exoplayer2/n$g;->f:Lcom/google/android/exoplayer2/n$g;

    .line 25
    .line 26
    :goto_0
    move-object v5, v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    sget-object v1, Lcom/google/android/exoplayer2/n$g;->l:Lcom/google/android/exoplayer2/e$a;

    .line 29
    .line 30
    invoke-interface {v1, v0}, Lcom/google/android/exoplayer2/e$a;->a(Landroid/os/Bundle;)Lcom/google/android/exoplayer2/e;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/google/android/exoplayer2/n$g;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :goto_1
    sget-object v0, Lcom/google/android/exoplayer2/n;->l:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    sget-object v0, Lcom/google/android/exoplayer2/o;->I:Lcom/google/android/exoplayer2/o;

    .line 46
    .line 47
    :goto_2
    move-object v6, v0

    .line 48
    goto :goto_3

    .line 49
    :cond_1
    sget-object v1, Lcom/google/android/exoplayer2/o;->S0:Lcom/google/android/exoplayer2/e$a;

    .line 50
    .line 51
    invoke-interface {v1, v0}, Lcom/google/android/exoplayer2/e$a;->a(Landroid/os/Bundle;)Lcom/google/android/exoplayer2/e;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/google/android/exoplayer2/o;

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :goto_3
    sget-object v0, Lcom/google/android/exoplayer2/n;->m:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    sget-object v0, Lcom/google/android/exoplayer2/n$e;->m:Lcom/google/android/exoplayer2/n$e;

    .line 67
    .line 68
    :goto_4
    move-object v3, v0

    .line 69
    goto :goto_5

    .line 70
    :cond_2
    sget-object v1, Lcom/google/android/exoplayer2/n$d;->l:Lcom/google/android/exoplayer2/e$a;

    .line 71
    .line 72
    invoke-interface {v1, v0}, Lcom/google/android/exoplayer2/e$a;->a(Landroid/os/Bundle;)Lcom/google/android/exoplayer2/e;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/google/android/exoplayer2/n$e;

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :goto_5
    sget-object v0, Lcom/google/android/exoplayer2/n;->n:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    if-nez v0, :cond_3

    .line 86
    .line 87
    sget-object v0, Lcom/google/android/exoplayer2/n$i;->d:Lcom/google/android/exoplayer2/n$i;

    .line 88
    .line 89
    :goto_6
    move-object v7, v0

    .line 90
    goto :goto_7

    .line 91
    :cond_3
    sget-object v1, Lcom/google/android/exoplayer2/n$i;->h:Lcom/google/android/exoplayer2/e$a;

    .line 92
    .line 93
    invoke-interface {v1, v0}, Lcom/google/android/exoplayer2/e$a;->a(Landroid/os/Bundle;)Lcom/google/android/exoplayer2/e;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/google/android/exoplayer2/n$i;

    .line 98
    .line 99
    goto :goto_6

    .line 100
    :goto_7
    sget-object v0, Lcom/google/android/exoplayer2/n;->o:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    if-nez p0, :cond_4

    .line 107
    .line 108
    const/4 p0, 0x0

    .line 109
    :goto_8
    move-object v4, p0

    .line 110
    goto :goto_9

    .line 111
    :cond_4
    sget-object v0, Lcom/google/android/exoplayer2/n$h;->q:Lcom/google/android/exoplayer2/e$a;

    .line 112
    .line 113
    invoke-interface {v0, p0}, Lcom/google/android/exoplayer2/e$a;->a(Landroid/os/Bundle;)Lcom/google/android/exoplayer2/e;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    check-cast p0, Lcom/google/android/exoplayer2/n$h;

    .line 118
    .line 119
    goto :goto_8

    .line 120
    :goto_9
    new-instance v1, Lcom/google/android/exoplayer2/n;

    .line 121
    .line 122
    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer2/n;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/n$e;Lcom/google/android/exoplayer2/n$h;Lcom/google/android/exoplayer2/n$g;Lcom/google/android/exoplayer2/o;Lcom/google/android/exoplayer2/n$i;)V

    .line 123
    .line 124
    .line 125
    return-object v1
.end method

.method public static d(Ljava/lang/String;)Lcom/google/android/exoplayer2/n;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$c;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/exoplayer2/n$c;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/n$c;->g(Ljava/lang/String;)Lcom/google/android/exoplayer2/n$c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/n$c;->a()Lcom/google/android/exoplayer2/n;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method private e(Z)Landroid/os/Bundle;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v2, ""

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    sget-object v1, Lcom/google/android/exoplayer2/n;->j:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/google/android/exoplayer2/n;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 24
    .line 25
    sget-object v2, Lcom/google/android/exoplayer2/n$g;->f:Lcom/google/android/exoplayer2/n$g;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/n$g;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    sget-object v1, Lcom/google/android/exoplayer2/n;->k:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/n$g;->toBundle()Landroid/os/Bundle;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->e:Lcom/google/android/exoplayer2/o;

    .line 45
    .line 46
    sget-object v2, Lcom/google/android/exoplayer2/o;->I:Lcom/google/android/exoplayer2/o;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/o;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_2

    .line 53
    .line 54
    sget-object v1, Lcom/google/android/exoplayer2/n;->l:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/google/android/exoplayer2/n;->e:Lcom/google/android/exoplayer2/o;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/o;->toBundle()Landroid/os/Bundle;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 66
    .line 67
    sget-object v2, Lcom/google/android/exoplayer2/n$d;->f:Lcom/google/android/exoplayer2/n$d;

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/n$d;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_3

    .line 74
    .line 75
    sget-object v1, Lcom/google/android/exoplayer2/n;->m:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v2, p0, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/n$d;->toBundle()Landroid/os/Bundle;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->h:Lcom/google/android/exoplayer2/n$i;

    .line 87
    .line 88
    sget-object v2, Lcom/google/android/exoplayer2/n$i;->d:Lcom/google/android/exoplayer2/n$i;

    .line 89
    .line 90
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/n$i;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_4

    .line 95
    .line 96
    sget-object v1, Lcom/google/android/exoplayer2/n;->n:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v2, p0, Lcom/google/android/exoplayer2/n;->h:Lcom/google/android/exoplayer2/n$i;

    .line 99
    .line 100
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/n$i;->toBundle()Landroid/os/Bundle;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 105
    .line 106
    .line 107
    :cond_4
    if-eqz p1, :cond_5

    .line 108
    .line 109
    iget-object p0, p0, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 110
    .line 111
    if-eqz p0, :cond_5

    .line 112
    .line 113
    sget-object p1, Lcom/google/android/exoplayer2/n;->o:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/n$h;->toBundle()Landroid/os/Bundle;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {v0, p1, p0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 120
    .line 121
    .line 122
    :cond_5
    return-object v0
.end method


# virtual methods
.method public b()Lcom/google/android/exoplayer2/n$c;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/n$c;-><init>(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/n$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/google/android/exoplayer2/n;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/google/android/exoplayer2/n;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->a:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/google/android/exoplayer2/n;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer2/n$d;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 36
    .line 37
    invoke-static {v1, v3}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 46
    .line 47
    invoke-static {v1, v3}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->e:Lcom/google/android/exoplayer2/o;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/google/android/exoplayer2/n;->e:Lcom/google/android/exoplayer2/o;

    .line 56
    .line 57
    invoke-static {v1, v3}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object p0, p0, Lcom/google/android/exoplayer2/n;->h:Lcom/google/android/exoplayer2/n$i;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/google/android/exoplayer2/n;->h:Lcom/google/android/exoplayer2/n$i;

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    return v0

    .line 74
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/n;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/n$h;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, 0x0

    .line 19
    :goto_0
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x1f

    .line 21
    .line 22
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/n$g;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x1f

    .line 30
    .line 31
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/n$d;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x1f

    .line 39
    .line 40
    iget-object v1, p0, Lcom/google/android/exoplayer2/n;->e:Lcom/google/android/exoplayer2/o;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/o;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x1f

    .line 48
    .line 49
    iget-object p0, p0, Lcom/google/android/exoplayer2/n;->h:Lcom/google/android/exoplayer2/n$i;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/n$i;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    add-int/2addr v0, p0

    .line 56
    return v0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/n;->e(Z)Landroid/os/Bundle;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method
