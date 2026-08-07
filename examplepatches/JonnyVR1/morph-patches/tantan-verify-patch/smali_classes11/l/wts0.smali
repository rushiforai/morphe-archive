.class public final Ll/wts0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ots0;
.implements Ll/mts0;


# instance fields
.field public final a:Ll/wit0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/v2s0;Ll/far0;)V
    .locals 17
    .param p3    # Ll/v2s0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcjw;
        }
    .end annotation

    .line 1
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bxy0;->B()Ll/jjt0;

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/xkt0;->a()Ll/xkt0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {}, Ll/fcs0;->a()Ll/fcs0;

    .line 12
    .line 13
    .line 14
    move-result-object v12

    .line 15
    const/4 v15, 0x0

    .line 16
    const/16 v16, 0x0

    .line 17
    .line 18
    const-string v3, ""

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    const/4 v5, 0x0

    .line 22
    const/4 v6, 0x0

    .line 23
    const/4 v7, 0x0

    .line 24
    const/4 v9, 0x0

    .line 25
    const/4 v10, 0x0

    .line 26
    const/4 v11, 0x0

    .line 27
    const/4 v13, 0x0

    .line 28
    const/4 v14, 0x0

    .line 29
    move-object/from16 v1, p1

    .line 30
    .line 31
    move-object/from16 v8, p2

    .line 32
    .line 33
    invoke-static/range {v1 .. v16}, Ll/jjt0;->a(Landroid/content/Context;Ll/xkt0;Ljava/lang/String;ZZLl/v2s0;Ll/his0;Lcom/google/android/gms/internal/ads/zzcei;Ll/khs0;Ll/d9y0;Ll/far0;Ll/fcs0;Ll/q6w0;Ll/t6w0;Ll/qbv0;Ll/s7w0;)Ll/wit0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    move-object/from16 v1, p0

    .line 38
    .line 39
    iput-object v0, v1, Ll/wts0;->a:Ll/wit0;

    .line 40
    .line 41
    check-cast v0, Landroid/view/View;

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static final d0(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/obt0;->w()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v0, "runOnUiThread > the UI thread is the main thread, the runnable will be run now"

    .line 11
    .line 12
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string v0, "runOnUiThread > the UI thread is not the main thread, the runnable will be added to the message queue"

    .line 20
    .line 21
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    const-string p0, "runOnUiThread > the runnable could not be placed to the message queue"

    .line 33
    .line 34
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method


# virtual methods
.method public final A(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "loadJavascript on adWebView from path: "

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "<!DOCTYPE html><html><head><script src=\"%s\"></script></head><body></body></html>"

    .line 19
    .line 20
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/uts0;

    .line 25
    .line 26
    invoke-direct {v0, p0, p1}, Ll/uts0;-><init>(Ll/wts0;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Ll/wts0;->d0(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final B(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "loadHtmlWrapper on adWebView from path: "

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/qts0;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Ll/qts0;-><init>(Ll/wts0;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/wts0;->d0(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final O(Ll/cus0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wts0;->a:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/wit0;->zzN()Ll/nkt0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/rts0;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/rts0;-><init>(Ll/cus0;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p0, v0}, Ll/nkt0;->zzH(Ll/mkt0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic R(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "UTF-8"

    .line 2
    .line 3
    iget-object p0, p0, Ll/wts0;->a:Ll/wit0;

    .line 4
    .line 5
    const-string v1, "text/html"

    .line 6
    .line 7
    invoke-interface {p0, p1, v1, v0}, Ll/wit0;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic S(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wts0;->a:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/wit0;->loadUrl(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic U(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "UTF-8"

    .line 2
    .line 3
    iget-object p0, p0, Ll/wts0;->a:Ll/wit0;

    .line 4
    .line 5
    const-string v1, "text/html"

    .line 6
    .line 7
    invoke-interface {p0, p1, v1, v0}, Ll/wit0;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Z(Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lts0;->a(Ll/mts0;Ljava/lang/String;Ljava/util/Map;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lts0;->c(Ll/mts0;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "loadHtml on adWebView from html"

    .line 2
    .line 3
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/tts0;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Ll/tts0;-><init>(Ll/wts0;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/wts0;->d0(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final k0(Ljava/lang/String;Ll/bqs0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/pts0;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/pts0;-><init>(Ll/bqs0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/wts0;->a:Ll/wit0;

    .line 7
    .line 8
    invoke-interface {p0, p1, v0}, Ll/wit0;->t0(Ljava/lang/String;Lcom/google/android/gms/common/util/Predicate;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic q(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lts0;->b(Ll/mts0;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q0(Ljava/lang/String;Ll/bqs0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/vts0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/vts0;-><init>(Ll/wts0;Ll/bqs0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/wts0;->a:Ll/wit0;

    .line 7
    .line 8
    invoke-interface {p0, p1, v0}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic z(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wts0;->a:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/xts0;->zza(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic z0(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lts0;->d(Ll/mts0;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final zza(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "invokeJavascript on adWebView from js"

    .line 2
    .line 3
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/sts0;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Ll/sts0;-><init>(Ll/wts0;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/wts0;->d0(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final zzc()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wts0;->a:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/wit0;->destroy()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzi()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wts0;->a:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/wit0;->V()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final zzj()Ll/dvs0;
    .locals 1

    .line 1
    new-instance v0, Ll/dvs0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dvs0;-><init>(Ll/cvs0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
