.class public final Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;
.super Le/e/a/vendor/lang3/text/translate/CodePointTranslator;
.source "SourceFile"


# instance fields
.field public final synthetic $r8$classId:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final translate(ILjava/io/StringWriter;)Z
    .registers 7

    iget-byte p0, p0, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;->$r8$classId:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_0

    const p0, 0xd800

    if-lt p1, p0, :cond_0

    const p0, 0xdfff

    if-gt p1, p0, :cond_0

    move v0, v1

    :cond_0
    return v0

    :pswitch_0
    const/16 p0, 0x20

    if-lt p1, p0, :cond_1

    const/16 p0, 0x7f

    if-le p1, p0, :cond_4

    :cond_1
    const p0, 0xffff

    .line 137
    const-string v2, "\\u"

    if-le p1, p0, :cond_3

    .line 116
    invoke-static {p1}, Ljava/lang/Character;->isBmpCodePoint(I)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 117
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x30

    .line 117
    invoke-static {p1, v0}, Le/e/a/vendor/lang3/StringUtils;->leftPad(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 119
    :cond_2
    invoke-static {p1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object p0

    .line 120
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-char v0, p0, v0

    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 120
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-char p0, p0, v1

    .line 51
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 120
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 138
    :goto_0
    invoke-virtual {p2, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    :goto_1
    move v0, v1

    goto :goto_2

    .line 140
    :cond_3
    invoke-virtual {p2, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    shr-int/lit8 p0, p1, 0xc

    and-int/lit8 p0, p0, 0xf

    .line 141
    sget-object v0, Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;->HEX_DIGITS:[C

    aget-char p0, v0, p0

    invoke-virtual {p2, p0}, Ljava/io/Writer;->write(I)V

    shr-int/lit8 p0, p1, 0x8

    and-int/lit8 p0, p0, 0xf

    .line 142
    aget-char p0, v0, p0

    invoke-virtual {p2, p0}, Ljava/io/Writer;->write(I)V

    shr-int/lit8 p0, p1, 0x4

    and-int/lit8 p0, p0, 0xf

    .line 143
    aget-char p0, v0, p0

    invoke-virtual {p2, p0}, Ljava/io/Writer;->write(I)V

    and-int/lit8 p1, p1, 0xf

    .line 144
    aget-char p0, v0, p1

    invoke-virtual {p2, p0}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    :cond_4
    :goto_2
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
