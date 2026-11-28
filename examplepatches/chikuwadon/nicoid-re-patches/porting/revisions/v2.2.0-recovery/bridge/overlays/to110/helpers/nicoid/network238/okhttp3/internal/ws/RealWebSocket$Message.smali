.class public final Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Message"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;",
        "",
        "formatOpcode",
        "",
        "data",
        "Lnicoid/network238/okio/ByteString;",
        "<init>",
        "(ILnicoid/network238/okio/ByteString;)V",
        "getFormatOpcode",
        "()I",
        "getData",
        "()Lnicoid/network238/okio/ByteString;",
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


# instance fields
.field private final data:Lnicoid/network238/okio/ByteString;

.field private final formatOpcode:I


# direct methods
.method public constructor <init>(ILnicoid/network238/okio/ByteString;)V
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 655
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 656
    iput p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;->formatOpcode:I

    .line 657
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;->data:Lnicoid/network238/okio/ByteString;

    return-void
.end method


# virtual methods
.method public final getData()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 657
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;->data:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public final getFormatOpcode()I
    .registers 2

    .line 656
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;->formatOpcode:I

    return v0
.end method
