.class public final Lzfg;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public a(Lq5j;)V
    .registers 4
    .param p1    # Lq5j;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p1, Lq5j;->b:Ljava/lang/String;

    const-string v0, "ga_usage_statistics"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    iget-object p0, p1, Lq5j;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, LJ/N;->Mk5xAnHM(Z)V

    return-void

    :cond_14
    const-string p1, "personalized_default"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_35

    const-string p1, "personalized_ads"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_35

    const-string p1, "personalized_news"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_35

    const-string p1, "process_news_topics"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_35

    return-void

    :cond_35
    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->f()V

    return-void
.end method
