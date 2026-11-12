.class public final Lpqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lshj;
.implements Lype;


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final b:Lx5f;

.field public final c:Lj4c;

.field public final d:Lesk;

.field public final e:Lesk;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lx5f;Lj4c;Lesk;Lesk;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpqe;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p2, p0, Lpqe;->b:Lx5f;

    iput-object p3, p0, Lpqe;->c:Lj4c;

    iput-object p4, p0, Lpqe;->d:Lesk;

    iput-object p5, p0, Lpqe;->e:Lesk;

    return-void
.end method


# virtual methods
.method public final a(Lorg/chromium/url/GURL;)Z
    .registers 2

    invoke-virtual {p0, p1}, Lpqe;->c(Lorg/chromium/url/GURL;)Z

    move-result p0

    return p0
.end method

.method public final b(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z
    .registers 6

    iget-boolean p3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    const/4 p4, 0x0

    if-eqz p3, :cond_6

    return p4

    :cond_6
    iget-boolean p3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->q:Z

    if-eqz p3, :cond_b

    return p4

    :cond_b
    iget-boolean p3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->u:Z

    if-eqz p3, :cond_10

    return p4

    :cond_10
    iget p3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    const/high16 v0, 0x1000000

    and-int/2addr p3, v0

    if-eqz p3, :cond_18

    return p4

    :cond_18
    iget-boolean p1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->a:Z

    if-nez p1, :cond_1d

    return p4

    :cond_1d
    invoke-virtual {p0, p2}, Lpqe;->c(Lorg/chromium/url/GURL;)Z

    move-result p0

    return p0
.end method

.method public final c(Lorg/chromium/url/GURL;)Z
    .registers 12

    iget-object v0, p0, Lpqe;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_10d

    const-string v1, "article_id"

    invoke-static {v0, v1}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_10d

    new-instance v1, Lorg/chromium/url/GURL;

    invoke-static {v0}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Lorg/chromium/url/GURL;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10d

    invoke-virtual {v1}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10d

    invoke-virtual {v1}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10d

    iget-object v0, v1, Lorg/chromium/url/GURL;->c:Lorg/chromium/url/Parsed;

    iget v3, v0, Lorg/chromium/url/Parsed;->i:I

    iget v0, v0, Lorg/chromium/url/Parsed;->j:I

    invoke-virtual {v1, v3, v0}, Lorg/chromium/url/GURL;->b(II)Ljava/lang/String;

    move-result-object v0

    iget-object v3, p1, Lorg/chromium/url/GURL;->c:Lorg/chromium/url/Parsed;

    iget v4, v3, Lorg/chromium/url/Parsed;->i:I

    iget v3, v3, Lorg/chromium/url/Parsed;->j:I

    invoke-virtual {p1, v4, v3}, Lorg/chromium/url/GURL;->b(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10d

    invoke-virtual {v1}, Lorg/chromium/url/GURL;->e()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/news/detail"

    const/4 v3, 0x6

    invoke-static {v0, v1, v2, v2, v3}, Lkotlin/text/StringsKt;->L(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result v1

    if-ltz v1, :cond_10d

    add-int/lit8 v1, v1, 0xc

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->e()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v1, :cond_10d

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10d

    iget-object v0, p0, Lpqe;->b:Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_9d

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v3

    invoke-virtual {v3, v1}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object v1

    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Ljf0;->e(I)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    :cond_9d
    iget-object v0, p0, Lpqe;->e:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loue;

    iget-object v2, v0, Loue;->a:Lnv6;

    sget-wide v4, Loue;->b:J

    iget-boolean v0, p1, Lorg/chromium/url/GURL;->b:Z

    if-nez v0, :cond_b0

    const/4 v0, 0x0

    :goto_ae
    move-object v3, v0

    goto :goto_b5

    :cond_b0
    invoke-virtual {p1}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v0

    goto :goto_ae

    :goto_b5
    if-eqz v3, :cond_c4

    iget-object v0, v2, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Lpd7;

    new-instance v1, Lni2;

    const/4 v6, 0x3

    invoke-direct/range {v1 .. v6}, Lni2;-><init>(Ljava/lang/Object;Ljava/lang/Object;JB)V

    invoke-virtual {v0, v1}, Lldk;->f(Ljava/lang/Runnable;)V

    :cond_c4
    iget-object v0, p0, Lpqe;->c:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lq82;

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "placeholder_"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v1, Lg82;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v2, 0x2

    const-string v4, ""

    const/4 v7, 0x0

    move-object v6, v5

    invoke-direct/range {v1 .. v9}, Lg82;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object p1, v0, Lq82;->h:Lc5o;

    iget-object v0, p1, Lc5o;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Lc5o;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lhpd;

    const/16 v0, 0x10

    invoke-direct {p1, p0, v1, v0}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0

    :cond_10d
    return v2
.end method
