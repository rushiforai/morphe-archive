.class public final Ll/esi0;
.super Lcom/google/android/exoplayer2/d;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public A:Ll/sdg0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public B:Ll/sdg0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public C:I

.field public D:J

.field public E:J

.field public F:J

.field public final p:Landroid/os/Handler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final q:Ll/asi0;

.field public final r:Ll/pdg0;

.field public final s:Ll/p1j;

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:I

.field public x:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public y:Ll/odg0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public z:Ll/rdg0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/asi0;Landroid/os/Looper;)V
    .locals 1
    .param p2    # Landroid/os/Looper;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    sget-object v0, Ll/pdg0;->a:Ll/pdg0;

    invoke-direct {p0, p1, p2, v0}, Ll/esi0;-><init>(Ll/asi0;Landroid/os/Looper;Ll/pdg0;)V

    return-void
.end method

.method public constructor <init>(Ll/asi0;Landroid/os/Looper;Ll/pdg0;)V
    .locals 1
    .param p2    # Landroid/os/Looper;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/d;-><init>(I)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ll/asi0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/esi0;->q:Ll/asi0;

    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p2, p0}, Ll/bmk0;->v(Landroid/os/Looper;Landroid/os/Handler$Callback;)Landroid/os/Handler;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    :goto_0
    iput-object p1, p0, Ll/esi0;->p:Landroid/os/Handler;

    .line 22
    .line 23
    iput-object p3, p0, Ll/esi0;->r:Ll/pdg0;

    .line 24
    .line 25
    new-instance p1, Ll/p1j;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/p1j;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/esi0;->s:Ll/p1j;

    .line 31
    .line 32
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    iput-wide p1, p0, Ll/esi0;->D:J

    .line 38
    .line 39
    iput-wide p1, p0, Ll/esi0;->E:J

    .line 40
    .line 41
    iput-wide p1, p0, Ll/esi0;->F:J

    .line 42
    .line 43
    return-void
.end method

.method private a0(J)J
    .locals 7
    .annotation runtime Lorg/checkerframework/dataflow/qual/SideEffectFree;
    .end annotation

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    cmp-long v2, p1, v0

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x1

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    move v2, v4

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v2, v3

    .line 15
    :goto_0
    invoke-static {v2}, Ll/w11;->g(Z)V

    .line 16
    .line 17
    .line 18
    iget-wide v5, p0, Ll/esi0;->E:J

    .line 19
    .line 20
    cmp-long v0, v5, v0

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    move v3, v4

    .line 25
    :cond_1
    invoke-static {v3}, Ll/w11;->g(Z)V

    .line 26
    .line 27
    .line 28
    iget-wide v0, p0, Ll/esi0;->E:J

    .line 29
    .line 30
    sub-long/2addr p1, v0

    .line 31
    return-wide p1
.end method


