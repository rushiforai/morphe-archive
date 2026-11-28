.class public final synthetic Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;"
    method = "applyAndAckSettings$lambda$0$0$1"
    proto = "(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

.field public final synthetic f$1:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$3;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$3;->f$1:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$3;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$3;->f$1:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->$r8$lambda$-_UQnGq5VUgB0kEomNLPoIaKCCk(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)Lnicoid/network238/kotlin/Unit;

    move-result-object v0

    return-object v0
.end method
