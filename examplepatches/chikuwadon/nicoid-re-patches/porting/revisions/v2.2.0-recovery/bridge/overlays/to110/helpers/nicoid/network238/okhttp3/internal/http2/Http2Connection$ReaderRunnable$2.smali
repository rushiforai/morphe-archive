.class public final synthetic Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;"
    method = "settings$lambda$0"
    proto = "(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;ZLnicoid/network238/okhttp3/internal/http2/Settings;)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Lnicoid/network238/okhttp3/internal/http2/Settings;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;ZLnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$2;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;

    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$2;->f$1:Z

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$2;->f$2:Lnicoid/network238/okhttp3/internal/http2/Settings;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$2;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$2;->f$1:Z

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$2;->f$2:Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->settings$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;ZLnicoid/network238/okhttp3/internal/http2/Settings;)Lnicoid/network238/kotlin/Unit;

    move-result-object v0

    return-object v0
.end method
