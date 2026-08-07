.class public final Ll/stv;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/stv$c;,
        Ll/stv$b;,
        Ll/stv$f;,
        Ll/stv$e;,
        Ll/stv$d;,
        Ll/stv$a;
    }
.end annotation


# static fields
.field public static final a:Ll/stv$b;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt v0, v1, :cond_0

    .line 7
    .line 8
    new-instance v0, Ll/stv$f;

    .line 9
    .line 10
    invoke-direct {v0, v2}, Ll/stv$f;-><init>(Ll/ttv;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/stv;->a:Ll/stv$b;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/16 v1, 0x1a

    .line 17
    .line 18
    if-lt v0, v1, :cond_1

    .line 19
    .line 20
    new-instance v0, Ll/stv$e;

    .line 21
    .line 22
    invoke-direct {v0, v2}, Ll/stv$e;-><init>(Ll/ttv;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Ll/stv;->a:Ll/stv$b;

    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    new-instance v0, Ll/stv$d;

    .line 29
    .line 30
    invoke-direct {v0, v2}, Ll/stv$d;-><init>(Ll/ttv;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Ll/stv;->a:Ll/stv$b;

    .line 34
    .line 35
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

.method public static a(Landroid/app/Application;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/stv;->b(Landroid/app/Application;Ll/stv$c;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static b(Landroid/app/Application;Ll/stv$c;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    sget-object v0, Ll/stv;->a:Ll/stv$b;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0, p1}, Ll/stv$b;->a(Landroid/content/Context;Ll/stv$c;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    :catchall_0
    :cond_0
    return-void
.end method
