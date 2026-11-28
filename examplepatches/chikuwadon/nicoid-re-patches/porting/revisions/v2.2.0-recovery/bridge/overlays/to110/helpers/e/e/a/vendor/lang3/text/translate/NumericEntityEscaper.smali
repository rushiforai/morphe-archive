.class public final Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;
.super Le/e/a/vendor/lang3/text/translate/CodePointTranslator;
.source "SourceFile"


# instance fields
.field public final above:S

.field public final below:S


# direct methods
.method public constructor <init>(II)V
    .registers 3

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-short p1, p0, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;->below:S

    .line 100
    iput-short p2, p0, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;->above:S

    return-void
.end method


# virtual methods
.method public final translate(ILjava/io/StringWriter;)Z
    .registers 4

    .line 113
    iget-short v0, p0, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;->below:S

    if-lt p1, v0, :cond_0

    .line 110
    iget-short p0, p0, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;->above:S

    if-gt p1, p0, :cond_0

    .line 117
    const-string p0, "&#"

    invoke-virtual {p2, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/16 p0, 0xa

    .line 118
    invoke-static {p1, p0}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/16 p0, 0x3b

    .line 119
    invoke-virtual {p2, p0}, Ljava/io/Writer;->write(I)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
