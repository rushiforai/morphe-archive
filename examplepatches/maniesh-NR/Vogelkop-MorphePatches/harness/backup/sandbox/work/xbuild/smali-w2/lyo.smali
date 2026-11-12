.class public final synthetic Llyo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ldzo;


# direct methods
.method public synthetic constructor <init>(Ldzo;)V
    .registers 2

    iput-object p1, p0, Llyo;->a:Ldzo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Z
    .registers 8

    const-string v0, "operaadx://FINISHED"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iget-object p0, p0, Llyo;->a:Ldzo;

    const/4 v1, 0x1

    if-eqz v0, :cond_25

    iget-boolean p1, p0, Ldzo;->j:Z

    if-nez p1, :cond_8a

    iput-boolean v1, p0, Ldzo;->e:Z

    iget-object p1, p0, Ldzo;->h:Lz4k;

    if-eqz p1, :cond_22

    iget-object p1, p1, Lz4k;->b:Ljava/lang/Object;

    check-cast p1, Llxo;

    iget-object p1, p1, Lk8;->b:Ljava/lang/Object;

    check-cast p1, Ldn;

    if-eqz p1, :cond_22

    invoke-interface {p1}, Ldn;->i()V

    :cond_22
    iput-boolean v1, p0, Ldzo;->j:Z

    return v1

    :cond_25
    iget-object v0, p0, Ldzo;->c:Lnyo;

    iget-object v2, p0, Ldzo;->d:Lfio;

    if-eqz v2, :cond_33

    iget-boolean v3, v2, Lfio;->f:Z

    if-eqz v3, :cond_33

    iget v2, v2, Lfio;->d:I

    if-eq v2, v1, :cond_46

    :cond_33
    iget-wide v2, p0, Ldzo;->g:J

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_8a

    const-wide/16 v4, 0x7d0

    add-long/2addr v2, v4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-ltz v2, :cond_8a

    :cond_46
    iget-object v2, p0, Ldzo;->a:Lbl;

    if-eqz v2, :cond_50

    invoke-interface {v2, p1}, Lbl;->k(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_8a

    :cond_50
    new-instance v2, Landroid/content/Intent;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v2}, Ln5p;->b(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_88

    const/high16 p1, 0x10000000

    invoke-virtual {v2, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p1, p0, Ldzo;->b:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_80

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_80

    iget-object p0, p0, Ldzo;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return v1

    :cond_80
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return v1

    :cond_88
    const/4 p0, 0x0

    return p0

    :cond_8a
    return v1
.end method
