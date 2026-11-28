.class public final synthetic Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;"
    method = "enqueue$lambda$1"
    proto = "(Lnicoid/network238/okhttp3/Dns$Callback;Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/Dns$Callback;

.field public final synthetic f$1:Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/Dns$Callback;Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$0;->f$0:Lnicoid/network238/okhttp3/Dns$Callback;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$0;->f$1:Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$0;->f$0:Lnicoid/network238/okhttp3/Dns$Callback;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$0;->f$1:Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->enqueue$lambda$1(Lnicoid/network238/okhttp3/Dns$Callback;Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;)Lnicoid/network238/kotlin/Unit;

    move-result-object v0

    return-object v0
.end method
