.class public final Ll/i5d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i5d0$a;
    }
.end annotation


# instance fields
.field public final a:Ll/x1d0;

.field public final b:Lokhttp3/Protocol;

.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:Ll/txk;

.field public final f:Ll/e0l;

.field public final g:Ll/k5d0;

.field public final h:Ll/i5d0;

.field public final i:Ll/i5d0;

.field public final j:Ll/i5d0;

.field public final k:J

.field public final l:J

.field public final m:Ll/n6f;

.field public volatile n:Ll/yx3;


# direct methods
.method public constructor <init>(Ll/i5d0$a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/i5d0$a;->a:Ll/x1d0;

    .line 5
    .line 6
    iput-object v0, p0, Ll/i5d0;->a:Ll/x1d0;

    .line 7
    .line 8
    iget-object v0, p1, Ll/i5d0$a;->b:Lokhttp3/Protocol;

    .line 9
    .line 10
    iput-object v0, p0, Ll/i5d0;->b:Lokhttp3/Protocol;

    .line 11
    .line 12
    iget v0, p1, Ll/i5d0$a;->c:I

    .line 13
    .line 14
    iput v0, p0, Ll/i5d0;->c:I

    .line 15
    .line 16
    iget-object v0, p1, Ll/i5d0$a;->d:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/i5d0;->d:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p1, Ll/i5d0$a;->e:Ll/txk;

    .line 21
    .line 22
    iput-object v0, p0, Ll/i5d0;->e:Ll/txk;

    .line 23
    .line 24
    iget-object v0, p1, Ll/i5d0$a;->f:Ll/e0l$a;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/e0l$a;->e()Ll/e0l;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/i5d0;->f:Ll/e0l;

    .line 31
    .line 32
    iget-object v0, p1, Ll/i5d0$a;->g:Ll/k5d0;

    .line 33
    .line 34
    iput-object v0, p0, Ll/i5d0;->g:Ll/k5d0;

    .line 35
    .line 36
    iget-object v0, p1, Ll/i5d0$a;->h:Ll/i5d0;

    .line 37
    .line 38
    iput-object v0, p0, Ll/i5d0;->h:Ll/i5d0;

    .line 39
    .line 40
    iget-object v0, p1, Ll/i5d0$a;->i:Ll/i5d0;

    .line 41
    .line 42
    iput-object v0, p0, Ll/i5d0;->i:Ll/i5d0;

    .line 43
    .line 44
    iget-object v0, p1, Ll/i5d0$a;->j:Ll/i5d0;

    .line 45
    .line 46
    iput-object v0, p0, Ll/i5d0;->j:Ll/i5d0;

    .line 47
    .line 48
    iget-wide v0, p1, Ll/i5d0$a;->k:J

    .line 49
    .line 50
    iput-wide v0, p0, Ll/i5d0;->k:J

    .line 51
    .line 52
    iget-wide v0, p1, Ll/i5d0$a;->l:J

    .line 53
    .line 54
    iput-wide v0, p0, Ll/i5d0;->l:J

    .line 55
    .line 56
    iget-object p1, p1, Ll/i5d0$a;->m:Ll/n6f;

    .line 57
    .line 58
    iput-object p1, p0, Ll/i5d0;->m:Ll/n6f;

    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public B(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i5d0;->f:Ll/e0l;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e0l;->n(Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public F()Ll/e0l;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->f:Ll/e0l;

    .line 2
    .line 3
    return-object p0
.end method

.method public H()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/i5d0;->c:I

    .line 2
    .line 3
    const/16 v0, 0x133

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x134

    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    :pswitch_0
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public I()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/i5d0;->c:I

    .line 2
    .line 3
    const/16 v0, 0xc8

    .line 4
    .line 5
    if-lt p0, v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x12c

    .line 8
    .line 9
    if-ge p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public J()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public M()Ll/i5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->h:Ll/i5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public N()Ll/i5d0$a;
    .locals 1

    .line 1
    new-instance v0, Ll/i5d0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i5d0$a;-><init>(Ll/i5d0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public Q()Ll/i5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->j:Ll/i5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public S()Lokhttp3/Protocol;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->b:Lokhttp3/Protocol;

    .line 2
    .line 3
    return-object p0
.end method

.method public U()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/i5d0;->l:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public Z()Ll/x1d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->a:Ll/x1d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public a0()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/i5d0;->k:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->g:Ll/k5d0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/k5d0;->close()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "response is not eligible for a body and must not be closed"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public k()Ll/k5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->g:Ll/k5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Ll/yx3;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i5d0;->n:Ll/yx3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/i5d0;->f:Ll/e0l;

    .line 7
    .line 8
    invoke-static {v0}, Ll/yx3;->k(Ll/e0l;)Ll/yx3;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/i5d0;->n:Ll/yx3;

    .line 13
    .line 14
    return-object v0
.end method

.method public n()Ll/i5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->i:Ll/i5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/i5d0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public t()Ll/txk;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->e:Ll/txk;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Response{protocol="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/i5d0;->b:Lokhttp3/Protocol;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", code="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/i5d0;->c:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", message="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/i5d0;->d:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", url="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/i5d0;->a:Ll/x1d0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/x1d0;->k()Ll/rnl;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const/16 p0, 0x7d

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public u(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/i5d0;->v(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public v(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5d0;->f:Ll/e0l;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    return-object p2
.end method
