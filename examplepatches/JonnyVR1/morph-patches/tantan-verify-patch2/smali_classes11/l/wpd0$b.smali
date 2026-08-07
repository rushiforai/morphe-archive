.class public final Ll/wpd0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wpd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:B

.field public d:I

.field public e:J

.field public f:I

.field public g:[B

.field public h:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/wpd0;->a()[B

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/wpd0$b;->g:[B

    .line 9
    .line 10
    invoke-static {}, Ll/wpd0;->a()[B

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/wpd0$b;->h:[B

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Ll/wpd0$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wpd0$b;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/wpd0$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wpd0$b;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/wpd0$b;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Ll/wpd0$b;->c:B

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ll/wpd0$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wpd0$b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Ll/wpd0$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/wpd0$b;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f(Ll/wpd0$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wpd0$b;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Ll/wpd0$b;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wpd0$b;->g:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ll/wpd0$b;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wpd0$b;->h:[B

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public i()Ll/wpd0;
    .locals 2

    .line 1
    new-instance v0, Ll/wpd0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/wpd0;-><init>(Ll/wpd0$b;Ll/wpd0$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public j([B)Ll/wpd0$b;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wpd0$b;->g:[B

    .line 5
    .line 6
    return-object p0
.end method

.method public k(Z)Ll/wpd0$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wpd0$b;->b:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Z)Ll/wpd0$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wpd0$b;->a:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public m([B)Ll/wpd0$b;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wpd0$b;->h:[B

    .line 5
    .line 6
    return-object p0
.end method

.method public n(B)Ll/wpd0$b;
    .locals 0

    .line 1
    iput-byte p1, p0, Ll/wpd0$b;->c:B

    .line 2
    .line 3
    return-object p0
.end method

.method public o(I)Ll/wpd0$b;
    .locals 2

    .line 1
    const v0, 0xffff

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    if-gt p1, v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-static {v1}, Ll/w11;->a(Z)V

    .line 12
    .line 13
    .line 14
    and-int/2addr p1, v0

    .line 15
    iput p1, p0, Ll/wpd0$b;->d:I

    .line 16
    .line 17
    return-object p0
.end method

.method public p(I)Ll/wpd0$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/wpd0$b;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(J)Ll/wpd0$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/wpd0$b;->e:J

    .line 2
    .line 3
    return-object p0
.end method
