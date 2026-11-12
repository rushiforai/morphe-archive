.class public abstract Lcti;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lhv5;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lhv5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcti;->a:Lhv5;

    return-void
.end method

.method public static a(Lzg;Leri;Lbti;Lp6l;)Ljava/lang/String;
    .registers 11

    iget-object v0, p0, Lzg;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget v1, p0, Lzg;->a:I

    iget-object v2, p0, Lzg;->b:Ljava/lang/Object;

    check-cast v2, Lsre;

    if-eqz v0, :cond_37

    invoke-interface {p1}, Leri;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_28

    const/4 v3, 0x0

    goto :goto_35

    :cond_28
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, LJ/N;->M3e4Lx_w(Ljava/lang/Object;Ljava/lang/Object;Z)Z

    move-result v3

    :goto_35
    if-nez v3, :cond_41

    :cond_37
    invoke-virtual {v2}, Lsre;->a()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Leti;->a:Lq6e;

    invoke-interface {p1, v1, p3, v0}, Leri;->a(ILp6l;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_41
    invoke-interface {p2, v0}, Lbti;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2}, Lbti;->B()Z

    move-result p3

    if-eqz p3, :cond_82

    new-instance p3, Lcom/opera/android/browser/UrlMangler$Builder;

    const-string v0, "search"

    invoke-direct {p3, v0, p1}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p0, Lzg;

    iget-object p0, p0, Lzg;->b:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p2, p0}, Lbti;->F(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "search_template"

    iget-object p2, p3, Lcom/opera/android/browser/UrlMangler$Builder;->c:Ljava/util/HashMap;

    invoke-virtual {p2, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v1}, Lvep;->A(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "search_origin"

    invoke-virtual {p2, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Lsre;->a()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    invoke-virtual {p3}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_82
    return-object p1
.end method
