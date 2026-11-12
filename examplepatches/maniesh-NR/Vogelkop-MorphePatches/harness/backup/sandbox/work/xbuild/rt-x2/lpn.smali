.class public final Llpn;
.super Lrtn;
.source "SourceFile"


# instance fields
.field public final c:Lrpn;

.field public final d:Landroid/net/Uri;

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/WebContentsWrapper;Lrpn;Landroid/net/Uri;)V
    .registers 4

    invoke-direct {p0, p1}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    iput-object p2, p0, Llpn;->c:Lrpn;

    iput-object p3, p0, Llpn;->d:Landroid/net/Uri;

    const/4 p1, 0x1

    iput-boolean p1, p0, Llpn;->e:Z

    return-void
.end method


# virtual methods
.method public final titleWasSet(Ljava/lang/String;)V
    .registers 9

    iget-boolean p1, p0, Llpn;->e:Z

    if-nez p1, :cond_6c

    iget-object p1, p0, Lrtn;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-boolean v0, p1, Lcom/opera/android/browser/WebContentsWrapper;->j:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    move-object p1, v1

    :cond_c
    if-eqz p1, :cond_37

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    if-eqz p1, :cond_37

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->p()Lorg/chromium/url/GURL;

    move-result-object v0

    iget-object v2, p0, Llpn;->d:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v2}, LJ/N;->MstQ1QcZ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    move-object p1, v1

    :cond_28
    if-eqz p1, :cond_37

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->n()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_37

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_37

    move-object v1, p1

    :cond_37
    if-nez v1, :cond_42

    new-instance p1, Lrxh;

    const v0, 0x7f141463

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    goto :goto_47

    :cond_42
    new-instance p1, Lqxh;

    invoke-direct {p1, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :goto_47
    iget-object p0, p0, Llpn;->c:Lrpn;

    iget-object v0, p0, Lrpn;->b:Lnak;

    :cond_4b
    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lqpn;

    iget-object v2, v1, Lqpn;->a:Lptl;

    iget-object v2, v2, Lptl;->b:Lxsl;

    move-object v3, v2

    new-instance v2, Lptl;

    invoke-direct {v2, p1, v3}, Lptl;-><init>(Lpxh;Lxsl;)V

    const/4 v5, 0x0

    const/16 v6, 0xe

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lqpn;->a(Lqpn;Lptl;ZLp68;ZI)Lqpn;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4b

    return-void

    :cond_6c
    const/4 p1, 0x0

    iput-boolean p1, p0, Llpn;->e:Z

    return-void
.end method
