.class public Ll/bkq;
.super Ll/sq2;
.source "SourceFile"


# instance fields
.field public final c:I

.field public final d:I

.field public e:Ll/by3;


# direct methods
.method public constructor <init>(II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/sq2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-lez p1, :cond_0

    .line 7
    .line 8
    move v2, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, v0

    .line 11
    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, Ll/wn80;->b(Ljava/lang/Boolean;)V

    .line 16
    .line 17
    .line 18
    if-lez p2, :cond_1

    .line 19
    .line 20
    move v0, v1

    .line 21
    :cond_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ll/wn80;->b(Ljava/lang/Boolean;)V

    .line 26
    .line 27
    .line 28
    iput p1, p0, Ll/bkq;->c:I

    .line 29
    .line 30
    iput p2, p0, Ll/bkq;->d:I

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a()Ll/by3;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bkq;->e:Ll/by3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/bkq;->c:I

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p0, Ll/bkq;->d:I

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    const-string v2, "i%dr%d"

    .line 23
    .line 24
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/sof0;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Ll/sof0;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ll/bkq;->e:Ll/by3;

    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Ll/bkq;->e:Ll/by3;

    .line 36
    .line 37
    return-object p0
.end method

.method public e(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/bkq;->c:I

    .line 2
    .line 3
    iget p0, p0, Ll/bkq;->d:I

    .line 4
    .line 5
    invoke-static {p1, v0, p0}, Lcom/facebook/imagepipeline/nativecode/NativeBlurFilter;->a(Landroid/graphics/Bitmap;II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
