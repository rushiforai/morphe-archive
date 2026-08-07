.class public Ll/i5r0;
.super Ll/tsq0$c;
.source "SourceFile"


# instance fields
.field private c:Landroid/content/Context;

.field private d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/tsq0$c;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/i5r0;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/i5r0;->c:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "2"

    .line 2
    .line 3
    return-object p0
.end method

.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/i5r0;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/xiaomi/push/gx;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/xiaomi/push/gx;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-boolean v2, p0, Ll/i5r0;->d:Z

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Lcom/xiaomi/push/gx;->a(I)Lcom/xiaomi/push/gx;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v3}, Lcom/xiaomi/push/gx;->b(I)Lcom/xiaomi/push/gx;

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object v2, Lcom/xiaomi/push/gl;->a:Lcom/xiaomi/push/gl;

    .line 25
    .line 26
    invoke-static {v0, v2}, Lcom/xiaomi/push/service/ai;->a(Lcom/xiaomi/push/service/ah;Lcom/xiaomi/push/gl;)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gx;->a(I)Lcom/xiaomi/push/gx;

    .line 31
    .line 32
    .line 33
    sget-object v2, Lcom/xiaomi/push/gl;->b:Lcom/xiaomi/push/gl;

    .line 34
    .line 35
    invoke-static {v0, v2}, Lcom/xiaomi/push/service/ai;->a(Lcom/xiaomi/push/service/ah;Lcom/xiaomi/push/gl;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {v1, v0}, Lcom/xiaomi/push/gx;->b(I)Lcom/xiaomi/push/gx;

    .line 40
    .line 41
    .line 42
    :goto_0
    new-instance v0, Lcom/xiaomi/push/he;

    .line 43
    .line 44
    const-string v2, "-1"

    .line 45
    .line 46
    invoke-direct {v0, v2, v3}, Lcom/xiaomi/push/he;-><init>(Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    sget-object v2, Lcom/xiaomi/push/gp;->p:Lcom/xiaomi/push/gp;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v0, v2}, Lcom/xiaomi/push/he;->a([B)Lcom/xiaomi/push/he;

    .line 61
    .line 62
    .line 63
    const-string v2, "-->check version: checkMessage="

    .line 64
    .line 65
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-string v2, "OcVersionCheckJob"

    .line 70
    .line 71
    invoke-static {v2, v1}, Ll/ouq0;->y(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Ll/i5r0;->c:Landroid/content/Context;

    .line 75
    .line 76
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget-object v1, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    invoke-virtual {p0, v0, v1, v2}, Lcom/xiaomi/mipush/sdk/f;->w(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;Lcom/xiaomi/push/gs;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
