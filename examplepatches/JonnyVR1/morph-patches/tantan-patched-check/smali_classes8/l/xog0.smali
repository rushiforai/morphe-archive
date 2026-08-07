.class public final Ll/xog0;
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
    iput-object p1, p0, Ll/xog0;->a:Ll/wyg0;

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
    iget-object p0, p0, Ll/xog0;->a:Ll/wyg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wyg0;->m:Ll/bfg0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "ProxySudFSTAPPImpl"

    .line 8
    .line 9
    const-string p1, "onGameLoadStarted"

    .line 10
    .line 11
    invoke-static {p0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Ll/dhg0;->F:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string p0, "{\"ret_code\":0, \"ret_msg\":\"success\"}"

    .line 20
    .line 21
    invoke-virtual {p5, p0}, Ll/gfg0;->success(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
