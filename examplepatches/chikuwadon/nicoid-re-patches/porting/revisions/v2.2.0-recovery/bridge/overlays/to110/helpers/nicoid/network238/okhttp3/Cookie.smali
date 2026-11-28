.class public final Lnicoid/network238/okhttp3/Cookie;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Cookie$Builder;,
        Lnicoid/network238/okhttp3/Cookie$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 *2\u00020\u0001:\u0002)*B[\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\u000c\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\n\u0012\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000e\u0010\u0014\u001a\u00020\n2\u0006\u0010\u0015\u001a\u00020\u0016J\u0013\u0010\u0017\u001a\u00020\n2\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u0019\u001a\u00020\u001aH\u0017J\u0008\u0010\u001b\u001a\u00020\u0003H\u0016J\r\u0010\u0002\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u001cJ\r\u0010\u0004\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u001dJ\r\u0010\u000c\u001a\u00020\nH\u0007\u00a2\u0006\u0002\u0008\u001eJ\r\u0010\u0005\u001a\u00020\u0006H\u0007\u00a2\u0006\u0002\u0008\u001fJ\r\u0010\r\u001a\u00020\nH\u0007\u00a2\u0006\u0002\u0008 J\r\u0010\u0007\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008!J\r\u0010\u0008\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\"J\r\u0010\u000b\u001a\u00020\nH\u0007\u00a2\u0006\u0002\u0008#J\r\u0010\t\u001a\u00020\nH\u0007\u00a2\u0006\u0002\u0008$J\u0015\u0010\u001b\u001a\u00020\u00032\u0006\u0010%\u001a\u00020\nH\u0000\u00a2\u0006\u0002\u0008&J\u0006\u0010\'\u001a\u00020(R\u0013\u0010\u0002\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0011R\u0013\u0010\u0004\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u0011R\u0013\u0010\u0005\u001a\u00020\u00068\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0012R\u0013\u0010\u0007\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0011R\u0013\u0010\u0008\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\u0011R\u0013\u0010\t\u001a\u00020\n8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0013R\u0013\u0010\u000b\u001a\u00020\n8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u0013R\u0013\u0010\u000c\u001a\u00020\n8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\u0013R\u0013\u0010\r\u001a\u00020\n8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u0013R\u0015\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u0011\u00a8\u0006+"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Cookie;",
        "",
        "name",
        "",
        "value",
        "expiresAt",
        "",
        "domain",
        "path",
        "secure",
        "",
        "httpOnly",
        "persistent",
        "hostOnly",
        "sameSite",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZLjava/lang/String;)V",
        "()Ljava/lang/String;",
        "()J",
        "()Z",
        "matches",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "-deprecated_name",
        "-deprecated_value",
        "-deprecated_persistent",
        "-deprecated_expiresAt",
        "-deprecated_hostOnly",
        "-deprecated_domain",
        "-deprecated_path",
        "-deprecated_httpOnly",
        "-deprecated_secure",
        "forObsoleteRfc2965",
        "toString$okhttp",
        "newBuilder",
        "Lnicoid/network238/okhttp3/Cookie$Builder;",
        "Builder",
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
.field public static final Companion:Lnicoid/network238/okhttp3/Cookie$Companion;

.field private static final DAY_OF_MONTH_PATTERN:Ljava/util/regex/Pattern;

.field private static final MONTH_PATTERN:Ljava/util/regex/Pattern;

.field private static final TIME_PATTERN:Ljava/util/regex/Pattern;

.field private static final YEAR_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final domain:Ljava/lang/String;

.field private final expiresAt:J

.field private final hostOnly:Z

.field private final httpOnly:Z

.field private final name:Ljava/lang/String;

.field private final path:Ljava/lang/String;

.field private final persistent:Z

.field private final sameSite:Ljava/lang/String;

.field private final secure:Z

.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/Cookie$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/Cookie$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/Cookie;->Companion:Lnicoid/network238/okhttp3/Cookie$Companion;

    .line 403
    const-string v0, "(\\d{2,4})[^\\d]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/Cookie;->YEAR_PATTERN:Ljava/util/regex/Pattern;

    .line 405
    const-string v0, "(?i)(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec).*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/Cookie;->MONTH_PATTERN:Ljava/util/regex/Pattern;

    .line 406
    const-string v0, "(\\d{1,2})[^\\d]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/Cookie;->DAY_OF_MONTH_PATTERN:Ljava/util/regex/Pattern;

    .line 407
    const-string v0, "(\\d{1,2}):(\\d{1,2}):(\\d{1,2})[^\\d]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/Cookie;->TIME_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZLjava/lang/String;)V
    .registers 12

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lnicoid/network238/okhttp3/Cookie;->name:Ljava/lang/String;

    .line 48
    iput-object p2, p0, Lnicoid/network238/okhttp3/Cookie;->value:Ljava/lang/String;

    .line 58
    iput-wide p3, p0, Lnicoid/network238/okhttp3/Cookie;->expiresAt:J

    .line 63
    iput-object p5, p0, Lnicoid/network238/okhttp3/Cookie;->domain:Ljava/lang/String;

    .line 69
    iput-object p6, p0, Lnicoid/network238/okhttp3/Cookie;->path:Ljava/lang/String;

    .line 71
    iput-boolean p7, p0, Lnicoid/network238/okhttp3/Cookie;->secure:Z

    .line 76
    iput-boolean p8, p0, Lnicoid/network238/okhttp3/Cookie;->httpOnly:Z

    .line 82
    iput-boolean p9, p0, Lnicoid/network238/okhttp3/Cookie;->persistent:Z

    .line 94
    iput-boolean p10, p0, Lnicoid/network238/okhttp3/Cookie;->hostOnly:Z

    .line 120
    iput-object p11, p0, Lnicoid/network238/okhttp3/Cookie;->sameSite:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZLjava/lang/String;Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 13

    invoke-direct/range {p0 .. p11}, Lnicoid/network238/okhttp3/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZLjava/lang/String;)V

    return-void
