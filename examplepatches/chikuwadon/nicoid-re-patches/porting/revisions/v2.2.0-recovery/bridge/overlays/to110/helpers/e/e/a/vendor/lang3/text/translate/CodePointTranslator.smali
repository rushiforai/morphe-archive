.class public abstract Le/e/a/vendor/lang3/text/translate/CodePointTranslator;
.super Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;
.source "SourceFile"


# virtual methods
.method public final translate(Ljava/lang/String;ILjava/io/StringWriter;)I
    .registers 4

    .line 47
    invoke-static {p1, p2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result p1

    .line 48
    invoke-virtual {p0, p1, p3}, Le/e/a/vendor/lang3/text/translate/CodePointTranslator;->translate(ILjava/io/StringWriter;)Z

    move-result p0

    return p0
.end method

.method public abstract translate(ILjava/io/StringWriter;)Z
.end method
