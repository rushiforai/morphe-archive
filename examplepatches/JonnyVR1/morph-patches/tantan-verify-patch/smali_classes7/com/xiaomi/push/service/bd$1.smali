.class final Lcom/xiaomi/push/service/bd$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/bd;->a(Landroid/content/Context;Lcom/xiaomi/push/he;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/he;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/he;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/bd$1;->a:Lcom/xiaomi/push/he;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/bd$1;->a:Lcom/xiaomi/push/he;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/xiaomi/push/he;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/xiaomi/push/service/bd$1;->a:Lcom/xiaomi/push/he;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/xiaomi/push/he;->b()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lcom/xiaomi/push/service/bd$1;->a:Lcom/xiaomi/push/he;

    .line 14
    .line 15
    sget-object v3, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 16
    .line 17
    invoke-static {v0, v1, v2, v3}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Lcom/xiaomi/push/service/bd;->a()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    instance-of v1, v1, Lcom/xiaomi/push/service/XMPushService;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-static {}, Lcom/xiaomi/push/service/bd;->a()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/xiaomi/push/service/XMPushService;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/xiaomi/push/service/bd$1;->a:Lcom/xiaomi/push/he;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/xiaomi/push/he;->d()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-virtual {v1, p0, v0, v2}, Lcom/xiaomi/push/service/XMPushService;->a(Ljava/lang/String;[BZ)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    const-string p0, "UNDatas UploadNotificationDatas failed because not xmsf"

    .line 51
    .line 52
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
