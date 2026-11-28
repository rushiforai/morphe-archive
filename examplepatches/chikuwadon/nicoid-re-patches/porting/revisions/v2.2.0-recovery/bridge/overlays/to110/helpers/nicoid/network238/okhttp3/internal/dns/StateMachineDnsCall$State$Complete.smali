.class public final Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Complete"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0008\u001a\u00020\tH\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;",
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;",
        "canceled",
        "",
        "<init>",
        "(Z)V",
        "getCanceled",
        "()Z",
        "cancel",
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;",
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
.field private final canceled:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2

    .line 363
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 364
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;->canceled:Z

    return-void
.end method


# virtual methods
.method public cancel()Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;
    .registers 3

    .line 366
    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;-><init>(Z)V

    return-object v0
.end method

.method public bridge synthetic cancel()Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;
    .registers 2

    .line 363
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;->cancel()Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;

    move-result-object v0

    return-object v0
.end method

.method public getCanceled()Z
    .registers 2

    .line 364
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;->canceled:Z

    return v0
.end method
