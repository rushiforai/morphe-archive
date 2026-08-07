.class public Lcom/xiaomi/push/service/v;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/v$a;,
        Lcom/xiaomi/push/service/v$b;
    }
.end annotation


# static fields
.field private static a:Lcom/xiaomi/push/service/v$a;

.field private static a:Lcom/xiaomi/push/service/v$b;


# direct methods
.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hb;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/xiaomi/push/hb;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 26
    sget-object v0, Lcom/xiaomi/push/service/v;->a:Lcom/xiaomi/push/service/v$a;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 27
    :cond_0
    invoke-interface {v0, p0, p1}, Lcom/xiaomi/push/service/v$a;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 28
    :cond_1
    :goto_0
    const-string p0, "pepa listener or container is null"

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hb;)V
    .locals 1

    .line 23
    sget-object v0, Lcom/xiaomi/push/service/v;->a:Lcom/xiaomi/push/service/v$a;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 24
    :cond_0
    invoke-interface {v0, p0, p1}, Lcom/xiaomi/push/service/v$a;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;)V

    return-void

    .line 25
    :cond_1
    :goto_0
    const-string p0, "handle msg wrong"

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/he;)V
    .locals 1

    .line 20
    sget-object v0, Lcom/xiaomi/push/service/v;->a:Lcom/xiaomi/push/service/v$a;

    if-nez v0, :cond_0

    .line 21
    const-string p0, "The Listener of EventProcessor must be set. Please check extension plugin initialization."

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    return-void

    .line 22
    :cond_0
    invoke-interface {v0, p0, p1, p2}, Lcom/xiaomi/push/service/v$a;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;Lcom/xiaomi/push/he;)V

    return-void
.end method

.method public static a(Lcom/xiaomi/push/hb;)V
    .locals 1

    .line 32
    sget-object v0, Lcom/xiaomi/push/service/v;->a:Lcom/xiaomi/push/service/v$b;

    if-eqz v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 33
    :cond_0
    invoke-interface {v0, p0}, Lcom/xiaomi/push/service/v$b;->a(Lcom/xiaomi/push/hb;)V

    return-void

    .line 34
    :cond_1
    :goto_0
    const-string p0, "pepa clearMessage is null"

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 1

    .line 35
    sget-object v0, Lcom/xiaomi/push/service/v;->a:Lcom/xiaomi/push/service/v$b;

    if-eqz v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 36
    :cond_0
    invoke-interface {v0, p0}, Lcom/xiaomi/push/service/v$b;->a(Ljava/lang/String;)V

    return-void

    .line 37
    :cond_1
    :goto_0
    const-string p0, "pepa clearMessage is null"

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/push/service/v;->a:Lcom/xiaomi/push/service/v$a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-interface {v0, p0, p1, p2}, Lcom/xiaomi/push/service/v$a;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const-string p0, "pepa judement listener or container is null"

    .line 14
    .line 15
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public static a(Lcom/xiaomi/push/hb;)Z
    .locals 1

    .line 29
    sget-object v0, Lcom/xiaomi/push/service/v;->a:Lcom/xiaomi/push/service/v$b;

    if-eqz v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 30
    :cond_0
    invoke-interface {v0, p0}, Lcom/xiaomi/push/service/v$b;->a(Lcom/xiaomi/push/hb;)Z

    move-result p0

    return p0

    .line 31
    :cond_1
    :goto_0
    const-string p0, "pepa handleReceiveMessage is null"

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method
