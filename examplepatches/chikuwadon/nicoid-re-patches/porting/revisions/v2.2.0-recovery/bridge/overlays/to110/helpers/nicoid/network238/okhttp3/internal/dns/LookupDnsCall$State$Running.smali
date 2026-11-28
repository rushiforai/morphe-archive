.class public final Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Running"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;",
        "Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;",
        "callback",
        "Lnicoid/network238/okhttp3/Dns$Callback;",
        "<init>",
        "(Lnicoid/network238/okhttp3/Dns$Callback;)V",
        "getCallback",
        "()Lnicoid/network238/okhttp3/Dns$Callback;",
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
.field private final callback:Lnicoid/network238/okhttp3/Dns$Callback;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/Dns$Callback;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;->callback:Lnicoid/network238/okhttp3/Dns$Callback;

    return-void
.end method


# virtual methods
.method public final getCallback()Lnicoid/network238/okhttp3/Dns$Callback;
    .registers 2

    .line 84
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;->callback:Lnicoid/network238/okhttp3/Dns$Callback;

    return-object v0
.end method
