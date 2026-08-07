.class public Ll/xzv;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Z

.field private static b:Ll/zzv;


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

.method public static a()Ll/zzv;
    .locals 1

    .line 1
    sget-object v0, Ll/xzv;->b:Ll/zzv;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b(Landroid/content/Context;Ll/zzv;)V
    .locals 0

    .line 1
    sput-object p1, Ll/xzv;->b:Ll/zzv;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xzv;->c(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(Landroid/content/Context;)V
    .locals 5

    .line 1
    sget-object v0, Ll/xzv;->b:Ll/zzv;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v2, v1

    .line 9
    :goto_0
    sget-boolean v3, Ll/xzv;->a:Z

    .line 10
    .line 11
    if-eqz v3, :cond_1

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    move v1, v2

    .line 15
    :goto_1
    new-instance v2, Ll/fyq0;

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    goto :goto_2

    .line 21
    :cond_2
    move-object v0, v4

    .line 22
    :goto_2
    if-nez v3, :cond_3

    .line 23
    .line 24
    invoke-static {p0}, Ll/gyq0;->d(Landroid/content/Context;)Ll/gyq0;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    :cond_3
    invoke-direct {v2, v0, v4}, Ll/fyq0;-><init>(Ll/zzv;Ll/zzv;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v2}, Ll/ouq0;->r(Ll/zzv;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
