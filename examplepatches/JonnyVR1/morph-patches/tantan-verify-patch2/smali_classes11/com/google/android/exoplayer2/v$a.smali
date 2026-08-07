.class public Lcom/google/android/exoplayer2/v$a;
.super Ll/c3j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/exoplayer2/v;->I(Ll/n8f0;)Lcom/google/android/exoplayer2/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final g:Lcom/google/android/exoplayer2/c0$d;

.field public final synthetic h:Lcom/google/android/exoplayer2/v;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/v;Lcom/google/android/exoplayer2/c0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/v$a;->h:Lcom/google/android/exoplayer2/v;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/c3j;-><init>(Lcom/google/android/exoplayer2/c0;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/google/android/exoplayer2/c0$d;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/google/android/exoplayer2/c0$d;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/google/android/exoplayer2/v$a;->g:Lcom/google/android/exoplayer2/c0$d;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public k(ILcom/google/android/exoplayer2/c0$b;Z)Lcom/google/android/exoplayer2/c0$b;
    .locals 10

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/c3j;->k(ILcom/google/android/exoplayer2/c0$b;Z)Lcom/google/android/exoplayer2/c0$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget p1, v0, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 6
    .line 7
    iget-object p3, p0, Lcom/google/android/exoplayer2/v$a;->g:Lcom/google/android/exoplayer2/c0$d;

    .line 8
    .line 9
    invoke-super {p0, p1, p3}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$d;->h()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    iget-object v1, p2, Lcom/google/android/exoplayer2/c0$b;->a:Ljava/lang/Object;

    .line 20
    .line 21
    iget-object v2, p2, Lcom/google/android/exoplayer2/c0$b;->b:Ljava/lang/Object;

    .line 22
    .line 23
    iget v3, p2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 24
    .line 25
    iget-wide v4, p2, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 26
    .line 27
    iget-wide v6, p2, Lcom/google/android/exoplayer2/c0$b;->e:J

    .line 28
    .line 29
    sget-object v8, Ll/r70;->g:Ll/r70;

    .line 30
    .line 31
    const/4 v9, 0x1

    .line 32
    invoke-virtual/range {v0 .. v9}, Lcom/google/android/exoplayer2/c0$b;->w(Ljava/lang/Object;Ljava/lang/Object;IJJLl/r70;Z)Lcom/google/android/exoplayer2/c0$b;

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_0
    const/4 p0, 0x1

    .line 37
    iput-boolean p0, v0, Lcom/google/android/exoplayer2/c0$b;->f:Z

    .line 38
    .line 39
    return-object v0
.end method
