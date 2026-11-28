.class public abstract Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Http2Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Listener"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008&\u0018\u0000 \r2\u00020\u0001:\u0001\rB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&J\u0018\u0010\u0008\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000cH\u0016\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;",
        "",
        "<init>",
        "()V",
        "onStream",
        "",
        "stream",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;",
        "onSettings",
        "connection",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection;",
        "settings",
        "Lnicoid/network238/okhttp3/internal/http2/Settings;",
        "Companion",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener$Companion;

.field public static final REFUSE_INCOMING_STREAMS:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener$Companion;

    .line 1023
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener$Companion$REFUSE_INCOMING_STREAMS$1;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener$Companion$REFUSE_INCOMING_STREAMS$1;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;->REFUSE_INCOMING_STREAMS:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 997
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSettings(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public abstract onStream(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
