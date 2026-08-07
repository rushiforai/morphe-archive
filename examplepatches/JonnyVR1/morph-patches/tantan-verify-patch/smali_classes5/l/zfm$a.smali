.class public Ll/zfm$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zfm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:[I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/zfm$a;->a:I

    .line 6
    .line 7
    const/16 v1, 0xc

    .line 8
    .line 9
    iput v1, p0, Ll/zfm$a;->b:I

    .line 10
    .line 11
    const-string v1, "#4d000000"

    .line 12
    .line 13
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, p0, Ll/zfm$a;->c:I

    .line 18
    .line 19
    const/16 v1, 0x12

    .line 20
    .line 21
    iput v1, p0, Ll/zfm$a;->d:I

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput v1, p0, Ll/zfm$a;->e:I

    .line 25
    .line 26
    iput v1, p0, Ll/zfm$a;->f:I

    .line 27
    .line 28
    new-array v0, v0, [I

    .line 29
    .line 30
    iput-object v0, p0, Ll/zfm$a;->g:[I

    .line 31
    .line 32
    aput v1, v0, v1

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a()Ll/zfm;
    .locals 9

    .line 1
    new-instance v0, Ll/zfm;

    .line 2
    .line 3
    iget v1, p0, Ll/zfm$a;->a:I

    .line 4
    .line 5
    iget-object v2, p0, Ll/zfm$a;->g:[I

    .line 6
    .line 7
    iget v3, p0, Ll/zfm$a;->b:I

    .line 8
    .line 9
    iget v4, p0, Ll/zfm$a;->c:I

    .line 10
    .line 11
    iget v5, p0, Ll/zfm$a;->d:I

    .line 12
    .line 13
    iget v6, p0, Ll/zfm$a;->e:I

    .line 14
    .line 15
    iget v7, p0, Ll/zfm$a;->f:I

    .line 16
    .line 17
    const/4 v8, 0x0

    .line 18
    invoke-direct/range {v0 .. v8}, Ll/zfm;-><init>(I[IIIIIILl/agm;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public b(I)Ll/zfm$a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zfm$a;->g:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput p1, v0, v1

    .line 5
    .line 6
    return-object p0
.end method

.method public c(I)Ll/zfm$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/zfm$a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/zfm$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/zfm$a;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(I)Ll/zfm$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/zfm$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public f(I)Ll/zfm$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/zfm$a;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public g(I)Ll/zfm$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/zfm$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method
