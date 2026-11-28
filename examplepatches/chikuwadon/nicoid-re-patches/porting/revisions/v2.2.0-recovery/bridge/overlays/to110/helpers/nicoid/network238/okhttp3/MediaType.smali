.class public final Lnicoid/network238/okhttp3/MediaType;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/MediaType$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0018\u0000 \u001a2\u00020\u0001:\u0001\u001aB/\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0016\u0010\r\u001a\u0004\u0018\u00010\u000e2\n\u0008\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0007J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0011\u001a\u00020\u0003J\r\u0010\u0004\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u0012J\r\u0010\u0005\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u0013J\u0008\u0010\u0014\u001a\u00020\u0003H\u0016J\u0013\u0010\u0015\u001a\u00020\u00162\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u0018\u001a\u00020\u0019H\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0013\u0010\u0004\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u000bR\u0013\u0010\u0005\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u000bR\u0016\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0007X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000c\u00a8\u0006\u001b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MediaType;",
        "",
        "mediaType",
        "",
        "type",
        "subtype",
        "parameterNamesAndValues",
        "",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V",
        "getMediaType$okhttp",
        "()Ljava/lang/String;",
        "[Ljava/lang/String;",
        "charset",
        "Ljava/nio/charset/Charset;",
        "defaultValue",
        "parameter",
        "name",
        "-deprecated_type",
        "-deprecated_subtype",
        "toString",
        "equals",
        "",
        "other",
        "hashCode",
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
.field public static final Companion:Lnicoid/network238/okhttp3/MediaType$Companion;

.field private static final PARAMETER:Lnicoid/network238/kotlin/text/Regex;

.field private static final QUOTED:Ljava/lang/String; = "\"([^\"]*)\""

.field private static final TOKEN:Ljava/lang/String; = "([a-zA-Z0-9-!#$%&\'*+.^_`{|}~]+)"

.field private static final TYPE_SUBTYPE:Lnicoid/network238/kotlin/text/Regex;


# instance fields
.field private final mediaType:Ljava/lang/String;

.field private final parameterNamesAndValues:[Ljava/lang/String;

.field private final subtype:Ljava/lang/String;

.field private final type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/MediaType$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/MediaType$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/MediaType;->Companion:Lnicoid/network238/okhttp3/MediaType$Companion;

    .line 95
    new-instance v0, Lnicoid/network238/kotlin/text/Regex;

    const-string v1, "([a-zA-Z0-9-!#$%&\'*+.^_`{|}~]+)/([a-zA-Z0-9-!#$%&\'*+.^_`{|}~]+)"

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/text/Regex;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/MediaType;->TYPE_SUBTYPE:Lnicoid/network238/kotlin/text/Regex;

    .line 96
    new-instance v0, Lnicoid/network238/kotlin/text/Regex;

    const-string v1, ";\\s*(?:([a-zA-Z0-9-!#$%&\'*+.^_`{|}~]+)=(?:([a-zA-Z0-9-!#$%&\'*+.^_`{|}~]+)|\"([^\"]*)\"))?"

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/text/Regex;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/MediaType;->PARAMETER:Lnicoid/network238/kotlin/text/Regex;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lnicoid/network238/okhttp3/MediaType;->mediaType:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lnicoid/network238/okhttp3/MediaType;->type:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lnicoid/network238/okhttp3/MediaType;->subtype:Ljava/lang/String;

    .line 37
    iput-object p4, p0, Lnicoid/network238/okhttp3/MediaType;->parameterNamesAndValues:[Ljava/lang/String;

    return-void
.end method

.method public static final synthetic access$getPARAMETER$cp()Lnicoid/network238/kotlin/text/Regex;
    .registers 1

    .line 26
    sget-object v0, Lnicoid/network238/okhttp3/MediaType;->PARAMETER:Lnicoid/network238/kotlin/text/Regex;

    return-object v0
.end method

.method public static final synthetic access$getTYPE_SUBTYPE$cp()Lnicoid/network238/kotlin/text/Regex;
    .registers 1

    .line 26
    sget-object v0, Lnicoid/network238/okhttp3/MediaType;->TYPE_SUBTYPE:Lnicoid/network238/kotlin/text/Regex;

    return-object v0
.end method

.method public static synthetic charset$default(Lnicoid/network238/okhttp3/MediaType;Ljava/nio/charset/Charset;ILjava/lang/Object;)Ljava/nio/charset/Charset;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 44
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/MediaType;->charset(Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;

    move-result-object p0

    return-object p0
.end method

.method public static final get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/MediaType;->Companion:Lnicoid/network238/okhttp3/MediaType$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object p0

    return-object p0
.end method

.method public static final parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/MediaType;->Companion:Lnicoid/network238/okhttp3/MediaType$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_subtype()Ljava/lang/String;
    .registers 2

    .line 80
    iget-object v0, p0, Lnicoid/network238/okhttp3/MediaType;->subtype:Ljava/lang/String;

    return-object v0
.end method

.method public final -deprecated_type()Ljava/lang/String;
    .registers 2

    .line 72
    iget-object v0, p0, Lnicoid/network238/okhttp3/MediaType;->type:Ljava/lang/String;

    return-object v0
.end method

.method public final charset()Ljava/nio/charset/Charset;
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lnicoid/network238/okhttp3/MediaType;->charset$default(Lnicoid/network238/okhttp3/MediaType;Ljava/nio/charset/Charset;ILjava/lang/Object;)Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0
.end method

.method public final charset(Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;
    .registers 3

    .line 45
    const-string v0, "charset"

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/MediaType;->parameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    return-object p1

    .line 47
    :cond_0
    :try_start_0
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    .line 88
    instance-of v0, p1, Lnicoid/network238/okhttp3/MediaType;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/MediaType;

    iget-object p1, p1, Lnicoid/network238/okhttp3/MediaType;->mediaType:Ljava/lang/String;

    iget-object v0, p0, Lnicoid/network238/okhttp3/MediaType;->mediaType:Ljava/lang/String;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final getMediaType$okhttp()Ljava/lang/String;
    .registers 2

    .line 27
    iget-object v0, p0, Lnicoid/network238/okhttp3/MediaType;->mediaType:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .line 90
    iget-object v0, p0, Lnicoid/network238/okhttp3/MediaType;->mediaType:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public final parameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    iget-object v0, p0, Lnicoid/network238/okhttp3/MediaType;->parameterNamesAndValues:[Ljava/lang/String;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {v2, v0, v1}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->getProgressionLastElement(III)I

    move-result v0

    if-ltz v0, :cond_1

    .line 59
    :goto_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/MediaType;->parameterNamesAndValues:[Ljava/lang/String;

    aget-object v1, v1, v2

    const/4 v3, 0x1

    invoke-static {v1, p1, v3}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 60
    iget-object p1, p0, Lnicoid/network238/okhttp3/MediaType;->parameterNamesAndValues:[Ljava/lang/String;

    add-int/2addr v2, v3

    aget-object p1, p1, v2

    return-object p1

    :cond_0
    if-eq v2, v0, :cond_1

    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public final subtype()Ljava/lang/String;
    .registers 2

    .line 35
    iget-object v0, p0, Lnicoid/network238/okhttp3/MediaType;->subtype:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 86
    iget-object v0, p0, Lnicoid/network238/okhttp3/MediaType;->mediaType:Ljava/lang/String;

    return-object v0
.end method

.method public final type()Ljava/lang/String;
    .registers 2

    .line 31
    iget-object v0, p0, Lnicoid/network238/okhttp3/MediaType;->type:Ljava/lang/String;

    return-object v0
.end method
