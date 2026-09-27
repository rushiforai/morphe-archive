.class public final Lkotlin/text/HexFormat$NumberHexFormat$Builder;
.super Ljava/lang/Object;
.source "HexFormat.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/text/HexFormat$NumberHexFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nHexFormat.kt\nKotlin\n*S Kotlin\n*F\n+ 1 HexFormat.kt\nkotlin/text/HexFormat$NumberHexFormat$Builder\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,845:1\n1#2:846\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\t\u0008@\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u001e\u001a\u00020\u001fH\u0080\u0080\u0004\u00a2\u0006\u0002\u0008 R%\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0004\u001a\u00020\u0005@FX\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR%\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u0004\u001a\u00020\u0005@FX\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\u0008\"\u0004\u0008\r\u0010\nR\u001b\u0010\u000e\u001a\u00020\u000fX\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013R;\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0004\u001a\u00020\u00148\u0006@FX\u0087\u008e\u0008r\u000c\u0008\u001b\u0012\u0008\u0008\u001c\u0012\u0004\u0008\u0008(\u001d\u00a2\u0006\u0014\n\u0000\u0012\u0004\u0008\u0016\u0010\u0003\u001a\u0004\u0008\u0017\u0010\u0018\"\u0004\u0008\u0019\u0010\u001a\u00a8\u0006!"
    }
    d2 = {
        "Lkotlin/text/HexFormat$NumberHexFormat$Builder;",
        "",
        "<init>",
        "()V",
        "value",
        "",
        "prefix",
        "getPrefix",
        "()Ljava/lang/String;",
        "setPrefix",
        "(Ljava/lang/String;)V",
        "suffix",
        "getSuffix",
        "setSuffix",
        "removeLeadingZeros",
        "",
        "getRemoveLeadingZeros",
        "()Z",
        "setRemoveLeadingZeros",
        "(Z)V",
        "",
        "minLength",
        "getMinLength$annotations",
        "getMinLength",
        "()I",
        "setMinLength",
        "(I)V",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.0",
        "build",
        "Lkotlin/text/HexFormat$NumberHexFormat;",
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
.field private minLength:I

.field private prefix:Ljava/lang/String;

.field private removeLeadingZeros:Z

.field private suffix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 548
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 561
    sget-object v0, Lkotlin/text/HexFormat$NumberHexFormat;->Companion:Lkotlin/text/HexFormat$NumberHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$NumberHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$NumberHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$NumberHexFormat;->getPrefix()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->prefix:Ljava/lang/String;

    .line 580
    sget-object v0, Lkotlin/text/HexFormat$NumberHexFormat;->Companion:Lkotlin/text/HexFormat$NumberHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$NumberHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$NumberHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$NumberHexFormat;->getSuffix()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->suffix:Ljava/lang/String;

    .line 595
    sget-object v0, Lkotlin/text/HexFormat$NumberHexFormat;->Companion:Lkotlin/text/HexFormat$NumberHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$NumberHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$NumberHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$NumberHexFormat;->getRemoveLeadingZeros()Z

    move-result v0

    iput-boolean v0, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->removeLeadingZeros:Z

    .line 610
    sget-object v0, Lkotlin/text/HexFormat$NumberHexFormat;->Companion:Lkotlin/text/HexFormat$NumberHexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$NumberHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$NumberHexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat$NumberHexFormat;->getMinLength()I

    move-result v0

    iput v0, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->minLength:I

    return-void
.end method

.method public static synthetic getMinLength$annotations()V
    .registers 0

    return-void
.end method


# virtual methods
.method public final build$kotlin_stdlib()Lkotlin/text/HexFormat$NumberHexFormat;
    .registers 5

    .line 617
    new-instance v0, Lkotlin/text/HexFormat$NumberHexFormat;

    iget-object v1, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->prefix:Ljava/lang/String;

    iget-object v2, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->suffix:Ljava/lang/String;

    iget-boolean v3, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->removeLeadingZeros:Z

    iget p0, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->minLength:I

    invoke-direct {v0, v1, v2, v3, p0}, Lkotlin/text/HexFormat$NumberHexFormat;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    return-object v0
.end method

.method public final getMinLength()I
    .registers 1

    .line 610
    iget p0, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->minLength:I

    return p0
.end method

.method public final getPrefix()Ljava/lang/String;
    .registers 1

    .line 561
    iget-object p0, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->prefix:Ljava/lang/String;

    return-object p0
.end method

.method public final getRemoveLeadingZeros()Z
    .registers 1

    .line 595
    iget-boolean p0, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->removeLeadingZeros:Z

    return p0
.end method

.method public final getSuffix()Ljava/lang/String;
    .registers 1

    .line 580
    iget-object p0, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->suffix:Ljava/lang/String;

    return-object p0
.end method

.method public final setMinLength(I)V
    .registers 3

    if-lez p1, :cond_5

    .line 613
    iput p1, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->minLength:I

    return-void

    .line 612
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Non-positive values are prohibited for minLength, but was "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setPrefix(Ljava/lang/String;)V
    .registers 7

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 563
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

    .line 565
    iput-object p1, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->prefix:Ljava/lang/String;

    return-void

    .line 564
    :cond_1e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LF and CR characters are prohibited in prefix, but was "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final setRemoveLeadingZeros(Z)V
    .registers 2

    .line 595
    iput-boolean p1, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->removeLeadingZeros:Z

    return-void
.end method

.method public final setSuffix(Ljava/lang/String;)V
    .registers 7

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 582
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

    .line 584
    iput-object p1, p0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->suffix:Ljava/lang/String;

    return-void

    .line 583
    :cond_1e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LF and CR characters are prohibited in suffix, but was "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
