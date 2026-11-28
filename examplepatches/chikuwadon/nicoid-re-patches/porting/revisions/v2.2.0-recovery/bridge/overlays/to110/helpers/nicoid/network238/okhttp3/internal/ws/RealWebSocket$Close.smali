.class public final Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Close"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\t\u0008\u0000\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;",
        "",
        "code",
        "",
        "reason",
        "Lnicoid/network238/okio/ByteString;",
        "cancelAfterCloseMillis",
        "",
        "<init>",
        "(ILnicoid/network238/okio/ByteString;J)V",
        "getCode",
        "()I",
        "getReason",
        "()Lnicoid/network238/okio/ByteString;",
        "getCancelAfterCloseMillis",
        "()J",
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
.field private final cancelAfterCloseMillis:J

.field private final code:I

.field private final reason:Lnicoid/network238/okio/ByteString;


# direct methods
.method public constructor <init>(ILnicoid/network238/okio/ByteString;J)V
    .registers 5

    .line 660
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 661
    iput p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;->code:I

    .line 662
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;->reason:Lnicoid/network238/okio/ByteString;

    .line 663
    iput-wide p3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;->cancelAfterCloseMillis:J

    return-void
.end method


# virtual methods
.method public final getCancelAfterCloseMillis()J
    .registers 3

    .line 663
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;->cancelAfterCloseMillis:J

    return-wide v0
.end method

.method public final getCode()I
    .registers 2

    .line 661
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;->code:I

    return v0
.end method

.method public final getReason()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 662
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;->reason:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method
