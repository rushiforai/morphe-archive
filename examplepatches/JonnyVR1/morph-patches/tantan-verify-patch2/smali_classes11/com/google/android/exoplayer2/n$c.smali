.class public final Lcom/google/android/exoplayer2/n$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Landroid/net/Uri;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Lcom/google/android/exoplayer2/n$d$a;

.field public e:Lcom/google/android/exoplayer2/n$f$a;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/offline/StreamKey;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/android/exoplayer2/n$k;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/google/android/exoplayer2/n$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:Lcom/google/android/exoplayer2/o;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public l:Lcom/google/android/exoplayer2/n$g$a;

.field public m:Lcom/google/android/exoplayer2/n$i;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Lcom/google/android/exoplayer2/n$d$a;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/n$d$a;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->d:Lcom/google/android/exoplayer2/n$d$a;

    .line 84
    new-instance v0, Lcom/google/android/exoplayer2/n$f$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/n$f$a;-><init>(Lcom/google/android/exoplayer2/n$a;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->e:Lcom/google/android/exoplayer2/n$f$a;

    .line 85
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->f:Ljava/util/List;

    .line 86
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->h:Lcom/google/common/collect/ImmutableList;

    .line 87
    new-instance v0, Lcom/google/android/exoplayer2/n$g$a;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/n$g$a;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->l:Lcom/google/android/exoplayer2/n$g$a;

    .line 88
    sget-object v0, Lcom/google/android/exoplayer2/n$i;->d:Lcom/google/android/exoplayer2/n$i;

    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->m:Lcom/google/android/exoplayer2/n$i;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/n;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/n$c;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->f:Lcom/google/android/exoplayer2/n$d;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$d;->b()Lcom/google/android/exoplayer2/n$d$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->d:Lcom/google/android/exoplayer2/n$d$a;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->a:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->a:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->e:Lcom/google/android/exoplayer2/o;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->k:Lcom/google/android/exoplayer2/o;

    .line 19
    .line 20
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$g;->b()Lcom/google/android/exoplayer2/n$g$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->l:Lcom/google/android/exoplayer2/n$g$a;

    .line 27
    .line 28
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->h:Lcom/google/android/exoplayer2/n$i;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->m:Lcom/google/android/exoplayer2/n$i;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$h;->f:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->g:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$h;->b:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->c:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$h;->a:Landroid/net/Uri;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->b:Landroid/net/Uri;

    .line 47
    .line 48
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$h;->e:Ljava/util/List;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->f:Ljava/util/List;

    .line 51
    .line 52
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$h;->g:Lcom/google/common/collect/ImmutableList;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->h:Lcom/google/common/collect/ImmutableList;

    .line 55
    .line 56
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$h;->i:Ljava/lang/Object;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->j:Ljava/lang/Object;

    .line 59
    .line 60
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$h;->c:Lcom/google/android/exoplayer2/n$f;

    .line 61
    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$f;->c()Lcom/google/android/exoplayer2/n$f$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/n$f$a;

    .line 70
    .line 71
    const/4 v1, 0x0

    .line 72
    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/n$f$a;-><init>(Lcom/google/android/exoplayer2/n$a;)V

    .line 73
    .line 74
    .line 75
    :goto_0
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$c;->e:Lcom/google/android/exoplayer2/n$f$a;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/google/android/exoplayer2/n$h;->d:Lcom/google/android/exoplayer2/n$b;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$c;->i:Lcom/google/android/exoplayer2/n$b;

    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/n$a;)V
    .locals 0

    .line 89
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/n$c;-><init>(Lcom/google/android/exoplayer2/n;)V

    return-void
.end method


