.class public Ll/c5b0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/c5b0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:Ljava/nio/FloatBuffer;

.field public final c:Ljava/nio/FloatBuffer;

.field public final d:I


# direct methods
.method public constructor <init>(Ll/a5b0$b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/a5b0$b;->a()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Ll/c5b0$a;->a:I

    .line 9
    .line 10
    iget-object v0, p1, Ll/a5b0$b;->c:[F

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/GlUtil;->e([F)Ljava/nio/FloatBuffer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/c5b0$a;->b:Ljava/nio/FloatBuffer;

    .line 17
    .line 18
    iget-object v0, p1, Ll/a5b0$b;->d:[F

    .line 19
    .line 20
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/GlUtil;->e([F)Ljava/nio/FloatBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/c5b0$a;->c:Ljava/nio/FloatBuffer;

    .line 25
    .line 26
    iget p1, p1, Ll/a5b0$b;->b:I

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    if-eq p1, v0, :cond_1

    .line 30
    .line 31
    const/4 v0, 0x2

    .line 32
    if-eq p1, v0, :cond_0

    .line 33
    .line 34
    const/4 p1, 0x4

    .line 35
    iput p1, p0, Ll/c5b0$a;->d:I

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const/4 p1, 0x6

    .line 39
    iput p1, p0, Ll/c5b0$a;->d:I

    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/4 p1, 0x5

    .line 43
    iput p1, p0, Ll/c5b0$a;->d:I

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic a(Ll/c5b0$a;)Ljava/nio/FloatBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c5b0$a;->b:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/c5b0$a;)Ljava/nio/FloatBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c5b0$a;->c:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/c5b0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/c5b0$a;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ll/c5b0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/c5b0$a;->a:I

    .line 2
    .line 3
    return p0
.end method
