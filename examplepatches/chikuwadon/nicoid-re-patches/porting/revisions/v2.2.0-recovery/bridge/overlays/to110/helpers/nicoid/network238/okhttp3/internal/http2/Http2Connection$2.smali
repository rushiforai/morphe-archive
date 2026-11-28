.class public final synthetic Lnicoid/network238/okhttp3/internal/http2/Http2Connection$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/http2/Http2Connection;"
    method = "writeWindowUpdateLater$lambda$0"
    proto = "(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;IJ)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

.field public final synthetic f$1:I

.field public final synthetic f$2:J


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;IJ)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$2;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iput p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$2;->f$1:I

    iput-wide p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$2;->f$2:J

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$2;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$2;->f$1:I

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$2;->f$2:J

    invoke-static {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeWindowUpdateLater$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;IJ)Lnicoid/network238/kotlin/Unit;

    move-result-object v0

    return-object v0
.end method
