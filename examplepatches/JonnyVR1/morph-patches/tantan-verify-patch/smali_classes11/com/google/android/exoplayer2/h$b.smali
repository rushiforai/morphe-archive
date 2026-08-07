.class public final Lcom/google/android/exoplayer2/h$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:I

.field public b:I

.field public c:I

.field public d:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/google/android/exoplayer2/h$b;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/h$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/h$b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/h$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/h$b;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/h$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/h$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/h$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/h$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public e()Lcom/google/android/exoplayer2/h;
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/h$b;->b:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/exoplayer2/h$b;->c:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/google/android/exoplayer2/h;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/h;-><init>(Lcom/google/android/exoplayer2/h$b;Lcom/google/android/exoplayer2/h$a;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public f(I)Lcom/google/android/exoplayer2/h$b;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/h$b;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public g(I)Lcom/google/android/exoplayer2/h$b;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/h$b;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/lang/String;)Lcom/google/android/exoplayer2/h$b;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/h$b;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    goto :goto_1

    .line 10
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 11
    :goto_1
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/google/android/exoplayer2/h$b;->d:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method
