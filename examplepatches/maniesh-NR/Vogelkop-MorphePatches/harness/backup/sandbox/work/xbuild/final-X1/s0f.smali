.class public abstract Ls0f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public b:Landroid/os/Bundle;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 20
    iput-wide v0, p0, Ls0f;->a:J

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls0f;->b:Landroid/os/Bundle;

    const-string v0, "action_created"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Ls0f;->a:J

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    const-string v0, "com.opera.android.action.SHOW_ESIM"

    invoke-virtual {p0, p1, v0}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public final b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 4

    invoke-static {p1}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const/high16 v0, 0x20000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object p2, p0, Ls0f;->b:Landroid/os/Bundle;

    if-eqz p2, :cond_13

    invoke-virtual {p1, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_13
    invoke-virtual {p0}, Ls0f;->c()Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    return-object p1
.end method

.method public c()Landroid/os/Bundle;
    .registers 5

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "action_created"

    iget-wide v2, p0, Ls0f;->a:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    return-object v0
.end method

.method public d(Landroid/content/Context;)Lyhe;
    .registers 5

    invoke-virtual {p0, p1}, Ls0f;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    sget-object v0, Lmdb;->b:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    const/4 v1, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {p1, v0, p0, v2, v1}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object p0

    return-object p0
.end method

.method public e(Lcom/opera/android/BrowserActivity;)Z
    .registers 2

    new-instance p0, Ls16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lxxh;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lac8;->a(Ljava/lang/Object;)V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    const/4 p0, 0x1

    return p0
.end method

.method public f(Landroid/content/Context;)Landroid/net/Uri;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public g(Landroid/content/Context;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method
