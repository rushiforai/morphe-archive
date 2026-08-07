.class public Lcom/immomo/momosec/network/HttpBaseException$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momosec/network/HttpBaseException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/Throwable;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:I

.field private f:I

.field private g:J

.field private h:Ljava/lang/String;

.field private i:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->e:I

    .line 6
    .line 7
    sget-object v0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->UNKNOWN:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->i:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/Throwable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->b:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/immomo/momosec/network/HttpBaseException$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/immomo/momosec/network/HttpBaseException$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/immomo/momosec/network/HttpBaseException$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic h(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Lcom/immomo/momosec/network/HttpBaseException$a;)Lcom/immomo/momosec/network/HttpBaseException$ErrorType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->i:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 2
    .line 3
    return-object p0
.end method

.method private t()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-array v0, v1, [B

    .line 11
    .line 12
    fill-array-data v0, :array_0

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->c:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->d:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    new-array v0, v1, [B

    .line 26
    .line 27
    fill-array-data v0, :array_1

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->d:Ljava/lang/String;

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->h:Ljava/lang/String;

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    new-array v0, v1, [B

    .line 41
    .line 42
    fill-array-data v0, :array_2

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->h:Ljava/lang/String;

    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->i:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 52
    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    sget-object v0, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->UNKNOWN:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->i:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 58
    .line 59
    :cond_3
    return-void

    .line 60
    :cond_4
    const/16 p0, 0x16

    .line 61
    .line 62
    new-array p0, p0, [B

    .line 63
    .line 64
    fill-array-data p0, :array_3

    .line 65
    .line 66
    .line 67
    invoke-static {p0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :array_0
    .array-data 1
        0x7et
        0x49t
        0x70t
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    :array_1
    .array-data 1
        0x7et
        0x49t
        0x70t
    .end array-data

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :array_2
    .array-data 1
        0x7et
        0x49t
        0x70t
    .end array-data

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    :array_3
    .array-data 1
        0x7dt
        0x3t
        0x42t
        0x44t
        0x0t
        0x1t
        0x55t
        0x46t
        0x52t
        0x56t
        0xft
        0x8t
        0x5ft
        0x12t
        0x11t
        0x55t
        0x4t
        0x46t
        0x5et
        0x13t
        0x5dt
        0x5bt
    .end array-data
.end method


# virtual methods
.method public j()Lcom/immomo/momosec/network/HttpBaseException;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momosec/network/HttpBaseException$a;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/momosec/network/HttpBaseException;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/immomo/momosec/network/HttpBaseException;-><init>(Lcom/immomo/momosec/network/HttpBaseException$a;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public k(Ljava/lang/Throwable;)Lcom/immomo/momosec/network/HttpBaseException$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->b:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Lcom/immomo/momosec/network/HttpBaseException$ErrorType;)Lcom/immomo/momosec/network/HttpBaseException$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->i:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(I)Lcom/immomo/momosec/network/HttpBaseException$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(I)Lcom/immomo/momosec/network/HttpBaseException$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public r(J)Lcom/immomo/momosec/network/HttpBaseException$a;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->g:J

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momosec/network/HttpBaseException$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
