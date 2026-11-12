.class public final Lp0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lshj;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lp0a;->a:B

    iput-object p1, p0, Lp0a;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lorg/chromium/url/GURL;)Z
    .registers 3

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p0

    const-string v0, "google.com"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "www.google.com"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_22

    :cond_20
    const/4 p0, 0x1

    return p0

    :cond_22
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final b(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z
    .registers 7

    iget-byte v0, p0, Lp0a;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lp0a;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_7c

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lbtb;->b(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2d

    check-cast p0, Loc2;

    iget-object p0, p0, Loc2;->b:Ljava/lang/Object;

    check-cast p0, Ldx3;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string p2, "jump_minigame.visited"

    const/4 p3, 0x1

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_2d
    return v1

    :pswitch_2e
    if-nez p3, :cond_7a

    if-nez p4, :cond_7a

    iget-boolean p3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->b:Z

    if-eqz p3, :cond_7a

    iget-boolean p3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->p:Z

    if-eqz p3, :cond_7a

    iget-boolean p3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->v:Z

    if-nez p3, :cond_7a

    iget-boolean p3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->u:Z

    if-nez p3, :cond_7a

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->e()Ljava/lang/String;

    move-result-object p3

    const-string p4, "/aclk"

    invoke-virtual {p3, p4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_7a

    invoke-static {p2}, Lp0a;->a(Lorg/chromium/url/GURL;)Z

    move-result p2

    if-eqz p2, :cond_7a

    iget-object p1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->x:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->s()Lorg/chromium/url/GURL;

    move-result-object p1

    invoke-static {p1}, Lorg/chromium/url/GURL;->i(Lorg/chromium/url/GURL;)Z

    move-result p2

    if-nez p2, :cond_7a

    invoke-static {p1}, Lp0a;->a(Lorg/chromium/url/GURL;)Z

    move-result p2

    if-eqz p2, :cond_7a

    check-cast p0, Lx5f;

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->h()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Lrkc;

    const/16 p3, 0x1d

    invoke-direct {p2, p1, p3}, Lrkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p2}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    :cond_7a
    return v1

    nop

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method
