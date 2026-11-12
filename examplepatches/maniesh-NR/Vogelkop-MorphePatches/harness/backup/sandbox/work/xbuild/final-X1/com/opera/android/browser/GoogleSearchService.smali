.class public final Lcom/opera/android/browser/GoogleSearchService;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static reportAiModeQuery(Lorg/chromium/url/GURL;)V
    .registers 7
    .param p0    # Lorg/chromium/url/GURL;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->d:Lx5f;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Llqm;->k:Llqm;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v3, v4, v5}, Lx5f;->h(Ljava/lang/String;Llqm;Ljava/lang/String;Z)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p0

    iget-boolean v1, v0, Lx5f;->h:Z

    if-nez v1, :cond_2a

    return-void

    :cond_2a
    invoke-virtual {v0, p0, v4, v5}, Lx5f;->g(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method
