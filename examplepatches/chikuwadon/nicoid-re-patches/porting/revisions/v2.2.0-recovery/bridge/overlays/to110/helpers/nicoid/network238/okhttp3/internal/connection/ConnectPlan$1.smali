.class public final synthetic Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;"
    method = "connectTls$lambda$1"
    proto = "(Lnicoid/network238/okhttp3/Handshake;)Ljava/util/List;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/Handshake;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/Handshake;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$1;->f$0:Lnicoid/network238/okhttp3/Handshake;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$1;->f$0:Lnicoid/network238/okhttp3/Handshake;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectTls$lambda$1(Lnicoid/network238/okhttp3/Handshake;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
