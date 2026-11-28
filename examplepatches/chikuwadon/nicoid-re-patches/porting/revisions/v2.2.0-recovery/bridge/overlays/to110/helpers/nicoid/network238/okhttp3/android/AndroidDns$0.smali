.class public final synthetic Lnicoid/network238/okhttp3/android/AndroidDns$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/android/AndroidDns;"
    method = "queryFactory$lambda$0"
    proto = "(Lnicoid/network238/okhttp3/android/AndroidDns;Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/android/AndroidDns;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/android/AndroidDns;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/android/AndroidDns$0;->f$0:Lnicoid/network238/okhttp3/android/AndroidDns;

    return-void
.end method


# virtual methods
.method public final newQuery(Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns$0;->f$0:Lnicoid/network238/okhttp3/android/AndroidDns;

    invoke-static {v0, p1}, Lnicoid/network238/okhttp3/android/AndroidDns;->queryFactory$lambda$0(Lnicoid/network238/okhttp3/android/AndroidDns;Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    move-result-object p1

    return-object p1
.end method
