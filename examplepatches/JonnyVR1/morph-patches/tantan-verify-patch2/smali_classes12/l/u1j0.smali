.class public Ll/u1j0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u1j0$b;
    }
.end annotation


# static fields
.field protected static b:Landroid/content/Context;

.field private static c:Ll/u1j0;

.field private static d:Landroid/os/Handler;


# instance fields
.field protected a:Landroid/widget/Toast;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/u1j0$a;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/u1j0$a;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/u1j0;->d:Landroid/os/Handler;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 6
    .line 7
    sget-object v0, Ll/u1j0;->b:Landroid/content/Context;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/u1j0;->j()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "Showner not been activated. You must call \'doEnable(Context c)\' method before"

    .line 16
    .line 17
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    throw p0
.end method

.method public static synthetic a(Ljava/lang/CharSequence;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u1j0;->e(Ljava/lang/CharSequence;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/u1j0;->f(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ljava/lang/CharSequence;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u1j0;->g(Ljava/lang/CharSequence;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Landroid/content/Context;)V
    .locals 0

    .line 1
    sput-object p0, Ll/u1j0;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-void
.end method

.method private static e(Ljava/lang/CharSequence;I)V
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_0
    sget-object v0, Ll/u1j0;->c:Ll/u1j0;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ll/cqw;->r()Ll/cqw;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/u1j0;->c:Ll/u1j0;

    .line 17
    .line 18
    :cond_1
    sget-object v0, Ll/u1j0;->c:Ll/u1j0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/u1j0;->h()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sget-object v1, Ll/u1j0;->c:Ll/u1j0;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v1, p0, v2, p1}, Ll/u1j0;->q(Ljava/lang/CharSequence;ZI)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Ll/u1j0;->c:Ll/u1j0;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/u1j0;->k(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    const-string p1, "Toaster"

    .line 38
    .line 39
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private static f(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    sget-object v0, Ll/u1j0;->c:Ll/u1j0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/cqw;->r()Ll/cqw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/u1j0;->c:Ll/u1j0;

    .line 10
    .line 11
    :cond_0
    sget-object v0, Ll/u1j0;->c:Ll/u1j0;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/u1j0;->o(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private static g(Ljava/lang/CharSequence;I)V
    .locals 3

    .line 1
    sget-object v0, Ll/u1j0;->c:Ll/u1j0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/cqw;->r()Ll/cqw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/u1j0;->c:Ll/u1j0;

    .line 10
    .line 11
    :cond_0
    sget-object v0, Ll/u1j0;->c:Ll/u1j0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/u1j0;->h()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sget-object v1, Ll/u1j0;->c:Ll/u1j0;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, p0, v2, p1}, Ll/u1j0;->q(Ljava/lang/CharSequence;ZI)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/u1j0;->c:Ll/u1j0;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/u1j0;->k(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static i(Landroid/widget/Toast;)V
    .locals 4

    .line 1
    const-class v0, Ll/u1j0;

    .line 2
    .line 3
    const-class v1, Landroid/widget/Toast;

    .line 4
    .line 5
    :try_start_0
    const-string v2, "mTN"

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v3, "mHandler"

    .line 24
    .line 25
    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/u1j0$b;

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Landroid/os/Handler;

    .line 39
    .line 40
    invoke-direct {v2, v3}, Ll/u1j0$b;-><init>(Landroid/os/Handler;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception p0

    .line 50
    goto :goto_1

    .line 51
    :catch_1
    move-exception p0

    .line 52
    goto :goto_2

    .line 53
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    goto :goto_3

    .line 61
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    goto :goto_3

    .line 69
    :goto_2
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    :goto_3
    return-void
.end method

.method public static l(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/u1j0;->m(Ljava/lang/CharSequence;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static m(Ljava/lang/CharSequence;I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/kv0;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/kv0;->f()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/u1j0;->e(Ljava/lang/CharSequence;I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/16 v1, 0x555

    .line 23
    .line 24
    iput v1, v0, Landroid/os/Message;->what:I

    .line 25
    .line 26
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 27
    .line 28
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 29
    .line 30
    sget-object p0, Ll/u1j0;->d:Landroid/os/Handler;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static n(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/kv0;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/kv0;->f()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-static {p0}, Ll/u1j0;->f(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    new-instance v0, Landroid/os/Message;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 21
    .line 22
    .line 23
    const/16 v1, 0x556

    .line 24
    .line 25
    iput v1, v0, Landroid/os/Message;->what:I

    .line 26
    .line 27
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 28
    .line 29
    sget-object p0, Ll/u1j0;->d:Landroid/os/Handler;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/Toast;->getDuration()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()V
    .locals 3

    .line 1
    sget-object v0, Ll/u1j0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 11
    .line 12
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 13
    .line 14
    const/16 v1, 0x19

    .line 15
    .line 16
    if-ne p0, v1, :cond_0

    .line 17
    .line 18
    invoke-static {v0}, Ll/u1j0;->i(Landroid/widget/Toast;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public k(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/Toast;->setDuration(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/u1j0;->p(Ljava/lang/CharSequence;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public p(Ljava/lang/CharSequence;Z)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p2}, Ll/u1j0;->q(Ljava/lang/CharSequence;ZI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public q(Ljava/lang/CharSequence;ZI)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Ll/u1j0;->j()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object p2, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 12
    .line 13
    invoke-virtual {p1, p3}, Landroid/widget/Toast;->setDuration(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :catchall_0
    return-void
.end method
