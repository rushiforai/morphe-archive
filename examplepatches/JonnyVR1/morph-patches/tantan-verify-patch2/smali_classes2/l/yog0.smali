.class public final Ll/yog0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qug0;


# direct methods
.method public constructor <init>(Ll/qug0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yog0;->a:Ll/qug0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yog0;->a:Ll/qug0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qug0;->a:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "delayGetGateTokenTask run"

    .line 6
    .line 7
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "SudGIPWebSocket"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/yog0;->a:Ll/qug0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/qug0;->a()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
