.class public Ll/g610;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static a(Landroid/content/Context;)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/g610;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    sput-boolean v0, Ll/g610;->a:Z

    .line 8
    .line 9
    invoke-static {}, Ll/k50;->c()Ll/k50;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0}, Ll/k50;->d(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/zlq;->b()Ll/zlq;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p0}, Ll/zlq;->d(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/g610;->a:Z

    .line 3
    .line 4
    invoke-static {}, Ll/k50;->c()Ll/k50;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/k50;->c()Ll/k50;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/k50;->e()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-static {}, Ll/zlq;->b()Ll/zlq;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/zlq;->e()V

    .line 22
    .line 23
    .line 24
    return-void
.end method
