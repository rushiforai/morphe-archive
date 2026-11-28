.class public final Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001a\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u000bR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan$Companion;",
        "",
        "<init>",
        "()V",
        "INVALID_PUBLIC_NAME",
        "Lnicoid/network238/kotlin/text/Regex;",
        "getOrNull",
        "Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;",
        "publicName",
        "",
        "configList",
        "Lnicoid/network238/okio/ByteString;",
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


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getOrNull(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    goto :goto_0

    .line 51
    :cond_0
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->canParseAsIpAddress(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 52
    :cond_1
    # getter for: Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;->INVALID_PUBLIC_NAME:Lnicoid/network238/kotlin/text/Regex;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;->access$getINVALID_PUBLIC_NAME$cp()Lnicoid/network238/kotlin/text/Regex;

    move-result-object v2

    invoke-virtual {v2, v0}, Lnicoid/network238/kotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    :goto_0
    return-object v1

    .line 53
    :cond_2
    new-instance v0, Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;

    invoke-direct {v0, p1, p2, v1}, Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;-><init>(Ljava/lang/String;Lnicoid/network238/okio/ByteString;Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method