# virtual methods
.method public L()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/esi0;->x:Lcom/google/android/exoplayer2/k;

    .line 3
    .line 4
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    iput-wide v0, p0, Ll/esi0;->D:J

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/esi0;->X()V

    .line 12
    .line 13
    .line 14
    iput-wide v0, p0, Ll/esi0;->E:J

    .line 15
    .line 16
    iput-wide v0, p0, Ll/esi0;->F:J

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/esi0;->f0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public N(JZ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/esi0;->F:J

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/esi0;->X()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/esi0;->t:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/esi0;->u:Z

    .line 10
    .line 11
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    iput-wide p1, p0, Ll/esi0;->D:J

    .line 17
    .line 18
    iget p1, p0, Ll/esi0;->w:I

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/esi0;->g0()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/esi0;->e0()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/esi0;->y:Ll/odg0;

    .line 30
    .line 31
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ll/odg0;

    .line 36
    .line 37
    invoke-interface {p0}, Ll/hid;->flush()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public T([Lcom/google/android/exoplayer2/k;JJ)V
    .locals 0

    .line 1
    iput-wide p4, p0, Ll/esi0;->E:J

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    aget-object p1, p1, p2

    .line 5
    .line 6
    iput-object p1, p0, Ll/esi0;->x:Lcom/google/android/exoplayer2/k;

    .line 7
    .line 8
    iget-object p1, p0, Ll/esi0;->y:Ll/odg0;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput p1, p0, Ll/esi0;->w:I

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/esi0;->c0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final X()V
    .locals 4

    .line 1
    new-instance v0, Ll/qyb;

    .line 2
    .line 3
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-wide v2, p0, Ll/esi0;->F:J

    .line 8
    .line 9
    invoke-direct {p0, v2, v3}, Ll/esi0;->a0(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    invoke-direct {v0, v1, v2, v3}, Ll/qyb;-><init>(Ljava/util/List;J)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/esi0;->i0(Ll/qyb;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final Y(J)J
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "subtitle"
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/dataflow/qual/SideEffectFree;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/esi0;->A:Ll/sdg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/sdg0;->f(J)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-object p2, p0, Ll/esi0;->A:Ll/sdg0;

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/sdg0;->b()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/esi0;->A:Ll/sdg0;

    .line 19
    .line 20
    const/4 p2, -0x1

    .line 21
    if-ne p1, p2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/sdg0;->b()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/lit8 p1, p1, -0x1

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/sdg0;->a(I)J

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    return-wide p0

    .line 34
    :cond_1
    add-int/lit8 p1, p1, -0x1

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/sdg0;->a(I)J

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    return-wide p0

    .line 41
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/esi0;->A:Ll/sdg0;

    .line 42
    .line 43
    iget-wide p0, p0, Ll/lid;->b:J

    .line 44
    .line 45
    return-wide p0
.end method

.method public final Z()J
    .locals 4

    .line 1
    iget v0, p0, Ll/esi0;->C:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-wide v2, 0x7fffffffffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    return-wide v2

    .line 12
    :cond_0
    iget-object v0, p0, Ll/esi0;->A:Ll/sdg0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    iget v0, p0, Ll/esi0;->C:I

    .line 18
    .line 19
    iget-object v1, p0, Ll/esi0;->A:Ll/sdg0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/sdg0;->b()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-lt v0, v1, :cond_1

    .line 26
    .line 27
    return-wide v2

    .line 28
    :cond_1
    iget-object v0, p0, Ll/esi0;->A:Ll/sdg0;

    .line 29
    .line 30
    iget p0, p0, Ll/esi0;->C:I

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ll/sdg0;->a(I)J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    return-wide v0
.end method

.method public a(Lcom/google/android/exoplayer2/k;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/esi0;->r:Ll/pdg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/pdg0;->a(Lcom/google/android/exoplayer2/k;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    iget p0, p1, Lcom/google/android/exoplayer2/k;->G:I

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x4

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x2

    .line 16
    :goto_0
    invoke-static {p0}, Lcom/google/android/exoplayer2/y;->v(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    iget-object p0, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Ll/kb00;->r(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    invoke-static {p0}, Lcom/google/android/exoplayer2/y;->v(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_2
    const/4 p0, 0x0

    .line 36
    invoke-static {p0}, Lcom/google/android/exoplayer2/y;->v(I)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final b0(Lcom/google/android/exoplayer2/text/SubtitleDecoderException;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Subtitle decoding failed. streamFormat="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/esi0;->x:Lcom/google/android/exoplayer2/k;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "TextRenderer"

    .line 18
    .line 19
    invoke-static {v1, v0, p1}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/esi0;->X()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/esi0;->g0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/esi0;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c0()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/esi0;->v:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/esi0;->r:Ll/pdg0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/esi0;->x:Lcom/google/android/exoplayer2/k;

    .line 7
    .line 8
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/google/android/exoplayer2/k;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ll/pdg0;->b(Lcom/google/android/exoplayer2/k;)Ll/odg0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/esi0;->y:Ll/odg0;

    .line 19
    .line 20
    return-void
.end method

.method public final d0(Ll/qyb;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/esi0;->q:Ll/asi0;

    .line 2
    .line 3
    iget-object v1, p1, Ll/qyb;->a:Lcom/google/common/collect/ImmutableList;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ll/asi0;->p(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/esi0;->q:Ll/asi0;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/asi0;->d(Ll/qyb;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final e0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/esi0;->z:Ll/rdg0;

    .line 3
    .line 4
    const/4 v1, -0x1

    .line 5
    iput v1, p0, Ll/esi0;->C:I

    .line 6
    .line 7
    iget-object v1, p0, Ll/esi0;->A:Ll/sdg0;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/lid;->u()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/esi0;->A:Ll/sdg0;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Ll/esi0;->B:Ll/sdg0;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/lid;->u()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/esi0;->B:Ll/sdg0;

    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public final f0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/esi0;->e0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/esi0;->y:Ll/odg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/odg0;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/hid;->release()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/esi0;->y:Ll/odg0;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Ll/esi0;->w:I

    .line 20
    .line 21
    return-void
.end method

.method public final g0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/esi0;->f0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/esi0;->c0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "TextRenderer"

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/d;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 6
    .line 7
    .line 8
    iput-wide p1, p0, Ll/esi0;->D:J

    .line 9
    .line 10
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 1

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/qyb;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/esi0;->d0(Ll/qyb;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final i0(Ll/qyb;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/esi0;->p:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-virtual {v0, p0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Ll/esi0;->d0(Ll/qyb;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public j(JJ)V
    .locals 8

    .line 1
    iput-wide p1, p0, Ll/esi0;->F:J

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/d;->g()Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const/4 p4, 0x1

    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    iget-wide v0, p0, Ll/esi0;->D:J

    .line 11
    .line 12
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    cmp-long p3, v0, v2

    .line 18
    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    cmp-long p3, p1, v0

    .line 22
    .line 23
    if-ltz p3, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/esi0;->e0()V

    .line 26
    .line 27
    .line 28
    iput-boolean p4, p0, Ll/esi0;->u:Z

    .line 29
    .line 30
    :cond_0
    iget-boolean p3, p0, Ll/esi0;->u:Z

    .line 31
    .line 32
    if-eqz p3, :cond_1

    .line 33
    .line 34
    goto/16 :goto_6

    .line 35
    .line 36
    :cond_1
    iget-object p3, p0, Ll/esi0;->B:Ll/sdg0;

    .line 37
    .line 38
    if-nez p3, :cond_2

    .line 39
    .line 40
    iget-object p3, p0, Ll/esi0;->y:Ll/odg0;

    .line 41
    .line 42
    invoke-static {p3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    check-cast p3, Ll/odg0;

    .line 47
    .line 48
    invoke-interface {p3, p1, p2}, Ll/odg0;->b(J)V

    .line 49
    .line 50
    .line 51
    :try_start_0
    iget-object p3, p0, Ll/esi0;->y:Ll/odg0;

    .line 52
    .line 53
    invoke-static {p3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    check-cast p3, Ll/odg0;

    .line 58
    .line 59
    invoke-interface {p3}, Ll/hid;->c()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    check-cast p3, Ll/sdg0;

    .line 64
    .line 65
    iput-object p3, p0, Ll/esi0;->B:Ll/sdg0;
    :try_end_0
    .catch Lcom/google/android/exoplayer2/text/SubtitleDecoderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    move-exception p1

    .line 69
    invoke-virtual {p0, p1}, Ll/esi0;->b0(Lcom/google/android/exoplayer2/text/SubtitleDecoderException;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/d;->getState()I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    const/4 v0, 0x2

    .line 78
    if-eq p3, v0, :cond_3

    .line 79
    .line 80
    goto/16 :goto_6

    .line 81
    .line 82
    :cond_3
    iget-object p3, p0, Ll/esi0;->A:Ll/sdg0;

    .line 83
    .line 84
    const/4 v1, 0x0

    .line 85
    if-eqz p3, :cond_4

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/esi0;->Z()J

    .line 88
    .line 89
    .line 90
    move-result-wide v2

    .line 91
    move p3, v1

    .line 92
    :goto_1
    cmp-long v2, v2, p1

    .line 93
    .line 94
    if-gtz v2, :cond_5

    .line 95
    .line 96
    iget p3, p0, Ll/esi0;->C:I

    .line 97
    .line 98
    add-int/2addr p3, p4

    .line 99
    iput p3, p0, Ll/esi0;->C:I

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/esi0;->Z()J

    .line 102
    .line 103
    .line 104
    move-result-wide v2

    .line 105
    move p3, p4

    .line 106
    goto :goto_1

    .line 107
    :cond_4
    move p3, v1

    .line 108
    :cond_5
    iget-object v2, p0, Ll/esi0;->B:Ll/sdg0;

    .line 109
    .line 110
    const/4 v3, 0x0

    .line 111
    if-eqz v2, :cond_9

    .line 112
    .line 113
    invoke-virtual {v2}, Ll/ah3;->p()Z

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    if-eqz v4, :cond_7

    .line 118
    .line 119
    if-nez p3, :cond_9

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/esi0;->Z()J

    .line 122
    .line 123
    .line 124
    move-result-wide v4

    .line 125
    const-wide v6, 0x7fffffffffffffffL

    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    cmp-long v2, v4, v6

    .line 131
    .line 132
    if-nez v2, :cond_9

    .line 133
    .line 134
    iget v2, p0, Ll/esi0;->w:I

    .line 135
    .line 136
    if-ne v2, v0, :cond_6

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/esi0;->g0()V

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_6
    invoke-virtual {p0}, Ll/esi0;->e0()V

    .line 143
    .line 144
    .line 145
    iput-boolean p4, p0, Ll/esi0;->u:Z

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_7
    iget-wide v4, v2, Ll/lid;->b:J

    .line 149
    .line 150
    cmp-long v4, v4, p1

    .line 151
    .line 152
    if-gtz v4, :cond_9

    .line 153
    .line 154
    iget-object p3, p0, Ll/esi0;->A:Ll/sdg0;

    .line 155
    .line 156
    if-eqz p3, :cond_8

    .line 157
    .line 158
    invoke-virtual {p3}, Ll/lid;->u()V

    .line 159
    .line 160
    .line 161
    :cond_8
    invoke-virtual {v2, p1, p2}, Ll/sdg0;->f(J)I

    .line 162
    .line 163
    .line 164
    move-result p3

    .line 165
    iput p3, p0, Ll/esi0;->C:I

    .line 166
    .line 167
    iput-object v2, p0, Ll/esi0;->A:Ll/sdg0;

    .line 168
    .line 169
    iput-object v3, p0, Ll/esi0;->B:Ll/sdg0;

    .line 170
    .line 171
    move p3, p4

    .line 172
    :cond_9
    :goto_2
    if-eqz p3, :cond_a

    .line 173
    .line 174
    iget-object p3, p0, Ll/esi0;->A:Ll/sdg0;

    .line 175
    .line 176
    invoke-static {p3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0, p1, p2}, Ll/esi0;->Y(J)J

    .line 180
    .line 181
    .line 182
    move-result-wide v4

    .line 183
    invoke-direct {p0, v4, v5}, Ll/esi0;->a0(J)J

    .line 184
    .line 185
    .line 186
    move-result-wide v4

    .line 187
    new-instance p3, Ll/qyb;

    .line 188
    .line 189
    iget-object v2, p0, Ll/esi0;->A:Ll/sdg0;

    .line 190
    .line 191
    invoke-virtual {v2, p1, p2}, Ll/sdg0;->g(J)Ljava/util/List;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-direct {p3, p1, v4, v5}, Ll/qyb;-><init>(Ljava/util/List;J)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0, p3}, Ll/esi0;->i0(Ll/qyb;)V

    .line 199
    .line 200
    .line 201
    :cond_a
    iget p1, p0, Ll/esi0;->w:I

    .line 202
    .line 203
    if-ne p1, v0, :cond_b

    .line 204
    .line 205
    goto/16 :goto_6

    .line 206
    .line 207
    :cond_b
    :goto_3
    :try_start_1
    iget-boolean p1, p0, Ll/esi0;->t:Z

    .line 208
    .line 209
    if-nez p1, :cond_12

    .line 210
    .line 211
    iget-object p1, p0, Ll/esi0;->z:Ll/rdg0;

    .line 212
    .line 213
    if-nez p1, :cond_d

    .line 214
    .line 215
    iget-object p1, p0, Ll/esi0;->y:Ll/odg0;

    .line 216
    .line 217
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    check-cast p1, Ll/odg0;

    .line 222
    .line 223
    invoke-interface {p1}, Ll/hid;->a()Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    check-cast p1, Ll/rdg0;

    .line 228
    .line 229
    if-nez p1, :cond_c

    .line 230
    .line 231
    goto :goto_6

    .line 232
    :cond_c
    iput-object p1, p0, Ll/esi0;->z:Ll/rdg0;

    .line 233
    .line 234
    goto :goto_4

    .line 235
    :catch_1
    move-exception p1

    .line 236
    goto :goto_7

    .line 237
    :cond_d
    :goto_4
    iget p2, p0, Ll/esi0;->w:I

    .line 238
    .line 239
    if-ne p2, p4, :cond_e

    .line 240
    .line 241
    const/4 p2, 0x4

    .line 242
    invoke-virtual {p1, p2}, Ll/ah3;->t(I)V

    .line 243
    .line 244
    .line 245
    iget-object p2, p0, Ll/esi0;->y:Ll/odg0;

    .line 246
    .line 247
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object p2

    .line 251
    check-cast p2, Ll/odg0;

    .line 252
    .line 253
    invoke-interface {p2, p1}, Ll/hid;->d(Ljava/lang/Object;)V

    .line 254
    .line 255
    .line 256
    iput-object v3, p0, Ll/esi0;->z:Ll/rdg0;

    .line 257
    .line 258
    iput v0, p0, Ll/esi0;->w:I

    .line 259
    .line 260
    return-void

    .line 261
    :cond_e
    iget-object p2, p0, Ll/esi0;->s:Ll/p1j;

    .line 262
    .line 263
    invoke-virtual {p0, p2, p1, v1}, Lcom/google/android/exoplayer2/d;->U(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I

    .line 264
    .line 265
    .line 266
    move-result p2

    .line 267
    const/4 p3, -0x4

    .line 268
    if-ne p2, p3, :cond_11

    .line 269
    .line 270
    invoke-virtual {p1}, Ll/ah3;->p()Z

    .line 271
    .line 272
    .line 273
    move-result p2

    .line 274
    if-eqz p2, :cond_f

    .line 275
    .line 276
    iput-boolean p4, p0, Ll/esi0;->t:Z

    .line 277
    .line 278
    iput-boolean v1, p0, Ll/esi0;->v:Z

    .line 279
    .line 280
    goto :goto_5

    .line 281
    :cond_f
    iget-object p2, p0, Ll/esi0;->s:Ll/p1j;

    .line 282
    .line 283
    iget-object p2, p2, Ll/p1j;->b:Lcom/google/android/exoplayer2/k;

    .line 284
    .line 285
    if-nez p2, :cond_10

    .line 286
    .line 287
    goto :goto_6

    .line 288
    :cond_10
    iget-wide p2, p2, Lcom/google/android/exoplayer2/k;->p:J

    .line 289
    .line 290
    iput-wide p2, p1, Ll/rdg0;->i:J

    .line 291
    .line 292
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->w()V

    .line 293
    .line 294
    .line 295
    iget-boolean p2, p0, Ll/esi0;->v:Z

    .line 296
    .line 297
    invoke-virtual {p1}, Ll/ah3;->r()Z

    .line 298
    .line 299
    .line 300
    move-result p3

    .line 301
    xor-int/2addr p3, p4

    .line 302
    and-int/2addr p2, p3

    .line 303
    iput-boolean p2, p0, Ll/esi0;->v:Z

    .line 304
    .line 305
    :goto_5
    iget-boolean p2, p0, Ll/esi0;->v:Z

    .line 306
    .line 307
    if-nez p2, :cond_b

    .line 308
    .line 309
    iget-object p2, p0, Ll/esi0;->y:Ll/odg0;

    .line 310
    .line 311
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object p2

    .line 315
    check-cast p2, Ll/odg0;

    .line 316
    .line 317
    invoke-interface {p2, p1}, Ll/hid;->d(Ljava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    iput-object v3, p0, Ll/esi0;->z:Ll/rdg0;
    :try_end_1
    .catch Lcom/google/android/exoplayer2/text/SubtitleDecoderException; {:try_start_1 .. :try_end_1} :catch_1

    .line 321
    .line 322
    goto :goto_3

    .line 323
    :cond_11
    const/4 p1, -0x3

    .line 324
    if-ne p2, p1, :cond_b

    .line 325
    .line 326
    :cond_12
    :goto_6
    return-void

    .line 327
    :goto_7
    invoke-virtual {p0, p1}, Ll/esi0;->b0(Lcom/google/android/exoplayer2/text/SubtitleDecoderException;)V

    .line 328
    .line 329
    .line 330
    return-void
.end method
