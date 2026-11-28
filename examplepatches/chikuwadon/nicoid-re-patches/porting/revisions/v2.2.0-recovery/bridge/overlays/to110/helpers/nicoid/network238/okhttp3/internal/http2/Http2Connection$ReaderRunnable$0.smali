.class public final synthetic Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;"
    method = "ping$lambda$1"
    proto = "(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;II)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

.field public final synthetic f$1:I

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;II)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$0;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iput p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$0;->f$1:I

    iput p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$0;->f$2:I

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$0;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$0;->f$1:I

    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$0;->f$2:I

    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->ping$lambda$1(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;II)Lnicoid/network238/kotlin/Unit;

    move-result-object v0

    return-object v0
.end method
