.class public final synthetic Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;"
    method = "initReaderAndWriter$lambda$0$0"
    proto = "(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;J)J"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

.field public final synthetic f$1:J


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;J)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$2;->f$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    iput-wide p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$2;->f$1:J

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$2;->f$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$2;->f$1:J

    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->$r8$lambda$M3uLbVxgXTEj1BhnKpRA6a_aJpc(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method
