.class public final Lq32;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lyv3;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lyv3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq32;->a:Landroid/content/Context;

    iput-object p2, p0, Lq32;->b:Lyv3;

    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;Lcom/opera/api/Callback;)V
    .registers 6

    iget-object v0, p0, Lq32;->a:Landroid/content/Context;

    const-string v1, "android.permission.CAMERA"

    invoke-static {v0, v1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    new-instance v0, Ln32;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Ln32;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p0, p1, v0}, Lq32;->b(Ljava/io/File;Ljava/lang/Runnable;)V

    return-void

    :cond_14
    iget-object v0, p0, Lq32;->b:Lyv3;

    invoke-virtual {v0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/ui/base/WindowAndroid;

    new-instance v2, Lp32;

    invoke-direct {v2, p0, p1, p2}, Lp32;-><init>(Lq32;Ljava/io/File;Lcom/opera/api/Callback;)V

    invoke-static {v0, v1, v2}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    return-void
.end method

.method public final b(Ljava/io/File;Ljava/lang/Runnable;)V
    .registers 5

    invoke-static {p1}, Lw7d;->x(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Lo32;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lo32;-><init>(Ljava/lang/Runnable;B)V

    new-instance p2, Landroid/content/Intent;

    const-string v1, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {p2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "output"

    invoke-virtual {p2, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 p1, 0x2

    invoke-virtual {p2, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lq32;->a:Landroid/content/Context;

    invoke-static {p0}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object p0

    new-instance p1, Lqj2;

    const/16 v1, 0xf

    invoke-direct {p1, v0, v1}, Lqj2;-><init>(Ljava/lang/Object;B)V

    check-cast p0, Lhjf;

    invoke-virtual {p0, p2, p1}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    return-void
.end method
