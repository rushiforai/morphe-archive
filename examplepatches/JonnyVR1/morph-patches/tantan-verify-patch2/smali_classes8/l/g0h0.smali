.class public final Ll/g0h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vrg0;


# instance fields
.field public final synthetic a:Ll/wyg0;


# direct methods
.method public constructor <init>(Ll/wyg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g0h0;->a:Ll/wyg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gfg0;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/g0h0;->a:Ll/wyg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wyg0;->c:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ltech/sud/gip/core/ISudFSMMG;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p4}, Ltech/sud/gip/core/ISudFSMMG;->onGameLog(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const-string p0, "{\"ret_code\":0, \"ret_msg\":\"success\"}"

    .line 17
    .line 18
    invoke-virtual {p5, p0}, Ll/gfg0;->success(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    const-string p0, "{\"ret_code\":-1, \"ret_msg\":\"json serialize fail\"}"

    .line 23
    .line 24
    invoke-virtual {p5, p0}, Ll/gfg0;->failure(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
