.class public final synthetic Ll/bjc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/utils/LogUtil$ILoggerSink;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bjc0;->a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    return-void
.end method


# virtual methods
.method public final onLoggerMessage(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjc0;->a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    invoke-static {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->e(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
