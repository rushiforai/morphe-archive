.class public final Lkotlin/text/HexFormat$BytesHexFormat$Builder;
.super Ljava/lang/Object;
.source "HexFormat.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/text/HexFormat$BytesHexFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0010\u000e\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\t\u0008@\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u001d\u001a\u00020\u001eH\u0080\u0080\u0004\u00a2\u0006\u0002\u0008\u001fR%\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0004\u001a\u00020\u0005@FX\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR%\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u0004\u001a\u00020\u0005@FX\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\u0008\"\u0004\u0008\r\u0010\nR\u001b\u0010\u000e\u001a\u00020\u000fX\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013R%\u0010\u0014\u001a\u00020\u000f2\u0006\u0010\u0004\u001a\u00020\u000f@FX\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0015\u0010\u0011\"\u0004\u0008\u0016\u0010\u0013R%\u0010\u0017\u001a\u00020\u000f2\u0006\u0010\u0004\u001a\u00020\u000f@FX\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0018\u0010\u0011\"\u0004\u0008\u0019\u0010\u0013R%\u0010\u001a\u001a\u00020\u000f2\u0006\u0010\u0004\u001a\u00020\u000f@FX\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001b\u0010\u0011\"\u0004\u0008\u001c\u0010\u0013\u00a8\u0006 "
    }
    d2 = {
        "Lkotlin/text/HexFormat$BytesHexFormat$Builder;",
        "",
        "<init>",
        "()V",
        "value",
        "",
        "bytesPerLine",
        "getBytesPerLine",
        "()I",
        "setBytesPerLine",
        "(I)V",
        "bytesPerGroup",
        "getBytesPerGroup",
        "setBytesPerGroup",
        "groupSeparator",
        "",
        "getGroupSeparator",
        "()Ljava/lang/String;",
        "setGroupSeparator",
        "(Ljava/lang/String;)V",
        "byteSeparator",
        "getByteSeparator",
        "setByteSeparator",
        "bytePrefix",
        "getBytePrefix",
        "setBytePrefix",
        "byteSuffix",
        "getByteSuffix",
        "setByteSuffix",
        "build",
        "Lkotlin/text/HexFormat$BytesHexFormat;",
        "build$kotlin_stdlib",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private bytePrefix:Ljava/lang/String;

.field private byteSeparator:Ljava/lang/String;

.field private byteSuffix:Ljava/lang/String;

.field private bytesPerGroup:I

.field private bytesPerLine:I

.field private groupSeparator:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 283
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 296
    sget-object v0, Lkotlin/text/HexFormat$BytesHexFormat;->Companion:Lkotlin/text/HexFormat$BytesHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$BytesHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat;->getBytesPerLine()I

    move-result v0

    iput v0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytesPerLine:I

    .line 315
    sget-object v0, Lkotlin/text/HexFormat$BytesHexFormat;->Companion:Lkotlin/text/HexFormat$BytesHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$BytesHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat;->getBytesPerGroup()I

    move-result v0

    iput v0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytesPerGroup:I

    .line 330
    sget-object v0, Lkotlin/text/HexFormat$BytesHexFormat;->Companion:Lkotlin/text/HexFormat$BytesHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$BytesHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat;->getGroupSeparator()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->groupSeparator:Ljava/lang/String;

    .line 344
    sget-object v0, Lkotlin/text/HexFormat$BytesHexFormat;->Companion:Lkotlin/text/HexFormat$BytesHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$BytesHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat;->getByteSeparator()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->byteSeparator:Ljava/lang/String;

    .line 363
    sget-object v0, Lkotlin/text/HexFormat$BytesHexFormat;->Companion:Lkotlin/text/HexFormat$BytesHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$BytesHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat;->getBytePrefix()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytePrefix:Ljava/lang/String;

    .line 382
    sget-object v0, Lkotlin/text/HexFormat$BytesHexFormat;->Companion:Lkotlin/text/HexFormat$BytesHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$BytesHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$BytesHexFormat;->getByteSuffix()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->byteSuffix:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final build$kotlin_stdlib()Lkotlin/text/HexFormat$BytesHexFormat;
    .registers 8

    .line 390
    new-instance v0, Lkotlin/text/HexFormat$BytesHexFormat;

    iget v1, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytesPerLine:I

    iget v2, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytesPerGroup:I

    iget-object v3, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->groupSeparator:Ljava/lang/String;

    iget-object v4, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->byteSeparator:Ljava/lang/String;

    iget-object v5, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytePrefix:Ljava/lang/String;

    iget-object v6, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->byteSuffix:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lkotlin/text/HexFormat$BytesHexFormat;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final getBytePrefix()Ljava/lang/String;
    .registers 1

    .line 363
    iget-object p0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytePrefix:Ljava/lang/String;

    return-object p0
.end method

.method public final getByteSeparator()Ljava/lang/String;
    .registers 1

    .line 344
    iget-object p0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->byteSeparator:Ljava/lang/String;

    return-object p0
.end method

.method public final getByteSuffix()Ljava/lang/String;
    .registers 1

    .line 382
    iget-object p0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->byteSuffix:Ljava/lang/String;

    return-object p0
.end method

.method public final getBytesPerGroup()I
    .registers 1

    .line 315
    iget p0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytesPerGroup:I

    return p0
.end method

.method public final getBytesPerLine()I
    .registers 1

    .line 296
    iget p0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytesPerLine:I

    return p0
.end method

.method public final getGroupSeparator()Ljava/lang/String;
    .registers 1

    .line 330
    iget-object p0, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->groupSeparator:Ljava/lang/String;

    return-object p0
.end method

.method public final setBytePrefix(Ljava/lang/String;)V
    .registers 7

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 365
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    const/16 v1, 0xa

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    const/16 v1, 0xd

    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 367
    iput-object p1, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytePrefix:Ljava/lang/String;

    return-void

    .line 366
    :cond_1e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LF and CR characters are prohibited in bytePrefix, but was "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final setByteSeparator(Ljava/lang/String;)V
    .registers 7

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 346
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    const/16 v1, 0xa

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    const/16 v1, 0xd

    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 348
    iput-object p1, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->byteSeparator:Ljava/lang/String;

    return-void

    .line 347
    :cond_1e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LF and CR characters are prohibited in byteSeparator, but was "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final setByteSuffix(Ljava/lang/String;)V
    .registers 7

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 384
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    const/16 v1, 0xa

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    const/16 v1, 0xd

    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 386
    iput-object p1, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->byteSuffix:Ljava/lang/String;

    return-void

    .line 385
    :cond_1e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LF and CR characters are prohibited in byteSuffix, but was "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final setBytesPerGroup(I)V
    .registers 4

    if-lez p1, :cond_5

    .line 319
    iput p1, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytesPerGroup:I

    return-void

    .line 318
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Non-positive values are prohibited for bytesPerGroup, but was "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final setBytesPerLine(I)V
    .registers 4

    if-lez p1, :cond_5

    .line 300
    iput p1, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->bytesPerLine:I

    return-void

    .line 299
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Non-positive values are prohibited for bytesPerLine, but was "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final setGroupSeparator(Ljava/lang/String;)V
    .registers 3

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 330
    iput-object p1, p0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->groupSeparator:Ljava/lang/String;

    return-void
.end method
