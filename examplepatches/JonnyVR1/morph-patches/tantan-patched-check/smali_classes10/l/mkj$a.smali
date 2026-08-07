.class public Ll/mkj$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mkj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:[I

.field public e:I

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/mkj$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v0, v0, [I

    .line 10
    .line 11
    iput-object v0, p0, Ll/mkj$a;->d:[I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Ll/mkj$a;->e:I

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Ll/mkj$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/mkj$a;->e:I

    return p0
.end method

.method public static bridge synthetic b(Ll/mkj$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/mkj$a;->c:I

    return p0
.end method

.method public static bridge synthetic c(Ll/mkj$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mkj$a;->g:Z

    return p0
.end method

.method public static bridge synthetic d(Ll/mkj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mkj$a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/mkj$a;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mkj$a;->d:[I

    return-object p0
.end method

.method public static bridge synthetic f(Ll/mkj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mkj$a;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/mkj$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mkj$a;->f:Z

    return p0
.end method

.method public static j()Ll/mkj$a;
    .locals 1

    .line 1
    new-instance v0, Ll/mkj$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mkj$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public h()Ll/mkj;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mkj$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/mkj;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p0, v1}, Ll/mkj;-><init>(Ll/mkj$a;Ll/nkj;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public i(I)Ll/mkj$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/mkj$a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public k(I)Ll/mkj$a;
    .locals 3

    .line 1
    iput p1, p0, Ll/mkj$a;->c:I

    .line 2
    .line 3
    const/16 v0, 0x50

    .line 4
    .line 5
    if-ne p1, v0, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Ll/mkj$a;->d:[I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    aget v1, p1, v0

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    aget v1, p1, v2

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    aput v1, p1, v0

    .line 24
    .line 25
    iget-object p1, p0, Ll/mkj$a;->d:[I

    .line 26
    .line 27
    invoke-static {}, Ll/bnl0;->w0()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    int-to-float v0, v0

    .line 32
    const/high16 v1, 0x3f400000    # 0.75f

    .line 33
    .line 34
    mul-float/2addr v0, v1

    .line 35
    float-to-int v0, v0

    .line 36
    aput v0, p1, v2

    .line 37
    .line 38
    :cond_1
    return-object p0
.end method

.method public l(DD)Ll/mkj$a;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mkj$a;->d:[I

    .line 2
    .line 3
    invoke-static {}, Ll/bnl0;->y0()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-double v1, v1

    .line 8
    mul-double/2addr v1, p1

    .line 9
    invoke-static {v1, v2}, Ljava/lang/Math;->round(D)J

    .line 10
    .line 11
    .line 12
    move-result-wide p1

    .line 13
    long-to-int p1, p1

    .line 14
    const/4 p2, 0x0

    .line 15
    aput p1, v0, p2

    .line 16
    .line 17
    iget-object p1, p0, Ll/mkj$a;->d:[I

    .line 18
    .line 19
    aget v0, p1, p2

    .line 20
    .line 21
    int-to-double v0, v0

    .line 22
    mul-double/2addr v0, p3

    .line 23
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 24
    .line 25
    .line 26
    move-result-wide p3

    .line 27
    long-to-int p3, p3

    .line 28
    const/4 p4, 0x1

    .line 29
    aput p3, p1, p4

    .line 30
    .line 31
    iget-object p1, p0, Ll/mkj$a;->d:[I

    .line 32
    .line 33
    aget p1, p1, p4

    .line 34
    .line 35
    invoke-static {}, Ll/bnl0;->w0()I

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    invoke-static {}, Ll/bnl0;->F0()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p3, v0

    .line 44
    if-lt p1, p3, :cond_0

    .line 45
    .line 46
    move p2, p4

    .line 47
    :cond_0
    iput-boolean p2, p0, Ll/mkj$a;->g:Z

    .line 48
    .line 49
    return-object p0
.end method

.method public m(Ljava/lang/String;)Ll/mkj$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mkj$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Z)Ll/mkj$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/mkj$a;->f:Z

    .line 2
    .line 3
    return-object p0
.end method
