.class public final Lt82;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lji;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;Lji;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f140da0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lt82;->a:Ljava/lang/String;

    iput-object p2, p0, Lt82;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lt82;->c:Lji;

    return-void
.end method


# virtual methods
.method public final a(Lg82;Llqm;)Llsc;
    .registers 12

    iget-object v0, p0, Lt82;->c:Lji;

    invoke-virtual {v0}, Lji;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loue;

    iget-object v1, p1, Lg82;->c:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v4, v0, Loue;->a:Lnv6;

    sget-wide v6, Loue;->b:J

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_25

    iget-object v0, v4, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Lpd7;

    new-instance v3, Lni2;

    const/4 v8, 0x3

    invoke-direct/range {v3 .. v8}, Lni2;-><init>(Ljava/lang/Object;Ljava/lang/Object;JB)V

    invoke-virtual {v0, v3}, Lldk;->f(Ljava/lang/Runnable;)V

    :cond_25
    new-instance v0, Lcom/opera/android/browser/UrlMangler$Builder;

    const-string v2, "article"

    invoke-direct {v0, v2, v1}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p1, Lg82;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/opera/android/browser/UrlMangler$Builder;->title(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    iget-object p0, p0, Lt82;->a:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    iget-object p0, p1, Lg82;->d:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/UrlMangler$Builder;->externalUrl(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    iget-object p0, p1, Lg82;->a:Ljava/lang/String;

    const-string v1, "article_id"

    iget-object v2, v0, Lcom/opera/android/browser/UrlMangler$Builder;->c:Ljava/util/HashMap;

    invoke-virtual {v2, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "article_transcoded"

    const-string v1, "1"

    invoke-virtual {v2, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p1, Lg82;->e:Ljava/lang/String;

    if-eqz p0, :cond_54

    const-string p1, "article_share_url"

    invoke-virtual {v2, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_54
    invoke-virtual {v0}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    invoke-static {p0, p1, p2}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object p0

    return-object p0
.end method
