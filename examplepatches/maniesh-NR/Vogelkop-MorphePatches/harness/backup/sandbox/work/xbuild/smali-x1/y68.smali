.class public final Ly68;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmud;


# instance fields
.field public final synthetic a:Lcom/opera/android/esim/ui/EsimActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/esim/ui/EsimActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly68;->a:Lcom/opera/android/esim/ui/EsimActivity;

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/MenuItem;)Z
    .registers 7

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a03ba

    const/4 v1, 0x0

    if-ne p1, v0, :cond_5d

    sget p1, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    iget-object p0, p0, Ly68;->a:Lcom/opera/android/esim/ui/EsimActivity;

    invoke-virtual {p0}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object p1

    iget-object p1, p1, Lu78;->n:Lrlh;

    iget-object p1, p1, Lrlh;->a:Lnak;

    invoke-virtual {p1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Li78;

    iget-object p1, p1, Li78;->a:Lh78;

    iget-object p1, p1, Lh78;->b:Le78;

    const/4 v0, 0x0

    if-eqz p1, :cond_26

    iget-object p1, p1, Le78;->a:Ljava/lang/String;

    goto :goto_27

    :cond_26
    move-object p1, v0

    :goto_27
    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->n0()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v2

    if-eqz v2, :cond_47

    invoke-interface {v2}, Lorg/chromium/content_public/browser/WebContents;->s()Lorg/chromium/url/GURL;

    move-result-object v2

    if-eqz v2, :cond_47

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_47

    new-instance v3, Lrma;

    const/4 v4, 0x4

    invoke-direct {v3, v4}, Lrma;-><init>(B)V

    invoke-virtual {v3, v2, v0}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v3}, Lrma;->d()Lhra;

    move-result-object v2

    goto :goto_48

    :cond_47
    move-object v2, v0

    :goto_48
    if-eqz p1, :cond_50

    if-eqz v2, :cond_50

    invoke-virtual {v2, p1}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v0

    :cond_50
    if-eqz v0, :cond_5d

    iget-object p1, v0, Lhra;->h:Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/opera/android/FullscreenWebActivity;->s0(Landroid/net/Uri;II)V

    return v0

    :cond_5d
    return v1
.end method

.method public final d(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 5

    sget p2, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    iget-object p0, p0, Ly68;->a:Lcom/opera/android/esim/ui/EsimActivity;

    invoke-virtual {p0}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object p2

    iget-object p2, p2, Lu78;->n:Lrlh;

    iget-object p2, p2, Lrlh;->a:Lnak;

    invoke-virtual {p2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Li78;

    iget-object p2, p2, Li78;->a:Lh78;

    iget-object p2, p2, Lh78;->b:Le78;

    if-nez p2, :cond_19

    return-void

    :cond_19
    sget-object p2, Lf78;->a:Lf78;

    sget-object p2, Lx68;->a:[I

    const/4 v0, 0x0

    aget p2, p2, v0

    const/4 v1, 0x1

    if-ne p2, v1, :cond_49

    const p2, 0x7f0a03ba

    const v1, 0x7f140882

    invoke-interface {p1, v0, p2, v0, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object p1

    const p2, 0x7f080576

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object p1

    new-instance p2, Ldxh;

    const v0, 0x7f040529

    invoke-direct {p2, v0}, Ldxh;-><init>(I)V

    invoke-virtual {p2, p0}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;

    move-result-object p0

    const/4 p1, 0x2

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setShowAsActionFlags(I)Landroid/view/MenuItem;

    return-void

    :cond_49
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
