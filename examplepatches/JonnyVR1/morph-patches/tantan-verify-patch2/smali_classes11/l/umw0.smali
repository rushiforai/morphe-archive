.class public final Ll/umw0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "RestrictedApi"
    }
.end annotation


# static fields
.field public static final c:Ll/cnw0;

.field public static final d:Landroid/content/Intent;


# instance fields
.field public final a:Ll/snw0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/cnw0;

    .line 2
    .line 3
    const-string v1, "OverlayDisplayService"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/cnw0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/umw0;->c:Ll/cnw0;

    .line 9
    .line 10
    new-instance v0, Landroid/content/Intent;

    .line 11
    .line 12
    const-string v1, "com.google.android.play.core.lmd.BIND_OVERLAY_DISPLAY_SERVICE"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v1, "com.android.vending"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/umw0;->d:Landroid/content/Intent;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/unw0;->a(Landroid/content/Context;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v1, Ll/snw0;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sget-object v3, Ll/umw0;->c:Ll/cnw0;

    .line 17
    .line 18
    sget-object v5, Ll/umw0;->d:Landroid/content/Intent;

    .line 19
    .line 20
    sget-object v6, Ll/pmw0;->a:Ll/pmw0;

    .line 21
    .line 22
    const/4 v7, 0x0

    .line 23
    const-string v4, "OverlayDisplayService"

    .line 24
    .line 25
    invoke-direct/range {v1 .. v7}, Ll/snw0;-><init>(Landroid/content/Context;Ll/cnw0;Ljava/lang/String;Landroid/content/Intent;Ll/pmw0;Ll/inw0;)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/umw0;->a:Ll/snw0;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    iput-object v0, p0, Ll/umw0;->a:Ll/snw0;

    .line 33
    .line 34
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/umw0;->b:Ljava/lang/String;

    .line 39
    .line 40
    return-void
.end method

.method public static bridge synthetic a()Ll/cnw0;
    .locals 1

    .line 1
    sget-object v0, Ll/umw0;->c:Ll/cnw0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic b(Ll/umw0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/umw0;->a:Ll/snw0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Ll/umw0;->c:Ll/cnw0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    new-array v1, v1, [Ljava/lang/Object;

    .line 10
    .line 11
    const-string v2, "unbind LMD display overlay service"

    .line 12
    .line 13
    invoke-virtual {v0, v2, v1}, Ll/cnw0;->c(Ljava/lang/String;[Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/umw0;->a:Ll/snw0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/snw0;->u()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final d(Ll/lmw0;Ll/zmw0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/umw0;->a:Ll/snw0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/umw0;->c:Ll/cnw0;

    .line 6
    .line 7
    const-string p1, "Play Store not found."

    .line 8
    .line 9
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p2, "error: %s"

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1}, Ll/cnw0;->a(Ljava/lang/String;[Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v2, Ll/sni0;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/sni0;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v6, p0, Ll/umw0;->a:Ll/snw0;

    .line 25
    .line 26
    new-instance v0, Ll/rmw0;

    .line 27
    .line 28
    move-object v5, v2

    .line 29
    move-object v1, p0

    .line 30
    move-object v3, p1

    .line 31
    move-object v4, p2

    .line 32
    invoke-direct/range {v0 .. v5}, Ll/rmw0;-><init>(Ll/umw0;Ll/sni0;Ll/lmw0;Ll/zmw0;Ll/sni0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v6, v0, v2}, Ll/snw0;->s(Ll/dnw0;Ll/sni0;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final e(Ll/wmw0;Ll/zmw0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/umw0;->a:Ll/snw0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/umw0;->c:Ll/cnw0;

    .line 6
    .line 7
    const-string p1, "Play Store not found."

    .line 8
    .line 9
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p2, "error: %s"

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1}, Ll/cnw0;->a(Ljava/lang/String;[Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/wmw0;->g()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    sget-object p0, Ll/umw0;->c:Ll/cnw0;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    new-array p1, p1, [Ljava/lang/Object;

    .line 29
    .line 30
    const-string v0, "Failed to convert OverlayDisplayShowRequest when to create a new session: appId cannot be null."

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1}, Ll/cnw0;->a(Ljava/lang/String;[Ljava/lang/Object;)I

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/ymw0;->c()Ll/xmw0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/16 p1, 0x1fe0

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/xmw0;->b(I)Ll/xmw0;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xmw0;->c()Ll/ymw0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p2, p0}, Ll/zmw0;->a(Ll/ymw0;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    new-instance v2, Ll/sni0;

    .line 53
    .line 54
    invoke-direct {v2}, Ll/sni0;-><init>()V

    .line 55
    .line 56
    .line 57
    iget-object v6, p0, Ll/umw0;->a:Ll/snw0;

    .line 58
    .line 59
    new-instance v0, Ll/qmw0;

    .line 60
    .line 61
    move-object v5, v2

    .line 62
    move-object v1, p0

    .line 63
    move-object v3, p1

    .line 64
    move-object v4, p2

    .line 65
    invoke-direct/range {v0 .. v5}, Ll/qmw0;-><init>(Ll/umw0;Ll/sni0;Ll/wmw0;Ll/zmw0;Ll/sni0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v6, v0, v2}, Ll/snw0;->s(Ll/dnw0;Ll/sni0;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final f(Ll/bnw0;Ll/zmw0;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/umw0;->a:Ll/snw0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/umw0;->c:Ll/cnw0;

    .line 6
    .line 7
    const-string p1, "Play Store not found."

    .line 8
    .line 9
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p2, "error: %s"

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1}, Ll/cnw0;->a(Ljava/lang/String;[Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v2, Ll/sni0;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/sni0;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v7, p0, Ll/umw0;->a:Ll/snw0;

    .line 25
    .line 26
    new-instance v0, Ll/smw0;

    .line 27
    .line 28
    move-object v6, v2

    .line 29
    move-object v1, p0

    .line 30
    move-object v3, p1

    .line 31
    move-object v5, p2

    .line 32
    move v4, p3

    .line 33
    invoke-direct/range {v0 .. v6}, Ll/smw0;-><init>(Ll/umw0;Ll/sni0;Ll/bnw0;ILl/zmw0;Ll/sni0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v7, v0, v2}, Ll/snw0;->s(Ll/dnw0;Ll/sni0;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
