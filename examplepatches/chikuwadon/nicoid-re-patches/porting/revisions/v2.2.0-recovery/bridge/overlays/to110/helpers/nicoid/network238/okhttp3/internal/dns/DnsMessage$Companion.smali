.class public final Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\n\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007J,\u0010\u0008\u001a\u00020\u00052\u0008\u0008\u0002\u0010\t\u001a\u00020\n2\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u000c2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u000c\u00a8\u0006\u000f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;",
        "",
        "<init>",
        "()V",
        "query",
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "question",
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "response",
        "id",
        "",
        "questions",
        "",
        "answers",
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
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

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;-><init>()V

    return-void
.end method

.method public static synthetic response$default(Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;SLjava/util/List;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
    .registers 6

    and-int/lit8 p4, p4, 0x1

    if-eqz p4, :cond_0

    const/4 p1, 0x0

    .line 50
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;->response(SLjava/util/List;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final query(Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    .line 46
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 43
    const/4 v1, 0x0

    const/16 v2, 0x100

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;-><init>(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final response(SLjava/util/List;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(S",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/Question;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;)",
            "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    const/16 v7, 0x30

    const/4 v8, 0x0

    const v2, 0x8000

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v8}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;-><init>(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method
