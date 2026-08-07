.class public final Ll/zwg0;
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
    iput-object p1, p0, Ll/zwg0;->a:Ll/wyg0;

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
    iget-object p0, p0, Ll/zwg0;->a:Ll/wyg0;

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
    const-string p1, "SudFSMMGStateHandlerImpl"

    .line 14
    .line 15
    const-string p2, "onGameStarted"

    .line 16
    .line 17
    invoke-static {p1, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Ll/wyg0;->n:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1, p2}, Ltech/sud/gip/logger/SudLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p0}, Ltech/sud/gip/core/ISudFSMMG;->onGameStarted()V

    .line 26
    .line 27
    .line 28
    :cond_0
    const-string p0, "{\"ret_code\":0, \"ret_msg\":\"success\"}"

    .line 29
    .line 30
    invoke-virtual {p5, p0}, Ll/gfg0;->success(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
