.class public Ll/r1j0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r1j0$d;,
        Ll/r1j0$b;,
        Ll/r1j0$c;
    }
.end annotation


# static fields
.field public static a:Ll/r1j0$c;

.field public static b:Ljava/lang/reflect/Field;

.field public static c:Ljava/lang/reflect/Field;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/r1j0;->d()Ll/r1j0$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Ll/r1j0$c;->d(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static b(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/r1j0;->d()Ll/r1j0$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Ll/r1j0$c;->c(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static c()Landroid/widget/Toast;
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/Toast;

    .line 2
    .line 3
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 11
    .line 12
    const/16 v2, 0x1a

    .line 13
    .line 14
    if-ge v1, v2, :cond_0

    .line 15
    .line 16
    invoke-static {v0}, Ll/r1j0;->e(Landroid/widget/Toast;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-object v0
.end method

.method public static d()Ll/r1j0$c;
    .locals 2

    .line 1
    sget-object v0, Ll/r1j0;->a:Ll/r1j0$c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r1j0$b;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, v1}, Ll/r1j0$b;-><init>(Ll/r1j0$a;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/r1j0;->a:Ll/r1j0$c;

    .line 12
    .line 13
    :cond_0
    sget-object v0, Ll/r1j0;->a:Ll/r1j0$c;

    .line 14
    .line 15
    return-object v0
.end method

.method public static e(Landroid/widget/Toast;)V
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Ll/r1j0;->b:Ljava/lang/reflect/Field;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "android.widget.Toast"

    .line 6
    .line 7
    invoke-static {v0}, Lorg/joor/Reflect;->on(Ljava/lang/String;)Lorg/joor/Reflect;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "mTN"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/joor/Reflect;->field0(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/r1j0;->b:Ljava/lang/reflect/Field;

    .line 18
    .line 19
    :cond_0
    sget-object v0, Ll/r1j0;->c:Ljava/lang/reflect/Field;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    sget-object v0, Ll/r1j0;->b:Ljava/lang/reflect/Field;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "mHandler"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Ll/r1j0;->c:Ljava/lang/reflect/Field;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    sget-object v0, Ll/r1j0;->b:Ljava/lang/reflect/Field;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    sget-object v1, Ll/r1j0;->c:Ljava/lang/reflect/Field;

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget-object v0, Ll/r1j0;->c:Ljava/lang/reflect/Field;

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroid/os/Handler;

    .line 61
    .line 62
    sget-object v1, Ll/r1j0;->c:Ljava/lang/reflect/Field;

    .line 63
    .line 64
    new-instance v2, Ll/r1j0$d;

    .line 65
    .line 66
    invoke-direct {v2, v0}, Ll/r1j0$d;-><init>(Landroid/os/Handler;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    :cond_3
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception p0

    .line 74
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static f(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/r1j0;->d()Ll/r1j0$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Ll/r1j0$c;->a(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static g(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/r1j0;->d()Ll/r1j0$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Ll/r1j0$c;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static h(Ll/r1j0$c;)V
    .locals 0

    .line 1
    sput-object p0, Ll/r1j0;->a:Ll/r1j0$c;

    .line 2
    .line 3
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 11
    .line 12
    const/16 v1, 0x1a

    .line 13
    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    invoke-static {p0}, Ll/r1j0;->e(Landroid/widget/Toast;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
