.class public Ll/i4c;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/d$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i4c$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/xml/sax/helpers/DefaultHandler;",
        "Lcom/google/android/exoplayer2/upstream/d$a<",
        "Ll/h4c;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final b:Ljava/util/regex/Pattern;

.field public static final c:Ljava/util/regex/Pattern;

.field public static final d:Ljava/util/regex/Pattern;

.field public static final e:[I


# instance fields
.field public final a:Lorg/xmlpull/v1/XmlPullParserFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "(\\d+)(?:/(\\d+))?"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/i4c;->b:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    const-string v0, "CC([1-4])=.*"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/i4c;->c:Ljava/util/regex/Pattern;

    .line 16
    .line 17
    const-string v0, "([1-9]|[1-5][0-9]|6[0-3])=.*"

    .line 18
    .line 19
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/i4c;->d:Ljava/util/regex/Pattern;

    .line 24
    .line 25
    const/16 v0, 0x15

    .line 26
    .line 27
    new-array v0, v0, [I

    .line 28
    .line 29
    fill-array-data v0, :array_0

    .line 30
    .line 31
    .line 32
    sput-object v0, Ll/i4c;->e:[I

    .line 33
    .line 34
    return-void

    .line 35
    :array_0
    .array-data 4
        -0x1
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x8
        0x2
        0x3
        0x4
        0x7
        0x8
        0x18
        0x8
        0xc
        0xa
        0xc
        0xe
        0xc
        0xe
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/i4c;->a:Lorg/xmlpull/v1/XmlPullParserFactory;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    const-string v0, "Couldn\'t create XmlPullParserFactory instance"

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    throw p0
.end method

.method public static D(Ljava/util/List;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_2

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/tvd;

    .line 13
    .line 14
    const-string v2, "urn:scte:dash:cc:cea-608:2015"

    .line 15
    .line 16
    iget-object v3, v1, Ll/tvd;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    iget-object v2, v1, Ll/tvd;->b:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    sget-object v3, Ll/i4c;->c:Ljava/util/regex/Pattern;

    .line 29
    .line 30
    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    invoke-virtual {v2, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v3, "Unable to parse CEA-608 channel number from: "

    .line 53
    .line 54
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, v1, Ll/tvd;->b:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v2, "MpdParser"

    .line 67
    .line 68
    invoke-static {v2, v1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 p0, -0x1

    .line 75
    return p0
.end method

.method public static E(Ljava/util/List;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_2

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/tvd;

    .line 13
    .line 14
    const-string v2, "urn:scte:dash:cc:cea-708:2015"

    .line 15
    .line 16
    iget-object v3, v1, Ll/tvd;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    iget-object v2, v1, Ll/tvd;->b:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    sget-object v3, Ll/i4c;->d:Ljava/util/regex/Pattern;

    .line 29
    .line 30
    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    invoke-virtual {v2, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v3, "Unable to parse CEA-708 service block number from: "

    .line 53
    .line 54
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, v1, Ll/tvd;->b:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v2, "MpdParser"

    .line 67
    .line 68
    invoke-static {v2, v1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 p0, -0x1

    .line 75
    return p0
.end method

.method public static H(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-wide p2

    .line 9
    :cond_0
    invoke-static {p0}, Ll/bmk0;->Q0(Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    return-wide p0
.end method

.method public static I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "schemeIdUri"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {p0, v0, v1}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "value"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {p0, v1, v2}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v3, "id"

    .line 17
    .line 18
    invoke-static {p0, v3, v2}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    :cond_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 23
    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    new-instance p0, Ll/tvd;

    .line 32
    .line 33
    invoke-direct {p0, v0, v1, v2}, Ll/tvd;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object p0
.end method

.method public static J(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "value"

    .line 3
    .line 4
    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, -0x1

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    invoke-static {p0}, Ll/i11;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x2

    .line 24
    const/4 v3, 0x1

    .line 25
    sparse-switch v1, :sswitch_data_0

    .line 26
    .line 27
    .line 28
    :goto_0
    move p0, v0

    .line 29
    goto :goto_1

    .line 30
    :sswitch_0
    const-string v1, "fa01"

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p0, 0x3

    .line 40
    goto :goto_1

    .line 41
    :sswitch_1
    const-string v1, "f801"

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move p0, v2

    .line 51
    goto :goto_1

    .line 52
    :sswitch_2
    const-string v1, "a000"

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    move p0, v3

    .line 62
    goto :goto_1

    .line 63
    :sswitch_3
    const-string v1, "4000"

    .line 64
    .line 65
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_4

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const/4 p0, 0x0

    .line 73
    :goto_1
    packed-switch p0, :pswitch_data_0

    .line 74
    .line 75
    .line 76
    return v0

    .line 77
    :pswitch_0
    const/16 p0, 0x8

    .line 78
    .line 79
    return p0

    .line 80
    :pswitch_1
    const/4 p0, 0x6

    .line 81
    return p0

    .line 82
    :pswitch_2
    return v2

    .line 83
    :pswitch_3
    return v3

    .line 84
    nop

    .line 85
    :sswitch_data_0
    .sparse-switch
        0x185d7c -> :sswitch_3
        0x2cd22f -> :sswitch_2
        0x2f3613 -> :sswitch_1
        0x2fcffc -> :sswitch_0
    .end sparse-switch

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static K(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 2

    .line 1
    const-string v0, "value"

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-static {p0, v0, v1}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-lez p0, :cond_0

    .line 9
    .line 10
    const/16 v0, 0x21

    .line 11
    .line 12
    if-ge p0, v0, :cond_0

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    return v1
.end method

.method public static L(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "value"

    .line 3
    .line 4
    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, -0x1

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    const/16 v1, 0x10

    .line 13
    .line 14
    invoke-static {p0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->bitCount(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    return v0

    .line 25
    :cond_1
    return p0
.end method

.method public static M(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-wide p2

    .line 9
    :cond_0
    invoke-static {p0}, Ll/bmk0;->R0(Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    return-wide p0
.end method

.method public static N(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_3

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/tvd;

    .line 13
    .line 14
    iget-object v2, v1, Ll/tvd;->a:Ljava/lang/String;

    .line 15
    .line 16
    const-string v3, "tag:dolby.com,2018:dash:EC3_ExtensionType:2018"

    .line 17
    .line 18
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    const-string v3, "JOC"

    .line 25
    .line 26
    iget-object v4, v1, Ll/tvd;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    :cond_0
    const-string v3, "tag:dolby.com,2014:dash:DolbyDigitalPlusExtensionType:2014"

    .line 35
    .line 36
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    const-string v2, "ec+3"

    .line 43
    .line 44
    iget-object v1, v1, Ll/tvd;->b:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    :cond_1
    const-string p0, "audio/eac3-joc"

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    const-string p0, "audio/eac3"

    .line 59
    .line 60
    return-object p0
.end method

.method public static R(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;F)F
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return p2

    .line 9
    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static S(Lorg/xmlpull/v1/XmlPullParser;F)F
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "frameRate"

    .line 3
    .line 4
    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    sget-object v0, Ll/i4c;->b:Ljava/util/regex/Pattern;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 v0, 0x2

    .line 32
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    int-to-float p1, p1

    .line 43
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    int-to-float p0, p0

    .line 48
    div-float/2addr p1, p0

    .line 49
    return p1

    .line 50
    :cond_0
    int-to-float p0, p1

    .line 51
    return p0

    .line 52
    :cond_1
    return p1
.end method

.method public static U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return p2

    .line 9
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static W(Ljava/util/List;)J
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)J"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/tvd;

    .line 13
    .line 14
    const-string v2, "http://dashif.org/guidelines/last-segment-number"

    .line 15
    .line 16
    iget-object v3, v1, Ll/tvd;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v2, v3}, Ll/i11;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    iget-object p0, v1, Ll/tvd;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    return-wide v0

    .line 31
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-wide/16 v0, -0x1

    .line 35
    .line 36
    return-wide v0
.end method

.method public static X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-wide p2

    .line 9
    :cond_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    return-wide p0
.end method

.method public static Z(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 3

    .line 1
    const-string v0, "value"

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-static {p0, v0, v1}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-ltz p0, :cond_0

    .line 9
    .line 10
    sget-object v0, Ll/i4c;->e:[I

    .line 11
    .line 12
    array-length v2, v0

    .line 13
    if-ge p0, v2, :cond_0

    .line 14
    .line 15
    aget p0, v0, p0

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    return v1
.end method

.method public static p(II)I
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    return p1

    .line 5
    :cond_0
    if-ne p1, v0, :cond_1

    .line 6
    .line 7
    return p0

    .line 8
    :cond_1
    if-ne p0, p1, :cond_2

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_2
    const/4 p1, 0x0

    .line 13
    :goto_0
    invoke-static {p1}, Ll/w11;->g(Z)V

    .line 14
    .line 15
    .line 16
    return p0
.end method

.method public static q(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-object p1

    .line 4
    :cond_0
    if-nez p1, :cond_1

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p1}, Ll/w11;->g(Z)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public static r(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    .line 14
    .line 15
    sget-object v3, Ll/zr3;->c:Ljava/util/UUID;

    .line 16
    .line 17
    iget-object v4, v2, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;->uuid:Ljava/util/UUID;

    .line 18
    .line 19
    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    iget-object v2, v2, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;->licenseServerUrl:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v2, 0x0

    .line 37
    :goto_1
    if-nez v2, :cond_2

    .line 38
    .line 39
    goto :goto_3

    .line 40
    :cond_2
    :goto_2
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-ge v0, v1, :cond_4

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    .line 51
    .line 52
    sget-object v3, Ll/zr3;->b:Ljava/util/UUID;

    .line 53
    .line 54
    iget-object v4, v1, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;->uuid:Ljava/util/UUID;

    .line 55
    .line 56
    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_3

    .line 61
    .line 62
    iget-object v3, v1, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;->licenseServerUrl:Ljava/lang/String;

    .line 63
    .line 64
    if-nez v3, :cond_3

    .line 65
    .line 66
    new-instance v3, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    .line 67
    .line 68
    sget-object v4, Ll/zr3;->c:Ljava/util/UUID;

    .line 69
    .line 70
    iget-object v5, v1, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;->mimeType:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;->data:[B

    .line 73
    .line 74
    invoke-direct {v3, v4, v2, v5, v1}, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;[B)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_4
    :goto_3
    return-void
.end method

.method public static r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object p2

    .line 9
    :cond_0
    return-object p0
.end method

.method public static s(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;->c()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    :goto_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-ge v2, v3, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;->a(Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    :goto_2
    add-int/lit8 v0, v0, -0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    return-void
.end method

.method public static s0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :cond_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x4

    .line 11
    if-ne v1, v2, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-static {p0}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    invoke-static {p0, p1}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    return-object v0
.end method

.method public static t(JJ)J
    .locals 3

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    cmp-long v2, p2, v0

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-wide p0, p2

    .line 12
    :goto_0
    const-wide p2, 0x7fffffffffffffffL

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    cmp-long p2, p0, p2

    .line 18
    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    return-wide v0

    .line 22
    :cond_1
    return-wide p0
.end method

.method public static u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/kb00;->o(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/kb00;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {p0}, Ll/kb00;->s(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {p1}, Ll/kb00;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-static {p0}, Ll/kb00;->r(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    invoke-static {p0}, Ll/kb00;->p(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    :goto_0
    return-object p0

    .line 37
    :cond_3
    const-string v0, "application/mp4"

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    invoke-static {p1}, Ll/kb00;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "text/vtt"

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_4

    .line 56
    .line 57
    const-string p0, "application/x-mp4-vtt"

    .line 58
    .line 59
    :cond_4
    return-object p0

    .line 60
    :cond_5
    const/4 p0, 0x0

    .line 61
    return-object p0
.end method

.method public static w(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/lmq0;->e(Lorg/xmlpull/v1/XmlPullParser;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Ll/lmq0;->e(Lorg/xmlpull/v1/XmlPullParser;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    invoke-static {p0}, Ll/lmq0;->c(Lorg/xmlpull/v1/XmlPullParser;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    add-int/lit8 v0, v0, -0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public A(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "schemeIdUri"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, p0, v0}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, -0x1

    .line 16
    sparse-switch v0, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    :goto_0
    move p0, v1

    .line 20
    goto :goto_1

    .line 21
    :sswitch_0
    const-string v0, "urn:dolby:dash:audio_channel_configuration:2011"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x6

    .line 31
    goto :goto_1

    .line 32
    :sswitch_1
    const-string v0, "tag:dts.com,2018:uhd:audio_channel_configuration"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 p0, 0x5

    .line 42
    goto :goto_1

    .line 43
    :sswitch_2
    const-string v0, "tag:dts.com,2014:dash:audio_channel_configuration:2012"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 p0, 0x4

    .line 53
    goto :goto_1

    .line 54
    :sswitch_3
    const-string v0, "urn:mpeg:mpegB:cicp:ChannelConfiguration"

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const/4 p0, 0x3

    .line 64
    goto :goto_1

    .line 65
    :sswitch_4
    const-string v0, "tag:dolby.com,2014:dash:audio_channel_configuration:2011"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 p0, 0x2

    .line 75
    goto :goto_1

    .line 76
    :sswitch_5
    const-string v0, "urn:mpeg:dash:23003:3:audio_channel_configuration:2011"

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_5

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    const/4 p0, 0x1

    .line 86
    goto :goto_1

    .line 87
    :sswitch_6
    const-string v0, "urn:dts:dash:audio_channel_configuration:2012"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-nez p0, :cond_6

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_6
    const/4 p0, 0x0

    .line 97
    :goto_1
    packed-switch p0, :pswitch_data_0

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :pswitch_0
    invoke-static {p1}, Ll/i4c;->L(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    goto :goto_2

    .line 106
    :pswitch_1
    invoke-static {p1}, Ll/i4c;->Z(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    goto :goto_2

    .line 111
    :pswitch_2
    invoke-static {p1}, Ll/i4c;->J(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    goto :goto_2

    .line 116
    :pswitch_3
    const-string p0, "value"

    .line 117
    .line 118
    invoke-static {p1, p0, v1}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    goto :goto_2

    .line 123
    :pswitch_4
    invoke-static {p1}, Ll/i4c;->K(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    :cond_7
    :goto_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 128
    .line 129
    .line 130
    const-string p0, "AudioChannelConfiguration"

    .line 131
    .line 132
    invoke-static {p1, p0}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_7

    .line 137
    .line 138
    return v1

    .line 139
    :sswitch_data_0
    .sparse-switch
        -0x7ee09c90 -> :sswitch_6
        -0x50a2db6e -> :sswitch_5
        -0x43d6a909 -> :sswitch_4
        -0x3aced4cf -> :sswitch_3
        -0x4b58cf3 -> :sswitch_2
        0x129b7989 -> :sswitch_1
        0x79657164 -> :sswitch_0
    .end sparse-switch

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public B(Lorg/xmlpull/v1/XmlPullParser;J)J
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const-string v0, "availabilityTimeOffset"

    .line 3
    .line 4
    invoke-interface {p1, p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-wide p2

    .line 11
    :cond_0
    const-string p1, "INF"

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const-wide p0, 0x7fffffffffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    return-wide p0

    .line 25
    :cond_1
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    const p1, 0x49742400    # 1000000.0f

    .line 30
    .line 31
    .line 32
    mul-float/2addr p0, p1

    .line 33
    float-to-long p0, p0

    .line 34
    return-wide p0
.end method

.method public C(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;Z)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Ljava/util/List<",
            "Ll/fs2;",
            ">;Z)",
            "Ljava/util/List<",
            "Ll/fs2;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "dvb:priority"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0, p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    if-eqz p3, :cond_1

    .line 17
    .line 18
    move p0, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/high16 p0, -0x80000000

    .line 21
    .line 22
    :goto_0
    const-string v2, "dvb:weight"

    .line 23
    .line 24
    invoke-interface {p1, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    :cond_2
    const-string v2, "serviceLocation"

    .line 35
    .line 36
    invoke-interface {p1, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v2, "BaseURL"

    .line 41
    .line 42
    invoke-static {p1, v2}, Ll/i4c;->s0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Ll/h4k0;->b(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_4

    .line 51
    .line 52
    if-nez v0, :cond_3

    .line 53
    .line 54
    move-object v0, p1

    .line 55
    :cond_3
    new-instance p2, Ll/fs2;

    .line 56
    .line 57
    invoke-direct {p2, p1, v0, p0, v1}, Ll/fs2;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    filled-new-array {p2}, [Ll/fs2;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Lcom/google/common/collect/Lists;->m([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_4
    new-instance v2, Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .line 73
    .line 74
    const/4 v3, 0x0

    .line 75
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-ge v3, v4, :cond_7

    .line 80
    .line 81
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Ll/fs2;

    .line 86
    .line 87
    iget-object v5, v4, Ll/fs2;->a:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v5, p1}, Ll/h4k0;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    if-nez v0, :cond_5

    .line 94
    .line 95
    move-object v6, v5

    .line 96
    goto :goto_2

    .line 97
    :cond_5
    move-object v6, v0

    .line 98
    :goto_2
    if-eqz p3, :cond_6

    .line 99
    .line 100
    iget p0, v4, Ll/fs2;->c:I

    .line 101
    .line 102
    iget v1, v4, Ll/fs2;->d:I

    .line 103
    .line 104
    iget-object v6, v4, Ll/fs2;->b:Ljava/lang/String;

    .line 105
    .line 106
    :cond_6
    new-instance v4, Ll/fs2;

    .line 107
    .line 108
    invoke-direct {v4, v5, v6, p0, v1}, Ll/fs2;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    .line 109
    .line 110
    .line 111
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    add-int/lit8 v3, v3, 0x1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_7
    return-object v2
.end method

.method public F(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/Pair;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "schemeIdUri"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0, p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz p0, :cond_6

    .line 10
    .line 11
    invoke-static {p0}, Ll/i11;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, -0x1

    .line 23
    sparse-switch v2, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :sswitch_0
    const-string v2, "urn:mpeg:dash:mp4protection:2011"

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v3, 0x3

    .line 37
    goto :goto_0

    .line 38
    :sswitch_1
    const-string v2, "urn:uuid:edef8ba9-79d6-4ace-a3c8-27dcd51d21ed"

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v3, 0x2

    .line 48
    goto :goto_0

    .line 49
    :sswitch_2
    const-string v2, "urn:uuid:9a04f079-9840-4286-ab92-e65be0885f95"

    .line 50
    .line 51
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/4 v3, 0x1

    .line 59
    goto :goto_0

    .line 60
    :sswitch_3
    const-string v2, "urn:uuid:e2719d58-a985-b3c9-781a-b030af78d30e"

    .line 61
    .line 62
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_3

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    move v3, v1

    .line 70
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 71
    .line 72
    .line 73
    goto :goto_5

    .line 74
    :pswitch_0
    const-string p0, "value"

    .line 75
    .line 76
    invoke-interface {p1, v0, p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v2, "default_KID"

    .line 81
    .line 82
    invoke-static {p1, v2}, Ll/lmq0;->b(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-nez v3, :cond_5

    .line 91
    .line 92
    const-string v3, "00000000-0000-0000-0000-000000000000"

    .line 93
    .line 94
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    if-nez v3, :cond_5

    .line 99
    .line 100
    const-string v3, "\\s+"

    .line 101
    .line 102
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    array-length v3, v2

    .line 107
    new-array v3, v3, [Ljava/util/UUID;

    .line 108
    .line 109
    move v4, v1

    .line 110
    :goto_1
    array-length v5, v2

    .line 111
    if-ge v4, v5, :cond_4

    .line 112
    .line 113
    aget-object v5, v2, v4

    .line 114
    .line 115
    invoke-static {v5}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    aput-object v5, v3, v4

    .line 120
    .line 121
    add-int/lit8 v4, v4, 0x1

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_4
    sget-object v2, Ll/zr3;->b:Ljava/util/UUID;

    .line 125
    .line 126
    invoke-static {v2, v3, v0}, Ll/t7b0;->b(Ljava/util/UUID;[Ljava/util/UUID;[B)[B

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    move-object v4, v0

    .line 131
    goto :goto_6

    .line 132
    :cond_5
    move-object v2, v0

    .line 133
    :goto_2
    move-object v3, v2

    .line 134
    :goto_3
    move-object v4, v3

    .line 135
    goto :goto_6

    .line 136
    :pswitch_1
    sget-object v2, Ll/zr3;->d:Ljava/util/UUID;

    .line 137
    .line 138
    :goto_4
    move-object p0, v0

    .line 139
    move-object v3, p0

    .line 140
    goto :goto_3

    .line 141
    :pswitch_2
    sget-object v2, Ll/zr3;->e:Ljava/util/UUID;

    .line 142
    .line 143
    goto :goto_4

    .line 144
    :pswitch_3
    sget-object v2, Ll/zr3;->c:Ljava/util/UUID;

    .line 145
    .line 146
    goto :goto_4

    .line 147
    :cond_6
    :goto_5
    move-object p0, v0

    .line 148
    move-object v2, p0

    .line 149
    goto :goto_2

    .line 150
    :cond_7
    :goto_6
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 151
    .line 152
    .line 153
    const-string v5, "clearkey:Laurl"

    .line 154
    .line 155
    invoke-static {p1, v5}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    const/4 v6, 0x4

    .line 160
    if-eqz v5, :cond_8

    .line 161
    .line 162
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 163
    .line 164
    .line 165
    move-result v5

    .line 166
    if-ne v5, v6, :cond_8

    .line 167
    .line 168
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    goto/16 :goto_7

    .line 173
    .line 174
    :cond_8
    const-string v5, "ms:laurl"

    .line 175
    .line 176
    invoke-static {p1, v5}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-eqz v5, :cond_9

    .line 181
    .line 182
    const-string v4, "licenseUrl"

    .line 183
    .line 184
    invoke-interface {p1, v0, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    goto :goto_7

    .line 189
    :cond_9
    if-nez v3, :cond_b

    .line 190
    .line 191
    const-string v5, "pssh"

    .line 192
    .line 193
    invoke-static {p1, v5}, Ll/lmq0;->g(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 194
    .line 195
    .line 196
    move-result v5

    .line 197
    if-eqz v5, :cond_b

    .line 198
    .line 199
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 200
    .line 201
    .line 202
    move-result v5

    .line 203
    if-ne v5, v6, :cond_b

    .line 204
    .line 205
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-static {v2, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-static {v2}, Ll/t7b0;->f([B)Ljava/util/UUID;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    if-nez v3, :cond_a

    .line 218
    .line 219
    const-string v2, "MpdParser"

    .line 220
    .line 221
    const-string v5, "Skipping malformed cenc:pssh data"

    .line 222
    .line 223
    invoke-static {v2, v5}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    move-object v2, v3

    .line 227
    move-object v3, v0

    .line 228
    goto :goto_7

    .line 229
    :cond_a
    move-object v8, v3

    .line 230
    move-object v3, v2

    .line 231
    move-object v2, v8

    .line 232
    goto :goto_7

    .line 233
    :cond_b
    if-nez v3, :cond_c

    .line 234
    .line 235
    sget-object v5, Ll/zr3;->e:Ljava/util/UUID;

    .line 236
    .line 237
    invoke-virtual {v5, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v7

    .line 241
    if-eqz v7, :cond_c

    .line 242
    .line 243
    const-string v7, "mspr:pro"

    .line 244
    .line 245
    invoke-static {p1, v7}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v7

    .line 249
    if-eqz v7, :cond_c

    .line 250
    .line 251
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 252
    .line 253
    .line 254
    move-result v7

    .line 255
    if-ne v7, v6, :cond_c

    .line 256
    .line 257
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v3

    .line 261
    invoke-static {v3, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    invoke-static {v5, v3}, Ll/t7b0;->a(Ljava/util/UUID;[B)[B

    .line 266
    .line 267
    .line 268
    move-result-object v3

    .line 269
    goto :goto_7

    .line 270
    :cond_c
    invoke-static {p1}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 271
    .line 272
    .line 273
    :goto_7
    const-string v5, "ContentProtection"

    .line 274
    .line 275
    invoke-static {p1, v5}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 276
    .line 277
    .line 278
    move-result v5

    .line 279
    if-eqz v5, :cond_7

    .line 280
    .line 281
    if-eqz v2, :cond_d

    .line 282
    .line 283
    new-instance v0, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    .line 284
    .line 285
    const-string p1, "video/mp4"

    .line 286
    .line 287
    invoke-direct {v0, v2, v4, p1, v3}, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;[B)V

    .line 288
    .line 289
    .line 290
    :cond_d
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    return-object p0

    .line 295
    :sswitch_data_0
    .sparse-switch
        -0x7610741f -> :sswitch_3
        0x1d2c5beb -> :sswitch_2
        0x2d06c692 -> :sswitch_1
        0x6c0c9d2a -> :sswitch_0
    .end sparse-switch

    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public G(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const-string v0, "contentType"

    .line 3
    .line 4
    invoke-interface {p1, p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, -0x1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    const-string p1, "audio"

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    const-string p1, "video"

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    const/4 p0, 0x2

    .line 35
    return p0

    .line 36
    :cond_2
    const-string p1, "text"

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    const/4 p0, 0x3

    .line 45
    return p0

    .line 46
    :cond_3
    const-string p1, "image"

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_4

    .line 53
    .line 54
    const/4 p0, 0x4

    .line 55
    return p0

    .line 56
    :cond_4
    return v0
.end method

.method public O(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;JJLjava/io/ByteArrayOutputStream;)Landroid/util/Pair;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JJ",
            "Ljava/io/ByteArrayOutputStream;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Long;",
            "Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const-string v1, "id"

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    invoke-static {v0, v1, v2, v3}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v7

    .line 11
    const-string v1, "duration"

    .line 12
    .line 13
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1, v4, v5}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v9

    .line 22
    const-string v1, "presentationTime"

    .line 23
    .line 24
    invoke-static {v0, v1, v2, v3}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    const-wide/16 v11, 0x3e8

    .line 29
    .line 30
    move-wide/from16 v13, p4

    .line 31
    .line 32
    invoke-static/range {v9 .. v14}, Ll/bmk0;->W0(JJJ)J

    .line 33
    .line 34
    .line 35
    move-result-wide v9

    .line 36
    sub-long v11, v1, p6

    .line 37
    .line 38
    const-wide/32 v13, 0xf4240

    .line 39
    .line 40
    .line 41
    move-wide/from16 v15, p4

    .line 42
    .line 43
    invoke-static/range {v11 .. v16}, Ll/bmk0;->W0(JJJ)J

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    const-string v3, "messageData"

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    invoke-static {v0, v3, v4}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    move-object/from16 v4, p0

    .line 55
    .line 56
    move-object/from16 v5, p8

    .line 57
    .line 58
    invoke-virtual {v4, v0, v5}, Ll/i4c;->P(Lorg/xmlpull/v1/XmlPullParser;Ljava/io/ByteArrayOutputStream;)[B

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    if-nez v3, :cond_0

    .line 67
    .line 68
    :goto_0
    move-object/from16 v5, p2

    .line 69
    .line 70
    move-object/from16 v6, p3

    .line 71
    .line 72
    move-object v11, v0

    .line 73
    goto :goto_1

    .line 74
    :cond_0
    invoke-static {v3}, Ll/bmk0;->r0(Ljava/lang/String;)[B

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    goto :goto_0

    .line 79
    :goto_1
    invoke-virtual/range {v4 .. v11}, Ll/i4c;->d(Ljava/lang/String;Ljava/lang/String;JJ[B)Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    return-object v0
.end method

.method public P(Lorg/xmlpull/v1/XmlPullParser;Ljava/io/ByteArrayOutputStream;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget-object v0, Ll/et4;->c:Ljava/nio/charset/Charset;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {p0, p2, v0}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextToken()I

    .line 18
    .line 19
    .line 20
    :goto_0
    const-string v0, "Event"

    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    packed-switch v0, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    goto/16 :goto_2

    .line 36
    .line 37
    :pswitch_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlSerializer;->docdecl(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto/16 :goto_2

    .line 45
    .line 46
    :pswitch_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlSerializer;->comment(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    goto :goto_2

    .line 54
    :pswitch_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlSerializer;->processingInstruction(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :pswitch_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlSerializer;->ignorableWhitespace(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :pswitch_4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlSerializer;->entityRef(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :pswitch_5
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlSerializer;->cdsect(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    goto :goto_2

    .line 86
    :pswitch_6
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :pswitch_7
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :pswitch_8
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 115
    .line 116
    .line 117
    const/4 v0, 0x0

    .line 118
    :goto_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-ge v0, v1, :cond_0

    .line 123
    .line 124
    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeNamespace(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-interface {p0, v1, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 137
    .line 138
    .line 139
    add-int/lit8 v0, v0, 0x1

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :pswitch_9
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 143
    .line 144
    .line 145
    goto :goto_2

    .line 146
    :pswitch_a
    const/4 v0, 0x0

    .line 147
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 148
    .line 149
    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 150
    .line 151
    .line 152
    :cond_0
    :goto_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextToken()I

    .line 153
    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :cond_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    return-object p0

    .line 165
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public Q(Lorg/xmlpull/v1/XmlPullParser;)Ll/a6f;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "schemeIdUri"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    const-string v0, "value"

    .line 10
    .line 11
    invoke-static {p1, v0, v1}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const-string v0, "timescale"

    .line 16
    .line 17
    const-wide/16 v1, 0x1

    .line 18
    .line 19
    invoke-static {p1, v0, v1, v2}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v5

    .line 23
    const-string v0, "presentationTimeOffset"

    .line 24
    .line 25
    const-wide/16 v1, 0x0

    .line 26
    .line 27
    invoke-static {p1, v0, v1, v2}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 28
    .line 29
    .line 30
    move-result-wide v8

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v10, Ljava/io/ByteArrayOutputStream;

    .line 37
    .line 38
    const/16 v1, 0x200

    .line 39
    .line 40
    invoke-direct {v10, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 44
    .line 45
    .line 46
    const-string v1, "Event"

    .line 47
    .line 48
    invoke-static {p1, v1}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    move-object v2, p0

    .line 55
    move-wide v6, v5

    .line 56
    move-object v5, v4

    .line 57
    move-object v4, v3

    .line 58
    move-object v3, p1

    .line 59
    invoke-virtual/range {v2 .. v10}, Ll/i4c;->O(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;JJLjava/io/ByteArrayOutputStream;)Landroid/util/Pair;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_0
    move-object v2, p0

    .line 68
    move-wide v6, v5

    .line 69
    move-object v5, v4

    .line 70
    move-object v4, v3

    .line 71
    move-object v3, p1

    .line 72
    invoke-static {v3}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 73
    .line 74
    .line 75
    :goto_1
    const-string p0, "EventStream"

    .line 76
    .line 77
    invoke-static {v3, p0}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_2

    .line 82
    .line 83
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    new-array p0, p0, [J

    .line 88
    .line 89
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    new-array v8, p1, [Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;

    .line 94
    .line 95
    const/4 p1, 0x0

    .line 96
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-ge p1, v1, :cond_1

    .line 101
    .line 102
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Landroid/util/Pair;

    .line 107
    .line 108
    iget-object v3, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v3, Ljava/lang/Long;

    .line 111
    .line 112
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 113
    .line 114
    .line 115
    move-result-wide v9

    .line 116
    aput-wide v9, p0, p1

    .line 117
    .line 118
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v1, Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;

    .line 121
    .line 122
    aput-object v1, v8, p1

    .line 123
    .line 124
    add-int/lit8 p1, p1, 0x1

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_1
    move-object v3, v4

    .line 128
    move-object v4, v5

    .line 129
    move-wide v5, v6

    .line 130
    move-object v7, p0

    .line 131
    invoke-virtual/range {v2 .. v8}, Ll/i4c;->e(Ljava/lang/String;Ljava/lang/String;J[J[Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;)Ll/a6f;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    return-object p0

    .line 136
    :cond_2
    move-object p0, v2

    .line 137
    move-object p1, v3

    .line 138
    move-object v3, v4

    .line 139
    move-object v4, v5

    .line 140
    move-wide v5, v6

    .line 141
    goto :goto_0
.end method

.method public T(Lorg/xmlpull/v1/XmlPullParser;)Ll/mkc0;
    .locals 2

    .line 1
    const-string v0, "sourceURL"

    .line 2
    .line 3
    const-string v1, "range"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, v1}, Ll/i4c;->d0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ll/mkc0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public V(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "Label"

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/i4c;->s0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Y(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Ll/h4c;
    .locals 40
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    new-array v3, v2, [Ljava/lang/String;

    .line 7
    .line 8
    const-string v4, "profiles"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v4, v3}, Ll/i4c;->b0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v0, v3}, Ll/i4c;->v([Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v11

    .line 18
    const-string v3, "availabilityStartTime"

    .line 19
    .line 20
    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    invoke-static {v1, v3, v12, v13}, Ll/i4c;->H(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 26
    .line 27
    .line 28
    move-result-wide v7

    .line 29
    const-string v3, "mediaPresentationDuration"

    .line 30
    .line 31
    invoke-static {v1, v3, v12, v13}, Ll/i4c;->M(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 32
    .line 33
    .line 34
    move-result-wide v14

    .line 35
    const-string v3, "minBufferTime"

    .line 36
    .line 37
    invoke-static {v1, v3, v12, v13}, Ll/i4c;->M(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 38
    .line 39
    .line 40
    move-result-wide v16

    .line 41
    const-string v3, "type"

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    invoke-interface {v1, v4, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v5, "dynamic"

    .line 49
    .line 50
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v18

    .line 54
    if-eqz v18, :cond_0

    .line 55
    .line 56
    const-string v3, "minimumUpdatePeriod"

    .line 57
    .line 58
    invoke-static {v1, v3, v12, v13}, Ll/i4c;->M(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    move-wide/from16 v19, v5

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move-wide/from16 v19, v12

    .line 66
    .line 67
    :goto_0
    if-eqz v18, :cond_1

    .line 68
    .line 69
    const-string v3, "timeShiftBufferDepth"

    .line 70
    .line 71
    invoke-static {v1, v3, v12, v13}, Ll/i4c;->M(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 72
    .line 73
    .line 74
    move-result-wide v5

    .line 75
    move-wide v9, v5

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    move-wide v9, v12

    .line 78
    :goto_1
    if-eqz v18, :cond_2

    .line 79
    .line 80
    const-string v3, "suggestedPresentationDelay"

    .line 81
    .line 82
    invoke-static {v1, v3, v12, v13}, Ll/i4c;->M(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 83
    .line 84
    .line 85
    move-result-wide v5

    .line 86
    move-wide/from16 v21, v5

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_2
    move-wide/from16 v21, v12

    .line 90
    .line 91
    :goto_2
    const-string v3, "publishTime"

    .line 92
    .line 93
    invoke-static {v1, v3, v12, v13}, Ll/i4c;->H(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 94
    .line 95
    .line 96
    move-result-wide v23

    .line 97
    const-wide/16 v5, 0x0

    .line 98
    .line 99
    if-eqz v18, :cond_3

    .line 100
    .line 101
    move-wide/from16 v25, v5

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_3
    move-wide/from16 v25, v12

    .line 105
    .line 106
    :goto_3
    new-instance v3, Ll/fs2;

    .line 107
    .line 108
    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    move-wide/from16 v29, v12

    .line 117
    .line 118
    const/4 v12, 0x1

    .line 119
    if-eqz v11, :cond_4

    .line 120
    .line 121
    move v13, v12

    .line 122
    goto :goto_4

    .line 123
    :cond_4
    const/high16 v13, -0x80000000

    .line 124
    .line 125
    :goto_4
    invoke-direct {v3, v2, v4, v13, v12}, Ll/fs2;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    .line 126
    .line 127
    .line 128
    filled-new-array {v3}, [Ll/fs2;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-static {v2}, Lcom/google/common/collect/Lists;->m([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 133
    .line 134
    .line 135
    move-result-object v13

    .line 136
    new-instance v2, Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .line 140
    .line 141
    new-instance v3, Ljava/util/ArrayList;

    .line 142
    .line 143
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .line 145
    .line 146
    if-eqz v18, :cond_5

    .line 147
    .line 148
    move-wide/from16 v5, v29

    .line 149
    .line 150
    :cond_5
    move-object/from16 v31, v13

    .line 151
    .line 152
    move-wide/from16 v12, v25

    .line 153
    .line 154
    const/16 v25, 0x0

    .line 155
    .line 156
    const/16 v27, 0x0

    .line 157
    .line 158
    const/16 v32, 0x0

    .line 159
    .line 160
    const/16 v33, 0x0

    .line 161
    .line 162
    const/16 v34, 0x0

    .line 163
    .line 164
    const/16 v35, 0x0

    .line 165
    .line 166
    :goto_5
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 167
    .line 168
    .line 169
    const-string v4, "BaseURL"

    .line 170
    .line 171
    invoke-static {v1, v4}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    if-eqz v4, :cond_7

    .line 176
    .line 177
    if-nez v27, :cond_6

    .line 178
    .line 179
    invoke-virtual {v0, v1, v12, v13}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    .line 180
    .line 181
    .line 182
    move-result-wide v12

    .line 183
    const/16 v27, 0x1

    .line 184
    .line 185
    :cond_6
    move-object/from16 v4, v31

    .line 186
    .line 187
    move-object/from16 v31, v2

    .line 188
    .line 189
    invoke-virtual {v0, v1, v4, v11}, Ll/i4c;->C(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;Z)Ljava/util/List;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 194
    .line 195
    .line 196
    :goto_6
    move-object/from16 v28, v3

    .line 197
    .line 198
    move-wide v2, v12

    .line 199
    move-wide/from16 v36, v14

    .line 200
    .line 201
    move-object/from16 v12, v31

    .line 202
    .line 203
    move-object/from16 v31, v4

    .line 204
    .line 205
    goto/16 :goto_b

    .line 206
    .line 207
    :cond_7
    move-object/from16 v4, v31

    .line 208
    .line 209
    move-object/from16 v31, v2

    .line 210
    .line 211
    const-string v2, "ProgramInformation"

    .line 212
    .line 213
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    if-eqz v2, :cond_8

    .line 218
    .line 219
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->c0(Lorg/xmlpull/v1/XmlPullParser;)Ll/m4b0;

    .line 220
    .line 221
    .line 222
    move-result-object v32

    .line 223
    goto :goto_6

    .line 224
    :cond_8
    const-string v2, "UTCTiming"

    .line 225
    .line 226
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    if-eqz v2, :cond_9

    .line 231
    .line 232
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->w0(Lorg/xmlpull/v1/XmlPullParser;)Ll/llk0;

    .line 233
    .line 234
    .line 235
    move-result-object v33

    .line 236
    goto :goto_6

    .line 237
    :cond_9
    const-string v2, "Location"

    .line 238
    .line 239
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    if-eqz v2, :cond_a

    .line 244
    .line 245
    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-static {v2, v0}, Ll/h4k0;->e(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    .line 254
    .line 255
    .line 256
    move-result-object v34

    .line 257
    goto :goto_6

    .line 258
    :cond_a
    const-string v0, "ServiceDescription"

    .line 259
    .line 260
    invoke-static {v1, v0}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-eqz v0, :cond_b

    .line 265
    .line 266
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->q0(Lorg/xmlpull/v1/XmlPullParser;)Ll/mre0;

    .line 267
    .line 268
    .line 269
    move-result-object v35

    .line 270
    goto :goto_6

    .line 271
    :cond_b
    const-string v0, "Period"

    .line 272
    .line 273
    invoke-static {v1, v0}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-eqz v0, :cond_10

    .line 278
    .line 279
    if-nez v25, :cond_10

    .line 280
    .line 281
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_c

    .line 286
    .line 287
    move-object v2, v3

    .line 288
    move-object/from16 v28, v2

    .line 289
    .line 290
    move-object/from16 v38, v31

    .line 291
    .line 292
    move-object/from16 v31, v4

    .line 293
    .line 294
    move-wide v3, v5

    .line 295
    move-wide v5, v12

    .line 296
    move-object/from16 v12, v38

    .line 297
    .line 298
    :goto_7
    move-object/from16 v0, p0

    .line 299
    .line 300
    const/4 v13, 0x0

    .line 301
    goto :goto_8

    .line 302
    :cond_c
    move-object/from16 v28, v3

    .line 303
    .line 304
    move-object v2, v4

    .line 305
    move-wide v3, v5

    .line 306
    move-wide v5, v12

    .line 307
    move-object/from16 v12, v31

    .line 308
    .line 309
    move-object/from16 v31, v2

    .line 310
    .line 311
    goto :goto_7

    .line 312
    :goto_8
    invoke-virtual/range {v0 .. v11}, Ll/i4c;->a0(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;JJJJZ)Landroid/util/Pair;

    .line 313
    .line 314
    .line 315
    move-result-object v2

    .line 316
    iget-object v0, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 317
    .line 318
    check-cast v0, Ll/mr60;

    .line 319
    .line 320
    move-wide/from16 v36, v14

    .line 321
    .line 322
    iget-wide v13, v0, Ll/mr60;->b:J

    .line 323
    .line 324
    cmp-long v13, v13, v29

    .line 325
    .line 326
    if-nez v13, :cond_e

    .line 327
    .line 328
    if-eqz v18, :cond_d

    .line 329
    .line 330
    move-wide v13, v3

    .line 331
    const/16 v25, 0x1

    .line 332
    .line 333
    goto :goto_a

    .line 334
    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    .line 335
    .line 336
    const-string v1, "Unable to determine start of period "

    .line 337
    .line 338
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    const/4 v15, 0x0

    .line 353
    invoke-static {v0, v15}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    throw v0

    .line 358
    :cond_e
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 359
    .line 360
    check-cast v2, Ljava/lang/Long;

    .line 361
    .line 362
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 363
    .line 364
    .line 365
    move-result-wide v2

    .line 366
    cmp-long v4, v2, v29

    .line 367
    .line 368
    if-nez v4, :cond_f

    .line 369
    .line 370
    move-wide/from16 v13, v29

    .line 371
    .line 372
    goto :goto_9

    .line 373
    :cond_f
    iget-wide v13, v0, Ll/mr60;->b:J

    .line 374
    .line 375
    add-long/2addr v13, v2

    .line 376
    :goto_9
    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    :goto_a
    move-wide v2, v5

    .line 380
    move-wide v5, v13

    .line 381
    goto :goto_b

    .line 382
    :cond_10
    move-object/from16 v28, v3

    .line 383
    .line 384
    move-wide/from16 v36, v14

    .line 385
    .line 386
    move-object/from16 v38, v31

    .line 387
    .line 388
    move-object/from16 v31, v4

    .line 389
    .line 390
    move-wide v3, v5

    .line 391
    move-wide v5, v12

    .line 392
    move-object/from16 v12, v38

    .line 393
    .line 394
    invoke-static {v1}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 395
    .line 396
    .line 397
    move-wide/from16 v38, v5

    .line 398
    .line 399
    move-wide v5, v3

    .line 400
    move-wide/from16 v2, v38

    .line 401
    .line 402
    :goto_b
    const-string v0, "MPD"

    .line 403
    .line 404
    invoke-static {v1, v0}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    if-eqz v0, :cond_15

    .line 409
    .line 410
    cmp-long v0, v36, v29

    .line 411
    .line 412
    if-nez v0, :cond_12

    .line 413
    .line 414
    cmp-long v0, v5, v29

    .line 415
    .line 416
    if-eqz v0, :cond_11

    .line 417
    .line 418
    move-wide v4, v5

    .line 419
    const/4 v15, 0x0

    .line 420
    goto :goto_d

    .line 421
    :cond_11
    if-eqz v18, :cond_13

    .line 422
    .line 423
    :cond_12
    const/4 v15, 0x0

    .line 424
    goto :goto_c

    .line 425
    :cond_13
    const-string v0, "Unable to determine duration of static manifest."

    .line 426
    .line 427
    const/4 v15, 0x0

    .line 428
    invoke-static {v0, v15}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    throw v0

    .line 433
    :goto_c
    move-wide/from16 v4, v36

    .line 434
    .line 435
    :goto_d
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    .line 436
    .line 437
    .line 438
    move-result v0

    .line 439
    if-nez v0, :cond_14

    .line 440
    .line 441
    move-object/from16 v1, p0

    .line 442
    .line 443
    move-wide v2, v7

    .line 444
    move-wide/from16 v6, v16

    .line 445
    .line 446
    move/from16 v8, v18

    .line 447
    .line 448
    move-wide/from16 v13, v21

    .line 449
    .line 450
    move-wide/from16 v15, v23

    .line 451
    .line 452
    move-object/from16 v17, v32

    .line 453
    .line 454
    move-object/from16 v18, v33

    .line 455
    .line 456
    move-object/from16 v21, v12

    .line 457
    .line 458
    move-wide v11, v9

    .line 459
    move-wide/from16 v9, v19

    .line 460
    .line 461
    move-object/from16 v20, v34

    .line 462
    .line 463
    move-object/from16 v19, v35

    .line 464
    .line 465
    invoke-virtual/range {v1 .. v21}, Ll/i4c;->g(JJJZJJJJLl/m4b0;Ll/llk0;Ll/mre0;Landroid/net/Uri;Ljava/util/List;)Ll/h4c;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    return-object v0

    .line 470
    :cond_14
    move-object v0, v15

    .line 471
    const-string v1, "No periods found."

    .line 472
    .line 473
    invoke-static {v1, v0}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 474
    .line 475
    .line 476
    move-result-object v0

    .line 477
    throw v0

    .line 478
    :cond_15
    move-wide v14, v9

    .line 479
    move-wide/from16 v9, v16

    .line 480
    .line 481
    move/from16 v4, v18

    .line 482
    .line 483
    move-object/from16 v17, v32

    .line 484
    .line 485
    move-object/from16 v18, v33

    .line 486
    .line 487
    const/4 v0, 0x0

    .line 488
    move-object/from16 v16, v12

    .line 489
    .line 490
    move-wide/from16 v12, v19

    .line 491
    .line 492
    move-object/from16 v20, v34

    .line 493
    .line 494
    move-object/from16 v19, v35

    .line 495
    .line 496
    move-object/from16 v0, p0

    .line 497
    .line 498
    move/from16 v18, v4

    .line 499
    .line 500
    move-wide/from16 v19, v12

    .line 501
    .line 502
    move-wide v12, v2

    .line 503
    move-object/from16 v2, v16

    .line 504
    .line 505
    move-object/from16 v3, v28

    .line 506
    .line 507
    move-wide/from16 v16, v9

    .line 508
    .line 509
    move-wide v9, v14

    .line 510
    move-wide/from16 v14, v36

    .line 511
    .line 512
    goto/16 :goto_5
.end method

.method public bridge synthetic a(Landroid/net/Uri;Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i4c;->x(Landroid/net/Uri;Ljava/io/InputStream;)Ll/h4c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public a0(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;JJJJZ)Landroid/util/Pair;
    .locals 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Ljava/util/List<",
            "Ll/fs2;",
            ">;JJJJZ)",
            "Landroid/util/Pair<",
            "Ll/mr60;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "id"

    .line 6
    .line 7
    const/4 v15, 0x0

    .line 8
    invoke-interface {v1, v15, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v16

    .line 12
    const-string v2, "start"

    .line 13
    .line 14
    move-wide/from16 v3, p3

    .line 15
    .line 16
    invoke-static {v1, v2, v3, v4}, Ll/i4c;->M(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v17

    .line 20
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    cmp-long v4, p7, v2

    .line 26
    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    add-long v4, p7, v17

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move-wide v4, v2

    .line 33
    :goto_0
    const-string v6, "duration"

    .line 34
    .line 35
    invoke-static {v1, v6, v2, v3}, Ll/i4c;->M(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 36
    .line 37
    .line 38
    move-result-wide v6

    .line 39
    new-instance v8, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v9, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    new-instance v10, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    const/4 v11, 0x0

    .line 55
    move-wide/from16 v21, v2

    .line 56
    .line 57
    move-object v13, v9

    .line 58
    move/from16 v19, v11

    .line 59
    .line 60
    move-object/from16 v20, v15

    .line 61
    .line 62
    move-wide/from16 v11, p5

    .line 63
    .line 64
    move-object v2, v8

    .line 65
    move-object/from16 v3, v20

    .line 66
    .line 67
    move-wide/from16 v8, v21

    .line 68
    .line 69
    :goto_1
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 70
    .line 71
    .line 72
    const-string v14, "BaseURL"

    .line 73
    .line 74
    invoke-static {v1, v14}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v14

    .line 78
    if-eqz v14, :cond_2

    .line 79
    .line 80
    if-nez v19, :cond_1

    .line 81
    .line 82
    invoke-virtual {v0, v1, v11, v12}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    .line 83
    .line 84
    .line 85
    move-result-wide v11

    .line 86
    const/16 v19, 0x1

    .line 87
    .line 88
    :cond_1
    move-object/from16 v14, p2

    .line 89
    .line 90
    move/from16 v15, p11

    .line 91
    .line 92
    move-object/from16 p3, v2

    .line 93
    .line 94
    invoke-virtual {v0, v1, v14, v15}, Ll/i4c;->C(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;Z)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 99
    .line 100
    .line 101
    move-object/from16 v24, p3

    .line 102
    .line 103
    move-wide/from16 v25, v11

    .line 104
    .line 105
    move-object/from16 p4, v13

    .line 106
    .line 107
    move/from16 v11, v19

    .line 108
    .line 109
    move-wide/from16 v14, v21

    .line 110
    .line 111
    const/16 v23, 0x0

    .line 112
    .line 113
    move-wide v12, v6

    .line 114
    move-object/from16 v21, v10

    .line 115
    .line 116
    move-object/from16 v6, v20

    .line 117
    .line 118
    move-object v7, v1

    .line 119
    move-object v10, v3

    .line 120
    move-wide/from16 v19, v8

    .line 121
    .line 122
    move-wide v8, v4

    .line 123
    goto/16 :goto_8

    .line 124
    .line 125
    :cond_2
    move-object/from16 v14, p2

    .line 126
    .line 127
    move/from16 v15, p11

    .line 128
    .line 129
    move-object/from16 p3, v2

    .line 130
    .line 131
    const-string v2, "AdaptationSet"

    .line 132
    .line 133
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-eqz v2, :cond_4

    .line 138
    .line 139
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-nez v2, :cond_3

    .line 144
    .line 145
    move-object v2, v10

    .line 146
    move-object/from16 v21, v2

    .line 147
    .line 148
    :goto_2
    move-object/from16 v24, v13

    .line 149
    .line 150
    move v14, v15

    .line 151
    move-object/from16 v15, p3

    .line 152
    .line 153
    move-wide/from16 v27, v11

    .line 154
    .line 155
    move-wide/from16 v12, p9

    .line 156
    .line 157
    move-wide v10, v4

    .line 158
    move-wide v4, v6

    .line 159
    move-wide/from16 v6, v27

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_3
    move-object/from16 v21, v10

    .line 163
    .line 164
    move-object v2, v14

    .line 165
    goto :goto_2

    .line 166
    :goto_3
    invoke-virtual/range {v0 .. v14}, Ll/i4c;->y(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;Ll/ske0;JJJJJZ)Ll/y70;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    move-wide/from16 v27, v6

    .line 171
    .line 172
    move-wide v6, v4

    .line 173
    move-wide v4, v10

    .line 174
    move-wide v10, v8

    .line 175
    move-wide/from16 v8, v27

    .line 176
    .line 177
    invoke-interface {v15, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-object/from16 p3, v3

    .line 181
    .line 182
    move-wide v12, v6

    .line 183
    move-object/from16 p4, v24

    .line 184
    .line 185
    const/16 v23, 0x0

    .line 186
    .line 187
    move-object v7, v1

    .line 188
    move-wide v0, v8

    .line 189
    move-object/from16 v24, v15

    .line 190
    .line 191
    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    :goto_4
    move-wide v8, v4

    .line 197
    goto/16 :goto_7

    .line 198
    .line 199
    :cond_4
    move-object/from16 v15, p3

    .line 200
    .line 201
    move-object/from16 v21, v10

    .line 202
    .line 203
    move-object/from16 v24, v13

    .line 204
    .line 205
    move-wide/from16 v27, v11

    .line 206
    .line 207
    move-wide v10, v8

    .line 208
    move-wide/from16 v8, v27

    .line 209
    .line 210
    const-string v2, "EventStream"

    .line 211
    .line 212
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    if-eqz v2, :cond_5

    .line 217
    .line 218
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->Q(Lorg/xmlpull/v1/XmlPullParser;)Ll/a6f;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    move-object/from16 v14, v24

    .line 223
    .line 224
    invoke-interface {v14, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-object/from16 p3, v3

    .line 228
    .line 229
    move-wide v12, v6

    .line 230
    move-object/from16 p4, v14

    .line 231
    .line 232
    move-object/from16 v24, v15

    .line 233
    .line 234
    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    const/16 v23, 0x0

    .line 240
    .line 241
    move-object v7, v1

    .line 242
    move-wide v0, v8

    .line 243
    goto :goto_4

    .line 244
    :cond_5
    move-object/from16 v14, v24

    .line 245
    .line 246
    const-string v2, "SegmentBase"

    .line 247
    .line 248
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    if-eqz v2, :cond_6

    .line 253
    .line 254
    const/4 v13, 0x0

    .line 255
    invoke-virtual {v0, v1, v13}, Ll/i4c;->j0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$e;)Ll/ske0$e;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    move-wide/from16 v25, v8

    .line 260
    .line 261
    move-object/from16 v23, v13

    .line 262
    .line 263
    move-object/from16 p4, v14

    .line 264
    .line 265
    move-object/from16 v24, v15

    .line 266
    .line 267
    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    move-wide v8, v4

    .line 273
    move-wide v12, v6

    .line 274
    move-object/from16 v6, v20

    .line 275
    .line 276
    move-object v7, v1

    .line 277
    :goto_5
    move-wide/from16 v27, v10

    .line 278
    .line 279
    move-object v10, v3

    .line 280
    :goto_6
    move/from16 v11, v19

    .line 281
    .line 282
    move-wide/from16 v19, v27

    .line 283
    .line 284
    goto/16 :goto_8

    .line 285
    .line 286
    :cond_6
    const/4 v13, 0x0

    .line 287
    const-string v2, "SegmentList"

    .line 288
    .line 289
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 290
    .line 291
    .line 292
    move-result v2

    .line 293
    if-eqz v2, :cond_7

    .line 294
    .line 295
    move-wide/from16 v22, v4

    .line 296
    .line 297
    move-wide v5, v6

    .line 298
    move-wide v7, v8

    .line 299
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, v1, v2, v3}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    .line 305
    .line 306
    .line 307
    move-result-wide v9

    .line 308
    move-wide/from16 v25, v2

    .line 309
    .line 310
    const/4 v2, 0x0

    .line 311
    move-wide/from16 v11, p9

    .line 312
    .line 313
    move-object/from16 p4, v14

    .line 314
    .line 315
    move-object/from16 v24, v15

    .line 316
    .line 317
    move-wide/from16 v3, v22

    .line 318
    .line 319
    move-wide/from16 v14, v25

    .line 320
    .line 321
    invoke-virtual/range {v0 .. v12}, Ll/i4c;->k0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$b;JJJJJ)Ll/ske0$b;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    move-wide v10, v9

    .line 326
    move-wide v8, v7

    .line 327
    move-wide v6, v5

    .line 328
    move-wide v4, v3

    .line 329
    move-wide/from16 v25, v8

    .line 330
    .line 331
    move-object/from16 v23, v13

    .line 332
    .line 333
    move-wide v8, v4

    .line 334
    move-wide v12, v6

    .line 335
    move-object/from16 v6, v20

    .line 336
    .line 337
    move-object v7, v1

    .line 338
    move-wide/from16 v27, v10

    .line 339
    .line 340
    move-object v10, v2

    .line 341
    goto :goto_6

    .line 342
    :cond_7
    move-object/from16 p3, v3

    .line 343
    .line 344
    move-object/from16 p4, v14

    .line 345
    .line 346
    move-object/from16 v24, v15

    .line 347
    .line 348
    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    const-string v2, "SegmentTemplate"

    .line 354
    .line 355
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 356
    .line 357
    .line 358
    move-result v2

    .line 359
    if-eqz v2, :cond_8

    .line 360
    .line 361
    invoke-virtual {v0, v1, v14, v15}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    .line 362
    .line 363
    .line 364
    move-result-wide v10

    .line 365
    const/4 v2, 0x0

    .line 366
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 367
    .line 368
    .line 369
    move-result-object v3

    .line 370
    move-object/from16 v23, v13

    .line 371
    .line 372
    move-wide/from16 v12, p9

    .line 373
    .line 374
    invoke-virtual/range {v0 .. v13}, Ll/i4c;->l0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$c;Ljava/util/List;JJJJJ)Ll/ske0$c;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    move-wide v12, v6

    .line 379
    move-object v7, v1

    .line 380
    move-wide v0, v8

    .line 381
    move-wide v8, v4

    .line 382
    move-wide/from16 v25, v0

    .line 383
    .line 384
    move-object/from16 v6, v20

    .line 385
    .line 386
    goto :goto_5

    .line 387
    :cond_8
    move-object/from16 v23, v13

    .line 388
    .line 389
    move-wide v12, v6

    .line 390
    move-object v7, v1

    .line 391
    move-wide v0, v8

    .line 392
    move-wide v8, v4

    .line 393
    const-string v2, "AssetIdentifier"

    .line 394
    .line 395
    invoke-static {v7, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    if-eqz v3, :cond_9

    .line 400
    .line 401
    invoke-static {v7, v2}, Ll/i4c;->I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;

    .line 402
    .line 403
    .line 404
    move-result-object v20

    .line 405
    :goto_7
    move-wide/from16 v25, v0

    .line 406
    .line 407
    move-object/from16 v6, v20

    .line 408
    .line 409
    move-wide/from16 v27, v10

    .line 410
    .line 411
    move-object/from16 v10, p3

    .line 412
    .line 413
    goto/16 :goto_6

    .line 414
    .line 415
    :cond_9
    invoke-static {v7}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 416
    .line 417
    .line 418
    goto :goto_7

    .line 419
    :goto_8
    const-string v0, "Period"

    .line 420
    .line 421
    invoke-static {v7, v0}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 422
    .line 423
    .line 424
    move-result v0

    .line 425
    if-eqz v0, :cond_a

    .line 426
    .line 427
    move-object/from16 v0, p0

    .line 428
    .line 429
    move-object/from16 v5, p4

    .line 430
    .line 431
    move-object/from16 v1, v16

    .line 432
    .line 433
    move-wide/from16 v2, v17

    .line 434
    .line 435
    move-object/from16 v4, v24

    .line 436
    .line 437
    invoke-virtual/range {v0 .. v6}, Ll/i4c;->h(Ljava/lang/String;JLjava/util/List;Ljava/util/List;Ll/tvd;)Ll/mr60;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    return-object v0

    .line 450
    :cond_a
    move-object/from16 v0, p0

    .line 451
    .line 452
    move-object v1, v7

    .line 453
    move-wide v4, v8

    .line 454
    move-object v3, v10

    .line 455
    move-wide/from16 v8, v19

    .line 456
    .line 457
    move-object/from16 v10, v21

    .line 458
    .line 459
    move-object/from16 v2, v24

    .line 460
    .line 461
    move-object/from16 v20, v6

    .line 462
    .line 463
    move/from16 v19, v11

    .line 464
    .line 465
    move-wide v6, v12

    .line 466
    move-wide/from16 v21, v14

    .line 467
    .line 468
    move-object/from16 v15, v23

    .line 469
    .line 470
    move-wide/from16 v11, v25

    .line 471
    .line 472
    move-object/from16 v13, p4

    .line 473
    .line 474
    goto/16 :goto_1
.end method

.method public final b(Ljava/util/List;JJIJ)J
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ske0$d;",
            ">;JJIJ)J"
        }
    .end annotation

    .line 1
    if-ltz p6, :cond_0

    .line 2
    .line 3
    add-int/lit8 p6, p6, 0x1

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sub-long/2addr p7, p2

    .line 7
    invoke-static {p7, p8, p4, p5}, Ll/bmk0;->m(JJ)J

    .line 8
    .line 9
    .line 10
    move-result-wide p6

    .line 11
    long-to-int p6, p6

    .line 12
    :goto_0
    const/4 p7, 0x0

    .line 13
    :goto_1
    if-ge p7, p6, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p2, p3, p4, p5}, Ll/i4c;->m(JJ)Ll/ske0$d;

    .line 16
    .line 17
    .line 18
    move-result-object p8

    .line 19
    invoke-interface {p1, p8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    add-long/2addr p2, p4

    .line 23
    add-int/lit8 p7, p7, 0x1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    return-wide p2
.end method

.method public b0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-interface {p1, p0, p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object p3

    .line 9
    :cond_0
    const-string p1, ","

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public c(JILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ll/y70;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Ljava/util/List<",
            "Ll/t1d0;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)",
            "Ll/y70;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/y70;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p7}, Ll/y70;-><init>(JILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c0(Lorg/xmlpull/v1/XmlPullParser;)Ll/m4b0;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 1
    const-string p0, "moreInformationURL"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, p0, v0}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v5

    .line 8
    const-string p0, "lang"

    .line 9
    .line 10
    invoke-static {p1, p0, v0}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v6

    .line 14
    move-object p0, v0

    .line 15
    move-object v1, p0

    .line 16
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 17
    .line 18
    .line 19
    const-string v2, "Title"

    .line 20
    .line 21
    invoke-static {p1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :goto_1
    move-object v3, p0

    .line 32
    move-object v2, v0

    .line 33
    move-object v4, v1

    .line 34
    goto :goto_2

    .line 35
    :cond_0
    const-string v2, "Source"

    .line 36
    .line 37
    invoke-static {p1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const-string v2, "Copyright"

    .line 49
    .line 50
    invoke-static {p1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    invoke-static {p1}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :goto_2
    const-string p0, "ProgramInformation"

    .line 66
    .line 67
    invoke-static {p1, p0}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_3

    .line 72
    .line 73
    new-instance v1, Ll/m4b0;

    .line 74
    .line 75
    invoke-direct/range {v1 .. v6}, Ll/m4b0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-object v1

    .line 79
    :cond_3
    move-object v0, v2

    .line 80
    move-object p0, v3

    .line 81
    move-object v1, v4

    .line 82
    goto :goto_0
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;JJ[B)Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;
    .locals 2

    .line 1
    new-instance p0, Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;

    .line 2
    .line 3
    move-wide v0, p5

    .line 4
    move-wide p5, p3

    .line 5
    move-wide p3, v0

    .line 6
    invoke-direct/range {p0 .. p7}, Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;-><init>(Ljava/lang/String;Ljava/lang/String;JJ[B)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public d0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ll/mkc0;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0, p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v2

    .line 6
    invoke-interface {p1, v0, p3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-wide/16 p2, -0x1

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    const-string v0, "-"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v0, 0x0

    .line 21
    aget-object v0, p1, v0

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    array-length v3, p1

    .line 28
    const/4 v4, 0x2

    .line 29
    if-ne v3, v4, :cond_0

    .line 30
    .line 31
    const/4 p2, 0x1

    .line 32
    aget-object p1, p1, p2

    .line 33
    .line 34
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 35
    .line 36
    .line 37
    move-result-wide p1

    .line 38
    sub-long/2addr p1, v0

    .line 39
    const-wide/16 v3, 0x1

    .line 40
    .line 41
    add-long p2, p1, v3

    .line 42
    .line 43
    :cond_0
    :goto_0
    move-wide v5, p2

    .line 44
    move-wide v3, v0

    .line 45
    move-object v1, p0

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const-wide/16 v0, 0x0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :goto_1
    invoke-virtual/range {v1 .. v6}, Ll/i4c;->i(Ljava/lang/String;JJ)Ll/mkc0;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;J[J[Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;)Ll/a6f;
    .locals 0

    .line 1
    new-instance p0, Ll/a6f;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p6}, Ll/a6f;-><init>(Ljava/lang/String;Ljava/lang/String;J[J[Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public e0(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;IIFIILjava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ll/ske0;JJJJJZ)Ll/i4c$a;
    .locals 32
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p15    # Ll/ske0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Ljava/util/List<",
            "Ll/fs2;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIFII",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ll/ske0;",
            "JJJJJZ)",
            "Ll/i4c$a;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    const-string v2, "id"

    const/4 v3, 0x0

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 2
    const-string v2, "bandwidth"

    const/4 v4, -0x1

    invoke-static {v1, v2, v4}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v15

    .line 3
    const-string v2, "mimeType"

    move-object/from16 v4, p3

    invoke-static {v1, v2, v4}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 4
    const-string v2, "codecs"

    move-object/from16 v4, p4

    invoke-static {v1, v2, v4}, Ll/i4c;->r0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 5
    const-string v2, "width"

    move/from16 v4, p5

    invoke-static {v1, v2, v4}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v18

    .line 6
    const-string v2, "height"

    move/from16 v4, p6

    invoke-static {v1, v2, v4}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v19

    move/from16 v2, p7

    .line 7
    invoke-static {v1, v2}, Ll/i4c;->S(Lorg/xmlpull/v1/XmlPullParser;F)F

    move-result v20

    .line 8
    const-string v2, "audioSamplingRate"

    move/from16 v4, p9

    invoke-static {v1, v2, v4}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v21

    .line 9
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 10
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 11
    new-instance v4, Ljava/util/ArrayList;

    move-object/from16 v5, p13

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v22, v14

    .line 12
    new-instance v14, Ljava/util/ArrayList;

    move-object/from16 v5, p14

    invoke-direct {v14, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 13
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x0

    move/from16 v23, p8

    move-wide/from16 v9, p22

    move-object/from16 v24, v3

    move/from16 v25, v7

    move-object/from16 v3, p15

    move-wide/from16 v7, p20

    .line 14
    :goto_0
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 15
    const-string v11, "BaseURL"

    invoke-static {v1, v11}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    if-nez v25, :cond_0

    .line 16
    invoke-virtual {v0, v1, v7, v8}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v7

    const/16 v25, 0x1

    :cond_0
    move-object/from16 v11, p2

    move/from16 v12, p26

    move-object/from16 p6, v2

    .line 17
    invoke-virtual {v0, v1, v11, v12}, Ll/i4c;->C(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    move-object v0, v1

    move-object/from16 v27, v6

    move-wide/from16 v28, v9

    move-object v2, v14

    move/from16 v26, v15

    move/from16 v6, v23

    move-object/from16 v30, v24

    move/from16 v31, v25

    move-object/from16 v15, p6

    move-object/from16 v23, v3

    move-wide/from16 v24, v7

    :goto_1
    move-object v14, v13

    move-object v13, v4

    goto/16 :goto_6

    :cond_1
    move-object/from16 v11, p2

    move/from16 v12, p26

    move-object/from16 p6, v2

    .line 18
    const-string v2, "AudioChannelConfiguration"

    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 19
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->A(Lorg/xmlpull/v1/XmlPullParser;)I

    move-result v2

    move-object v0, v1

    move-object/from16 v23, v3

    move-object/from16 v27, v6

    move-wide/from16 v28, v9

    move/from16 v26, v15

    move-object/from16 v30, v24

    move/from16 v31, v25

    move-object/from16 v15, p6

    move v6, v2

    :goto_2
    move-wide/from16 v24, v7

    move-object v2, v14

    goto :goto_1

    .line 20
    :cond_2
    const-string v2, "SegmentBase"

    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 21
    check-cast v3, Ll/ske0$e;

    invoke-virtual {v0, v1, v3}, Ll/i4c;->j0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$e;)Ll/ske0$e;

    move-result-object v2

    move-object v0, v1

    move-object/from16 v27, v6

    move-wide/from16 v28, v9

    move/from16 v26, v15

    move/from16 v6, v23

    move-object/from16 v30, v24

    move/from16 v31, v25

    move-object/from16 v15, p6

    move-object/from16 v23, v2

    goto :goto_2

    .line 22
    :cond_3
    const-string v2, "SegmentList"

    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 23
    invoke-virtual {v0, v1, v9, v10}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v9

    .line 24
    move-object v2, v3

    check-cast v2, Ll/ske0$b;

    move-wide/from16 v11, p24

    move-object/from16 v27, v6

    move-object/from16 p3, v14

    move/from16 v26, v15

    move-object/from16 v15, p6

    move-wide/from16 v5, p18

    move-object v14, v4

    move-wide/from16 v3, p16

    .line 25
    invoke-virtual/range {v0 .. v12}, Ll/i4c;->k0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$b;JJJJJ)Ll/ske0$b;

    move-result-object v2

    move-object v0, v14

    move-object v14, v13

    move-object v13, v0

    move-object v0, v1

    move-wide/from16 v28, v9

    :goto_3
    move/from16 v6, v23

    move-object/from16 v30, v24

    move/from16 v31, v25

    move-object/from16 v23, v2

    move-wide/from16 v24, v7

    move-object/from16 v2, p3

    goto/16 :goto_6

    :cond_4
    move-object/from16 v27, v6

    move-object/from16 p3, v14

    move/from16 v26, v15

    move-object/from16 v15, p6

    move-object v14, v4

    .line 26
    const-string v2, "SegmentTemplate"

    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 27
    invoke-virtual {v0, v1, v9, v10}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v10

    .line 28
    move-object v2, v3

    check-cast v2, Ll/ske0$c;

    move-object/from16 v3, p14

    move-wide/from16 v4, p16

    move-wide v8, v7

    move-object/from16 p7, v14

    move-wide/from16 v6, p18

    move-object v14, v13

    move-wide/from16 v12, p24

    .line 29
    invoke-virtual/range {v0 .. v13}, Ll/i4c;->l0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$c;Ljava/util/List;JJJJJ)Ll/ske0$c;

    move-result-object v2

    move-object v0, v1

    move-wide v7, v8

    move-object/from16 v13, p7

    move-wide/from16 v28, v10

    goto :goto_3

    :cond_5
    move-object v0, v1

    move-object/from16 p7, v14

    move-object v14, v13

    .line 30
    const-string v1, "ContentProtection"

    invoke-static {v0, v1}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 31
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->F(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/Pair;

    move-result-object v1

    .line 32
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-eqz v2, :cond_6

    .line 33
    move-object/from16 v24, v2

    check-cast v24, Ljava/lang/String;

    .line 34
    :cond_6
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-eqz v1, :cond_7

    .line 35
    check-cast v1, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    invoke-virtual {v14, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    :goto_4
    move-object/from16 v2, p3

    move-object/from16 v13, p7

    :goto_5
    move-wide/from16 v28, v9

    move/from16 v6, v23

    move-object/from16 v30, v24

    move/from16 v31, v25

    move-object/from16 v23, v3

    move-wide/from16 v24, v7

    goto :goto_6

    .line 36
    :cond_8
    const-string v1, "InbandEventStream"

    invoke-static {v0, v1}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 37
    invoke-static {v0, v1}, Ll/i4c;->I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;

    move-result-object v1

    invoke-virtual {v15, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 38
    :cond_9
    const-string v1, "EssentialProperty"

    invoke-static {v0, v1}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 39
    invoke-static {v0, v1}, Ll/i4c;->I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;

    move-result-object v1

    move-object/from16 v13, p7

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v2, p3

    goto :goto_5

    :cond_a
    move-object/from16 v13, p7

    .line 40
    const-string v1, "SupplementalProperty"

    invoke-static {v0, v1}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 41
    invoke-static {v0, v1}, Ll/i4c;->I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;

    move-result-object v1

    move-object/from16 v2, p3

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_b
    move-object/from16 v2, p3

    .line 42
    invoke-static {v0}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_5

    .line 43
    :goto_6
    const-string v1, "Representation"

    invoke-static {v0, v1}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    move-object v0, v14

    move-object v14, v2

    move-object/from16 v2, v16

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v9, p10

    move-object/from16 v10, p11

    move-object/from16 v11, p12

    move-object/from16 v12, v17

    move/from16 v3, v18

    move/from16 v4, v19

    move/from16 v5, v20

    move/from16 v7, v21

    move-object/from16 v1, v22

    move/from16 v8, v26

    .line 44
    invoke-virtual/range {v0 .. v14}, Ll/i4c;->f(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer2/k;

    move-result-object v0

    if-eqz v23, :cond_c

    goto :goto_7

    .line 45
    :cond_c
    new-instance v23, Ll/ske0$e;

    invoke-direct/range {v23 .. v23}, Ll/ske0$e;-><init>()V

    .line 46
    :goto_7
    new-instance v1, Ll/i4c$a;

    .line 47
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_d

    goto :goto_8

    :cond_d
    move-object/from16 v27, p2

    :goto_8
    const-wide/16 v2, -0x1

    move-object/from16 p1, v0

    move-object/from16 p0, v1

    move-wide/from16 p9, v2

    move-object/from16 p7, v13

    move-object/from16 p8, v14

    move-object/from16 p6, v15

    move-object/from16 p5, v16

    move-object/from16 p3, v23

    move-object/from16 p2, v27

    move-object/from16 p4, v30

    invoke-direct/range {p0 .. p10}, Ll/i4c$a;-><init>(Lcom/google/android/exoplayer2/k;Ljava/util/List;Ll/ske0;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;J)V

    move-object/from16 v0, p0

    return-object v0

    :cond_e
    move-object v1, v2

    move-object/from16 v0, v30

    move-object/from16 v5, p14

    move-object v4, v13

    move-object v13, v14

    move-object v2, v15

    move-object/from16 v3, v23

    move-wide/from16 v7, v24

    move/from16 v15, v26

    move-wide/from16 v9, v28

    move/from16 v25, v31

    move-object/from16 v24, v0

    move-object v14, v1

    move/from16 v23, v6

    move-object/from16 v6, v27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    goto/16 :goto_0
.end method

.method public f(Ljava/lang/String;Ljava/lang/String;IIFIIILjava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer2/k;
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIFIII",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)",
            "Lcom/google/android/exoplayer2/k;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p10

    .line 2
    .line 3
    move-object/from16 v1, p13

    .line 4
    .line 5
    move-object/from16 v2, p12

    .line 6
    .line 7
    invoke-static {p2, v2}, Ll/i4c;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v4, "audio/eac3"

    .line 12
    .line 13
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    invoke-static/range {p14 .. p14}, Ll/i4c;->N(Ljava/util/List;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string v4, "audio/eac3-joc"

    .line 24
    .line 25
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_0

    .line 30
    .line 31
    const-string v2, "ec+3"

    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0, v0}, Ll/i4c;->p0(Ljava/util/List;)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    invoke-virtual {p0, v0}, Ll/i4c;->i0(Ljava/util/List;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    move-object/from16 v5, p11

    .line 42
    .line 43
    invoke-virtual {p0, v5}, Ll/i4c;->f0(Ljava/util/List;)I

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    or-int/2addr v0, v6

    .line 48
    invoke-virtual {p0, v1}, Ll/i4c;->h0(Ljava/util/List;)I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    or-int/2addr v0, v6

    .line 53
    move-object/from16 v6, p14

    .line 54
    .line 55
    invoke-virtual {p0, v6}, Ll/i4c;->h0(Ljava/util/List;)I

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    or-int/2addr v0, v6

    .line 60
    invoke-virtual {p0, v1}, Ll/i4c;->t0(Ljava/util/List;)Landroid/util/Pair;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance v1, Lcom/google/android/exoplayer2/k$b;

    .line 65
    .line 66
    invoke-direct {v1}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/k$b;->M(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1, p8}, Lcom/google/android/exoplayer2/k$b;->b0(I)Lcom/google/android/exoplayer2/k$b;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1, v4}, Lcom/google/android/exoplayer2/k$b;->i0(I)Lcom/google/android/exoplayer2/k$b;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/k$b;->e0(I)Lcom/google/android/exoplayer2/k$b;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    move-object/from16 p2, p9

    .line 98
    .line 99
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const/4 p2, -0x1

    .line 104
    if-eqz p0, :cond_1

    .line 105
    .line 106
    iget-object v0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast v0, Ljava/lang/Integer;

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    goto :goto_0

    .line 115
    :cond_1
    move v0, p2

    .line 116
    :goto_0
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/k$b;->l0(I)Lcom/google/android/exoplayer2/k$b;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    if-eqz p0, :cond_2

    .line 121
    .line 122
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast p0, Ljava/lang/Integer;

    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    goto :goto_1

    .line 131
    :cond_2
    move p0, p2

    .line 132
    :goto_1
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/k$b;->m0(I)Lcom/google/android/exoplayer2/k$b;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {v3}, Ll/kb00;->s(Ljava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-eqz p1, :cond_3

    .line 141
    .line 142
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1, p4}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p1, p5}, Lcom/google/android/exoplayer2/k$b;->R(F)Lcom/google/android/exoplayer2/k$b;

    .line 151
    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_3
    invoke-static {v3}, Ll/kb00;->o(Ljava/lang/String;)Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_4

    .line 159
    .line 160
    invoke-virtual {p0, p6}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p1, p7}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 165
    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_4
    invoke-static {v3}, Ll/kb00;->r(Ljava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-eqz p1, :cond_7

    .line 173
    .line 174
    const-string p1, "application/cea-608"

    .line 175
    .line 176
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_5

    .line 181
    .line 182
    invoke-static {v5}, Ll/i4c;->D(Ljava/util/List;)I

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    goto :goto_2

    .line 187
    :cond_5
    const-string p1, "application/cea-708"

    .line 188
    .line 189
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_6

    .line 194
    .line 195
    invoke-static {v5}, Ll/i4c;->E(Ljava/util/List;)I

    .line 196
    .line 197
    .line 198
    move-result p2

    .line 199
    :cond_6
    :goto_2
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/k$b;->H(I)Lcom/google/android/exoplayer2/k$b;

    .line 200
    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_7
    invoke-static {v3}, Ll/kb00;->p(Ljava/lang/String;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-eqz p1, :cond_8

    .line 208
    .line 209
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {p1, p4}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 214
    .line 215
    .line 216
    :cond_8
    :goto_3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    return-object p0
.end method

.method public f0(Ljava/util/List;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v0, v2, :cond_2

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ll/tvd;

    .line 14
    .line 15
    const-string v3, "urn:mpeg:dash:role:2011"

    .line 16
    .line 17
    iget-object v4, v2, Ll/tvd;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v3, v4}, Ll/i11;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    iget-object v2, v2, Ll/tvd;->b:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Ll/i4c;->g0(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    :goto_1
    or-int/2addr v1, v2

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    const-string v3, "urn:tva:metadata:cs:AudioPurposeCS:2007"

    .line 34
    .line 35
    iget-object v4, v2, Ll/tvd;->a:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v3, v4}, Ll/i11;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    iget-object v2, v2, Ll/tvd;->b:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, v2}, Ll/i4c;->u0(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    return v1
.end method

.method public g(JJJZJJJJLl/m4b0;Ll/llk0;Ll/mre0;Landroid/net/Uri;Ljava/util/List;)Ll/h4c;
    .locals 21
    .param p16    # Ll/m4b0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p17    # Ll/llk0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p18    # Ll/mre0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p19    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJJZJJJJ",
            "Ll/m4b0;",
            "Ll/llk0;",
            "Ll/mre0;",
            "Landroid/net/Uri;",
            "Ljava/util/List<",
            "Ll/mr60;",
            ">;)",
            "Ll/h4c;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h4c;

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v3, p3

    .line 6
    .line 7
    move-wide/from16 v5, p5

    .line 8
    .line 9
    move/from16 v7, p7

    .line 10
    .line 11
    move-wide/from16 v8, p8

    .line 12
    .line 13
    move-wide/from16 v10, p10

    .line 14
    .line 15
    move-wide/from16 v12, p12

    .line 16
    .line 17
    move-wide/from16 v14, p14

    .line 18
    .line 19
    move-object/from16 v16, p16

    .line 20
    .line 21
    move-object/from16 v17, p17

    .line 22
    .line 23
    move-object/from16 v18, p18

    .line 24
    .line 25
    move-object/from16 v19, p19

    .line 26
    .line 27
    move-object/from16 v20, p20

    .line 28
    .line 29
    invoke-direct/range {v0 .. v20}, Ll/h4c;-><init>(JJJZJJJJLl/m4b0;Ll/llk0;Ll/mre0;Landroid/net/Uri;Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public g0(Ljava/lang/String;)I
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    const/4 v2, 0x4

    .line 12
    const/4 v3, 0x2

    .line 13
    const/4 v4, 0x1

    .line 14
    const/4 v5, -0x1

    .line 15
    sparse-switch v0, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :sswitch_0
    const-string v0, "supplementary"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :cond_1
    const/16 v5, 0xc

    .line 31
    .line 32
    goto/16 :goto_0

    .line 33
    .line 34
    :sswitch_1
    const-string v0, "emergency"

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :cond_2
    const/16 v5, 0xb

    .line 45
    .line 46
    goto/16 :goto_0

    .line 47
    .line 48
    :sswitch_2
    const-string v0, "commentary"

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-nez p1, :cond_3

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :cond_3
    const/16 v5, 0xa

    .line 59
    .line 60
    goto/16 :goto_0

    .line 61
    .line 62
    :sswitch_3
    const-string v0, "caption"

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_4

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :cond_4
    const/16 v5, 0x9

    .line 73
    .line 74
    goto/16 :goto_0

    .line 75
    .line 76
    :sswitch_4
    const-string v0, "sign"

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_5

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :cond_5
    move v5, v1

    .line 87
    goto/16 :goto_0

    .line 88
    .line 89
    :sswitch_5
    const-string v0, "main"

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-nez p1, :cond_6

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    const/4 v5, 0x7

    .line 99
    goto :goto_0

    .line 100
    :sswitch_6
    const-string v0, "dub"

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_7

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    const/4 v5, 0x6

    .line 110
    goto :goto_0

    .line 111
    :sswitch_7
    const-string v0, "forced-subtitle"

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_8

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_8
    const/4 v5, 0x5

    .line 121
    goto :goto_0

    .line 122
    :sswitch_8
    const-string v0, "alternate"

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-nez p1, :cond_9

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    move v5, v2

    .line 132
    goto :goto_0

    .line 133
    :sswitch_9
    const-string v0, "forced_subtitle"

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-nez p1, :cond_a

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_a
    const/4 v5, 0x3

    .line 143
    goto :goto_0

    .line 144
    :sswitch_a
    const-string v0, "enhanced-audio-intelligibility"

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-nez p1, :cond_b

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_b
    move v5, v3

    .line 154
    goto :goto_0

    .line 155
    :sswitch_b
    const-string v0, "description"

    .line 156
    .line 157
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-nez p1, :cond_c

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_c
    move v5, v4

    .line 165
    goto :goto_0

    .line 166
    :sswitch_c
    const-string v0, "subtitle"

    .line 167
    .line 168
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-nez p1, :cond_d

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_d
    move v5, p0

    .line 176
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 177
    .line 178
    .line 179
    return p0

    .line 180
    :pswitch_0
    return v2

    .line 181
    :pswitch_1
    const/16 p0, 0x20

    .line 182
    .line 183
    return p0

    .line 184
    :pswitch_2
    return v1

    .line 185
    :pswitch_3
    const/16 p0, 0x40

    .line 186
    .line 187
    return p0

    .line 188
    :pswitch_4
    const/16 p0, 0x100

    .line 189
    .line 190
    return p0

    .line 191
    :pswitch_5
    return v4

    .line 192
    :pswitch_6
    const/16 p0, 0x10

    .line 193
    .line 194
    return p0

    .line 195
    :pswitch_7
    return v3

    .line 196
    :pswitch_8
    const/16 p0, 0x800

    .line 197
    .line 198
    return p0

    .line 199
    :pswitch_9
    const/16 p0, 0x200

    .line 200
    .line 201
    return p0

    .line 202
    :pswitch_a
    const/16 p0, 0x80

    .line 203
    .line 204
    return p0

    .line 205
    :sswitch_data_0
    .sparse-switch
        -0x7ad0b3e8 -> :sswitch_c
        -0x66ca7c04 -> :sswitch_b
        -0x5e3a5c50 -> :sswitch_a
        -0x5dde3142 -> :sswitch_9
        -0x53ecbf86 -> :sswitch_8
        -0x533bdf74 -> :sswitch_7
        0x185f1 -> :sswitch_6
        0x3305b9 -> :sswitch_5
        0x35ddbd -> :sswitch_4
        0x20ef99e6 -> :sswitch_3
        0x3597fba9 -> :sswitch_2
        0x6118c591 -> :sswitch_1
        0x6e96bb0f -> :sswitch_0
    .end sparse-switch

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_a
        :pswitch_7
        :pswitch_a
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public h(Ljava/lang/String;JLjava/util/List;Ljava/util/List;Ll/tvd;)Ll/mr60;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ll/tvd;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/List<",
            "Ll/y70;",
            ">;",
            "Ljava/util/List<",
            "Ll/a6f;",
            ">;",
            "Ll/tvd;",
            ")",
            "Ll/mr60;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/mr60;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p6}, Ll/mr60;-><init>(Ljava/lang/String;JLjava/util/List;Ljava/util/List;Ll/tvd;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public h0(Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ge p0, v1, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ll/tvd;

    .line 14
    .line 15
    const-string v2, "http://dashif.org/guidelines/trickmode"

    .line 16
    .line 17
    iget-object v1, v1, Ll/tvd;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v2, v1}, Ll/i11;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const/16 v0, 0x4000

    .line 26
    .line 27
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return v0
.end method

.method public i(Ljava/lang/String;JJ)Ll/mkc0;
    .locals 0

    .line 1
    new-instance p0, Ll/mkc0;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p5}, Ll/mkc0;-><init>(Ljava/lang/String;JJ)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public i0(Ljava/util/List;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v0, v2, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ll/tvd;

    .line 14
    .line 15
    const-string v3, "urn:mpeg:dash:role:2011"

    .line 16
    .line 17
    iget-object v4, v2, Ll/tvd;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v3, v4}, Ll/i11;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    iget-object v2, v2, Ll/tvd;->b:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Ll/i4c;->g0(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    or-int/2addr v1, v2

    .line 32
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v1
.end method

.method public j(Ll/i4c$a;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ll/t1d0;
    .locals 9
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i4c$a;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ll/tvd;",
            ">;)",
            "Ll/t1d0;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Ll/i4c$a;->a:Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k;->b()Lcom/google/android/exoplayer2/k$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/k$b;->W(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p2, p1, Ll/i4c$a;->d:Ljava/lang/String;

    .line 13
    .line 14
    if-nez p2, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    move-object p3, p2

    .line 18
    :goto_0
    iget-object p2, p1, Ll/i4c$a;->e:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    if-nez p4, :cond_2

    .line 28
    .line 29
    invoke-static {p2}, Ll/i4c;->r(Ljava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p2}, Ll/i4c;->s(Ljava/util/ArrayList;)V

    .line 33
    .line 34
    .line 35
    new-instance p4, Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 36
    .line 37
    invoke-direct {p4, p3, p2}, Lcom/google/android/exoplayer2/drm/DrmInitData;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p4}, Lcom/google/android/exoplayer2/k$b;->O(Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k$b;

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object v5, p1, Ll/i4c$a;->f:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v5, p5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    iget-wide v0, p1, Ll/i4c$a;->g:J

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, p1, Ll/i4c$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 55
    .line 56
    iget-object v4, p1, Ll/i4c$a;->c:Ll/ske0;

    .line 57
    .line 58
    iget-object v6, p1, Ll/i4c$a;->h:Ljava/util/List;

    .line 59
    .line 60
    iget-object v7, p1, Ll/i4c$a;->i:Ljava/util/List;

    .line 61
    .line 62
    const/4 v8, 0x0

    .line 63
    invoke-static/range {v0 .. v8}, Ll/t1d0;->o(JLcom/google/android/exoplayer2/k;Ljava/util/List;Ll/ske0;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Ll/t1d0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public j0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$e;)Ll/ske0$e;
    .locals 17
    .param p2    # Ll/ske0$e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-wide v4, v1, Ll/ske0;->b:J

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move-wide v4, v2

    .line 13
    :goto_0
    const-string v6, "timescale"

    .line 14
    .line 15
    invoke-static {v0, v6, v4, v5}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v9

    .line 19
    const-wide/16 v4, 0x0

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-wide v6, v1, Ll/ske0;->c:J

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move-wide v6, v4

    .line 27
    :goto_1
    const-string v8, "presentationTimeOffset"

    .line 28
    .line 29
    invoke-static {v0, v8, v6, v7}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 30
    .line 31
    .line 32
    move-result-wide v11

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget-wide v6, v1, Ll/ske0$e;->d:J

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_2
    move-wide v6, v4

    .line 39
    :goto_2
    if-eqz v1, :cond_3

    .line 40
    .line 41
    iget-wide v4, v1, Ll/ske0$e;->e:J

    .line 42
    .line 43
    :cond_3
    const-string v8, "indexRange"

    .line 44
    .line 45
    const/4 v13, 0x0

    .line 46
    invoke-interface {v0, v13, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v8

    .line 50
    if-eqz v8, :cond_4

    .line 51
    .line 52
    const-string v4, "-"

    .line 53
    .line 54
    invoke-virtual {v8, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    const/4 v5, 0x0

    .line 59
    aget-object v5, v4, v5

    .line 60
    .line 61
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 62
    .line 63
    .line 64
    move-result-wide v6

    .line 65
    const/4 v5, 0x1

    .line 66
    aget-object v4, v4, v5

    .line 67
    .line 68
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 69
    .line 70
    .line 71
    move-result-wide v4

    .line 72
    sub-long/2addr v4, v6

    .line 73
    add-long/2addr v4, v2

    .line 74
    :cond_4
    move-wide v15, v4

    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    iget-object v13, v1, Ll/ske0;->a:Ll/mkc0;

    .line 78
    .line 79
    :cond_5
    :goto_3
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 80
    .line 81
    .line 82
    const-string v1, "Initialization"

    .line 83
    .line 84
    invoke-static {v0, v1}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->T(Lorg/xmlpull/v1/XmlPullParser;)Ll/mkc0;

    .line 91
    .line 92
    .line 93
    move-result-object v13

    .line 94
    :goto_4
    move-object v8, v13

    .line 95
    goto :goto_5

    .line 96
    :cond_6
    invoke-static {v0}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 97
    .line 98
    .line 99
    goto :goto_4

    .line 100
    :goto_5
    const-string v1, "SegmentBase"

    .line 101
    .line 102
    invoke-static {v0, v1}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    move-wide v13, v6

    .line 109
    move-object/from16 v7, p0

    .line 110
    .line 111
    invoke-virtual/range {v7 .. v16}, Ll/i4c;->n(Ll/mkc0;JJJJ)Ll/ske0$e;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    return-object v0

    .line 116
    :cond_7
    move-object v13, v8

    .line 117
    goto :goto_3
.end method

.method public k(Ll/mkc0;JJJJLjava/util/List;JLjava/util/List;JJ)Ll/ske0$b;
    .locals 18
    .param p10    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mkc0;",
            "JJJJ",
            "Ljava/util/List<",
            "Ll/ske0$d;",
            ">;J",
            "Ljava/util/List<",
            "Ll/mkc0;",
            ">;JJ)",
            "Ll/ske0$b;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ske0$b;

    .line 2
    .line 3
    invoke-static/range {p14 .. p15}, Ll/bmk0;->J0(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v14

    .line 7
    invoke-static/range {p16 .. p17}, Ll/bmk0;->J0(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v16

    .line 11
    move-object/from16 v1, p1

    .line 12
    .line 13
    move-wide/from16 v2, p2

    .line 14
    .line 15
    move-wide/from16 v4, p4

    .line 16
    .line 17
    move-wide/from16 v6, p6

    .line 18
    .line 19
    move-wide/from16 v8, p8

    .line 20
    .line 21
    move-object/from16 v10, p10

    .line 22
    .line 23
    move-wide/from16 v11, p11

    .line 24
    .line 25
    move-object/from16 v13, p13

    .line 26
    .line 27
    invoke-direct/range {v0 .. v17}, Ll/ske0$b;-><init>(Ll/mkc0;JJJJLjava/util/List;JLjava/util/List;JJ)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public k0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$b;JJJJJ)Ll/ske0$b;
    .locals 24
    .param p2    # Ll/ske0$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    move-object/from16 v6, p2

    .line 4
    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    if-eqz v6, :cond_0

    .line 8
    .line 9
    iget-wide v4, v6, Ll/ske0;->b:J

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move-wide v4, v2

    .line 13
    :goto_0
    const-string v0, "timescale"

    .line 14
    .line 15
    invoke-static {v1, v0, v4, v5}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v8

    .line 19
    if-eqz v6, :cond_1

    .line 20
    .line 21
    iget-wide v4, v6, Ll/ske0;->c:J

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const-wide/16 v4, 0x0

    .line 25
    .line 26
    :goto_1
    const-string v0, "presentationTimeOffset"

    .line 27
    .line 28
    invoke-static {v1, v0, v4, v5}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v10

    .line 32
    if-eqz v6, :cond_2

    .line 33
    .line 34
    iget-wide v4, v6, Ll/ske0$a;->e:J

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_2
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    :goto_2
    const-string v0, "duration"

    .line 43
    .line 44
    invoke-static {v1, v0, v4, v5}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 45
    .line 46
    .line 47
    move-result-wide v14

    .line 48
    if-eqz v6, :cond_3

    .line 49
    .line 50
    iget-wide v2, v6, Ll/ske0$a;->d:J

    .line 51
    .line 52
    :cond_3
    const-string v0, "startNumber"

    .line 53
    .line 54
    invoke-static {v1, v0, v2, v3}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 55
    .line 56
    .line 57
    move-result-wide v12

    .line 58
    invoke-static/range {p7 .. p10}, Ll/i4c;->t(JJ)J

    .line 59
    .line 60
    .line 61
    move-result-wide v17

    .line 62
    const/4 v0, 0x0

    .line 63
    move-object v7, v0

    .line 64
    move-object/from16 v16, v7

    .line 65
    .line 66
    move-object/from16 v19, v16

    .line 67
    .line 68
    :goto_3
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 69
    .line 70
    .line 71
    const-string v0, "Initialization"

    .line 72
    .line 73
    invoke-static {v1, v0}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->T(Lorg/xmlpull/v1/XmlPullParser;)Ll/mkc0;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    move-object/from16 v16, v0

    .line 84
    .line 85
    move-wide v2, v8

    .line 86
    goto :goto_4

    .line 87
    :cond_4
    const-string v0, "SegmentTimeline"

    .line 88
    .line 89
    invoke-static {v1, v0}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_5

    .line 94
    .line 95
    move-object/from16 v0, p0

    .line 96
    .line 97
    move-wide/from16 v4, p5

    .line 98
    .line 99
    move-wide v2, v8

    .line 100
    invoke-virtual/range {v0 .. v5}, Ll/i4c;->m0(Lorg/xmlpull/v1/XmlPullParser;JJ)Ljava/util/List;

    .line 101
    .line 102
    .line 103
    move-result-object v8

    .line 104
    move-object/from16 v19, v8

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_5
    move-wide v2, v8

    .line 108
    const-string v0, "SegmentURL"

    .line 109
    .line 110
    invoke-static {v1, v0}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_7

    .line 115
    .line 116
    if-nez v7, :cond_6

    .line 117
    .line 118
    new-instance v7, Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .line 122
    .line 123
    :cond_6
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->n0(Lorg/xmlpull/v1/XmlPullParser;)Ll/mkc0;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    goto :goto_4

    .line 131
    :cond_7
    invoke-static {v1}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 132
    .line 133
    .line 134
    :goto_4
    const-string v0, "SegmentList"

    .line 135
    .line 136
    invoke-static {v1, v0}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_c

    .line 141
    .line 142
    if-eqz v6, :cond_b

    .line 143
    .line 144
    if-eqz v16, :cond_8

    .line 145
    .line 146
    goto :goto_5

    .line 147
    :cond_8
    iget-object v0, v6, Ll/ske0;->a:Ll/mkc0;

    .line 148
    .line 149
    move-object/from16 v16, v0

    .line 150
    .line 151
    :goto_5
    if-eqz v19, :cond_9

    .line 152
    .line 153
    goto :goto_6

    .line 154
    :cond_9
    iget-object v0, v6, Ll/ske0$a;->f:Ljava/util/List;

    .line 155
    .line 156
    move-object/from16 v19, v0

    .line 157
    .line 158
    :goto_6
    if-eqz v7, :cond_a

    .line 159
    .line 160
    goto :goto_7

    .line 161
    :cond_a
    iget-object v0, v6, Ll/ske0$b;->j:Ljava/util/List;

    .line 162
    .line 163
    move-object v7, v0

    .line 164
    :cond_b
    :goto_7
    move-object/from16 v6, v19

    .line 165
    .line 166
    move-object/from16 v19, v7

    .line 167
    .line 168
    move-object/from16 v7, v16

    .line 169
    .line 170
    move-object/from16 v16, v6

    .line 171
    .line 172
    move-object/from16 v6, p0

    .line 173
    .line 174
    move-wide/from16 v22, p3

    .line 175
    .line 176
    move-wide/from16 v20, p11

    .line 177
    .line 178
    move-wide v8, v2

    .line 179
    invoke-virtual/range {v6 .. v23}, Ll/i4c;->k(Ll/mkc0;JJJJLjava/util/List;JLjava/util/List;JJ)Ll/ske0$b;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    return-object v0

    .line 184
    :cond_c
    move-wide v8, v2

    .line 185
    goto :goto_3
.end method

.method public l(Ll/mkc0;JJJJJLjava/util/List;JLl/y5k0;Ll/y5k0;JJ)Ll/ske0$c;
    .locals 21
    .param p15    # Ll/y5k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p16    # Ll/y5k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mkc0;",
            "JJJJJ",
            "Ljava/util/List<",
            "Ll/ske0$d;",
            ">;J",
            "Ll/y5k0;",
            "Ll/y5k0;",
            "JJ)",
            "Ll/ske0$c;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ske0$c;

    .line 2
    .line 3
    invoke-static/range {p17 .. p18}, Ll/bmk0;->J0(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v17

    .line 7
    invoke-static/range {p19 .. p20}, Ll/bmk0;->J0(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v19

    .line 11
    move-object/from16 v1, p1

    .line 12
    .line 13
    move-wide/from16 v2, p2

    .line 14
    .line 15
    move-wide/from16 v4, p4

    .line 16
    .line 17
    move-wide/from16 v6, p6

    .line 18
    .line 19
    move-wide/from16 v8, p8

    .line 20
    .line 21
    move-wide/from16 v10, p10

    .line 22
    .line 23
    move-object/from16 v12, p12

    .line 24
    .line 25
    move-wide/from16 v13, p13

    .line 26
    .line 27
    move-object/from16 v15, p15

    .line 28
    .line 29
    move-object/from16 v16, p16

    .line 30
    .line 31
    invoke-direct/range {v0 .. v20}, Ll/ske0$c;-><init>(Ll/mkc0;JJJJJLjava/util/List;JLl/y5k0;Ll/y5k0;JJ)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public l0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$c;Ljava/util/List;JJJJJ)Ll/ske0$c;
    .locals 22
    .param p2    # Ll/ske0$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Ll/ske0$c;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;JJJJJ)",
            "Ll/ske0$c;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v6, p2

    .line 6
    .line 7
    const-wide/16 v2, 0x1

    .line 8
    .line 9
    if-eqz v6, :cond_0

    .line 10
    .line 11
    iget-wide v4, v6, Ll/ske0;->b:J

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-wide v4, v2

    .line 15
    :goto_0
    const-string v7, "timescale"

    .line 16
    .line 17
    invoke-static {v1, v7, v4, v5}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    if-eqz v6, :cond_1

    .line 22
    .line 23
    iget-wide v7, v6, Ll/ske0;->c:J

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    const-wide/16 v7, 0x0

    .line 27
    .line 28
    :goto_1
    const-string v9, "presentationTimeOffset"

    .line 29
    .line 30
    invoke-static {v1, v9, v7, v8}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 31
    .line 32
    .line 33
    move-result-wide v7

    .line 34
    if-eqz v6, :cond_2

    .line 35
    .line 36
    iget-wide v9, v6, Ll/ske0$a;->e:J

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_2
    const-wide v9, -0x7fffffffffffffffL    # -4.9E-324

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    :goto_2
    const-string v11, "duration"

    .line 45
    .line 46
    invoke-static {v1, v11, v9, v10}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 47
    .line 48
    .line 49
    move-result-wide v11

    .line 50
    if-eqz v6, :cond_3

    .line 51
    .line 52
    iget-wide v2, v6, Ll/ske0$a;->d:J

    .line 53
    .line 54
    :cond_3
    const-string v9, "startNumber"

    .line 55
    .line 56
    invoke-static {v1, v9, v2, v3}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 57
    .line 58
    .line 59
    move-result-wide v9

    .line 60
    invoke-static/range {p3 .. p3}, Ll/i4c;->W(Ljava/util/List;)J

    .line 61
    .line 62
    .line 63
    move-result-wide v13

    .line 64
    invoke-static/range {p8 .. p11}, Ll/i4c;->t(JJ)J

    .line 65
    .line 66
    .line 67
    move-result-wide v15

    .line 68
    if-eqz v6, :cond_4

    .line 69
    .line 70
    iget-object v3, v6, Ll/ske0$c;->k:Ll/y5k0;

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_4
    const/4 v3, 0x0

    .line 74
    :goto_3
    const-string v2, "media"

    .line 75
    .line 76
    invoke-virtual {v0, v1, v2, v3}, Ll/i4c;->v0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ll/y5k0;)Ll/y5k0;

    .line 77
    .line 78
    .line 79
    move-result-object v17

    .line 80
    if-eqz v6, :cond_5

    .line 81
    .line 82
    iget-object v2, v6, Ll/ske0$c;->j:Ll/y5k0;

    .line 83
    .line 84
    goto :goto_4

    .line 85
    :cond_5
    const/4 v2, 0x0

    .line 86
    :goto_4
    const-string v3, "initialization"

    .line 87
    .line 88
    invoke-virtual {v0, v1, v3, v2}, Ll/i4c;->v0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ll/y5k0;)Ll/y5k0;

    .line 89
    .line 90
    .line 91
    move-result-object v18

    .line 92
    const/16 v19, 0x0

    .line 93
    .line 94
    const/16 v20, 0x0

    .line 95
    .line 96
    :goto_5
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 97
    .line 98
    .line 99
    const-string v2, "Initialization"

    .line 100
    .line 101
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_6

    .line 106
    .line 107
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->T(Lorg/xmlpull/v1/XmlPullParser;)Ll/mkc0;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    move-object/from16 v19, v2

    .line 112
    .line 113
    move-wide v2, v4

    .line 114
    goto :goto_6

    .line 115
    :cond_6
    const-string v2, "SegmentTimeline"

    .line 116
    .line 117
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-eqz v2, :cond_7

    .line 122
    .line 123
    move-wide v2, v4

    .line 124
    move-wide/from16 v4, p6

    .line 125
    .line 126
    invoke-virtual/range {v0 .. v5}, Ll/i4c;->m0(Lorg/xmlpull/v1/XmlPullParser;JJ)Ljava/util/List;

    .line 127
    .line 128
    .line 129
    move-result-object v20

    .line 130
    goto :goto_6

    .line 131
    :cond_7
    move-wide v2, v4

    .line 132
    invoke-static {v1}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 133
    .line 134
    .line 135
    :goto_6
    const-string v0, "SegmentTemplate"

    .line 136
    .line 137
    invoke-static {v1, v0}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_b

    .line 142
    .line 143
    if-eqz v6, :cond_a

    .line 144
    .line 145
    if-eqz v19, :cond_8

    .line 146
    .line 147
    goto :goto_7

    .line 148
    :cond_8
    iget-object v0, v6, Ll/ske0;->a:Ll/mkc0;

    .line 149
    .line 150
    move-object/from16 v19, v0

    .line 151
    .line 152
    :goto_7
    if-eqz v20, :cond_9

    .line 153
    .line 154
    goto :goto_8

    .line 155
    :cond_9
    iget-object v0, v6, Ll/ske0$a;->f:Ljava/util/List;

    .line 156
    .line 157
    move-object/from16 v20, v0

    .line 158
    .line 159
    :cond_a
    :goto_8
    move-object/from16 v1, p0

    .line 160
    .line 161
    move-wide v3, v2

    .line 162
    move-wide v5, v7

    .line 163
    move-wide v7, v9

    .line 164
    move-wide v9, v13

    .line 165
    move-wide v14, v15

    .line 166
    move-object/from16 v16, v18

    .line 167
    .line 168
    move-object/from16 v2, v19

    .line 169
    .line 170
    move-object/from16 v13, v20

    .line 171
    .line 172
    move-wide/from16 v20, p4

    .line 173
    .line 174
    move-wide/from16 v18, p12

    .line 175
    .line 176
    invoke-virtual/range {v1 .. v21}, Ll/i4c;->l(Ll/mkc0;JJJJJLjava/util/List;JLl/y5k0;Ll/y5k0;JJ)Ll/ske0$c;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    return-object v0

    .line 181
    :cond_b
    move-wide v4, v7

    .line 182
    move-wide v7, v9

    .line 183
    move-wide v9, v13

    .line 184
    move-wide v14, v15

    .line 185
    move-object/from16 v0, p0

    .line 186
    .line 187
    move-wide v15, v14

    .line 188
    move-wide v13, v9

    .line 189
    move-wide v9, v7

    .line 190
    move-wide v7, v4

    .line 191
    move-wide v4, v2

    .line 192
    goto :goto_5
.end method

.method public m(JJ)Ll/ske0$d;
    .locals 0

    .line 1
    new-instance p0, Ll/ske0$d;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Ll/ske0$d;-><init>(JJ)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public m0(Lorg/xmlpull/v1/XmlPullParser;JJ)Ljava/util/List;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "JJ)",
            "Ljava/util/List<",
            "Ll/ske0$d;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    const/4 v12, 0x0

    .line 16
    move-wide v3, v2

    .line 17
    move-wide v5, v10

    .line 18
    move v2, v12

    .line 19
    move v7, v2

    .line 20
    :cond_0
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 21
    .line 22
    .line 23
    const-string v8, "S"

    .line 24
    .line 25
    invoke-static {v0, v8}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v8

    .line 29
    if-eqz v8, :cond_3

    .line 30
    .line 31
    const-string v8, "t"

    .line 32
    .line 33
    invoke-static {v0, v8, v10, v11}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v8

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    move-object v2, v1

    .line 40
    move-object/from16 v1, p0

    .line 41
    .line 42
    invoke-virtual/range {v1 .. v9}, Ll/i4c;->b(Ljava/util/List;JJIJ)J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    move-object v1, v2

    .line 47
    :cond_1
    cmp-long v2, v8, v10

    .line 48
    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    move-wide v3, v8

    .line 52
    :cond_2
    const-string v2, "d"

    .line 53
    .line 54
    invoke-static {v0, v2, v10, v11}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 55
    .line 56
    .line 57
    move-result-wide v5

    .line 58
    const-string v2, "r"

    .line 59
    .line 60
    invoke-static {v0, v2, v12}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    const/4 v2, 0x1

    .line 65
    goto :goto_0

    .line 66
    :cond_3
    invoke-static {v0}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 67
    .line 68
    .line 69
    :goto_0
    const-string v8, "SegmentTimeline"

    .line 70
    .line 71
    invoke-static {v0, v8}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    if-eqz v8, :cond_0

    .line 76
    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    const-wide/16 v17, 0x3e8

    .line 80
    .line 81
    move-wide/from16 v15, p2

    .line 82
    .line 83
    move-wide/from16 v13, p4

    .line 84
    .line 85
    invoke-static/range {v13 .. v18}, Ll/bmk0;->W0(JJJ)J

    .line 86
    .line 87
    .line 88
    move-result-wide v8

    .line 89
    move-object/from16 v0, p0

    .line 90
    .line 91
    move-wide v2, v3

    .line 92
    move-wide v4, v5

    .line 93
    move v6, v7

    .line 94
    move-wide v7, v8

    .line 95
    invoke-virtual/range {v0 .. v8}, Ll/i4c;->b(Ljava/util/List;JJIJ)J

    .line 96
    .line 97
    .line 98
    :cond_4
    return-object v1
.end method

.method public n(Ll/mkc0;JJJJ)Ll/ske0$e;
    .locals 0

    .line 1
    new-instance p0, Ll/ske0$e;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p9}, Ll/ske0$e;-><init>(Ll/mkc0;JJJJ)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public n0(Lorg/xmlpull/v1/XmlPullParser;)Ll/mkc0;
    .locals 2

    .line 1
    const-string v0, "media"

    .line 2
    .line 3
    const-string v1, "mediaRange"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, v1}, Ll/i4c;->d0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ll/mkc0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public o(Ljava/lang/String;Ljava/lang/String;)Ll/llk0;
    .locals 0

    .line 1
    new-instance p0, Ll/llk0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/llk0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public o0(Ljava/lang/String;)I
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const-string v0, "forced_subtitle"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const-string v0, "forced-subtitle"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    return p0

    .line 22
    :cond_1
    const/4 p0, 0x2

    .line 23
    return p0
.end method

.method public p0(Ljava/util/List;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v0, v2, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ll/tvd;

    .line 14
    .line 15
    const-string v3, "urn:mpeg:dash:role:2011"

    .line 16
    .line 17
    iget-object v4, v2, Ll/tvd;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v3, v4}, Ll/i11;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    iget-object v2, v2, Ll/tvd;->b:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Ll/i4c;->o0(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    or-int/2addr v1, v2

    .line 32
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v1
.end method

.method public q0(Lorg/xmlpull/v1/XmlPullParser;)Ll/mre0;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    const v3, -0x800001

    .line 9
    .line 10
    .line 11
    move-wide v4, v1

    .line 12
    move-wide v6, v4

    .line 13
    move-wide v8, v6

    .line 14
    move v10, v3

    .line 15
    move v11, v10

    .line 16
    :goto_0
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 17
    .line 18
    .line 19
    const-string v12, "Latency"

    .line 20
    .line 21
    invoke-static {v0, v12}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v12

    .line 25
    const-string v13, "max"

    .line 26
    .line 27
    const-string v14, "min"

    .line 28
    .line 29
    if-eqz v12, :cond_1

    .line 30
    .line 31
    const-string v4, "target"

    .line 32
    .line 33
    invoke-static {v0, v4, v1, v2}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    invoke-static {v0, v14, v1, v2}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 38
    .line 39
    .line 40
    move-result-wide v6

    .line 41
    invoke-static {v0, v13, v1, v2}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 42
    .line 43
    .line 44
    move-result-wide v8

    .line 45
    :cond_0
    :goto_1
    move-wide v13, v4

    .line 46
    move-wide v15, v6

    .line 47
    move-wide/from16 v17, v8

    .line 48
    .line 49
    move/from16 v19, v10

    .line 50
    .line 51
    move/from16 v20, v11

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_1
    const-string v12, "PlaybackRate"

    .line 55
    .line 56
    invoke-static {v0, v12}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v12

    .line 60
    if-eqz v12, :cond_0

    .line 61
    .line 62
    invoke-static {v0, v14, v3}, Ll/i4c;->R(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;F)F

    .line 63
    .line 64
    .line 65
    move-result v10

    .line 66
    invoke-static {v0, v13, v3}, Ll/i4c;->R(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;F)F

    .line 67
    .line 68
    .line 69
    move-result v11

    .line 70
    goto :goto_1

    .line 71
    :goto_2
    const-string v4, "ServiceDescription"

    .line 72
    .line 73
    invoke-static {v0, v4}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-eqz v4, :cond_2

    .line 78
    .line 79
    new-instance v12, Ll/mre0;

    .line 80
    .line 81
    invoke-direct/range {v12 .. v20}, Ll/mre0;-><init>(JJJFF)V

    .line 82
    .line 83
    .line 84
    return-object v12

    .line 85
    :cond_2
    move-wide v4, v13

    .line 86
    move-wide v6, v15

    .line 87
    move-wide/from16 v8, v17

    .line 88
    .line 89
    move/from16 v10, v19

    .line 90
    .line 91
    move/from16 v11, v20

    .line 92
    .line 93
    goto :goto_0
.end method

.method public t0(Ljava/util/List;)Landroid/util/Pair;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;)",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ge v0, v1, :cond_3

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ll/tvd;

    .line 14
    .line 15
    const-string v2, "http://dashif.org/thumbnail_tile"

    .line 16
    .line 17
    iget-object v3, v1, Ll/tvd;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v2, v3}, Ll/i11;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    const-string v2, "http://dashif.org/guidelines/thumbnail_tile"

    .line 26
    .line 27
    iget-object v3, v1, Ll/tvd;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2, v3}, Ll/i11;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    :cond_0
    iget-object v1, v1, Ll/tvd;->b:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    const-string v2, "x"

    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/bmk0;->a1(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    array-length v2, v1

    .line 46
    const/4 v3, 0x2

    .line 47
    if-eq v2, v3, :cond_1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :try_start_0
    aget-object v2, v1, p0

    .line 51
    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    const/4 v3, 0x1

    .line 57
    aget-object v1, v1, v3

    .line 58
    .line 59
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {v2, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 72
    .line 73
    .line 74
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    return-object p0

    .line 76
    :catch_0
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    const/4 p0, 0x0

    .line 80
    return-object p0
.end method

.method public u0(Ljava/lang/String;)I
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x4

    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, -0x1

    .line 12
    packed-switch v0, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    :pswitch_0
    goto :goto_0

    .line 16
    :pswitch_1
    const-string v0, "6"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move v3, v1

    .line 26
    goto :goto_0

    .line 27
    :pswitch_2
    const-string v0, "4"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/4 v3, 0x3

    .line 37
    goto :goto_0

    .line 38
    :pswitch_3
    const-string v0, "3"

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_3

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    const/4 v3, 0x2

    .line 48
    goto :goto_0

    .line 49
    :pswitch_4
    const-string v0, "2"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_4

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_4
    move v3, v2

    .line 59
    goto :goto_0

    .line 60
    :pswitch_5
    const-string v0, "1"

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_5

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_5
    move v3, p0

    .line 70
    :goto_0
    packed-switch v3, :pswitch_data_1

    .line 71
    .line 72
    .line 73
    return p0

    .line 74
    :pswitch_6
    return v2

    .line 75
    :pswitch_7
    const/16 p0, 0x8

    .line 76
    .line 77
    return p0

    .line 78
    :pswitch_8
    return v1

    .line 79
    :pswitch_9
    const/16 p0, 0x800

    .line 80
    .line 81
    return p0

    .line 82
    :pswitch_a
    const/16 p0, 0x200

    .line 83
    .line 84
    return p0

    .line 85
    :pswitch_data_0
    .packed-switch 0x31
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method

.method public final v([Ljava/lang/String;)Z
    .locals 4

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    move v1, v0

    .line 4
    :goto_0
    if-ge v1, p0, :cond_1

    .line 5
    .line 6
    aget-object v2, p1, v1

    .line 7
    .line 8
    const-string v3, "urn:dvb:dash:profile:dvb-dash:"

    .line 9
    .line 10
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return v0
.end method

.method public v0(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ll/y5k0;)Ll/y5k0;
    .locals 0
    .param p3    # Ll/y5k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-interface {p1, p0, p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {p0}, Ll/y5k0;->b(Ljava/lang/String;)Ll/y5k0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    return-object p3
.end method

.method public w0(Lorg/xmlpull/v1/XmlPullParser;)Ll/llk0;
    .locals 3

    .line 1
    const-string v0, "schemeIdUri"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {p1, v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v2, "value"

    .line 9
    .line 10
    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, v0, p1}, Ll/i4c;->o(Ljava/lang/String;Ljava/lang/String;)Ll/llk0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public x(Landroid/net/Uri;Ljava/io/InputStream;)Ll/h4c;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/i4c;->a:Lorg/xmlpull/v1/XmlPullParserFactory;

    .line 3
    .line 4
    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-interface {v1, p2, v0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const/4 v2, 0x2

    .line 16
    if-ne p2, v2, :cond_0

    .line 17
    .line 18
    const-string p2, "MPD"

    .line 19
    .line 20
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, v1, p1}, Ll/i4c;->Y(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Ll/h4c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :catch_0
    move-exception p0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p0, "inputStream does not contain a valid media presentation description"

    .line 38
    .line 39
    invoke-static {p0, v0}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    throw p0
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :goto_0
    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    throw p0
.end method

.method public y(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;Ll/ske0;JJJJJZ)Ll/y70;
    .locals 42
    .param p3    # Ll/ske0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Ljava/util/List<",
            "Ll/fs2;",
            ">;",
            "Ll/ske0;",
            "JJJJJZ)",
            "Ll/y70;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "id"

    .line 6
    .line 7
    const-wide/16 v3, -0x1

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v4}, Ll/i4c;->X(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v28

    .line 13
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->G(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const-string v3, "mimeType"

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-interface {v1, v4, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const-string v5, "codecs"

    .line 25
    .line 26
    invoke-interface {v1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    const-string v6, "width"

    .line 31
    .line 32
    const/4 v7, -0x1

    .line 33
    invoke-static {v1, v6, v7}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    const-string v8, "height"

    .line 38
    .line 39
    invoke-static {v1, v8, v7}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    const/high16 v9, -0x40800000    # -1.0f

    .line 44
    .line 45
    invoke-static {v1, v9}, Ll/i4c;->S(Lorg/xmlpull/v1/XmlPullParser;F)F

    .line 46
    .line 47
    .line 48
    move-result v9

    .line 49
    const-string v10, "audioSamplingRate"

    .line 50
    .line 51
    invoke-static {v1, v10, v7}, Ll/i4c;->U(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 52
    .line 53
    .line 54
    move-result v10

    .line 55
    const-string v11, "lang"

    .line 56
    .line 57
    invoke-interface {v1, v4, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v12

    .line 61
    const-string v13, "label"

    .line 62
    .line 63
    invoke-interface {v1, v4, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v13

    .line 67
    new-instance v14, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v15, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    move-object/from16 v16, v13

    .line 78
    .line 79
    new-instance v13, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    move-object/from16 v17, v12

    .line 85
    .line 86
    new-instance v12, Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .line 90
    .line 91
    new-instance v7, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    move-object/from16 v19, v15

    .line 97
    .line 98
    new-instance v15, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    new-instance v4, Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .line 107
    .line 108
    move/from16 v21, v2

    .line 109
    .line 110
    new-instance v2, Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .line 114
    .line 115
    const/16 v30, 0x0

    .line 116
    .line 117
    move/from16 v18, v21

    .line 118
    .line 119
    move-object/from16 v21, v5

    .line 120
    .line 121
    move/from16 v5, v18

    .line 122
    .line 123
    move-wide/from16 v23, p8

    .line 124
    .line 125
    move-object/from16 v18, v4

    .line 126
    .line 127
    move/from16 v22, v6

    .line 128
    .line 129
    move/from16 v25, v8

    .line 130
    .line 131
    move v8, v9

    .line 132
    move-object/from16 v31, v16

    .line 133
    .line 134
    move-object/from16 v6, v17

    .line 135
    .line 136
    move/from16 v32, v30

    .line 137
    .line 138
    const/4 v9, -0x1

    .line 139
    const/16 v33, 0x0

    .line 140
    .line 141
    move-object/from16 v16, p3

    .line 142
    .line 143
    move-object/from16 v17, v3

    .line 144
    .line 145
    move-wide/from16 v3, p6

    .line 146
    .line 147
    :goto_0
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 148
    .line 149
    .line 150
    move/from16 p3, v8

    .line 151
    .line 152
    const-string v8, "BaseURL"

    .line 153
    .line 154
    invoke-static {v1, v8}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 155
    .line 156
    .line 157
    move-result v8

    .line 158
    if-eqz v8, :cond_1

    .line 159
    .line 160
    if-nez v32, :cond_0

    .line 161
    .line 162
    invoke-virtual {v0, v1, v3, v4}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    .line 163
    .line 164
    .line 165
    move-result-wide v3

    .line 166
    const/16 v32, 0x1

    .line 167
    .line 168
    :cond_0
    move-object/from16 v8, p2

    .line 169
    .line 170
    move-wide/from16 p6, v3

    .line 171
    .line 172
    move/from16 v3, p14

    .line 173
    .line 174
    invoke-virtual {v0, v1, v8, v3}, Ll/i4c;->C(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;Z)Ljava/util/List;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 179
    .line 180
    .line 181
    move-object/from16 v37, v2

    .line 182
    .line 183
    move-object/from16 v39, v11

    .line 184
    .line 185
    move-object/from16 v34, v14

    .line 186
    .line 187
    move-object v3, v15

    .line 188
    move-object/from16 v4, v16

    .line 189
    .line 190
    move-object/from16 p9, v18

    .line 191
    .line 192
    move-object/from16 v2, v19

    .line 193
    .line 194
    const/16 v38, 0x0

    .line 195
    .line 196
    move/from16 v14, p3

    .line 197
    .line 198
    move-object/from16 v19, v7

    .line 199
    .line 200
    move v15, v10

    .line 201
    move-object/from16 v18, v12

    .line 202
    .line 203
    move-object/from16 v16, v13

    .line 204
    .line 205
    move-wide/from16 v7, p6

    .line 206
    .line 207
    goto/16 :goto_8

    .line 208
    .line 209
    :cond_1
    move-object/from16 v8, p2

    .line 210
    .line 211
    move-wide/from16 v26, v3

    .line 212
    .line 213
    move/from16 v3, p14

    .line 214
    .line 215
    const-string v4, "ContentProtection"

    .line 216
    .line 217
    invoke-static {v1, v4}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    if-eqz v4, :cond_4

    .line 222
    .line 223
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->F(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/Pair;

    .line 224
    .line 225
    .line 226
    move-result-object v4

    .line 227
    iget-object v0, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 228
    .line 229
    if-eqz v0, :cond_2

    .line 230
    .line 231
    move-object/from16 v33, v0

    .line 232
    .line 233
    check-cast v33, Ljava/lang/String;

    .line 234
    .line 235
    :cond_2
    iget-object v0, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 236
    .line 237
    if-eqz v0, :cond_3

    .line 238
    .line 239
    check-cast v0, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    .line 240
    .line 241
    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    :cond_3
    move-object/from16 v37, v2

    .line 245
    .line 246
    move-object/from16 v39, v11

    .line 247
    .line 248
    move-object/from16 v34, v14

    .line 249
    .line 250
    move-object v3, v15

    .line 251
    move-object/from16 v4, v16

    .line 252
    .line 253
    move-object/from16 p9, v18

    .line 254
    .line 255
    move-object/from16 v2, v19

    .line 256
    .line 257
    const/16 v38, 0x0

    .line 258
    .line 259
    :goto_1
    move/from16 v14, p3

    .line 260
    .line 261
    move-object/from16 v19, v7

    .line 262
    .line 263
    move v15, v10

    .line 264
    move-object/from16 v18, v12

    .line 265
    .line 266
    move-object/from16 v16, v13

    .line 267
    .line 268
    move-wide/from16 v7, v26

    .line 269
    .line 270
    goto/16 :goto_8

    .line 271
    .line 272
    :cond_4
    const-string v0, "ContentComponent"

    .line 273
    .line 274
    invoke-static {v1, v0}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    if-eqz v0, :cond_5

    .line 279
    .line 280
    const/4 v0, 0x0

    .line 281
    invoke-interface {v1, v0, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v4

    .line 285
    invoke-static {v6, v4}, Ll/i4c;->q(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v4

    .line 289
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->G(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 290
    .line 291
    .line 292
    move-result v6

    .line 293
    invoke-static {v5, v6}, Ll/i4c;->p(II)I

    .line 294
    .line 295
    .line 296
    move-result v5

    .line 297
    move-object/from16 v38, v0

    .line 298
    .line 299
    move-object/from16 v37, v2

    .line 300
    .line 301
    move-object v6, v4

    .line 302
    :goto_2
    move-object/from16 v39, v11

    .line 303
    .line 304
    move-object/from16 v34, v14

    .line 305
    .line 306
    move-object v3, v15

    .line 307
    move-object/from16 v4, v16

    .line 308
    .line 309
    move-object/from16 p9, v18

    .line 310
    .line 311
    move-object/from16 v2, v19

    .line 312
    .line 313
    goto :goto_1

    .line 314
    :cond_5
    const/4 v0, 0x0

    .line 315
    const-string v4, "Role"

    .line 316
    .line 317
    invoke-static {v1, v4}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 318
    .line 319
    .line 320
    move-result v20

    .line 321
    if-eqz v20, :cond_6

    .line 322
    .line 323
    invoke-static {v1, v4}, Ll/i4c;->I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;

    .line 324
    .line 325
    .line 326
    move-result-object v4

    .line 327
    invoke-virtual {v12, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    :goto_3
    move-object/from16 v38, v0

    .line 331
    .line 332
    move-object/from16 v37, v2

    .line 333
    .line 334
    move-object/from16 v20, v6

    .line 335
    .line 336
    move-object/from16 v39, v11

    .line 337
    .line 338
    move-object/from16 v34, v14

    .line 339
    .line 340
    move-object v3, v15

    .line 341
    move-object/from16 v4, v16

    .line 342
    .line 343
    move-object/from16 p9, v18

    .line 344
    .line 345
    move-object/from16 v2, v19

    .line 346
    .line 347
    move/from16 v14, p3

    .line 348
    .line 349
    move-object/from16 v19, v7

    .line 350
    .line 351
    move v15, v10

    .line 352
    move-object/from16 v18, v12

    .line 353
    .line 354
    move-object/from16 v16, v13

    .line 355
    .line 356
    move-wide/from16 v7, v26

    .line 357
    .line 358
    move-wide/from16 v40, v23

    .line 359
    .line 360
    move/from16 v24, v5

    .line 361
    .line 362
    move/from16 v23, v9

    .line 363
    .line 364
    move-wide/from16 v5, v40

    .line 365
    .line 366
    goto/16 :goto_7

    .line 367
    .line 368
    :cond_6
    const-string v4, "AudioChannelConfiguration"

    .line 369
    .line 370
    invoke-static {v1, v4}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 371
    .line 372
    .line 373
    move-result v4

    .line 374
    if-eqz v4, :cond_7

    .line 375
    .line 376
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->A(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 377
    .line 378
    .line 379
    move-result v4

    .line 380
    move-object/from16 v38, v0

    .line 381
    .line 382
    move-object/from16 v37, v2

    .line 383
    .line 384
    move v9, v4

    .line 385
    goto :goto_2

    .line 386
    :cond_7
    const-string v4, "Accessibility"

    .line 387
    .line 388
    invoke-static {v1, v4}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 389
    .line 390
    .line 391
    move-result v20

    .line 392
    if-eqz v20, :cond_8

    .line 393
    .line 394
    invoke-static {v1, v4}, Ll/i4c;->I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;

    .line 395
    .line 396
    .line 397
    move-result-object v4

    .line 398
    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 399
    .line 400
    .line 401
    goto :goto_3

    .line 402
    :cond_8
    const-string v4, "EssentialProperty"

    .line 403
    .line 404
    invoke-static {v1, v4}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 405
    .line 406
    .line 407
    move-result v20

    .line 408
    if-eqz v20, :cond_9

    .line 409
    .line 410
    invoke-static {v1, v4}, Ll/i4c;->I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;

    .line 411
    .line 412
    .line 413
    move-result-object v4

    .line 414
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 415
    .line 416
    .line 417
    goto :goto_3

    .line 418
    :cond_9
    const-string v4, "SupplementalProperty"

    .line 419
    .line 420
    invoke-static {v1, v4}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 421
    .line 422
    .line 423
    move-result v20

    .line 424
    if-eqz v20, :cond_a

    .line 425
    .line 426
    invoke-static {v1, v4}, Ll/i4c;->I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;

    .line 427
    .line 428
    .line 429
    move-result-object v4

    .line 430
    invoke-virtual {v15, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 431
    .line 432
    .line 433
    goto :goto_3

    .line 434
    :cond_a
    const-string v4, "Representation"

    .line 435
    .line 436
    invoke-static {v1, v4}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 437
    .line 438
    .line 439
    move-result v4

    .line 440
    if-eqz v4, :cond_c

    .line 441
    .line 442
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 443
    .line 444
    .line 445
    move-result v4

    .line 446
    move-object/from16 v38, v0

    .line 447
    .line 448
    move-object/from16 v37, v2

    .line 449
    .line 450
    move v0, v5

    .line 451
    move-object/from16 v39, v11

    .line 452
    .line 453
    move-object/from16 v5, v21

    .line 454
    .line 455
    move-object v11, v6

    .line 456
    move/from16 v6, v22

    .line 457
    .line 458
    move-wide/from16 v21, v26

    .line 459
    .line 460
    move/from16 v27, v3

    .line 461
    .line 462
    if-nez v4, :cond_b

    .line 463
    .line 464
    move-object/from16 v3, v37

    .line 465
    .line 466
    move/from16 v8, p3

    .line 467
    .line 468
    move-object/from16 v34, v14

    .line 469
    .line 470
    move-object/from16 v4, v17

    .line 471
    .line 472
    move-object/from16 v36, v18

    .line 473
    .line 474
    move-object/from16 v35, v19

    .line 475
    .line 476
    move-wide/from16 v19, p4

    .line 477
    .line 478
    move-wide/from16 v17, p10

    .line 479
    .line 480
    move-object v2, v1

    .line 481
    move-object v14, v7

    .line 482
    move/from16 v7, v25

    .line 483
    .line 484
    move-object/from16 v1, p0

    .line 485
    .line 486
    move-wide/from16 v25, p12

    .line 487
    .line 488
    goto :goto_4

    .line 489
    :cond_b
    move-object v3, v8

    .line 490
    move-object/from16 v34, v14

    .line 491
    .line 492
    move-object/from16 v4, v17

    .line 493
    .line 494
    move-object/from16 v36, v18

    .line 495
    .line 496
    move-object/from16 v35, v19

    .line 497
    .line 498
    move-wide/from16 v19, p4

    .line 499
    .line 500
    move-wide/from16 v17, p10

    .line 501
    .line 502
    move-object v2, v1

    .line 503
    move-object v14, v7

    .line 504
    move/from16 v7, v25

    .line 505
    .line 506
    move-object/from16 v1, p0

    .line 507
    .line 508
    move-wide/from16 v25, p12

    .line 509
    .line 510
    move/from16 v8, p3

    .line 511
    .line 512
    :goto_4
    invoke-virtual/range {v1 .. v27}, Ll/i4c;->e0(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;IIFIILjava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ll/ske0;JJJJJZ)Ll/i4c$a;

    .line 513
    .line 514
    .line 515
    move-result-object v3

    .line 516
    move-object/from16 v17, v4

    .line 517
    .line 518
    move/from16 v25, v7

    .line 519
    .line 520
    move-object/from16 v20, v11

    .line 521
    .line 522
    move-object/from16 v18, v12

    .line 523
    .line 524
    move-object/from16 v19, v14

    .line 525
    .line 526
    move-object/from16 v4, v16

    .line 527
    .line 528
    move v14, v8

    .line 529
    move-object/from16 v16, v13

    .line 530
    .line 531
    move-object v13, v15

    .line 532
    move-wide/from16 v7, v21

    .line 533
    .line 534
    move-object/from16 v21, v5

    .line 535
    .line 536
    move/from16 v22, v6

    .line 537
    .line 538
    move v15, v10

    .line 539
    move-wide/from16 v5, v23

    .line 540
    .line 541
    move/from16 v23, v9

    .line 542
    .line 543
    iget-object v9, v3, Ll/i4c$a;->a:Lcom/google/android/exoplayer2/k;

    .line 544
    .line 545
    iget-object v9, v9, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 546
    .line 547
    invoke-static {v9}, Ll/kb00;->k(Ljava/lang/String;)I

    .line 548
    .line 549
    .line 550
    move-result v9

    .line 551
    invoke-static {v0, v9}, Ll/i4c;->p(II)I

    .line 552
    .line 553
    .line 554
    move-result v0

    .line 555
    move-object/from16 v9, v36

    .line 556
    .line 557
    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 558
    .line 559
    .line 560
    move-object v1, v2

    .line 561
    :goto_5
    move-object/from16 p9, v9

    .line 562
    .line 563
    move-object v3, v13

    .line 564
    move/from16 v9, v23

    .line 565
    .line 566
    move-object/from16 v2, v35

    .line 567
    .line 568
    move-wide/from16 v23, v5

    .line 569
    .line 570
    move-object/from16 v6, v20

    .line 571
    .line 572
    move v5, v0

    .line 573
    goto/16 :goto_8

    .line 574
    .line 575
    :cond_c
    move-object/from16 v38, v0

    .line 576
    .line 577
    move-object/from16 v37, v2

    .line 578
    .line 579
    move v0, v5

    .line 580
    move-object/from16 v20, v6

    .line 581
    .line 582
    move-object/from16 v39, v11

    .line 583
    .line 584
    move-object/from16 v34, v14

    .line 585
    .line 586
    move-object/from16 v4, v16

    .line 587
    .line 588
    move-object/from16 v35, v19

    .line 589
    .line 590
    move-wide/from16 v5, v23

    .line 591
    .line 592
    move/from16 v14, p3

    .line 593
    .line 594
    move-object v2, v1

    .line 595
    move-object/from16 v19, v7

    .line 596
    .line 597
    move/from16 v23, v9

    .line 598
    .line 599
    move-object/from16 v16, v13

    .line 600
    .line 601
    move-object v13, v15

    .line 602
    move-object/from16 v9, v18

    .line 603
    .line 604
    move-wide/from16 v7, v26

    .line 605
    .line 606
    move-object/from16 v1, p0

    .line 607
    .line 608
    move v15, v10

    .line 609
    move-object/from16 v18, v12

    .line 610
    .line 611
    const-string v3, "SegmentBase"

    .line 612
    .line 613
    invoke-static {v2, v3}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 614
    .line 615
    .line 616
    move-result v3

    .line 617
    if-eqz v3, :cond_d

    .line 618
    .line 619
    move-object v3, v4

    .line 620
    check-cast v3, Ll/ske0$e;

    .line 621
    .line 622
    invoke-virtual {v1, v2, v3}, Ll/i4c;->j0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$e;)Ll/ske0$e;

    .line 623
    .line 624
    .line 625
    move-result-object v3

    .line 626
    move-object v1, v2

    .line 627
    move-object v4, v3

    .line 628
    goto :goto_5

    .line 629
    :cond_d
    const-string v3, "SegmentList"

    .line 630
    .line 631
    invoke-static {v2, v3}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 632
    .line 633
    .line 634
    move-result v3

    .line 635
    if-eqz v3, :cond_e

    .line 636
    .line 637
    move-object/from16 v36, v9

    .line 638
    .line 639
    invoke-virtual {v1, v2, v5, v6}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    .line 640
    .line 641
    .line 642
    move-result-wide v9

    .line 643
    move-object v2, v4

    .line 644
    check-cast v2, Ll/ske0$b;

    .line 645
    .line 646
    move-wide/from16 v5, p4

    .line 647
    .line 648
    move-wide/from16 v3, p10

    .line 649
    .line 650
    move-wide/from16 v11, p12

    .line 651
    .line 652
    move/from16 v24, v0

    .line 653
    .line 654
    move-object v0, v1

    .line 655
    move-object/from16 p9, v36

    .line 656
    .line 657
    move-object/from16 v1, p1

    .line 658
    .line 659
    invoke-virtual/range {v0 .. v12}, Ll/i4c;->k0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$b;JJJJJ)Ll/ske0$b;

    .line 660
    .line 661
    .line 662
    move-result-object v2

    .line 663
    move-object v4, v2

    .line 664
    move-object v3, v13

    .line 665
    move-object/from16 v6, v20

    .line 666
    .line 667
    move/from16 v5, v24

    .line 668
    .line 669
    move-object/from16 v2, v35

    .line 670
    .line 671
    move-wide/from16 v40, v9

    .line 672
    .line 673
    move/from16 v9, v23

    .line 674
    .line 675
    :goto_6
    move-wide/from16 v23, v40

    .line 676
    .line 677
    goto/16 :goto_8

    .line 678
    .line 679
    :cond_e
    move/from16 v24, v0

    .line 680
    .line 681
    move-object v0, v1

    .line 682
    move-object v1, v2

    .line 683
    move-object/from16 p9, v9

    .line 684
    .line 685
    const-string v2, "SegmentTemplate"

    .line 686
    .line 687
    invoke-static {v1, v2}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 688
    .line 689
    .line 690
    move-result v2

    .line 691
    if-eqz v2, :cond_f

    .line 692
    .line 693
    invoke-virtual {v0, v1, v5, v6}, Ll/i4c;->B(Lorg/xmlpull/v1/XmlPullParser;J)J

    .line 694
    .line 695
    .line 696
    move-result-wide v10

    .line 697
    move-object v2, v4

    .line 698
    check-cast v2, Ll/ske0$c;

    .line 699
    .line 700
    move-wide/from16 v4, p10

    .line 701
    .line 702
    move-wide v8, v7

    .line 703
    move-object v3, v13

    .line 704
    move-wide/from16 v6, p4

    .line 705
    .line 706
    move-wide/from16 v12, p12

    .line 707
    .line 708
    invoke-virtual/range {v0 .. v13}, Ll/i4c;->l0(Lorg/xmlpull/v1/XmlPullParser;Ll/ske0$c;Ljava/util/List;JJJJJ)Ll/ske0$c;

    .line 709
    .line 710
    .line 711
    move-result-object v2

    .line 712
    move-wide v7, v8

    .line 713
    move-object v4, v2

    .line 714
    move-object/from16 v6, v20

    .line 715
    .line 716
    move/from16 v9, v23

    .line 717
    .line 718
    move/from16 v5, v24

    .line 719
    .line 720
    move-object/from16 v2, v35

    .line 721
    .line 722
    move-wide/from16 v23, v10

    .line 723
    .line 724
    goto :goto_8

    .line 725
    :cond_f
    move-object v3, v13

    .line 726
    const-string v0, "InbandEventStream"

    .line 727
    .line 728
    invoke-static {v1, v0}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 729
    .line 730
    .line 731
    move-result v2

    .line 732
    if-eqz v2, :cond_10

    .line 733
    .line 734
    invoke-static {v1, v0}, Ll/i4c;->I(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ll/tvd;

    .line 735
    .line 736
    .line 737
    move-result-object v0

    .line 738
    move-object/from16 v2, v35

    .line 739
    .line 740
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 741
    .line 742
    .line 743
    goto :goto_7

    .line 744
    :cond_10
    move-object/from16 v2, v35

    .line 745
    .line 746
    const-string v0, "Label"

    .line 747
    .line 748
    invoke-static {v1, v0}, Ll/lmq0;->f(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 749
    .line 750
    .line 751
    move-result v0

    .line 752
    if-eqz v0, :cond_12

    .line 753
    .line 754
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->V(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    .line 755
    .line 756
    .line 757
    move-result-object v31

    .line 758
    :cond_11
    :goto_7
    move/from16 v9, v23

    .line 759
    .line 760
    move-wide/from16 v40, v5

    .line 761
    .line 762
    move-object/from16 v6, v20

    .line 763
    .line 764
    move/from16 v5, v24

    .line 765
    .line 766
    goto :goto_6

    .line 767
    :cond_12
    invoke-static {v1}, Ll/lmq0;->e(Lorg/xmlpull/v1/XmlPullParser;)Z

    .line 768
    .line 769
    .line 770
    move-result v0

    .line 771
    if-eqz v0, :cond_11

    .line 772
    .line 773
    invoke-virtual/range {p0 .. p1}, Ll/i4c;->z(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 774
    .line 775
    .line 776
    goto :goto_7

    .line 777
    :goto_8
    const-string v0, "AdaptationSet"

    .line 778
    .line 779
    invoke-static {v1, v0}, Ll/lmq0;->d(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 780
    .line 781
    .line 782
    move-result v0

    .line 783
    if-eqz v0, :cond_14

    .line 784
    .line 785
    new-instance v0, Ljava/util/ArrayList;

    .line 786
    .line 787
    invoke-interface/range {p9 .. p9}, Ljava/util/List;->size()I

    .line 788
    .line 789
    .line 790
    move-result v1

    .line 791
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 792
    .line 793
    .line 794
    move/from16 v1, v30

    .line 795
    .line 796
    :goto_9
    invoke-interface/range {p9 .. p9}, Ljava/util/List;->size()I

    .line 797
    .line 798
    .line 799
    move-result v4

    .line 800
    if-ge v1, v4, :cond_13

    .line 801
    .line 802
    move-object/from16 v10, p9

    .line 803
    .line 804
    invoke-interface {v10, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 805
    .line 806
    .line 807
    move-result-object v4

    .line 808
    check-cast v4, Ll/i4c$a;

    .line 809
    .line 810
    move-object/from16 p1, p0

    .line 811
    .line 812
    move-object/from16 p6, v2

    .line 813
    .line 814
    move-object/from16 p2, v4

    .line 815
    .line 816
    move-object/from16 p3, v31

    .line 817
    .line 818
    move-object/from16 p4, v33

    .line 819
    .line 820
    move-object/from16 p5, v34

    .line 821
    .line 822
    invoke-virtual/range {p1 .. p6}, Ll/i4c;->j(Ll/i4c$a;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ll/t1d0;

    .line 823
    .line 824
    .line 825
    move-result-object v2

    .line 826
    move-object/from16 v35, p6

    .line 827
    .line 828
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 829
    .line 830
    .line 831
    add-int/lit8 v1, v1, 0x1

    .line 832
    .line 833
    move-object/from16 v2, v35

    .line 834
    .line 835
    goto :goto_9

    .line 836
    :cond_13
    move-object/from16 p1, p0

    .line 837
    .line 838
    move-object/from16 p5, v0

    .line 839
    .line 840
    move-object/from16 p8, v3

    .line 841
    .line 842
    move/from16 p4, v5

    .line 843
    .line 844
    move-object/from16 p6, v16

    .line 845
    .line 846
    move-object/from16 p7, v19

    .line 847
    .line 848
    move-wide/from16 p2, v28

    .line 849
    .line 850
    invoke-virtual/range {p1 .. p8}, Ll/i4c;->c(JILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ll/y70;

    .line 851
    .line 852
    .line 853
    move-result-object v0

    .line 854
    return-object v0

    .line 855
    :cond_14
    move-object/from16 v0, p0

    .line 856
    .line 857
    move v10, v15

    .line 858
    move-object/from16 v13, v16

    .line 859
    .line 860
    move-object/from16 v12, v18

    .line 861
    .line 862
    move-object/from16 v11, v39

    .line 863
    .line 864
    move-object/from16 v18, p9

    .line 865
    .line 866
    move-object v15, v3

    .line 867
    move-object/from16 v16, v4

    .line 868
    .line 869
    move-wide v3, v7

    .line 870
    move v8, v14

    .line 871
    move-object/from16 v7, v19

    .line 872
    .line 873
    move-object/from16 v14, v34

    .line 874
    .line 875
    move-object/from16 v19, v2

    .line 876
    .line 877
    move-object/from16 v2, v37

    .line 878
    .line 879
    goto/16 :goto_0
.end method

.method public z(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/i4c;->w(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
