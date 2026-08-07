.class public final synthetic Ll/hnc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hnc0;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnc0;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;)V

    return-void
.end method
