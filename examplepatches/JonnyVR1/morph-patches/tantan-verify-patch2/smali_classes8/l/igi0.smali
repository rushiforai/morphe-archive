.class public Ll/igi0;
.super Ll/wc00;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/wc00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Ll/l4g0;Ll/xc00;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_anti_harass_customiza_popup_set"

    .line 5
    .line 6
    const-string v2, "p_anti_harass_customiza_popup"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "customiza_popup"

    .line 23
    .line 24
    invoke-static {v0}, Ll/lve0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "\u8bbe\u7f6e\u5c4f\u853d\u8bcd"

    .line 29
    .line 30
    invoke-static {p1, v1, v0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic L(Ll/igi0;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/igi0;->P(Ll/xc00;)V

    return-void
.end method

.method public static synthetic M(Ll/igi0;Ll/l4g0;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/igi0;->O(Ll/l4g0;Ll/xc00;)V

    return-void
.end method


# virtual methods
.method public final N(Ll/xc00;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/gra;->W2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v0, Ll/fgi0;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1}, Ll/fgi0;-><init>(Ll/igi0;Ll/xc00;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic O(Ll/l4g0;Ll/xc00;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_anti_harass_customiza_popup_nothanks"

    .line 5
    .line 6
    const-string v2, "p_anti_harass_customiza_popup"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 12
    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m1:Ll/jxd0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ll/igi0;->Q(Ll/xc00;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic P(Ll/xc00;)V
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_anti_harass_customiza_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/jl80$a;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v1, v2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    sget v2, Ll/dbc0;->i6:I

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "\u81ea\u5b9a\u4e49\u9632\u9a9a\u6270\u5173\u952e\u8bcd"

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "\u5e73\u53f0\u7ed9\u4e88\u60a8\u81ea\u5b9a\u4e49\u5c4f\u853d\u5173\u952e\u8bcd\u7684\u6743\u529b\uff0c\u5f00\u542f\u540e\u60a8\u5c06\u4e0d\u518d\u6536\u5230\u76f8\u5173\u6d88\u606f"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Ll/ggi0;

    .line 46
    .line 47
    invoke-direct {v2, v0, p1}, Ll/ggi0;-><init>(Ll/l4g0;Ll/xc00;)V

    .line 48
    .line 49
    .line 50
    const-string v3, "\u53bb\u8bbe\u7f6e"

    .line 51
    .line 52
    invoke-virtual {v1, v3, v2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/hgi0;

    .line 57
    .line 58
    invoke-direct {v2, p0, v0, p1}, Ll/hgi0;-><init>(Ll/igi0;Ll/l4g0;Ll/xc00;)V

    .line 59
    .line 60
    .line 61
    const-string p0, "\u4e0d\u7528\u4e86"

    .line 62
    .line 63
    invoke-virtual {v1, p0, v2}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 68
    .line 69
    .line 70
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final Q(Ll/xc00;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m1:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    new-instance p0, Ll/jl80$a;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-direct {p0, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const-string p1, "\u6e29\u99a8\u63d0\u793a"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "\u597d\u7684\uff0c\u5982\u60a8\u9700\u8981\uff0c\u53ef\u5728\u3010\u8bbe\u7f6e\u3011\u9875\u9762\u6dfb\u52a0\u54e6"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, p1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "\u6211\u77e5\u9053\u4e86"

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public v(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string p2, "antiHarassmentPopup"

    .line 5
    .line 6
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Ll/igi0;->N(Ll/xc00;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0
.end method
