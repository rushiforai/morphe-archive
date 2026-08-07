.class public final Ll/fo0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/f2e0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/qxk;

    .line 2
    .line 3
    new-instance v1, Landroid/os/Handler;

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/qxk;-><init>(Landroid/os/Handler;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/fo0;->a:Ll/f2e0;

    .line 16
    .line 17
    return-void
.end method

.method public static a()Ll/f2e0;
    .locals 1

    .line 1
    invoke-static {}, Ll/zqd0;->a()Ll/zqd0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/zqd0;->b()Ll/ard0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/ard0;->b()Ll/f2e0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    sget-object v0, Ll/fo0;->a:Ll/f2e0;

    .line 17
    .line 18
    return-object v0
.end method
