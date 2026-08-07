.class public Ll/jrq;
.super Ll/ef00;
.source "SourceFile"


# instance fields
.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ef00;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->r()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/jrq;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->s()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/jrq;->c:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public close(Lcom/quickjs/JSContext;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/jrq;->c:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jrq;->b:Ljava/lang/String;

    .line 4
    .line 5
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "JsfModule"

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const-string v1, "jsf module context is closed @version=%s, @path=%s"

    .line 13
    .line 14
    invoke-static {p1, v0, v1, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setup(Lcom/quickjs/JSContext;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->w()Ll/rde0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/jrq;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/rde0;->load(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    const-string v3, "JsfModule"

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/jrq;->c:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p0, Ll/jrq;->b:Ljava/lang/String;

    .line 23
    .line 24
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "jsf module setup with empty script @version=%s, @path=%s"

    .line 29
    .line 30
    invoke-static {v3, v2, p1, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    :try_start_0
    iget-object v1, p0, Ll/jrq;->b:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Lcom/quickjs/JSContext;->executeVoidScript(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string p1, "jsf module setup success @version=%s, @path=%s"

    .line 40
    .line 41
    iget-object v0, p0, Ll/jrq;->c:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v1, p0, Ll/jrq;->b:Ljava/lang/String;

    .line 44
    .line 45
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v3, v2, p1, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/quickjs/QuickJSException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :catch_0
    move-exception p1

    .line 54
    iget-object v0, p0, Ll/jrq;->c:Ljava/lang/String;

    .line 55
    .line 56
    iget-object p0, p0, Ll/jrq;->b:Ljava/lang/String;

    .line 57
    .line 58
    filled-new-array {v0, p0, p1}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "jsf module setup QuickJSException @version=%s, @path=%s, @error=%s"

    .line 63
    .line 64
    invoke-static {v3, v2, p1, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
