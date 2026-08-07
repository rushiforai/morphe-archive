.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Close"
.end annotation


# instance fields
.field public final a:I

.field public final b:Lcom/tencent/cloud/ai/network/okio/ByteString;

.field public final c:J


# direct methods
.method public constructor <init>(ILcom/tencent/cloud/ai/network/okio/ByteString;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;->c:J

    .line 9
    .line 10
    return-void
.end method
