.class interface abstract Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;,
        Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;,
        Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008r\u0018\u00002\u00020\u0001:\u0003\u0007\u0008\tJ\u0008\u0010\u0006\u001a\u00020\u0000H&R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005\u0082\u0001\u0003\n\u000b\u000c\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\r\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;",
        "",
        "canceled",
        "",
        "getCanceled",
        "()Z",
        "cancel",
        "Idle",
        "Running",
        "Complete",
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;",
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;",
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;",
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


# virtual methods
.method public abstract cancel()Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;
.end method

.method public abstract getCanceled()Z
.end method
