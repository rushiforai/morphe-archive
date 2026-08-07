.class public Ll/i5d0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i5d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ll/x1d0;

.field public b:Lokhttp3/Protocol;

.field public c:I

.field public d:Ljava/lang/String;

.field public e:Ll/txk;

.field public f:Ll/e0l$a;

.field public g:Ll/k5d0;

.field public h:Ll/i5d0;

.field public i:Ll/i5d0;

.field public j:Ll/i5d0;

.field public k:J

.field public l:J

.field public m:Ll/n6f;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 65
    iput v0, p0, Ll/i5d0$a;->c:I

    .line 66
    new-instance v0, Ll/e0l$a;

    invoke-direct {v0}, Ll/e0l$a;-><init>()V

    iput-object v0, p0, Ll/i5d0$a;->f:Ll/e0l$a;

    return-void
.end method

.method public constructor <init>(Ll/i5d0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/i5d0$a;->c:I

    .line 6
    .line 7
    iget-object v0, p1, Ll/i5d0;->a:Ll/x1d0;

    .line 8
    .line 9
    iput-object v0, p0, Ll/i5d0$a;->a:Ll/x1d0;

    .line 10
    .line 11
    iget-object v0, p1, Ll/i5d0;->b:Lokhttp3/Protocol;

    .line 12
    .line 13
    iput-object v0, p0, Ll/i5d0$a;->b:Lokhttp3/Protocol;

    .line 14
    .line 15
    iget v0, p1, Ll/i5d0;->c:I

    .line 16
    .line 17
    iput v0, p0, Ll/i5d0$a;->c:I

    .line 18
    .line 19
    iget-object v0, p1, Ll/i5d0;->d:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p0, Ll/i5d0$a;->d:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v0, p1, Ll/i5d0;->e:Ll/txk;

    .line 24
    .line 25
    iput-object v0, p0, Ll/i5d0$a;->e:Ll/txk;

    .line 26
    .line 27
    iget-object v0, p1, Ll/i5d0;->f:Ll/e0l;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/e0l;->h()Ll/e0l$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Ll/i5d0$a;->f:Ll/e0l$a;

    .line 34
    .line 35
    iget-object v0, p1, Ll/i5d0;->g:Ll/k5d0;

    .line 36
    .line 37
    iput-object v0, p0, Ll/i5d0$a;->g:Ll/k5d0;

    .line 38
    .line 39
    iget-object v0, p1, Ll/i5d0;->h:Ll/i5d0;

    .line 40
    .line 41
    iput-object v0, p0, Ll/i5d0$a;->h:Ll/i5d0;

    .line 42
    .line 43
    iget-object v0, p1, Ll/i5d0;->i:Ll/i5d0;

    .line 44
    .line 45
    iput-object v0, p0, Ll/i5d0$a;->i:Ll/i5d0;

    .line 46
    .line 47
    iget-object v0, p1, Ll/i5d0;->j:Ll/i5d0;

    .line 48
    .line 49
    iput-object v0, p0, Ll/i5d0$a;->j:Ll/i5d0;

    .line 50
    .line 51
    iget-wide v0, p1, Ll/i5d0;->k:J

    .line 52
    .line 53
    iput-wide v0, p0, Ll/i5d0$a;->k:J

    .line 54
    .line 55
    iget-wide v0, p1, Ll/i5d0;->l:J

    .line 56
    .line 57
    iput-wide v0, p0, Ll/i5d0$a;->l:J

    .line 58
    .line 59
    iget-object p1, p1, Ll/i5d0;->m:Ll/n6f;

    .line 60
    .line 61
    iput-object p1, p0, Ll/i5d0$a;->m:Ll/n6f;

    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)Ll/i5d0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i5d0$a;->f:Ll/e0l$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/e0l$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/e0l$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b(Ll/k5d0;)Ll/i5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i5d0$a;->g:Ll/k5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/i5d0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i5d0$a;->a:Ll/x1d0;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ll/i5d0$a;->b:Lokhttp3/Protocol;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget v0, p0, Ll/i5d0$a;->c:I

    .line 10
    .line 11
    if-ltz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/i5d0$a;->d:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/i5d0;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/i5d0;-><init>(Ll/i5d0$a;)V

    .line 20
    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    const-string p0, "message == null"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :goto_0
    const/4 p0, 0x0

    .line 29
    return-object p0

    .line 30
    :cond_1
    const-string v0, "code < 0: "

    .line 31
    .line 32
    iget p0, p0, Ll/i5d0$a;->c:I

    .line 33
    .line 34
    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const-string p0, "protocol == null"

    .line 39
    .line 40
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    const-string p0, "request == null"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0
.end method

.method public d(Ll/i5d0;)Ll/i5d0$a;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "cacheResponse"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/i5d0$a;->f(Ljava/lang/String;Ll/i5d0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Ll/i5d0$a;->i:Ll/i5d0;

    .line 9
    .line 10
    return-object p0
.end method

.method public final e(Ll/i5d0;)V
    .locals 0

    .line 1
    iget-object p0, p1, Ll/i5d0;->g:Ll/k5d0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "priorResponse.body != null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final f(Ljava/lang/String;Ll/i5d0;)V
    .locals 0

    .line 1
    iget-object p0, p2, Ll/i5d0;->g:Ll/k5d0;

    .line 2
    .line 3
    if-nez p0, :cond_3

    .line 4
    .line 5
    iget-object p0, p2, Ll/i5d0;->h:Ll/i5d0;

    .line 6
    .line 7
    if-nez p0, :cond_2

    .line 8
    .line 9
    iget-object p0, p2, Ll/i5d0;->i:Ll/i5d0;

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    iget-object p0, p2, Ll/i5d0;->j:Ll/i5d0;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, ".priorResponse != null"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const-string p0, ".cacheResponse != null"

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    const-string p0, ".networkResponse != null"

    .line 31
    .line 32
    invoke-static {p1, p0}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_3
    const-string p0, ".body != null"

    .line 37
    .line 38
    invoke-static {p1, p0}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public g(I)Ll/i5d0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/i5d0$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/txk;)Ll/i5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i5d0$a;->e:Ll/txk;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;)Ll/i5d0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i5d0$a;->f:Ll/e0l$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/e0l$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/e0l$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public j(Ll/e0l;)Ll/i5d0$a;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/e0l;->h()Ll/e0l$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/i5d0$a;->f:Ll/e0l$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public k(Ll/n6f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i5d0$a;->m:Ll/n6f;

    .line 2
    .line 3
    return-void
.end method

.method public l(Ljava/lang/String;)Ll/i5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i5d0$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ll/i5d0;)Ll/i5d0$a;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "networkResponse"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/i5d0$a;->f(Ljava/lang/String;Ll/i5d0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Ll/i5d0$a;->h:Ll/i5d0;

    .line 9
    .line 10
    return-object p0
.end method

.method public n(Ll/i5d0;)Ll/i5d0$a;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i5d0$a;->e(Ll/i5d0;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput-object p1, p0, Ll/i5d0$a;->j:Ll/i5d0;

    .line 7
    .line 8
    return-object p0
.end method

.method public o(Lokhttp3/Protocol;)Ll/i5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i5d0$a;->b:Lokhttp3/Protocol;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(J)Ll/i5d0$a;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/i5d0$a;->l:J

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ll/x1d0;)Ll/i5d0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i5d0$a;->a:Ll/x1d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(J)Ll/i5d0$a;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/i5d0$a;->k:J

    .line 2
    .line 3
    return-object p0
.end method
