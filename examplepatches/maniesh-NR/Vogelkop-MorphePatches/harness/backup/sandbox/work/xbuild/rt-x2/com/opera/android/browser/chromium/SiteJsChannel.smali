.class public final Lcom/opera/android/browser/chromium/SiteJsChannel;
.super Ljo7;
.source "SourceFile"


# direct methods
.method public static isPushedCdbWhitelistDisabled()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public final d([B)V
    .registers 5

    sget-object v0, Lsnf;->b:Ljava/lang/String;

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {v0, p1, v2, v1, v2}, Ljo7;->h(Ljava/lang/String;[BIIZ)V

    new-instance p1, Lkoj;

    invoke-direct {p1, v2}, Lkoj;-><init>(B)V

    iget-object p0, p0, Ljo7;->a:Lumi;

    invoke-interface {p0, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
