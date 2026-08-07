.class public Ll/w0c;
.super Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;
.source "SourceFile"


# static fields
.field public static final n:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/scj<",
            "Lcom/p1/mobile/putong/app/PutongAct;",
            "Ljava/lang/String;",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            "Ll/wc00;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/wc00;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/w0c;->n:Ljava/util/Map;

    .line 7
    .line 8
    new-instance v1, Ll/k0c;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/k0c;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "tantan"

    .line 14
    .line 15
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/p0c;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/p0c;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v2, "tantan_ui"

    .line 24
    .line 25
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/q0c;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/q0c;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v2, "tantan_device"

    .line 34
    .line 35
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/r0c;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/r0c;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v2, "tantan_media"

    .line 44
    .line 45
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    new-instance v1, Ll/s0c;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/s0c;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v2, "tantan_ab"

    .line 54
    .line 55
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    new-instance v1, Ll/t0c;

    .line 59
    .line 60
    invoke-direct {v1}, Ll/t0c;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v2, "tantan_webview"

    .line 64
    .line 65
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    new-instance v1, Ll/u0c;

    .line 69
    .line 70
    invoke-direct {v1}, Ll/u0c;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string v2, "tantan_share"

    .line 74
    .line 75
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    new-instance v1, Ll/v0c;

    .line 79
    .line 80
    invoke-direct {v1}, Ll/v0c;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v2, "tantan_storage"

    .line 84
    .line 85
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    new-instance v1, Ll/l0c;

    .line 89
    .line 90
    invoke-direct {v1}, Ll/l0c;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v2, "tantan_third_party"

    .line 94
    .line 95
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    new-instance v1, Ll/m0c;

    .line 99
    .line 100
    invoke-direct {v1}, Ll/m0c;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v2, "tantan_action"

    .line 104
    .line 105
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    new-instance v1, Ll/n0c;

    .line 109
    .line 110
    invoke-direct {v1}, Ll/n0c;-><init>()V

    .line 111
    .line 112
    .line 113
    const-string v2, "tantan_http"

    .line 114
    .line 115
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    new-instance v1, Ll/o0c;

    .line 119
    .line 120
    invoke-direct {v1}, Ll/o0c;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v2, "tantan_sensor"

    .line 124
    .line 125
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/w0c;->m:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static O(Ljava/lang/String;Ll/scj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/scj<",
            "Lcom/p1/mobile/putong/app/PutongAct;",
            "Ljava/lang/String;",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            "Ll/wc00;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/w0c;->n:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w0c;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/wc00;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/wc00;->E()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Ll/w0c;->m:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->d()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public L()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/wc00;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w0c;->m:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w0c;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/w0c;->n:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/String;

    .line 27
    .line 28
    :try_start_0
    sget-object v2, Ll/w0c;->n:Ljava/util/Map;

    .line 29
    .line 30
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ll/scj;

    .line 35
    .line 36
    invoke-interface {v2, p1, p2, p3}, Ll/scj;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ll/wc00;

    .line 41
    .line 42
    iget-object v3, p0, Ll/w0c;->m:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->H(Ljava/lang/String;Ll/qpl;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, p4}, Ll/wc00;->I(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception v1

    .line 55
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    return-void
.end method

.method public N()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0c;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public P(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0c;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/w0c;->m:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/wc00;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/wc00;->J(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public closePage()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->l()Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Ll/ave0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    return-void
.end method

.method public r(Ll/zue0;)V
    .locals 0

    .line 1
    return-void
.end method
