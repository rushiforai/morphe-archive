.class public final Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;
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
    name = "Complete"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;",
        "Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;",
        "<init>",
        "()V",
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


# static fields
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
