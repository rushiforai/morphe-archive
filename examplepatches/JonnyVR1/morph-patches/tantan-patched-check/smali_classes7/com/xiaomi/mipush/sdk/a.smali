.class public Lcom/xiaomi/mipush/sdk/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mipush/sdk/a$a;
    }
.end annotation


# static fields
.field private static a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/xiaomi/mipush/sdk/c$a;",
            ">;"
        }
    .end annotation
.end field

.field private static b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static c:Lcom/xiaomi/mipush/sdk/a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/xiaomi/mipush/sdk/a;->a:Ljava/util/Map;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/xiaomi/mipush/sdk/a;->b:Ljava/util/Map;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hg;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->a()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v1, v1, v3

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    sget-object v1, Lcom/xiaomi/mipush/sdk/a;->a:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/xiaomi/mipush/sdk/c$a;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v2, p1, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/mipush/sdk/c$a;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/mipush/sdk/c;->h(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/c$a;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object p0, p1, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_1

    .line 46
    .line 47
    new-instance p0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iget-object v1, p1, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    .line 53
    .line 54
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :goto_0
    move-object v2, p0

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const/4 p0, 0x0

    .line 60
    goto :goto_0

    .line 61
    :goto_1
    sget-object p0, Lcom/xiaomi/push/ed;->a:Lcom/xiaomi/push/ed;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    .line 64
    .line 65
    iget-wide v3, p1, Lcom/xiaomi/push/hg;->a:J

    .line 66
    .line 67
    iget-object v5, p1, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

    .line 68
    .line 69
    const/4 v6, 0x0

    .line 70
    const/4 v7, 0x0

    .line 71
    invoke-static/range {v1 .. v7}, Ll/qmb0;->a(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget-object p1, Lcom/xiaomi/mipush/sdk/a;->c:Lcom/xiaomi/mipush/sdk/a$a;

    .line 76
    .line 77
    if-eqz p1, :cond_2

    .line 78
    .line 79
    invoke-virtual {p1, v0, p0}, Lcom/xiaomi/mipush/sdk/a$a;->a(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method

.method public static b(Landroid/content/Context;Lcom/xiaomi/push/hm;)V
    .locals 7

    .line 1
    sget-object p0, Lcom/xiaomi/push/ed;->b:Lcom/xiaomi/push/ed;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-wide v2, p1, Lcom/xiaomi/push/hm;->a:J

    .line 6
    .line 7
    iget-object v4, p1, Lcom/xiaomi/push/hm;->d:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    const/4 v6, 0x0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static/range {v0 .. v6}, Ll/qmb0;->a(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1}, Lcom/xiaomi/push/hm;->a()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget-object v0, Lcom/xiaomi/mipush/sdk/a;->c:Lcom/xiaomi/mipush/sdk/a$a;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p1, p0}, Lcom/xiaomi/mipush/sdk/a$a;->b(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
