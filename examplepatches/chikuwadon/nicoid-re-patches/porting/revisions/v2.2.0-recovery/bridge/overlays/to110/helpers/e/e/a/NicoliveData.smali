.class public final Le/e/a/NicoliveData;
.super Ljava/lang/Object;
.source "NicoliveData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/NicoliveData$Chat;,
        Le/e/a/NicoliveData$Program;,
        Le/e/a/NicoliveData$Wire;
    }
.end annotation


# static fields
.field static final COLORS:[I

.field static final ID:Ljava/util/regex/Pattern;

.field public static final UA:Ljava/lang/String; = "Mozilla/5.0"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    const-string v0, "lv[0-9]{1,15}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/NicoliveData;->ID:Ljava/util/regex/Pattern;

    const/16 v0, 0x14

    .line 206
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Le/e/a/NicoliveData;->COLORS:[I

    return-void

    :array_0
    .array-data 4
        -0x1
        -0xbbbc
        -0x7f50
        -0x5fc0
        -0xc0
        -0x9f2fa0
        -0x9f2223
        -0x9f6f01    # -2.9849993E38f
        -0x4f7f01
        -0xdfdfe0
        -0x1
        -0x33cccd
        -0x33906a
        -0x337dd0
        -0x2222d0
        -0xbf4fc0
        -0xbf4445
        -0xbf8f34
        -0x6f9f34
        -0xdfdfe0
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static accessLabel(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 7

    .line 108
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 109
    :cond_0
    const-string v1, "nicoliveAccessLabel"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 110
    const-string/jumbo v2, "\u6709\u6599"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "\u4f1a\u54e1\u7121\u6599"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v4, "\u4e00\u90e8\u7121\u6599"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 111
    const-string v1, "isPartialFree"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "isPartiallyFree"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "isFreePart"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 112
    const-string v1, "isPayProgram"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "isPaidProgram"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 113
    const-string v1, "isMemberOnly"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "isMemberFree"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    return-object v0

    :cond_1
    return-object v3

    :cond_2
    return-object v2

    :cond_3
    return-object v4

    :cond_4
    return-object v1
.end method

.method static addMediaArtwork(Le/e/a/NicoliveData$Program;Ljava/lang/String;)V
    .registers 4

    if-eqz p0, :cond_0

    .line 32
    invoke-static {p1}, Le/e/a/NicoliveArtwork;->isTrusted(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveData$Program;->mediaThumbnails:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 33
    iget-object v0, p0, Le/e/a/NicoliveData$Program;->mediaThumbnails:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x8

    if-ge v0, v1, :cond_0

    iget-object p0, p0, Le/e/a/NicoliveData$Program;->mediaThumbnails:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method static attr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\\b"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\\s*=\\s*([\"\'])(.*?)\\1"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x20

    invoke-static {p1, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/NicoliveData;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "PAGE_DATA_MISSING"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static broadcastThumbnail(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 5

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    .line 117
    :cond_0
    const-string v0, "huge"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    .line 118
    const-string v0, "s1280x720"

    const-string v1, "s1920x1080"

    const-string v2, "s352x198"

    const-string v3, "s640x360"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_1
    const/4 v2, 0x4

    if-ge v1, v2, :cond_2

    aget-object v2, v0, v1

    .line 119
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 120
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    return-object v2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 122
    :cond_2
    const-string p0, ""

    return-object p0
.end method

.method public static chat([B)Le/e/a/NicoliveData$Chat;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    new-instance v0, Le/e/a/NicoliveData$Wire;

    invoke-direct {v0, p0}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    new-instance v1, Le/e/a/NicoliveData$Chat;

    invoke-direct {v1}, Le/e/a/NicoliveData$Chat;-><init>()V

    const/4 v2, 0x0

    .line 200
    :cond_0
    :goto_0
    iget v3, v0, Le/e/a/NicoliveData$Wire;->pos:I

    array-length v4, p0

    if-lt v3, v4, :cond_2

    if-eqz v2, :cond_1

    .line 203
    iget-object p0, v1, Le/e/a/NicoliveData$Chat;->text:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1

    return-object v1

    :cond_1
    const/4 p0, 0x0

    return-object p0

    .line 200
    :cond_2
    invoke-virtual {v0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v3

    long-to-int v3, v3

    const/16 v4, 0x12

    const/16 v5, 0xa

    if-ne v3, v5, :cond_8

    new-instance v6, Le/e/a/NicoliveData$Wire;

    invoke-virtual {v0}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v3

    invoke-direct {v6, v3}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    :goto_1
    iget v3, v6, Le/e/a/NicoliveData$Wire;->pos:I

    iget-object v7, v6, Le/e/a/NicoliveData$Wire;->data:[B

    array-length v7, v7

    if-ge v3, v7, :cond_0

    invoke-virtual {v6}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v7

    long-to-int v3, v7

    if-ne v3, v5, :cond_3

    new-instance v3, Ljava/lang/String;

    invoke-virtual {v6}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v7

    sget-object v8, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v7, v8}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    iput-object v3, v1, Le/e/a/NicoliveData$Chat;->id:Ljava/lang/String;

    goto :goto_1

    :cond_3
    if-ne v3, v4, :cond_7

    new-instance v7, Le/e/a/NicoliveData$Wire;

    invoke-virtual {v6}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v3

    invoke-direct {v7, v3}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    const-wide/16 v8, 0x0

    move-wide v10, v8

    :goto_2
    iget v3, v7, Le/e/a/NicoliveData$Wire;->pos:I

    iget-object v12, v7, Le/e/a/NicoliveData$Wire;->data:[B

    array-length v12, v12

    if-lt v3, v12, :cond_4

    const-wide/16 v12, 0x3e8

    mul-long/2addr v8, v12

    const-wide/32 v12, 0xf4240

    div-long/2addr v10, v12

    add-long/2addr v8, v10

    iput-wide v8, v1, Le/e/a/NicoliveData$Chat;->atMs:J

    goto :goto_1

    :cond_4
    invoke-virtual {v7}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v12

    long-to-int v3, v12

    const/16 v12, 0x8

    if-ne v3, v12, :cond_5

    invoke-virtual {v7}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v8

    goto :goto_2

    :cond_5
    const/16 v12, 0x10

    if-ne v3, v12, :cond_6

    invoke-virtual {v7}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v10

    goto :goto_2

    :cond_6
    and-int/lit8 v3, v3, 0x7

    invoke-virtual {v7, v3}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto :goto_2

    :cond_7
    and-int/lit8 v3, v3, 0x7

    invoke-virtual {v6, v3}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto :goto_1

    :cond_8
    if-ne v3, v4, :cond_a

    .line 201
    new-instance v4, Le/e/a/NicoliveData$Wire;

    invoke-virtual {v0}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v3

    invoke-direct {v4, v3}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    :goto_3
    iget v3, v4, Le/e/a/NicoliveData$Wire;->pos:I

    iget-object v6, v4, Le/e/a/NicoliveData$Wire;->data:[B

    array-length v6, v6

    if-ge v3, v6, :cond_0

    invoke-virtual {v4}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v6

    long-to-int v3, v6

    if-eq v3, v5, :cond_9

    const/16 v6, 0xa2

    if-eq v3, v6, :cond_9

    and-int/lit8 v3, v3, 0x7

    invoke-virtual {v4, v3}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto :goto_3

    :cond_9
    new-instance v2, Le/e/a/NicoliveData$Wire;

    invoke-virtual {v4}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v3

    invoke-direct {v2, v3}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    invoke-static {v2, v1}, Le/e/a/NicoliveData;->parseChat(Le/e/a/NicoliveData$Wire;Le/e/a/NicoliveData$Chat;)V

    const/4 v2, 0x1

    goto :goto_3

    :cond_a
    and-int/lit8 v3, v3, 0x7

    .line 202
    invoke-virtual {v0, v3}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto/16 :goto_0
.end method

.method static collect(Ljava/lang/Object;Ljava/util/Map;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/NicoliveData$Program;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-eqz p0, :cond_2

    const/16 v0, 0x12

    if-gt p2, v0, :cond_2

    .line 170
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v1, 0xc8

    if-ge v0, v1, :cond_2

    .line 171
    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {v0}, Le/e/a/NicoliveData$Program;->listing(Lorg/json/JSONObject;)Le/e/a/NicoliveData$Program;

    move-result-object p0

    if-eqz p0, :cond_0

    iget-object v1, p0, Le/e/a/NicoliveData$Program;->title:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    iget-object p2, p0, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-interface {p1, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    add-int/lit8 v2, p2, 0x1

    invoke-static {p0, p1, v2}, Le/e/a/NicoliveData;->collect(Ljava/lang/Object;Ljava/util/Map;I)V

    goto :goto_0

    .line 172
    :cond_1
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_2

    check-cast p0, Lorg/json/JSONArray;

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, p2, 0x1

    invoke-static {v1, p1, v2}, Le/e/a/NicoliveData;->collect(Ljava/lang/Object;Ljava/util/Map;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public static embedded(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<script\\b[^>]*\\bid\\s*=\\s*([\"\'])"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\\1[^>]*>"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x22

    invoke-static {p1, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lorg/json/JSONObject;

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2}, Le/e/a/NicoliveData;->attr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    return-object p1

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "PAGE_DATA_MISSING"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static entry([B[J)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 197
    new-instance v0, Le/e/a/NicoliveData$Wire;

    invoke-direct {v0, p0}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    const/4 v1, 0x0

    :cond_0
    :goto_0
    iget v2, v0, Le/e/a/NicoliveData$Wire;->pos:I

    array-length v3, p0

    if-lt v2, v3, :cond_1

    return-object v1

    :cond_1
    invoke-virtual {v0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v2

    long-to-int v2, v2

    ushr-int/lit8 v3, v2, 0x3

    and-int/lit8 v4, v2, 0x7

    const/4 v5, 0x2

    if-ne v4, v5, :cond_4

    const/4 v5, 0x1

    if-eq v3, v5, :cond_2

    const/4 v5, 0x3

    if-ne v3, v5, :cond_4

    :cond_2
    new-instance v3, Le/e/a/NicoliveData$Wire;

    invoke-virtual {v0}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v2

    invoke-direct {v3, v2}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    :goto_1
    iget v2, v3, Le/e/a/NicoliveData$Wire;->pos:I

    iget-object v4, v3, Le/e/a/NicoliveData$Wire;->data:[B

    array-length v4, v4

    if-ge v2, v4, :cond_0

    invoke-virtual {v3}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v4

    long-to-int v2, v4

    const/16 v4, 0x1a

    if-ne v2, v4, :cond_3

    new-instance v1, Ljava/lang/String;

    invoke-virtual {v3}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v2

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_1

    :cond_3
    and-int/lit8 v2, v2, 0x7

    invoke-virtual {v3, v2}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto :goto_1

    :cond_4
    const/16 v3, 0x22

    if-ne v2, v3, :cond_6

    new-instance v2, Le/e/a/NicoliveData$Wire;

    invoke-virtual {v0}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v3

    invoke-direct {v2, v3}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    :goto_2
    iget v3, v2, Le/e/a/NicoliveData$Wire;->pos:I

    iget-object v4, v2, Le/e/a/NicoliveData$Wire;->data:[B

    array-length v4, v4

    if-ge v3, v4, :cond_0

    invoke-virtual {v2}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v3

    long-to-int v3, v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_5

    const/4 v3, 0x0

    invoke-virtual {v2}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v4

    aput-wide v4, p1, v3

    goto :goto_2

    :cond_5
    and-int/lit8 v3, v3, 0x7

    invoke-virtual {v2, v3}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto :goto_2

    :cond_6
    invoke-virtual {v0, v4}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto :goto_0
.end method

.method public static failure(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-nez p0, :cond_0

    .line 177
    const-string/jumbo p0, "\u63a5\u7d9a\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    return-object p0

    .line 178
    :cond_0
    const-string v0, "NOT_ON_AIR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "END_PROGRAM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 179
    const-string v0, "NO_PERMISSION"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "FORBIDDEN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "NO_AUTH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 180
    const-string v0, "NOT_FOUND"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo p0, "\u756a\u7d44\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093"

    return-object p0

    .line 181
    :cond_1
    const-string v0, "COMMENT_LOCK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "\u30b3\u30e1\u30f3\u30c8\u306e\u6295\u7a3f\u304c\u5236\u9650\u3055\u308c\u3066\u3044\u307e\u3059"

    return-object p0

    .line 182
    :cond_2
    const-string v0, "POST"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "\u30b3\u30e1\u30f3\u30c8\u3092\u9001\u4fe1\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u6295\u7a3f\u6e08\u307f\u304b\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    return-object p0

    .line 183
    :cond_3
    const-string/jumbo p0, "\u63a5\u7d9a\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u63a5\u7d9a\u3092\u304a\u8a66\u3057\u304f\u3060\u3055\u3044"

    return-object p0

    .line 179
    :cond_4
    const-string p0, "\u3053\u306e\u756a\u7d44\u306e\u8996\u8074\u6761\u4ef6\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    return-object p0

    .line 178
    :cond_5
    const-string/jumbo p0, "\u653e\u9001\u306f\u7d42\u4e86\u3057\u307e\u3057\u305f"

    return-object p0
.end method

.method public static frame(Ljava/io/InputStream;)[B
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 196
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    if-gez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    and-int/lit8 v1, v0, 0x7f

    int-to-long v1, v1

    const/4 v3, 0x7

    :goto_0
    and-int/lit16 v0, v0, 0x80

    const-string v4, "FRAME_TOO_LARGE"

    if-nez v0, :cond_7

    const-wide/32 v5, 0x100000

    cmp-long v0, v1, v5

    if-gtz v0, :cond_6

    long-to-int v0, v1

    new-array v1, v0, [B

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :cond_1
    :goto_1
    if-lt v3, v0, :cond_2

    return-object v1

    :cond_2
    sub-int v5, v0, v3

    invoke-virtual {p0, v1, v3, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    if-ltz v5, :cond_5

    if-nez v5, :cond_4

    add-int/lit8 v4, v4, 0x1

    const/16 v5, 0x8

    if-gt v4, v5, :cond_3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string v0, "FRAME_STALLED"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    add-int/2addr v3, v5

    move v4, v2

    goto :goto_1

    :cond_5
    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    throw p0

    :cond_6
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_7
    const/16 v0, 0x1c

    if-gt v3, v0, :cond_9

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    if-ltz v0, :cond_8

    and-int/lit8 v4, v0, 0x7f

    int-to-long v4, v4

    shl-long/2addr v4, v3

    or-long/2addr v1, v4

    add-int/lit8 v3, v3, 0x7

    goto :goto_0

    :cond_8
    new-instance p0, Ljava/io/EOFException;

    invoke-direct {p0}, Ljava/io/EOFException;-><init>()V

    throw p0

    :cond_9
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static historyThumbnail(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 129
    const-string v0, "embedded-data"

    const-string v1, "data-props"

    invoke-static {p0, v0, v1}, Le/e/a/NicoliveData;->embedded(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "program"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 130
    const-string v1, "nicoliveProgramId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 131
    const-string p1, "thumbnail"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 132
    invoke-static {p1}, Le/e/a/NicoliveData;->broadcastThumbnail(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    .line 133
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    .line 136
    :cond_0
    const-string v0, ""

    if-eqz p1, :cond_2

    .line 137
    const-string v1, "thumbnailUrl"

    const-string v2, "url"

    const-string v3, "large"

    const-string v4, "middle"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x4

    if-ge v2, v3, :cond_2

    aget-object v3, v1, v2

    .line 138
    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 139
    invoke-static {v3}, Le/e/a/NicoliveData;->trustedThumbnail(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    return-object v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 143
    :cond_2
    const-string v1, "(?is)<meta\\b[^>]*>"

    .line 142
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 143
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 144
    :catch_0
    :cond_3
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_5

    if-eqz p1, :cond_4

    .line 153
    const-string p0, "small"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/NicoliveData;->trustedThumbnail(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 154
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_4
    return-object v0

    .line 145
    :cond_5
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    .line 147
    :try_start_0
    const-string v2, "property"

    invoke-static {v1, v2}, Le/e/a/NicoliveData;->attr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 148
    const-string v3, "og:image"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 149
    const-string v2, "content"

    invoke-static {v1, v2}, Le/e/a/NicoliveData;->attr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 150
    invoke-static {v1}, Le/e/a/NicoliveData;->trustedThumbnail(Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_3

    return-object v1

    .line 130
    :cond_6
    new-instance p0, Ljava/io/IOException;

    const-string p1, "PROGRAM_MISMATCH"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static id(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Le/e/a/NicoliveData;->ID:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_1

    return-object p0

    .line 16
    :cond_1
    :try_start_0
    new-instance v2, Ljava/net/URI;

    invoke-direct {v2, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    const-string v3, "nicoid-re"

    invoke-virtual {v2}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    const-string v3, "live"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v2}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    invoke-virtual {v2}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2

    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    return-object v0

    :cond_3
    if-eqz p0, :cond_6

    invoke-virtual {v2}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_6

    const-string v1, "live.nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "live2.nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "sp.live.nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "nico.ms"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    .line 17
    :cond_4
    const-string p0, "https"

    invoke-virtual {v2}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_5

    const-string p0, "http"

    invoke-virtual {v2}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_5

    return-object v0

    .line 18
    :cond_5
    const-string p0, "^/(?:watch/|gate/)?(lv[0-9]{1,15})/?$"

    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p0

    invoke-virtual {v2}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {p0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    :cond_6
    return-object v0
.end method

.method static isListingThumbnail(Ljava/lang/String;)Z
    .registers 2

    .line 125
    :try_start_0
    const-string v0, "listing-thumbnail.live.nicovideo.jp"

    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public static listings(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Le/e/a/NicoliveData$Program;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 166
    :try_start_0
    const-string v0, "DAT-csr-data"

    const-string v1, "data-value"

    invoke-static {p0, v0, v1}, Le/e/a/NicoliveData;->embedded(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v0, "embedded-data"

    const-string v1, "data-props"

    invoke-static {p0, v0, v1}, Le/e/a/NicoliveData;->embedded(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 167
    :goto_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Le/e/a/NicoliveData;->collect(Ljava/lang/Object;Ljava/util/Map;I)V

    new-instance p0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p0
.end method

.method static modifier(Le/e/a/NicoliveData$Wire;Le/e/a/NicoliveData$Chat;)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 207
    :cond_0
    :goto_0
    iget v0, p0, Le/e/a/NicoliveData$Wire;->pos:I

    iget-object v1, p0, Le/e/a/NicoliveData$Wire;->data:[B

    array-length v1, v1

    if-lt v0, v1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v0

    long-to-int v0, v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_2

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p1, Le/e/a/NicoliveData$Chat;->position:I

    goto :goto_0

    :cond_2
    const/16 v2, 0x10

    if-ne v0, v2, :cond_3

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p1, Le/e/a/NicoliveData$Chat;->size:I

    goto :goto_0

    :cond_3
    const/16 v3, 0x18

    if-ne v0, v3, :cond_4

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v0

    long-to-int v0, v0

    if-ltz v0, :cond_0

    sget-object v1, Le/e/a/NicoliveData;->COLORS:[I

    array-length v2, v1

    if-ge v0, v2, :cond_0

    aget v0, v1, v0

    :goto_1
    iput v0, p1, Le/e/a/NicoliveData$Chat;->color:I

    goto :goto_0

    :cond_4
    const/16 v4, 0x22

    const/4 v5, 0x0

    if-ne v0, v4, :cond_9

    new-instance v4, Le/e/a/NicoliveData$Wire;

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v0

    invoke-direct {v4, v0}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    const/16 v6, 0xff

    move v0, v6

    move v7, v0

    move v8, v7

    :goto_2
    iget v9, v4, Le/e/a/NicoliveData$Wire;->pos:I

    iget-object v10, v4, Le/e/a/NicoliveData$Wire;->data:[B

    array-length v10, v10

    if-lt v9, v10, :cond_5

    invoke-static {v6, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    shl-int/2addr v0, v2

    const/high16 v2, -0x1000000

    or-int/2addr v0, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    shl-int/2addr v2, v1

    or-int/2addr v0, v2

    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    or-int/2addr v0, v1

    goto :goto_1

    :cond_5
    invoke-virtual {v4}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v9

    long-to-int v9, v9

    if-ne v9, v1, :cond_6

    invoke-virtual {v4}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v9

    long-to-int v0, v9

    goto :goto_2

    :cond_6
    if-ne v9, v2, :cond_7

    invoke-virtual {v4}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v9

    long-to-int v7, v9

    goto :goto_2

    :cond_7
    if-ne v9, v3, :cond_8

    invoke-virtual {v4}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v8

    long-to-int v8, v8

    goto :goto_2

    :cond_8
    and-int/lit8 v9, v9, 0x7

    invoke-virtual {v4, v9}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto :goto_2

    :cond_9
    const/16 v1, 0x30

    if-ne v0, v1, :cond_b

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_a

    const/4 v5, 0x1

    :cond_a
    iput-boolean v5, p1, Le/e/a/NicoliveData$Chat;->translucent:Z

    goto/16 :goto_0

    :cond_b
    and-int/lit8 v0, v0, 0x7

    invoke-virtual {p0, v0}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto/16 :goto_0
.end method

.method static parseChat(Le/e/a/NicoliveData$Wire;Le/e/a/NicoliveData$Chat;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    :goto_0
    iget v0, p0, Le/e/a/NicoliveData$Wire;->pos:I

    iget-object v1, p0, Le/e/a/NicoliveData$Wire;->data:[B

    array-length v1, v1

    if-lt v0, v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v0

    long-to-int v0, v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    iput-object v0, p1, Le/e/a/NicoliveData$Chat;->text:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const/16 v1, 0x18

    if-ne v0, v1, :cond_2

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v0

    long-to-int v0, v0

    int-to-long v0, v0

    iput-wide v0, p1, Le/e/a/NicoliveData$Chat;->vpos:J

    goto :goto_0

    :cond_2
    const/16 v1, 0x28

    if-ne v0, v1, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "raw:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->varint()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, p1, Le/e/a/NicoliveData$Chat;->user:Ljava/lang/String;

    goto :goto_0

    :cond_3
    const/16 v1, 0x32

    if-ne v0, v1, :cond_4

    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    const-string v1, "live-anon:"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    const/16 v1, 0x3a

    if-ne v0, v1, :cond_5

    new-instance v0, Le/e/a/NicoliveData$Wire;

    invoke-virtual {p0}, Le/e/a/NicoliveData$Wire;->bytes()[B

    move-result-object v1

    invoke-direct {v0, v1}, Le/e/a/NicoliveData$Wire;-><init>([B)V

    invoke-static {v0, p1}, Le/e/a/NicoliveData;->modifier(Le/e/a/NicoliveData$Wire;Le/e/a/NicoliveData$Chat;)V

    goto :goto_0

    :cond_5
    and-int/lit8 v0, v0, 0x7

    invoke-virtual {p0, v0}, Le/e/a/NicoliveData$Wire;->skip(I)V

    goto :goto_0
.end method

.method public static qualityLabel(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 175
    const-string v0, "abr"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo p0, "\u81ea\u52d5"

    return-object p0

    :cond_0
    const-string v0, "audio_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo p0, "\u97f3\u58f0\u306e\u307f"

    return-object p0

    :cond_1
    const-string v0, "super_high"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo p0, "\u6700\u9ad8\u753b\u8cea"

    return-object p0

    :cond_2
    const-string v0, "high"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo p0, "\u9ad8\u753b\u8cea"

    return-object p0

    :cond_3
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string/jumbo p0, "\u6a19\u6e96\u753b\u8cea"

    return-object p0

    :cond_4
    const-string v0, "low"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string p0, "\u4f4e\u753b\u8cea"

    return-object p0

    :cond_5
    const-string v0, "super_low"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string/jumbo p0, "\u6700\u4f4e\u753b\u8cea"

    :cond_6
    return-object p0
.end method

.method public static retryDelay(I)J
    .registers 5

    const/4 v0, 0x0

    .line 176
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    const/4 v0, 0x5

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const-wide/16 v0, 0x3e8

    shl-long/2addr v0, p0

    const-wide/16 v2, 0x7530

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static secureServiceUri(Ljava/lang/String;Z)Z
    .registers 5

    const/4 v0, 0x0

    .line 174
    :try_start_0
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2

    const-string v2, "nicovideo.jp"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, ".nicovideo.jp"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_0
    if-eqz p1, :cond_1

    const-string p0, "wss"

    goto :goto_0

    :cond_1
    const-string p0, "https"

    :goto_0
    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-virtual {v1}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_2

    const/4 p0, 0x1

    return p0

    :catch_0
    :cond_2
    return v0
.end method

.method private static trustedThumbnail(Ljava/lang/String;)Z
    .registers 4

    const/4 v0, 0x0

    .line 158
    :try_start_0
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 159
    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0

    .line 160
    const-string v2, "https"

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz p0, :cond_1

    .line 161
    const-string v1, "nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ".nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 162
    const-string v1, "nimg.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ".nimg.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :catch_0
    :cond_1
    return v0
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 22
    const-string v0, "x"

    if-nez p0, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    const-string v1, "&quot;"

    const-string v2, "\""

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "&#39;"

    const-string v2, "\'"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "&apos;"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 23
    const-string v1, "&#(x[0-9a-fA-F]+|[0-9]+);"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 24
    :goto_0
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "&amp;"

    const-string v1, "&"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v4

    :try_start_0
    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_2
    move-object v2, v3

    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/16 v3, 0x10

    goto :goto_2

    :cond_3
    const/16 v3, 0xa

    :goto_2
    invoke-static {v2, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isValidCodePoint(I)Z

    move-result v3

    if-eqz v3, :cond_4

    new-instance v3, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([C)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v3

    :catch_0
    :cond_4
    invoke-static {v4}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_0
.end method
