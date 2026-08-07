.class public Ll/u2r0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u2r0$b;
    }
.end annotation


# static fields
.field private static a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/xiaomi/mipush/sdk/d;",
            "Ll/u2r0$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/u2r0;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->a:Lcom/xiaomi/mipush/sdk/d;

    .line 9
    .line 10
    new-instance v1, Ll/u2r0$b;

    .line 11
    .line 12
    const-string v2, "com.xiaomi.assemble.control.HmsPushManager"

    .line 13
    .line 14
    const-string v3, "newInstance"

    .line 15
    .line 16
    invoke-direct {v1, v2, v3}, Ll/u2r0$b;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/u2r0;->d(Lcom/xiaomi/mipush/sdk/d;Ll/u2r0$b;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->b:Lcom/xiaomi/mipush/sdk/d;

    .line 23
    .line 24
    new-instance v1, Ll/u2r0$b;

    .line 25
    .line 26
    const-string v2, "com.xiaomi.assemble.control.FCMPushManager"

    .line 27
    .line 28
    invoke-direct {v1, v2, v3}, Ll/u2r0$b;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/u2r0;->d(Lcom/xiaomi/mipush/sdk/d;Ll/u2r0$b;)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->c:Lcom/xiaomi/mipush/sdk/d;

    .line 35
    .line 36
    new-instance v1, Ll/u2r0$b;

    .line 37
    .line 38
    const-string v2, "com.xiaomi.assemble.control.COSPushManager"

    .line 39
    .line 40
    invoke-direct {v1, v2, v3}, Ll/u2r0$b;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/u2r0;->d(Lcom/xiaomi/mipush/sdk/d;Ll/u2r0$b;)V

    .line 44
    .line 45
    .line 46
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->d:Lcom/xiaomi/mipush/sdk/d;

    .line 47
    .line 48
    new-instance v1, Ll/u2r0$b;

    .line 49
    .line 50
    const-string v2, "com.xiaomi.assemble.control.FTOSPushManager"

    .line 51
    .line 52
    invoke-direct {v1, v2, v3}, Ll/u2r0$b;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/u2r0;->d(Lcom/xiaomi/mipush/sdk/d;Ll/u2r0$b;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static a(Lcom/xiaomi/mipush/sdk/d;)Lcom/xiaomi/mipush/sdk/v;
    .locals 1

    .line 1
    sget-object v0, Ll/u2r0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_0
    sget-object p0, Lcom/xiaomi/mipush/sdk/v;->f:Lcom/xiaomi/mipush/sdk/v;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    sget-object p0, Lcom/xiaomi/mipush/sdk/v;->e:Lcom/xiaomi/mipush/sdk/v;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    sget-object p0, Lcom/xiaomi/mipush/sdk/v;->d:Lcom/xiaomi/mipush/sdk/v;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_3
    sget-object p0, Lcom/xiaomi/mipush/sdk/v;->c:Lcom/xiaomi/mipush/sdk/v;

    .line 33
    .line 34
    return-object p0
.end method

.method public static b(Lcom/xiaomi/mipush/sdk/d;)Lcom/xiaomi/push/gk;
    .locals 0

    .line 1
    sget-object p0, Lcom/xiaomi/push/gk;->ao:Lcom/xiaomi/push/gk;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c(Lcom/xiaomi/mipush/sdk/d;)Ll/u2r0$b;
    .locals 1

    .line 1
    sget-object v0, Ll/u2r0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/u2r0$b;

    .line 8
    .line 9
    return-object p0
.end method

.method private static d(Lcom/xiaomi/mipush/sdk/d;Ll/u2r0$b;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Ll/u2r0;->a:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
