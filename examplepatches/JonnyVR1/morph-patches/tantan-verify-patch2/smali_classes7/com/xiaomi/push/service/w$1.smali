.class final Lcom/xiaomi/push/service/w$1;
.super Lcom/xiaomi/push/service/ay$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/p;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/service/XMPushService;

.field final synthetic a:Lcom/xiaomi/push/service/p;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/p;)V
    .locals 0

    .line 1
    iput-object p4, p0, Lcom/xiaomi/push/service/w$1;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    iput-object p5, p0, Lcom/xiaomi/push/service/w$1;->a:Lcom/xiaomi/push/service/p;

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/push/service/ay$a;-><init>(Ljava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/xiaomi/push/service/ay;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/w$1;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    invoke-static {v0}, Ll/etq0;->c(Landroid/content/Context;)Ll/etq0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "MSAID"

    .line 8
    .line 9
    const-string v2, "msaid"

    .line 10
    .line 11
    invoke-virtual {p1, v1, v2}, Lcom/xiaomi/push/service/ay;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v0}, Ll/etq0;->a()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-nez v5, :cond_0

    .line 24
    .line 25
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-nez v3, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1, v1, v2, v4}, Lcom/xiaomi/push/service/ay;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Lcom/xiaomi/push/he;

    .line 35
    .line 36
    invoke-direct {p1}, Lcom/xiaomi/push/he;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/xiaomi/push/service/w$1;->a:Lcom/xiaomi/push/service/p;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/xiaomi/push/service/p;->d:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 44
    .line 45
    .line 46
    sget-object v1, Lcom/xiaomi/push/gp;->g:Lcom/xiaomi/push/gp;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/xiaomi/push/service/aj;->a()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p1, v1}, Lcom/xiaomi/push/he;->a(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 58
    .line 59
    .line 60
    new-instance v1, Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v1}, Lcom/xiaomi/push/he;->a(Ljava/util/Map;)Lcom/xiaomi/push/he;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/xiaomi/push/he;->a()Ljava/util/Map;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ll/etq0;->e(Ljava/util/Map;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/xiaomi/push/service/w$1;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v1, p0, Lcom/xiaomi/push/service/w$1;->a:Lcom/xiaomi/push/service/p;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/xiaomi/push/service/p;->d:Ljava/lang/String;

    .line 84
    .line 85
    sget-object v2, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 86
    .line 87
    invoke-static {v0, v1, p1, v2}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object p0, p0, Lcom/xiaomi/push/service/w$1;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const/4 v1, 0x1

    .line 102
    invoke-virtual {p0, v0, p1, v1}, Lcom/xiaomi/push/service/XMPushService;->a(Ljava/lang/String;[BZ)V

    .line 103
    .line 104
    .line 105
    :cond_0
    return-void
.end method
