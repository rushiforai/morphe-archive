.class public interface abstract Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/FlowControlListener$None;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\u0008f\u0018\u00002\u00020\u0001:\u0001\u000bJ \u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH&J\u0010\u0010\n\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0007H&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u000c\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;",
        "",
        "receivingStreamWindowChanged",
        "",
        "streamId",
        "",
        "windowCounter",
        "Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;",
        "bufferSize",
        "",
        "receivingConnectionWindowChanged",
        "None",
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


# virtual methods
.method public abstract receivingConnectionWindowChanged(Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;)V
.end method

.method public abstract receivingStreamWindowChanged(ILnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;J)V
.end method
