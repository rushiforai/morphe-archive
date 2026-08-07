.class Lcom/xiaomi/mipush/sdk/f$c;
.super Landroid/database/ContentObserver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/f;->Q()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/mipush/sdk/f;


# direct methods
.method public constructor <init>(Lcom/xiaomi/mipush/sdk/f;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/f$c;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f$c;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/xiaomi/push/service/ap;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/xiaomi/push/service/ap;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p1, v0}, Lcom/xiaomi/mipush/sdk/f;->j(Lcom/xiaomi/mipush/sdk/f;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f$c;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/f;->i(Lcom/xiaomi/mipush/sdk/f;)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f$c;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f$c;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 48
    .line 49
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Ll/mtq0;->t(Landroid/content/Context;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f$c;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/f;->S()V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method
