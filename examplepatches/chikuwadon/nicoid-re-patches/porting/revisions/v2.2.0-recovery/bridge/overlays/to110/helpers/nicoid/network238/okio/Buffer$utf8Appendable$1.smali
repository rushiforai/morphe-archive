.class public final Lnicoid/network238/okio/Buffer$utf8Appendable$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Appendable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/Buffer;->utf8Appendable()Ljava/lang/Appendable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\r\n\u0002\u0008\u0005\n\u0002\u0010\u000c\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00060\u0001j\u0002`\u0002J\u0017\u0010\u0005\u001a\u00020\u00002\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0016\u00a2\u0006\u0002\u0010\u0008J\'\u0010\u0005\u001a\u00020\u00002\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u0004H\u0016\u00a2\u0006\u0002\u0010\u000bJ\u0015\u0010\u0005\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\rH\u0016\u00a2\u0006\u0002\u0010\u000eR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "nicoid/network238/okio/Buffer$utf8Appendable$1",
        "Ljava/lang/Appendable;",
        "Lnicoid/network238/kotlin/text/Appendable;",
        "savedHighSurrogate",
        "",
        "append",
        "charSequence",
        "",
        "(Ljava/lang/CharSequence;)Lnicoid/network238/okio/Buffer$utf8Appendable$1;",
        "beginIndex",
        "endIndex",
        "(Ljava/lang/CharSequence;II)Lnicoid/network238/okio/Buffer$utf8Appendable$1;",
        "c",
        "",
        "(C)Lnicoid/network238/okio/Buffer$utf8Appendable$1;",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private savedHighSurrogate:I

.field final synthetic this$0:Lnicoid/network238/okio/Buffer;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/Buffer;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->this$0:Lnicoid/network238/okio/Buffer;

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .registers 2

    .line 109
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->append(C)Lnicoid/network238/okio/Buffer$utf8Appendable$1;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .registers 2

    .line 109
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->append(Ljava/lang/CharSequence;)Lnicoid/network238/okio/Buffer$utf8Appendable$1;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .registers 4

    .line 109
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->append(Ljava/lang/CharSequence;II)Lnicoid/network238/okio/Buffer$utf8Appendable$1;

    move-result-object p1

    return-object p1
.end method

.method public append(C)Lnicoid/network238/okio/Buffer$utf8Appendable$1;
    .registers 6

    .line 148
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->this$0:Lnicoid/network238/okio/Buffer;

    .line 152
    iget v1, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->savedHighSurrogate:I

    const v2, 0xdc00

    if-eqz v1, :cond_1

    if-gt v2, p1, :cond_0

    const v3, 0xe000

    if-ge p1, v3, :cond_0

    .line 154
    invoke-static {v1, p1}, Lnicoid/network238/okio/internal/_Utf16Kt;->combineSurrogates(II)I

    move-result p1

    goto :goto_0

    :cond_0
    nop

    .line 156
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    :goto_0
    nop

    .line 158
    const/4 v1, 0x0

    iput v1, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->savedHighSurrogate:I

    :cond_1
    const v1, 0xd800

    if-gt v1, p1, :cond_2

    if-ge p1, v2, :cond_2

    .line 163
    iput p1, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->savedHighSurrogate:I

    return-object p0

    .line 167
    :cond_2
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8CodePoint(I)Lnicoid/network238/okio/Buffer;

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lnicoid/network238/okio/Buffer$utf8Appendable$1;
    .registers 4

    if-eqz p1, :cond_0

    .line 113
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->append(Ljava/lang/CharSequence;II)Lnicoid/network238/okio/Buffer$utf8Appendable$1;

    move-result-object p1

    return-object p1
.end method

.method public append(Ljava/lang/CharSequence;II)Lnicoid/network238/okio/Buffer$utf8Appendable$1;
    .registers 8

    .line 119
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->this$0:Lnicoid/network238/okio/Buffer;

    if-eqz p1, :cond_0

    .line 120
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    :cond_0
    const-string p1, "null"

    :cond_1
    if-ltz p2, :cond_8

    if-lt p3, p2, :cond_7

    .line 124
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-gt p3, v1, :cond_6

    if-eq p2, p3, :cond_5

    .line 130
    iget v1, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->savedHighSurrogate:I

    const v2, 0xdc00

    if-eqz v1, :cond_3

    .line 131
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-gt v2, v1, :cond_2

    const v3, 0xe000

    if-ge v1, v3, :cond_2

    .line 132
    iget v1, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->savedHighSurrogate:I

    add-int/lit8 v3, p2, 0x1

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p2

    invoke-static {v1, p2}, Lnicoid/network238/okio/internal/_Utf16Kt;->combineSurrogates(II)I

    move-result p2

    invoke-virtual {v0, p2}, Lnicoid/network238/okio/Buffer;->writeUtf8CodePoint(I)Lnicoid/network238/okio/Buffer;

    move p2, v3

    goto :goto_0

    :cond_2
    nop

    .line 134
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    :goto_0
    nop

    .line 136
    const/4 v1, 0x0

    iput v1, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->savedHighSurrogate:I

    :cond_3
    if-ge p2, p3, :cond_4

    add-int/lit8 v1, p3, -0x1

    .line 141
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const v3, 0xd800

    if-gt v3, v1, :cond_4

    if-ge v1, v2, :cond_4

    add-int/lit8 p3, p3, -0x1

    .line 142
    invoke-virtual {p1, p3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    iput v1, p0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;->savedHighSurrogate:I

    .line 145
    :cond_4
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;

    :cond_5
    return-object p0

    .line 124
    :cond_6
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "endIndex > string.length: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " > "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 123
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "endIndex < beginIndex: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " < "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 122
    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "beginIndex < 0: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
