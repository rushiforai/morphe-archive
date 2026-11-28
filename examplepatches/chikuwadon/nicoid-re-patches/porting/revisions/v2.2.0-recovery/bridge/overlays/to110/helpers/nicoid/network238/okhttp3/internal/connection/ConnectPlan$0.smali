.class public final synthetic Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;"
    method = "connectTls$lambda$0"
    proto = "(Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Address;)Ljava/util/List;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/CertificatePinner;

.field public final synthetic f$1:Lnicoid/network238/okhttp3/Handshake;

.field public final synthetic f$2:Lnicoid/network238/okhttp3/Address;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Address;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$0;->f$0:Lnicoid/network238/okhttp3/CertificatePinner;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$0;->f$1:Lnicoid/network238/okhttp3/Handshake;

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$0;->f$2:Lnicoid/network238/okhttp3/Address;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$0;->f$0:Lnicoid/network238/okhttp3/CertificatePinner;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$0;->f$1:Lnicoid/network238/okhttp3/Handshake;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$0;->f$2:Lnicoid/network238/okhttp3/Address;

    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectTls$lambda$0(Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Address;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
