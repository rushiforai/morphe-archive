.class public final synthetic Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/http2/Http2Connection;"
    method = "pushDataLater$lambda$0"
    proto = "(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILnicoid/network238/okio/Buffer;IZ)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

.field public final synthetic f$1:I

.field public final synthetic f$2:Lnicoid/network238/okio/Buffer;

.field public final synthetic f$3:I

.field public final synthetic f$4:Z


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILnicoid/network238/okio/Buffer;IZ)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iput p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$1:I

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$2:Lnicoid/network238/okio/Buffer;

    iput p4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$3:I

    iput-boolean p5, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$4:Z

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$1:I

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$2:Lnicoid/network238/okio/Buffer;

    iget v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$3:I

    iget-boolean v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;->f$4:Z

    invoke-static {v0, v1, v2, v3, v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushDataLater$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILnicoid/network238/okio/Buffer;IZ)Lnicoid/network238/kotlin/Unit;

    move-result-object v0

    return-object v0
.end method
