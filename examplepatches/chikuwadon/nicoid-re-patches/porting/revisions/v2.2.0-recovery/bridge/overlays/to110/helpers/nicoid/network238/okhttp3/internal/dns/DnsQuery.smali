.class public interface abstract Lnicoid/network238/okhttp3/internal/dns/DnsQuery;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;,
        Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008g\u0018\u00002\u00020\u0001:\u0002\u0007\u0008J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0008\u0010\u0006\u001a\u00020\u0003H&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\t\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
        "",
        "enqueue",
        "",
        "callback",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;",
        "cancel",
        "Callback",
        "Factory",
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
.method public abstract cancel()V
.end method

.method public abstract enqueue(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V
.end method
