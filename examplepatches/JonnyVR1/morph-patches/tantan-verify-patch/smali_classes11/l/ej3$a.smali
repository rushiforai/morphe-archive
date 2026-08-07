.class public final Ll/ej3$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qfj0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ej3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:Ll/rfe;

.field public e:Lcom/google/android/exoplayer2/k;

.field public f:Ll/qfj0;

.field public g:J


# direct methods
.method public constructor <init>(IILcom/google/android/exoplayer2/k;)V
    .locals 0
    .param p3    # Lcom/google/android/exoplayer2/k;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ej3$a;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/ej3$a;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/ej3$a;->c:Lcom/google/android/exoplayer2/k;

    .line 9
    .line 10
    new-instance p1, Ll/rfe;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/rfe;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/ej3$a;->d:Ll/rfe;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(JIIILl/qfj0$a;)V
    .locals 7
    .param p6    # Ll/qfj0$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-wide v0, p0, Ll/ej3$a;->g:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v2, v0, v2

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    cmp-long v0, p1, v0

    .line 13
    .line 14
    if-ltz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/ej3$a;->d:Ll/rfe;

    .line 17
    .line 18
    iput-object v0, p0, Ll/ej3$a;->f:Ll/qfj0;

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/ej3$a;->f:Ll/qfj0;

    .line 21
    .line 22
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    move-object v0, p0

    .line 27
    check-cast v0, Ll/qfj0;

    .line 28
    .line 29
    move-wide v1, p1

    .line 30
    move v3, p3

    .line 31
    move v4, p4

    .line 32
    move v5, p5

    .line 33
    move-object v6, p6

    .line 34
    invoke-interface/range {v0 .. v6}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public b(Lcom/google/android/exoplayer2/k;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ej3$a;->c:Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/k;->k(Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :cond_0
    iput-object p1, p0, Ll/ej3$a;->e:Lcom/google/android/exoplayer2/k;

    .line 10
    .line 11
    iget-object p1, p0, Ll/ej3$a;->f:Ll/qfj0;

    .line 12
    .line 13
    invoke-static {p1}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/qfj0;

    .line 18
    .line 19
    iget-object p0, p0, Ll/ej3$a;->e:Lcom/google/android/exoplayer2/k;

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public c(Ll/e6c;IZI)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ej3$a;->f:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/qfj0;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3}, Ll/qfj0;->e(Ll/e6c;IZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public f(Ll/ig60;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ej3$a;->f:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/qfj0;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public g(Ll/p45$b;J)V
    .locals 0
    .param p1    # Ll/p45$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/ej3$a;->d:Ll/rfe;

    .line 4
    .line 5
    iput-object p1, p0, Ll/ej3$a;->f:Ll/qfj0;

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-wide p2, p0, Ll/ej3$a;->g:J

    .line 9
    .line 10
    iget p2, p0, Ll/ej3$a;->a:I

    .line 11
    .line 12
    iget p3, p0, Ll/ej3$a;->b:I

    .line 13
    .line 14
    invoke-interface {p1, p2, p3}, Ll/p45$b;->b(II)Ll/qfj0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/ej3$a;->f:Ll/qfj0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/ej3$a;->e:Lcom/google/android/exoplayer2/k;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-interface {p1, p0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method
