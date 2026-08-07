.class public final Lcom/vivo/push/util/p;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcom/vivo/push/util/o;

.field private static b:Z

.field private static c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/vivo/push/util/n;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/vivo/push/util/n;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    .line 7
    .line 8
    invoke-static {}, Lcom/vivo/push/util/p;->b()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 15
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    invoke-interface {v0, p0, p1}, Lcom/vivo/push/util/o;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 1

    .line 17
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    invoke-interface {v0, p0, p1, p2}, Lcom/vivo/push/util/o;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result p0

    return p0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 1

    .line 16
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    invoke-interface {v0, p0, p1}, Lcom/vivo/push/util/o;->a(Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result p0

    return p0
.end method

.method public static a(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 1

    .line 18
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    invoke-interface {v0, p0}, Lcom/vivo/push/util/o;->a(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 19
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    invoke-interface {v0, p0, p1}, Lcom/vivo/push/util/o;->a(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static a(Z)V
    .locals 0

    .line 13
    invoke-static {}, Lcom/vivo/push/util/p;->b()V

    .line 14
    sput-boolean p0, Lcom/vivo/push/util/p;->c:Z

    return-void
.end method

.method public static a()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/vivo/push/util/p;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-boolean v0, Lcom/vivo/push/util/p;->c:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    return v0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    return v0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 18
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    invoke-interface {v0, p0, p1}, Lcom/vivo/push/util/o;->b(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 1

    .line 19
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    invoke-interface {v0, p0, p1, p2}, Lcom/vivo/push/util/o;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result p0

    return p0
.end method

.method private static b()V
    .locals 2

    .line 1
    const-string v0, "persist.sys.log.ctrl"

    .line 2
    .line 3
    const-string v1, "no"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/vivo/push/util/z;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "yes"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput-boolean v0, Lcom/vivo/push/util/p;->b:Z

    .line 16
    .line 17
    return-void
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 20
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    invoke-interface {v0, p0, p1}, Lcom/vivo/push/util/o;->b(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Lcom/vivo/push/util/o;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static c(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 8
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    invoke-interface {v0, p0, p1}, Lcom/vivo/push/util/o;->c(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Lcom/vivo/push/util/o;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/vivo/push/util/p;->a:Lcom/vivo/push/util/o;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Lcom/vivo/push/util/o;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
