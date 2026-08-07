.class public Ll/u5l$a;
.super Ll/ilw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u5l;->E()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/u5l;


# direct methods
.method public constructor <init>(Ll/u5l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5l$a;->a:Ll/u5l;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ilw;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/ilw;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/u5l$a;->a:Ll/u5l;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pd00;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/w20;->b(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/ilw;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/u5l$a;->a:Ll/u5l;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/u5l;->c0()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/u5l$a;->a:Ll/u5l;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pd00;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const-string v0, "extra_layer_id"

    .line 30
    .line 31
    const/4 v1, -0x1

    .line 32
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v0, "extra_layer_display"

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p2, p0}, Ll/dkb;->c7(ILjava/lang/String;)Lrx/c;

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ilw;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/u5l$a;->a:Ll/u5l;

    .line 5
    .line 6
    new-instance p2, Ljava/util/Timer;

    .line 7
    .line 8
    invoke-direct {p2}, Ljava/util/Timer;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, p2}, Ll/u5l;->a0(Ll/u5l;Ljava/util/Timer;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/u5l$a;->a:Ll/u5l;

    .line 15
    .line 16
    invoke-static {p1}, Ll/u5l;->Y(Ll/u5l;)Ljava/util/Timer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance p2, Ll/u5l$a$a;

    .line 21
    .line 22
    invoke-direct {p2, p0}, Ll/u5l$a$a;-><init>(Ll/u5l$a;)V

    .line 23
    .line 24
    .line 25
    const-wide/16 v0, 0x1b58

    .line 26
    .line 27
    invoke-virtual {p1, p2, v0, v1}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
