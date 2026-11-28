.class public final Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\n\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0017\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u0000 \'2\u00020\u0001:\u0001\'BU\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u0012\u000e\u0008\u0002\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007\u0012\u000e\u0008\u0002\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007\u0012\u000e\u0008\u0002\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\t\u0010\u001a\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u001b\u001a\u00020\u0005H\u00c6\u0003J\u000f\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007H\u00c6\u0003J\u000f\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007H\u00c6\u0003J\u000f\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007H\u00c6\u0003J\u000f\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007H\u00c6\u0003J]\u0010 \u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u000e\u0008\u0002\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00072\u000e\u0008\u0002\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\n0\u00072\u000e\u0008\u0002\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\n0\u00072\u000e\u0008\u0002\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007H\u00c6\u0001J\u0013\u0010!\u001a\u00020\"2\u0008\u0010#\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010$\u001a\u00020\u0005H\u00d6\u0001J\t\u0010%\u001a\u00020&H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u0017\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0014R\u0017\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0014R\u0017\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0014R\u0011\u0010\u0018\u001a\u00020\u00058F\u00a2\u0006\u0006\u001a\u0004\u0008\u0019\u0010\u0012\u00a8\u0006("
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "",
        "id",
        "",
        "flags",
        "",
        "questions",
        "",
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "answers",
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
        "authorityRecords",
        "additionalRecords",
        "<init>",
        "(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V",
        "getId",
        "()S",
        "getFlags",
        "()I",
        "getQuestions",
        "()Ljava/util/List;",
        "getAnswers",
        "getAuthorityRecords",
        "getAdditionalRecords",
        "responseCode",
        "getResponseCode",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "toString",
        "",
        "Companion",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;


# instance fields
.field private final additionalRecords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;"
        }
    .end annotation
.end field

.field private final answers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;"
        }
    .end annotation
.end field

.field private final authorityRecords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;"
        }
    .end annotation
.end field

.field private final flags:I

.field private final id:S

.field private final questions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/Question;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->Companion:Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;

    return-void
.end method

.method public constructor <init>(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(SI",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/Question;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-short p1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->id:S

    .line 27
    iput p2, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->flags:I

    .line 28
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->questions:Ljava/util/List;

    .line 29
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->answers:Ljava/util/List;

    .line 30
    iput-object p5, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->authorityRecords:Ljava/util/List;

    .line 31
    iput-object p6, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->additionalRecords:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 16

    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_0

    .line 29
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p4

    move-object v4, p4

    goto :goto_0

    .line 0
    :cond_0
    move-object v4, p4

    .line 29
    :goto_0
    and-int/lit8 p4, p7, 0x10

    if-eqz p4, :cond_1

    .line 30
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p5

    move-object v5, p5

    goto :goto_1

    .line 29
    :cond_1
    move-object v5, p5

    .line 30
    :goto_1
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_2

    .line 31
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p6

    move-object v6, p6

    goto :goto_2

    .line 30
    :cond_2
    move-object v6, p6

    .line 25
    :goto_2
    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;-><init>(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic copy$default(Lnicoid/network238/okhttp3/internal/dns/DnsMessage;SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
    .registers 9

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    iget-short p1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->id:S

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    iget p2, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->flags:I

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->questions:Ljava/util/List;

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    iget-object p4, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->answers:Ljava/util/List;

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    iget-object p5, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->authorityRecords:Ljava/util/List;

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    iget-object p6, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->additionalRecords:Ljava/util/List;

    :cond_5
    move-object p7, p5

    move-object p8, p6

    move-object p5, p3

    move-object p6, p4

    move p3, p1

    move p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p8}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->copy(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()S
    .registers 2

    iget-short v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->id:S

    return v0
.end method

.method public final component2()I
    .registers 2

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->flags:I

    return v0
.end method

.method public final component3()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/Question;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->questions:Ljava/util/List;

    return-object v0
.end method

.method public final component4()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->answers:Ljava/util/List;

    return-object v0
.end method

.method public final component5()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->authorityRecords:Ljava/util/List;

    return-object v0
.end method

.method public final component6()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->additionalRecords:Ljava/util/List;

    return-object v0
.end method

.method public final copy(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(SI",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/Question;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;)",
            "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;"
        }
    .end annotation

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;-><init>(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    iget-short v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->id:S

    iget-short v1, p1, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->id:S

    if-ne v0, v1, :cond_0

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->flags:I

    iget v1, p1, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->flags:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->questions:Ljava/util/List;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->questions:Ljava/util/List;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->answers:Ljava/util/List;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->answers:Ljava/util/List;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->authorityRecords:Ljava/util/List;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->authorityRecords:Ljava/util/List;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->additionalRecords:Ljava/util/List;

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->additionalRecords:Ljava/util/List;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public final getAdditionalRecords()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;"
        }
    .end annotation

    .line 31
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->additionalRecords:Ljava/util/List;

    return-object v0
.end method

.method public final getAnswers()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;"
        }
    .end annotation

    .line 29
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->answers:Ljava/util/List;

    return-object v0
.end method

.method public final getAuthorityRecords()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
            ">;"
        }
    .end annotation

    .line 30
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->authorityRecords:Ljava/util/List;

    return-object v0
.end method

.method public final getFlags()I
    .registers 2

    .line 27
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->flags:I

    return v0
.end method

.method public final getId()S
    .registers 2

    .line 26
    iget-short v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->id:S

    return v0
.end method

.method public final getQuestions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/Question;",
            ">;"
        }
    .end annotation

    .line 28
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->questions:Ljava/util/List;

    return-object v0
.end method

.method public final getResponseCode()I
    .registers 2

    .line 34
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->flags:I

    and-int/lit8 v0, v0, 0xf

    return v0
.end method

.method public hashCode()I
    .registers 3

    iget-short v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->id:S

    invoke-static {v0}, Ljava/lang/Short;->hashCode(S)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->flags:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->questions:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->answers:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->authorityRecords:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->additionalRecords:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DnsMessage(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-short v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->id:S

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", flags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->flags:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", questions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->questions:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", answers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->answers:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", authorityRecords="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->authorityRecords:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", additionalRecords="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->additionalRecords:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
