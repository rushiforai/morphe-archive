.class public Lcom/cmic/sso/sdk/c/d/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:Ljava/lang/String;


# direct methods
.method private constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/cmic/sso/sdk/c/d/a;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/cmic/sso/sdk/c/d/a;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static a(I)Lcom/cmic/sso/sdk/c/d/a;
    .locals 2

    .line 1
    const-string v0, "\u7f51\u7edc\u5f02\u5e38"

    .line 2
    .line 3
    sparse-switch p0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/cmic/sso/sdk/c/d/a;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0}, Lcom/cmic/sso/sdk/c/d/a;-><init>(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object v1

    .line 12
    :sswitch_0
    new-instance p0, Lcom/cmic/sso/sdk/c/d/a;

    .line 13
    .line 14
    const v0, 0x30d72

    .line 15
    .line 16
    .line 17
    const-string v1, "EOF\u5f02\u5e38"

    .line 18
    .line 19
    invoke-direct {p0, v0, v1}, Lcom/cmic/sso/sdk/c/d/a;-><init>(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :sswitch_1
    new-instance p0, Lcom/cmic/sso/sdk/c/d/a;

    .line 24
    .line 25
    const v0, 0x30d67

    .line 26
    .line 27
    .line 28
    const-string v1, "\u7535\u4fe1\u53d6\u53f7\u63a5\u53e3\u5931\u8d25"

    .line 29
    .line 30
    invoke-direct {p0, v0, v1}, Lcom/cmic/sso/sdk/c/d/a;-><init>(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :sswitch_2
    new-instance p0, Lcom/cmic/sso/sdk/c/d/a;

    .line 35
    .line 36
    const v0, 0x30d59

    .line 37
    .line 38
    .line 39
    const-string v1, "\u767b\u5f55\u8d85\u65f6"

    .line 40
    .line 41
    invoke-direct {p0, v0, v1}, Lcom/cmic/sso/sdk/c/d/a;-><init>(ILjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-object p0

    .line 45
    :sswitch_3
    new-instance p0, Lcom/cmic/sso/sdk/c/d/a;

    .line 46
    .line 47
    const v0, 0x1906c

    .line 48
    .line 49
    .line 50
    const-string v1, "\u6570\u636e\u7f51\u7edc\u5207\u6362\u5931\u8d25"

    .line 51
    .line 52
    invoke-direct {p0, v0, v1}, Lcom/cmic/sso/sdk/c/d/a;-><init>(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :sswitch_4
    new-instance p0, Lcom/cmic/sso/sdk/c/d/a;

    .line 57
    .line 58
    const v0, 0x18f4f

    .line 59
    .line 60
    .line 61
    const-string v1, "\u6570\u636e\u89e3\u6790\u5f02\u5e38"

    .line 62
    .line 63
    invoke-direct {p0, v0, v1}, Lcom/cmic/sso/sdk/c/d/a;-><init>(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-object p0

    .line 67
    :sswitch_5
    new-instance p0, Lcom/cmic/sso/sdk/c/d/a;

    .line 68
    .line 69
    const v1, 0x18ed6

    .line 70
    .line 71
    .line 72
    invoke-direct {p0, v1, v0}, Lcom/cmic/sso/sdk/c/d/a;-><init>(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-object p0

    .line 76
    nop

    .line 77
    :sswitch_data_0
    .sparse-switch
        0x18ed6 -> :sswitch_5
        0x18f4f -> :sswitch_4
        0x1906c -> :sswitch_3
        0x30d59 -> :sswitch_2
        0x30d67 -> :sswitch_1
        0x30d72 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 77
    iget p0, p0, Lcom/cmic/sso/sdk/c/d/a;->a:I

    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/d/a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
