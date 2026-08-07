.class public Ll/r8r;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r8r$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Ll/zvl;


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
    iput-object v0, p0, Ll/r8r;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/r8r;->b:I

    .line 10
    .line 11
    iput v0, p0, Ll/r8r;->c:I

    .line 12
    .line 13
    iput v0, p0, Ll/r8r;->d:I

    .line 14
    .line 15
    iput v0, p0, Ll/r8r;->e:I

    .line 16
    .line 17
    return-void
.end method

.method public synthetic constructor <init>(Ll/s8r;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ll/r8r;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Ll/r8r;
    .locals 2

    .line 1
    new-instance v0, Ll/r8r;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/r8r;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/r8r;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Ll/r8r;->a:Ljava/lang/String;

    .line 9
    .line 10
    iget v1, p0, Ll/r8r;->b:I

    .line 11
    .line 12
    iput v1, v0, Ll/r8r;->b:I

    .line 13
    .line 14
    iget v1, p0, Ll/r8r;->c:I

    .line 15
    .line 16
    iput v1, v0, Ll/r8r;->c:I

    .line 17
    .line 18
    iget v1, p0, Ll/r8r;->d:I

    .line 19
    .line 20
    iput v1, v0, Ll/r8r;->d:I

    .line 21
    .line 22
    iget v1, p0, Ll/r8r;->e:I

    .line 23
    .line 24
    iput v1, v0, Ll/r8r;->e:I

    .line 25
    .line 26
    iget-object p0, p0, Ll/r8r;->f:Ll/zvl;

    .line 27
    .line 28
    iput-object p0, v0, Ll/r8r;->f:Ll/zvl;

    .line 29
    .line 30
    return-object v0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/r8r;->b:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r8r;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/r8r;->e:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r8r;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Ll/r8r;->b:I

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r8r;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Ll/r8r;->b:I

    .line 10
    .line 11
    if-gtz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public g(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r8r;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
