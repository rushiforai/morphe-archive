.class public final Lkk5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lshj;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/browser/chromium/ChromiumContent;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;B)V
    .registers 3

    iput-byte p2, p0, Lkk5;->a:B

    iput-object p1, p0, Lkk5;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z
    .registers 9

    iget-byte p3, p0, Lkk5;->a:B

    iget-object p0, p0, Lkk5;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    const/4 p4, 0x0

    const/4 v0, 0x1

    packed-switch p3, :pswitch_data_11c

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    :try_start_19
    invoke-static {p3, p4}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p3
    :try_end_1d
    .catch Ljava/net/URISyntaxException; {:try_start_19 .. :try_end_1d} :catch_79

    invoke-virtual {v1, p3, p4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_25
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_79

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    const-string v2, "com.opera.android.MainLauncherActivity"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    iget-object p3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->f:Lorg/chromium/url/GURL;

    iget-boolean v1, p3, Lorg/chromium/url/GURL;->b:Z

    if-eqz v1, :cond_51

    invoke-virtual {p3}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v1

    invoke-static {p3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p3

    xor-int/2addr p3, v0

    goto :goto_52

    :cond_51
    move p3, v0

    :goto_52
    iget-boolean v1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->p:Z

    if-eqz v1, :cond_79

    if-eqz p3, :cond_79

    iget p1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    and-int/lit16 p1, p1, 0xff

    if-nez p1, :cond_79

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lxgf;

    invoke-direct {p2, p1}, Lxgf;-><init>(Ljava/lang/String;)V

    sget-object p1, Llqm;->i:Llqm;

    iput-object p1, p2, Lxgf;->m:Llqm;

    iput-boolean v0, p2, Lxgf;->n:Z

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p2}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    move p4, v0

    :catch_79
    :cond_79
    return p4

    :pswitch_7a
    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p2

    const-string p3, "https://opera.com/connect"

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_dd

    invoke-virtual {p3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_ad

    const-string v3, "www."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_ad

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    :cond_ad
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_dd

    invoke-virtual {p3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lcqp;->y0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcqp;->y0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_dd

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p2

    new-instance p3, Lcd9;

    invoke-direct {p3}, Lcd9;-><init>()V

    invoke-virtual {p3, p2}, Ls63;->w0(Landroid/content/Context;)V

    invoke-static {p1}, Lx1p;->C(Lorg/chromium/content_public/browser/NavigationHandle;)Z

    move-result p1

    invoke-static {p0, p1}, Lx1p;->Y(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    move p4, v0

    :cond_dd
    return p4

    :pswitch_de
    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p2

    sget-object p3, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p2}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    if-eqz p2, :cond_11a

    invoke-static {p2}, Llcp;->t(Landroid/net/Uri;)Z

    move-result p3

    if-eqz p3, :cond_11a

    const-string p3, "ofa_cb"

    invoke-virtual {p2, p3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_101

    invoke-static {p2}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_102

    :cond_101
    const/4 p2, 0x0

    :goto_102
    if-eqz p2, :cond_112

    invoke-static {p2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_112

    new-instance p3, Lsk5;

    invoke-direct {p3, p2}, Lsk5;-><init>(Ljava/lang/String;)V

    invoke-static {p3}, Lac8;->a(Ljava/lang/Object;)V

    :cond_112
    invoke-static {p1}, Lx1p;->C(Lorg/chromium/content_public/browser/NavigationHandle;)Z

    move-result p1

    invoke-static {p0, p1}, Lx1p;->Y(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    move p4, v0

    :cond_11a
    return p4

    nop

    :pswitch_data_11c
    .packed-switch 0x0
        :pswitch_de
        :pswitch_7a
    .end packed-switch
.end method
