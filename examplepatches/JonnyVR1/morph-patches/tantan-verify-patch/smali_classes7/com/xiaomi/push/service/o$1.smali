.class Lcom/xiaomi/push/service/o$1;
.super Lcom/xiaomi/push/service/XMPushService$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/o;->a(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/service/o;

.field final synthetic a:Ljava/lang/String;

.field final synthetic a:Ljava/util/List;

.field final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/o;ILjava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/o$1;->a:Lcom/xiaomi/push/service/o;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/xiaomi/push/service/o$1;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/xiaomi/push/service/o$1;->a:Ljava/util/List;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/xiaomi/push/service/o$1;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/XMPushService$j;-><init>(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 125
    const-string p0, "Send tiny data."

    return-object p0
.end method

.method public a()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/o$1;->a:Lcom/xiaomi/push/service/o;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/xiaomi/push/service/o$1;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/xiaomi/push/service/o;->a(Lcom/xiaomi/push/service/o;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/xiaomi/push/service/o$1;->a:Ljava/util/List;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/xiaomi/push/service/o$1;->a:Ljava/lang/String;

    .line 12
    .line 13
    const v3, 0x8000

    .line 14
    .line 15
    .line 16
    invoke-static {v1, v2, v0, v3}, Lcom/xiaomi/push/service/az;->a(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;I)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/xiaomi/push/he;

    .line 37
    .line 38
    const-string v3, "uploadWay"

    .line 39
    .line 40
    const-string v4, "longXMPushService"

    .line 41
    .line 42
    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/push/he;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, Lcom/xiaomi/push/service/o$1;->a:Ljava/lang/String;

    .line 46
    .line 47
    sget-object v4, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 48
    .line 49
    invoke-static {v3, v0, v2, v4}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-object v3, p0, Lcom/xiaomi/push/service/o$1;->b:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-nez v3, :cond_1

    .line 60
    .line 61
    iget-object v3, p0, Lcom/xiaomi/push/service/o$1;->a:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v4, p0, Lcom/xiaomi/push/service/o$1;->b:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-nez v3, :cond_1

    .line 70
    .line 71
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    if-nez v3, :cond_0

    .line 76
    .line 77
    new-instance v3, Lcom/xiaomi/push/gs;

    .line 78
    .line 79
    invoke-direct {v3}, Lcom/xiaomi/push/gs;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v4, "-1"

    .line 83
    .line 84
    invoke-virtual {v3, v4}, Lcom/xiaomi/push/gs;->a(Ljava/lang/String;)Lcom/xiaomi/push/gs;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2, v3}, Lcom/xiaomi/push/hb;->a(Lcom/xiaomi/push/gs;)Lcom/xiaomi/push/hb;

    .line 88
    .line 89
    .line 90
    :cond_0
    invoke-virtual {v2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gs;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    const-string v4, "ext_traffic_source_pkg"

    .line 95
    .line 96
    iget-object v5, p0, Lcom/xiaomi/push/service/o$1;->b:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v3, v4, v5}, Lcom/xiaomi/push/gs;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    invoke-static {v2}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iget-object v3, p0, Lcom/xiaomi/push/service/o$1;->a:Lcom/xiaomi/push/service/o;

    .line 106
    .line 107
    invoke-static {v3}, Lcom/xiaomi/push/service/o;->a(Lcom/xiaomi/push/service/o;)Lcom/xiaomi/push/service/XMPushService;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    iget-object v4, p0, Lcom/xiaomi/push/service/o$1;->a:Ljava/lang/String;

    .line 112
    .line 113
    const/4 v5, 0x1

    .line 114
    invoke-virtual {v3, v4, v2, v5}, Lcom/xiaomi/push/service/XMPushService;->a(Ljava/lang/String;[BZ)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    return-void

    .line 119
    :cond_3
    const-string p0, "TinyData LongConnUploader.upload Get a null XmPushActionNotification list when TinyDataHelper.pack() in XMPushService."

    .line 120
    .line 121
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method
