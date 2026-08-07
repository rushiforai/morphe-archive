.class public final Lcom/google/android/exoplayer2/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/erx;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/g$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/n1g0;

.field public final b:Lcom/google/android/exoplayer2/g$a;

.field public c:Lcom/google/android/exoplayer2/x;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ll/erx;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/g$a;Ll/qa5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/g;->b:Lcom/google/android/exoplayer2/g$a;

    .line 5
    .line 6
    new-instance p1, Ll/n1g0;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ll/n1g0;-><init>(Ll/qa5;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/g;->e:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/exoplayer2/x;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/g;->c:Lcom/google/android/exoplayer2/x;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/google/android/exoplayer2/g;->d:Ll/erx;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/google/android/exoplayer2/g;->c:Lcom/google/android/exoplayer2/x;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/g;->e:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public b(Lcom/google/android/exoplayer2/x;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/google/android/exoplayer2/x;->m()Ll/erx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/android/exoplayer2/g;->d:Ll/erx;

    .line 8
    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iput-object v0, p0, Lcom/google/android/exoplayer2/g;->d:Ll/erx;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/google/android/exoplayer2/g;->c:Lcom/google/android/exoplayer2/x;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/n1g0;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {v0, p0}, Ll/erx;->setPlaybackParameters(Lcom/google/android/exoplayer2/s;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 28
    .line 29
    const-string p1, "Multiple renderer media clocks enabled."

    .line 30
    .line 31
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p0}, Lcom/google/android/exoplayer2/ExoPlaybackException;->createForUnexpected(Ljava/lang/RuntimeException;)Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    throw p0

    .line 39
    :cond_1
    return-void
.end method

.method public c(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/n1g0;->a(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Z)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/g;->c:Lcom/google/android/exoplayer2/x;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/google/android/exoplayer2/x;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/g;->c:Lcom/google/android/exoplayer2/x;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/google/android/exoplayer2/x;->b()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->c:Lcom/google/android/exoplayer2/x;

    .line 22
    .line 23
    invoke-interface {p0}, Lcom/google/android/exoplayer2/x;->d()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/g;->f:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/n1g0;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/g;->f:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/n1g0;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g(Z)J
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/g;->h(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/g;->z()J

    .line 5
    .line 6
    .line 7
    move-result-wide p0

    .line 8
    return-wide p0
.end method

.method public getPlaybackParameters()Lcom/google/android/exoplayer2/s;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/g;->d:Ll/erx;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/erx;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/n1g0;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final h(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/g;->d(Z)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/g;->e:Z

    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/g;->f:Z

    .line 11
    .line 12
    if-eqz p1, :cond_3

    .line 13
    .line 14
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/n1g0;->b()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/g;->d:Ll/erx;

    .line 21
    .line 22
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ll/erx;

    .line 27
    .line 28
    invoke-interface {p1}, Ll/erx;->z()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/g;->e:Z

    .line 33
    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    iget-object v2, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/n1g0;->z()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    cmp-long v2, v0, v2

    .line 43
    .line 44
    if-gez v2, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/n1g0;->c()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    const/4 v2, 0x0

    .line 53
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/g;->e:Z

    .line 54
    .line 55
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/g;->f:Z

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    iget-object v2, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 60
    .line 61
    invoke-virtual {v2}, Ll/n1g0;->b()V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object v2, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 65
    .line 66
    invoke-virtual {v2, v0, v1}, Ll/n1g0;->a(J)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p1}, Ll/erx;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object v0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/n1g0;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/s;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_3

    .line 84
    .line 85
    iget-object v0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 86
    .line 87
    invoke-virtual {v0, p1}, Ll/n1g0;->setPlaybackParameters(Lcom/google/android/exoplayer2/s;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->b:Lcom/google/android/exoplayer2/g$a;

    .line 91
    .line 92
    invoke-interface {p0, p1}, Lcom/google/android/exoplayer2/g$a;->s(Lcom/google/android/exoplayer2/s;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    return-void
.end method

.method public setPlaybackParameters(Lcom/google/android/exoplayer2/s;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/g;->d:Ll/erx;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/erx;->setPlaybackParameters(Lcom/google/android/exoplayer2/s;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/google/android/exoplayer2/g;->d:Ll/erx;

    .line 9
    .line 10
    invoke-interface {p1}, Ll/erx;->getPlaybackParameters()Lcom/google/android/exoplayer2/s;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/n1g0;->setPlaybackParameters(Lcom/google/android/exoplayer2/s;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public z()J
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/g;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->a:Ll/n1g0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/n1g0;->z()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/g;->d:Ll/erx;

    .line 13
    .line 14
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ll/erx;

    .line 19
    .line 20
    invoke-interface {p0}, Ll/erx;->z()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    return-wide v0
.end method
