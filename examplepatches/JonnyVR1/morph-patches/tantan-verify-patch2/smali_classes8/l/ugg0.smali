.class public final Ll/ugg0;
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
    iput-object p1, p0, Ll/ugg0;->a:Ll/wyg0;

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
    .locals 1

    .line 1
    new-instance p1, Ll/bsg0;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/bsg0;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p2, "getGameViewInfo"

    .line 7
    .line 8
    iput-object p2, p1, Ll/bsg0;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide p2

    .line 14
    iput-wide p2, p1, Ll/bsg0;->b:J

    .line 15
    .line 16
    iget-object p2, p0, Ll/ugg0;->a:Ll/wyg0;

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Ll/wyg0;->b(Ll/bsg0;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Ll/ugg0;->a:Ll/wyg0;

    .line 22
    .line 23
    iget-object p2, p2, Ll/wyg0;->c:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Ltech/sud/gip/core/ISudFSMMG;

    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    sget-object p3, Ll/wyg0;->n:Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "onGetGameViewInfo"

    .line 36
    .line 37
    invoke-static {p3, v0}, Ltech/sud/gip/logger/SudLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-string p3, "SudFSMMGStateHandlerImpl"

    .line 41
    .line 42
    invoke-static {p3, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    new-instance p3, Ll/xxg0;

    .line 46
    .line 47
    iget-object p0, p0, Ll/ugg0;->a:Ll/wyg0;

    .line 48
    .line 49
    invoke-direct {p3, p0, p5, p1}, Ll/xxg0;-><init>(Ll/wyg0;Ll/gfg0;Ll/bsg0;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p2, p3, p4}, Ltech/sud/gip/core/ISudFSMMG;->onGetGameViewInfo(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method
