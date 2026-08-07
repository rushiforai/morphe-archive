.class public Lcom/xiaomi/push/service/g;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/g$a;,
        Lcom/xiaomi/push/service/g$b;
    }
.end annotation


# static fields
.field private static a:Lcom/xiaomi/push/service/g$a;

.field private static a:Lcom/xiaomi/push/service/g$b;


# direct methods
.method public static a(Lcom/xiaomi/push/service/g$b;)V
    .locals 0

    .line 38
    sput-object p0, Lcom/xiaomi/push/service/g;->a:Lcom/xiaomi/push/service/g$b;

    return-void
.end method

.method public static a(Lcom/xiaomi/push/he;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/xiaomi/push/service/g;->a:Lcom/xiaomi/push/service/g$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {}, Ll/t5r0;->b()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const-string p0, "rc app not permission to cpra"

    .line 20
    .line 21
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return v1

    .line 25
    :cond_1
    sget-object v0, Lcom/xiaomi/push/service/g;->a:Lcom/xiaomi/push/service/g$a;

    .line 26
    .line 27
    invoke-interface {v0, p0}, Lcom/xiaomi/push/service/g$a;->a(Lcom/xiaomi/push/he;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_2
    :goto_0
    const-string p0, "rc params is null, not cpra"

    .line 33
    .line 34
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return v1
.end method
