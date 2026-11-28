.class public final synthetic Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;"
    method = "finishReader$lambda$0$0"
    proto = "(Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$1;->f$0:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$1;->f$0:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->$r8$lambda$0T3qT4Eg5PnlD3bX-T9nHdqY_Jw(Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;)Lnicoid/network238/kotlin/Unit;

    move-result-object v0

    return-object v0
.end method
