.class Ll/ctq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zsq0;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private c:Ljava/lang/Object;

.field private d:Ljava/lang/reflect/Method;

.field private e:Ljava/lang/reflect/Method;

.field private f:Ljava/lang/reflect/Method;

.field private g:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/ctq0;->d:Ljava/lang/reflect/Method;

    .line 6
    .line 7
    iput-object v0, p0, Ll/ctq0;->e:Ljava/lang/reflect/Method;

    .line 8
    .line 9
    iput-object v0, p0, Ll/ctq0;->f:Ljava/lang/reflect/Method;

    .line 10
    .line 11
    iput-object v0, p0, Ll/ctq0;->g:Ljava/lang/reflect/Method;

    .line 12
    .line 13
    iput-object p1, p0, Ll/ctq0;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/ctq0;->c(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private b(Landroid/content/Context;Ljava/lang/reflect/Method;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ctq0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    :try_start_0
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p2, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    return-object p0

    .line 20
    :catch_0
    move-exception p0

    .line 21
    const-string p1, "miui invoke error"

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/ouq0;->o(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method private c(Landroid/content/Context;)V
    .locals 2

    .line 1
    :try_start_0
    const-string v0, "com.android.id.impl.IdProviderImpl"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/t5r0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/ctq0;->b:Ljava/lang/Class;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/ctq0;->c:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object p1, p0, Ll/ctq0;->b:Ljava/lang/Class;

    .line 16
    .line 17
    const-string v0, "getOAID"

    .line 18
    .line 19
    const-class v1, Landroid/content/Context;

    .line 20
    .line 21
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/ctq0;->e:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    move-exception p0

    .line 33
    const-string p1, "miui load class error"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/ouq0;->o(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 2

    .line 13
    iget-object v0, p0, Ll/ctq0;->a:Landroid/content/Context;

    iget-object v1, p0, Ll/ctq0;->e:Ljava/lang/reflect/Method;

    invoke-direct {p0, v0, v1}, Ll/ctq0;->b(Landroid/content/Context;Ljava/lang/reflect/Method;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public a()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ctq0;->b:Ljava/lang/Class;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ctq0;->c:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
