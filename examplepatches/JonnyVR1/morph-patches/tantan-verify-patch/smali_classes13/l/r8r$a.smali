.class public Ll/r8r$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r8r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Ll/zvl;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/r8r$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/r8r$a;->b:I

    .line 10
    .line 11
    iput v0, p0, Ll/r8r$a;->c:I

    .line 12
    .line 13
    iput v0, p0, Ll/r8r$a;->d:I

    .line 14
    .line 15
    iput p1, p0, Ll/r8r$a;->e:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 19
    iput v0, p0, Ll/r8r$a;->c:I

    .line 20
    iput v0, p0, Ll/r8r$a;->d:I

    .line 21
    iput v0, p0, Ll/r8r$a;->e:I

    .line 22
    iput-object p1, p0, Ll/r8r$a;->a:Ljava/lang/String;

    .line 23
    iput p2, p0, Ll/r8r$a;->b:I

    return-void
.end method


# virtual methods
.method public a()Ll/r8r;
    .locals 3

    .line 1
    new-instance v0, Ll/r8r;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/r8r;-><init>(Ll/s8r;)V

    .line 5
    .line 6
    .line 7
    iget v1, p0, Ll/r8r$a;->e:I

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    const-string v1, ""

    .line 13
    .line 14
    iput-object v1, p0, Ll/r8r$a;->a:Ljava/lang/String;

    .line 15
    .line 16
    iput v2, p0, Ll/r8r$a;->b:I

    .line 17
    .line 18
    iput v2, p0, Ll/r8r$a;->c:I

    .line 19
    .line 20
    iput v2, p0, Ll/r8r$a;->d:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iput v2, p0, Ll/r8r$a;->e:I

    .line 24
    .line 25
    :goto_0
    iget-object v1, p0, Ll/r8r$a;->f:Ll/zvl;

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    const-string v1, "\u6807\u7b7e\u5fc5\u987b\u8bbe\u7f6e\u4e00\u4e2atag"

    .line 30
    .line 31
    invoke-static {v1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Ll/r8r$a;->a:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Ll/r8r;->a:Ljava/lang/String;

    .line 37
    .line 38
    iget v1, p0, Ll/r8r$a;->b:I

    .line 39
    .line 40
    iput v1, v0, Ll/r8r;->b:I

    .line 41
    .line 42
    iget v1, p0, Ll/r8r$a;->c:I

    .line 43
    .line 44
    iput v1, v0, Ll/r8r;->c:I

    .line 45
    .line 46
    iget v1, p0, Ll/r8r$a;->d:I

    .line 47
    .line 48
    iput v1, v0, Ll/r8r;->d:I

    .line 49
    .line 50
    iget v1, p0, Ll/r8r$a;->e:I

    .line 51
    .line 52
    iput v1, v0, Ll/r8r;->e:I

    .line 53
    .line 54
    iget-object p0, p0, Ll/r8r$a;->f:Ll/zvl;

    .line 55
    .line 56
    iput-object p0, v0, Ll/r8r;->f:Ll/zvl;

    .line 57
    .line 58
    return-object v0
.end method

.method public b(I)Ll/r8r$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/r8r$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/zvl;)Ll/r8r$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r8r$a;->f:Ll/zvl;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/r8r$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/r8r$a;->d:I

    .line 2
    .line 3
    return-object p0
.end method
