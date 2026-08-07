.class public final Ll/dj70$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dj70;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/data/Moment;

.field public b:Ljava/lang/String;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Lcom/p1/mobile/putong/data/User;

.field public g:Lcom/p1/mobile/putong/feed/data/RawFeed;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:I

.field public j:Landroid/os/Bundle;

.field public k:Ll/n570;

.field public l:Ll/t6i;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


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

.method public static a()Ll/dj70$a;
    .locals 1

    .line 1
    new-instance v0, Ll/dj70$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dj70$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Ll/dj70;
    .locals 3

    .line 1
    new-instance v0, Ll/dj70;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/dj70;-><init>(Ll/ej70;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Ll/dj70$a;->k:Ll/n570;

    .line 8
    .line 9
    iput-object v1, v0, Ll/dj70;->j:Ll/n570;

    .line 10
    .line 11
    iget-object v1, p0, Ll/dj70$a;->f:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 16
    .line 17
    iget-object v2, p0, Ll/dj70$a;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    :cond_0
    iget-object v1, p0, Ll/dj70$a;->g:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 28
    .line 29
    iput-object v1, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 30
    .line 31
    iget v1, p0, Ll/dj70$a;->i:I

    .line 32
    .line 33
    iput v1, v0, Ll/dj70;->h:I

    .line 34
    .line 35
    iget-object v1, p0, Ll/dj70$a;->h:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    iput-object v1, v0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    iget-object v1, p0, Ll/dj70$a;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    iput-object v1, v0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    iget-boolean v1, p0, Ll/dj70$a;->c:Z

    .line 44
    .line 45
    iput-boolean v1, v0, Ll/dj70;->c:Z

    .line 46
    .line 47
    iget-boolean v1, p0, Ll/dj70$a;->d:Z

    .line 48
    .line 49
    iput-boolean v1, v0, Ll/dj70;->d:Z

    .line 50
    .line 51
    iget-boolean v1, p0, Ll/dj70$a;->e:Z

    .line 52
    .line 53
    iput-boolean v1, v0, Ll/dj70;->e:Z

    .line 54
    .line 55
    iget-object v1, p0, Ll/dj70$a;->b:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v1, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v1, p0, Ll/dj70$a;->j:Landroid/os/Bundle;

    .line 60
    .line 61
    iput-object v1, v0, Ll/dj70;->i:Landroid/os/Bundle;

    .line 62
    .line 63
    iget-object v1, p0, Ll/dj70$a;->m:Ljava/util/List;

    .line 64
    .line 65
    iput-object v1, v0, Ll/dj70;->p:Ljava/util/List;

    .line 66
    .line 67
    new-instance v1, Ll/fj70;

    .line 68
    .line 69
    invoke-direct {v1, v0}, Ll/fj70;-><init>(Ll/dj70;)V

    .line 70
    .line 71
    .line 72
    iput-object v1, v0, Ll/dj70;->l:Ll/fj70;

    .line 73
    .line 74
    iget-object v1, p0, Ll/dj70$a;->l:Ll/t6i;

    .line 75
    .line 76
    iput-object v1, v0, Ll/dj70;->n:Ll/t6i;

    .line 77
    .line 78
    iget-object v1, p0, Ll/dj70$a;->m:Ljava/util/List;

    .line 79
    .line 80
    if-eqz v1, :cond_1

    .line 81
    .line 82
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-lez v1, :cond_1

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/dj70$a;->c()Ll/s6i;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    iput-object p0, v0, Ll/dj70;->m:Ll/s6i;

    .line 93
    .line 94
    :cond_1
    return-object v0
.end method

.method public c()Ll/s6i;
    .locals 3

    .line 1
    new-instance v0, Ll/s6i;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/s6i;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/s6i;->b()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iget-object p0, p0, Ll/dj70$a;->m:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ll/s6i;

    .line 27
    .line 28
    iget v2, v2, Ll/s6i;->a:I

    .line 29
    .line 30
    and-int/2addr v1, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iput v1, v0, Ll/s6i;->a:I

    .line 33
    .line 34
    return-object v0
.end method

.method public d(Lcom/p1/mobile/android/app/Act;)Ll/dj70$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dj70$a;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/n570;)Ll/dj70$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dj70$a;->k:Ll/n570;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/feed/data/RawFeed;)Ll/dj70$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dj70$a;->g:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ljava/lang/String;)Ll/dj70$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dj70$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Z)Ll/dj70$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/dj70$a;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Z)Ll/dj70$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/dj70$a;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Z)Ll/dj70$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/dj70$a;->e:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/dj70$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dj70$a;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Landroid/os/Bundle;)Ll/dj70$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dj70$a;->j:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ljava/util/List;)Ll/dj70$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)",
            "Ll/dj70$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/dj70$a;->m:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(I)Ll/dj70$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/dj70$a;->i:I

    .line 2
    .line 3
    return-object p0
.end method
