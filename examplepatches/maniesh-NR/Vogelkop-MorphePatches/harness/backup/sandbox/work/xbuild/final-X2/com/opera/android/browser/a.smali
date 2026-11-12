.class public final Lcom/opera/android/browser/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lshj;


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/a;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    return-void
.end method


# virtual methods
.method public final b(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z
    .registers 11

    iget-boolean p2, p1, Lorg/chromium/content_public/browser/NavigationHandle;->a:Z

    const/4 p3, 0x0

    if-eqz p2, :cond_c3

    iget p2, p1, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    and-int/lit16 p4, p2, 0xff

    const/4 v0, 0x5

    if-eq p4, v0, :cond_c3

    const/16 v0, 0x8

    if-eq p4, v0, :cond_c3

    const/high16 p4, 0x1000000

    and-int/2addr p2, p4

    if-nez p2, :cond_c3

    iget-object p2, p0, Lcom/opera/android/browser/a;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p2}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lcom/opera/android/browser/BrowserUtils;->b(Ljava/lang/String;)Lzg;

    move-result-object p4

    if-eqz p4, :cond_c3

    iget-object v0, p4, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Lzg;

    iget-object v0, v0, Lzg;->b:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {v1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v1

    iget v2, p4, Lzg;->a:I

    invoke-static {v2, v0, v1}, Lzg;->o(ILjava/lang/String;Ljava/lang/String;)Lzg;

    move-result-object v0

    if-eqz v0, :cond_c3

    iget-object v1, v0, Lzg;->b:Ljava/lang/Object;

    check-cast v1, Lsre;

    new-instance v2, Lcom/opera/android/browser/UrlMangler$Builder;

    iget-object v3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {v3}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v3

    const-string v4, "search"

    invoke-direct {v2, v4, v3}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v3, Lzg;

    iget-object v3, v3, Lzg;->b:Ljava/lang/Object;

    check-cast v3, Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "search_template"

    iget-object v5, v2, Lcom/opera/android/browser/UrlMangler$Builder;->c:Ljava/util/HashMap;

    invoke-virtual {v5, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, v0, Lzg;->a:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "search_origin"

    invoke-virtual {v5, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Lsre;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    invoke-virtual {v2}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c3

    const/4 v2, 0x0

    sget-object v3, Llqm;->b:Llqm;

    invoke-static {v0, v2, v3}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v0

    if-eqz v0, :cond_c3

    iget-object p4, p4, Lzg;->b:Ljava/lang/Object;

    check-cast p4, Lsre;

    invoke-virtual {p4}, Lsre;->a()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v1}, Lsre;->a()Ljava/lang/String;

    move-result-object v1

    invoke-static {p4, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p4

    const/high16 v1, -0x40000000    # -2.0f

    if-eqz p4, :cond_a5

    iget p4, v0, Lksc;->d:I

    or-int/2addr p4, v1

    iput p4, v0, Lksc;->d:I

    :cond_a5
    iget p1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    and-int/2addr p1, v1

    const/4 p4, 0x1

    if-eqz p1, :cond_ac

    move p3, p4

    :cond_ac
    iput-boolean p3, v0, Lksc;->k:Z

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-static {p1}, LJ/N;->MHFaii6l(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    iput-object p1, v0, Llsc;->o:[B

    new-instance p1, Ljri;

    invoke-direct {p1, p0, v0, p4}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return p4

    :cond_c3
    return p3
.end method
