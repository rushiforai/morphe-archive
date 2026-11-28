.class public final synthetic Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;"
    method = "cancel$lambda$0"
    proto = "(Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;)Z"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    check-cast p1, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->cancel$lambda$0(Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
