.class public Ll/zmp0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Landroid/content/Context;)Ll/b3d0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/zmp0;->b(Landroid/content/Context;Ll/mm2;)Ll/b3d0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static b(Landroid/content/Context;Ll/mm2;)Ll/b3d0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/ot2;

    .line 4
    .line 5
    new-instance v0, Ll/iol;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/iol;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p1, v0}, Ll/ot2;-><init>(Ll/mm2;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Ll/ot2;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ll/ot2;-><init>(Ll/mm2;)V

    .line 17
    .line 18
    .line 19
    move-object p1, v0

    .line 20
    :goto_0
    invoke-static {p0, p1}, Ll/zmp0;->c(Landroid/content/Context;Ll/lj20;)Ll/b3d0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method private static c(Landroid/content/Context;Ll/lj20;)Ll/b3d0;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/zmp0$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/zmp0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ll/b3d0;

    .line 11
    .line 12
    new-instance v1, Ll/y3e;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ll/y3e;-><init>(Ll/y3e$c;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v1, p1}, Ll/b3d0;-><init>(Lcom/android/volley/a;Ll/lj20;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/b3d0;->g()V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method
