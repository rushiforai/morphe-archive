.class public final Le/e/a/vendor/lang3/text/translate/OctalUnescaper;
.super Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;
.source "SourceFile"


# instance fields
.field public final synthetic $r8$classId:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Le/e/a/vendor/lang3/text/translate/OctalUnescaper;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final translate(Ljava/lang/String;ILjava/io/StringWriter;)I
    .registers 12

    iget-byte p0, p0, Le/e/a/vendor/lang3/text/translate/OctalUnescaper;->$r8$classId:B

    const/4 v0, 0x2

    const/16 v1, 0x5c

    const/4 v2, 0x0

    packed-switch p0, :pswitch_data_0

    .line 52
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p0

    if-ne p0, v1, :cond_3

    add-int/lit8 p0, p2, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge p0, v1, :cond_3

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v1, 0x75

    if-ne p0, v1, :cond_3

    :goto_0
    add-int p0, p2, v0

    .line 55
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge p0, v3, :cond_0

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge p0, v1, :cond_1

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v1, 0x2b

    if-ne p0, v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    :cond_1
    add-int/2addr p2, v0

    add-int/lit8 p0, p2, 0x4

    .line 61
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-gt p0, v1, :cond_3

    .line 63
    invoke-virtual {p1, p2, p0}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    move p1, v2

    :goto_1
    const/4 p2, 0x4

    if-ge p1, p2, :cond_2

    .line 70
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p2

    invoke-static {p2}, Le/e/a/vendor/lang3/CharUtils;->isHex(C)Z

    move-result p2

    if-eqz p2, :cond_3

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 74
    :cond_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x10

    invoke-static {p0, p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    int-to-char p0, p0

    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(I)V

    add-int/lit8 v2, v0, 0x4

    :cond_3
    return v2

    .line 62
    :pswitch_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    sub-int/2addr p0, p2

    const/4 v3, 0x1

    sub-int/2addr p0, v3

    .line 63
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v1, :cond_5

    if-lez p0, :cond_5

    add-int/lit8 v1, p2, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    sget v6, Le/e/a/vendor/lang3/CharUtils;->$r8$clinit:I

    const/16 v6, 0x30

    if-lt v5, v6, :cond_5

    const/16 v7, 0x37

    if-gt v5, v7, :cond_5

    add-int/lit8 v2, p2, 0x2

    add-int/lit8 p2, p2, 0x3

    .line 69
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-le p0, v3, :cond_4

    .line 70
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-lt v5, v6, :cond_4

    if-gt v5, v7, :cond_4

    .line 71
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-le p0, v0, :cond_4

    .line 72
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    if-lt p0, v6, :cond_4

    const/16 v0, 0x33

    if-gt p0, v0, :cond_4

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p0

    if-lt p0, v6, :cond_4

    if-gt p0, v7, :cond_4

    .line 73
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x8

    invoke-static {p0, p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(I)V

    .line 77
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    add-int/lit8 v2, p0, 0x1

    :cond_5
    return v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