.end method

.method public static final synthetic access$getDAY_OF_MONTH_PATTERN$cp()Ljava/util/regex/Pattern;
    .registers 1

    .line 43
    sget-object v0, Lnicoid/network238/okhttp3/Cookie;->DAY_OF_MONTH_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method public static final synthetic access$getMONTH_PATTERN$cp()Ljava/util/regex/Pattern;
    .registers 1

    .line 43
    sget-object v0, Lnicoid/network238/okhttp3/Cookie;->MONTH_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method public static final synthetic access$getTIME_PATTERN$cp()Ljava/util/regex/Pattern;
    .registers 1

    .line 43
    sget-object v0, Lnicoid/network238/okhttp3/Cookie;->TIME_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method public static final synthetic access$getYEAR_PATTERN$cp()Ljava/util/regex/Pattern;
    .registers 1

    .line 43
    sget-object v0, Lnicoid/network238/okhttp3/Cookie;->YEAR_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method public static final parse(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/Cookie;->Companion:Lnicoid/network238/okhttp3/Cookie$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/Cookie$Companion;->parse(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie;

    move-result-object p0

    return-object p0
.end method

.method public static final parseAll(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            "Lnicoid/network238/okhttp3/Headers;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Cookie;",
            ">;"
        }
    .end annotation

    sget-object v0, Lnicoid/network238/okhttp3/Cookie;->Companion:Lnicoid/network238/okhttp3/Cookie$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/Cookie$Companion;->parseAll(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_domain()Ljava/lang/String;
    .registers 2

    .line 218
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->domain:Ljava/lang/String;

    return-object v0
.end method

.method public final -deprecated_expiresAt()J
    .registers 3

    .line 202
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Cookie;->expiresAt:J

    return-wide v0
.end method

.method public final -deprecated_hostOnly()Z
    .registers 2

    .line 210
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->hostOnly:Z

    return v0
.end method

.method public final -deprecated_httpOnly()Z
    .registers 2

    .line 234
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->httpOnly:Z

    return v0
.end method

.method public final -deprecated_name()Ljava/lang/String;
    .registers 2

    .line 178
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final -deprecated_path()Ljava/lang/String;
    .registers 2

    .line 226
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->path:Ljava/lang/String;

    return-object v0
.end method

.method public final -deprecated_persistent()Z
    .registers 2

    .line 194
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->persistent:Z

    return v0
.end method

.method public final -deprecated_secure()Z
    .registers 2

    .line 242
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->secure:Z

    return v0
.end method

.method public final -deprecated_value()Ljava/lang/String;
    .registers 2

    .line 186
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->value:Ljava/lang/String;

    return-object v0
.end method

.method public final domain()Ljava/lang/String;
    .registers 2

    .line 63
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->domain:Ljava/lang/String;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .line 142
    instance-of v0, p1, Lnicoid/network238/okhttp3/Cookie;

    if-eqz v0, :cond_0

    .line 143
    check-cast p1, Lnicoid/network238/okhttp3/Cookie;

    iget-object v0, p1, Lnicoid/network238/okhttp3/Cookie;->name:Ljava/lang/String;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->name:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p1, Lnicoid/network238/okhttp3/Cookie;->value:Ljava/lang/String;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->value:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    iget-wide v0, p1, Lnicoid/network238/okhttp3/Cookie;->expiresAt:J

    iget-wide v2, p0, Lnicoid/network238/okhttp3/Cookie;->expiresAt:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 146
    iget-object v0, p1, Lnicoid/network238/okhttp3/Cookie;->domain:Ljava/lang/String;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->domain:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p1, Lnicoid/network238/okhttp3/Cookie;->path:Ljava/lang/String;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->path:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    iget-boolean v0, p1, Lnicoid/network238/okhttp3/Cookie;->secure:Z

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->secure:Z

    if-ne v0, v1, :cond_0

    .line 149
    iget-boolean v0, p1, Lnicoid/network238/okhttp3/Cookie;->httpOnly:Z

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->httpOnly:Z

    if-ne v0, v1, :cond_0

    .line 150
    iget-boolean v0, p1, Lnicoid/network238/okhttp3/Cookie;->persistent:Z

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->persistent:Z

    if-ne v0, v1, :cond_0

    .line 151
    iget-boolean v0, p1, Lnicoid/network238/okhttp3/Cookie;->hostOnly:Z

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->hostOnly:Z

    if-ne v0, v1, :cond_0

    .line 152
    iget-object p1, p1, Lnicoid/network238/okhttp3/Cookie;->sameSite:Ljava/lang/String;

    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->sameSite:Ljava/lang/String;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final expiresAt()J
    .registers 3

    .line 58
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Cookie;->expiresAt:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 4

    .line 157
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    .line 158
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->value:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 159
    iget-wide v1, p0, Lnicoid/network238/okhttp3/Cookie;->expiresAt:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 160
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->domain:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 161
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->path:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 162
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->secure:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 163
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->httpOnly:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 164
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->persistent:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 165
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->hostOnly:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 166
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->sameSite:Ljava/lang/String;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public final hostOnly()Z
    .registers 2

    .line 94
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->hostOnly:Z

    return v0
.end method

.method public final httpOnly()Z
    .registers 2

    .line 76
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->httpOnly:Z

    return v0
.end method

.method public final matches(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->hostOnly:Z

    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->domain:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 132
    :cond_0
    sget-object v0, Lnicoid/network238/okhttp3/Cookie;->Companion:Lnicoid/network238/okhttp3/Cookie$Companion;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/okhttp3/Cookie;->domain:Ljava/lang/String;

    # invokes: Lnicoid/network238/okhttp3/Cookie$Companion;->domainMatch(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/Cookie$Companion;->access$domainMatch(Lnicoid/network238/okhttp3/Cookie$Companion;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    :goto_0
    if-nez v0, :cond_1

    goto :goto_1

    .line 136
    :cond_1
    sget-object v0, Lnicoid/network238/okhttp3/Cookie;->Companion:Lnicoid/network238/okhttp3/Cookie$Companion;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->path:Ljava/lang/String;

    # invokes: Lnicoid/network238/okhttp3/Cookie$Companion;->pathMatch(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Z
    invoke-static {v0, p1, v1}, Lnicoid/network238/okhttp3/Cookie$Companion;->access$pathMatch(Lnicoid/network238/okhttp3/Cookie$Companion;Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_1

    .line 138
    :cond_2
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->secure:Z

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result p1

    if-nez p1, :cond_3

    :goto_1
    const/4 p1, 0x0

    return p1

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public final name()Ljava/lang/String;
    .registers 2

    .line 46
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final newBuilder()Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 2

    .line 289
    new-instance v0, Lnicoid/network238/okhttp3/Cookie$Builder;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/Cookie$Builder;-><init>(Lnicoid/network238/okhttp3/Cookie;)V

    return-object v0
.end method

.method public final path()Ljava/lang/String;
    .registers 2

    .line 69
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->path:Ljava/lang/String;

    return-object v0
.end method

.method public final persistent()Z
    .registers 2

    .line 82
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->persistent:Z

    return v0
.end method

.method public final sameSite()Ljava/lang/String;
    .registers 2

    .line 121
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->sameSite:Ljava/lang/String;

    return-object v0
.end method

.method public final secure()Z
    .registers 2

    .line 71
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie;->secure:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 170
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/Cookie;->toString$okhttp(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final toString$okhttp(Z)Ljava/lang/String;
    .registers 7

    .line 250
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 251
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 253
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->persistent:Z

    if-eqz v1, :cond_1

    .line 256
    iget-wide v1, p0, Lnicoid/network238/okhttp3/Cookie;->expiresAt:J

    const-wide/high16 v3, -0x8000000000000000L

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 257
    const-string v1, "; max-age=0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 259
    :cond_0
    const-string v1, "; expires="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    iget-wide v3, p0, Lnicoid/network238/okhttp3/Cookie;->expiresAt:J

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->toHttpDateString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    :cond_1
    :goto_0
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cookie;->hostOnly:Z

    if-nez v1, :cond_3

    .line 264
    const-string v1, "; domain="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_2

    .line 266
    const-string p1, "."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    :cond_2
    iget-object p1, p0, Lnicoid/network238/okhttp3/Cookie;->domain:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    :cond_3
    const-string p1, "; path="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->path:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/Cookie;->secure:Z

    if-eqz p1, :cond_4

    .line 274
    const-string p1, "; secure"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    :cond_4
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/Cookie;->httpOnly:Z

    if-eqz p1, :cond_5

    .line 278
    const-string p1, "; httponly"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    :cond_5
    iget-object p1, p0, Lnicoid/network238/okhttp3/Cookie;->sameSite:Ljava/lang/String;

    if-eqz p1, :cond_6

    .line 282
    const-string p1, "; samesite="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie;->sameSite:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final value()Ljava/lang/String;
    .registers 2

    .line 48
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cookie;->value:Ljava/lang/String;

    return-object v0
.end method
