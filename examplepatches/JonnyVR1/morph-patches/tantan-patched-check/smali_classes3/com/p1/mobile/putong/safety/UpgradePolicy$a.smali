.class public Lcom/p1/mobile/putong/safety/UpgradePolicy$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w84;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/safety/UpgradePolicy;->checkUpdate(Landroid/app/Activity;Ll/y20;Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/app/Activity;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ll/y20;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ll/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->a:Landroid/app/Activity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->b:Ll/y20;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->c:Ll/y20;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/y20;Ljava/io/IOException;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/y20;Ll/vx0;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/y20;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/IOException;

    .line 2
    .line 3
    const-string v1, "It\'s the latest version\uff01"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onFailure(Ll/ry3;Ljava/io/IOException;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/IOException;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->a:Landroid/app/Activity;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->b:Ll/y20;

    .line 4
    .line 5
    new-instance v0, Ll/z2k0;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2}, Ll/z2k0;-><init>(Ll/y20;Ljava/io/IOException;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onResponse(Ll/ry3;Ll/i5d0;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/i5d0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Ll/vx0;->e(Ll/i5d0;)Ll/vx0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/vx0;->d()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->a:Landroid/app/Activity;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->c:Ll/y20;

    .line 20
    .line 21
    new-instance v0, Ll/x2k0;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, Ll/x2k0;-><init>(Ll/y20;Ll/vx0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->a:Landroid/app/Activity;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->b:Ll/y20;

    .line 33
    .line 34
    new-instance p2, Ll/y2k0;

    .line 35
    .line 36
    invoke-direct {p2, p0}, Ll/y2k0;-><init>(Ll/y20;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