# virtual methods
.method public a()Lcom/google/android/exoplayer2/n;
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/n$c;->e:Lcom/google/android/exoplayer2/n$f$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/n$f$a;->e(Lcom/google/android/exoplayer2/n$f$a;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/n$c;->e:Lcom/google/android/exoplayer2/n$f$a;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/android/exoplayer2/n$f$a;->f(Lcom/google/android/exoplayer2/n$f$a;)Ljava/util/UUID;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 21
    :goto_1
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/google/android/exoplayer2/n$c;->b:Landroid/net/Uri;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    if-eqz v2, :cond_3

    .line 28
    .line 29
    new-instance v1, Lcom/google/android/exoplayer2/n$h;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/google/android/exoplayer2/n$c;->c:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v4, p0, Lcom/google/android/exoplayer2/n$c;->e:Lcom/google/android/exoplayer2/n$f$a;

    .line 34
    .line 35
    invoke-static {v4}, Lcom/google/android/exoplayer2/n$f$a;->f(Lcom/google/android/exoplayer2/n$f$a;)Ljava/util/UUID;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    if-eqz v4, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, Lcom/google/android/exoplayer2/n$c;->e:Lcom/google/android/exoplayer2/n$f$a;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$f$a;->i()Lcom/google/android/exoplayer2/n$f;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    :cond_2
    move-object v4, v0

    .line 48
    iget-object v5, p0, Lcom/google/android/exoplayer2/n$c;->i:Lcom/google/android/exoplayer2/n$b;

    .line 49
    .line 50
    iget-object v6, p0, Lcom/google/android/exoplayer2/n$c;->f:Ljava/util/List;

    .line 51
    .line 52
    iget-object v7, p0, Lcom/google/android/exoplayer2/n$c;->g:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v8, p0, Lcom/google/android/exoplayer2/n$c;->h:Lcom/google/common/collect/ImmutableList;

    .line 55
    .line 56
    iget-object v9, p0, Lcom/google/android/exoplayer2/n$c;->j:Ljava/lang/Object;

    .line 57
    .line 58
    const/4 v10, 0x0

    .line 59
    invoke-direct/range {v1 .. v10}, Lcom/google/android/exoplayer2/n$h;-><init>(Landroid/net/Uri;Ljava/lang/String;Lcom/google/android/exoplayer2/n$f;Lcom/google/android/exoplayer2/n$b;Ljava/util/List;Ljava/lang/String;Lcom/google/common/collect/ImmutableList;Ljava/lang/Object;Lcom/google/android/exoplayer2/n$a;)V

    .line 60
    .line 61
    .line 62
    move-object v5, v1

    .line 63
    goto :goto_2

    .line 64
    :cond_3
    move-object v5, v0

    .line 65
    :goto_2
    new-instance v2, Lcom/google/android/exoplayer2/n;

    .line 66
    .line 67
    iget-object v0, p0, Lcom/google/android/exoplayer2/n$c;->a:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    :goto_3
    move-object v3, v0

    .line 72
    goto :goto_4

    .line 73
    :cond_4
    const-string v0, ""

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :goto_4
    iget-object v0, p0, Lcom/google/android/exoplayer2/n$c;->d:Lcom/google/android/exoplayer2/n$d$a;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$d$a;->g()Lcom/google/android/exoplayer2/n$e;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    iget-object v0, p0, Lcom/google/android/exoplayer2/n$c;->l:Lcom/google/android/exoplayer2/n$g$a;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$g$a;->f()Lcom/google/android/exoplayer2/n$g;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    iget-object v0, p0, Lcom/google/android/exoplayer2/n$c;->k:Lcom/google/android/exoplayer2/o;

    .line 89
    .line 90
    if-eqz v0, :cond_5

    .line 91
    .line 92
    :goto_5
    move-object v7, v0

    .line 93
    goto :goto_6

    .line 94
    :cond_5
    sget-object v0, Lcom/google/android/exoplayer2/o;->I:Lcom/google/android/exoplayer2/o;

    .line 95
    .line 96
    goto :goto_5

    .line 97
    :goto_6
    iget-object v8, p0, Lcom/google/android/exoplayer2/n$c;->m:Lcom/google/android/exoplayer2/n$i;

    .line 98
    .line 99
    const/4 v9, 0x0

    .line 100
    invoke-direct/range {v2 .. v9}, Lcom/google/android/exoplayer2/n;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/n$e;Lcom/google/android/exoplayer2/n$h;Lcom/google/android/exoplayer2/n$g;Lcom/google/android/exoplayer2/o;Lcom/google/android/exoplayer2/n$i;Lcom/google/android/exoplayer2/n$a;)V

    .line 101
    .line 102
    .line 103
    return-object v2
.end method

.method public b(Lcom/google/android/exoplayer2/n$g;)Lcom/google/android/exoplayer2/n$c;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/n$g;->b()Lcom/google/android/exoplayer2/n$g$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$c;->l:Lcom/google/android/exoplayer2/n$g$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public c(Ljava/lang/String;)Lcom/google/android/exoplayer2/n$c;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$c;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public d(Ljava/util/List;)Lcom/google/android/exoplayer2/n$c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/n$k;",
            ">;)",
            "Lcom/google/android/exoplayer2/n$c;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$c;->h:Lcom/google/common/collect/ImmutableList;

    .line 6
    .line 7
    return-object p0
.end method

.method public e(Ljava/lang/Object;)Lcom/google/android/exoplayer2/n$c;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$c;->j:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Landroid/net/Uri;)Lcom/google/android/exoplayer2/n$c;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$c;->b:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ljava/lang/String;)Lcom/google/android/exoplayer2/n$c;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/n$c;->f(Landroid/net/Uri;)Lcom/google/android/exoplayer2/n$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
