.class public final Lkotlin/io/encoding/Base64$Default;
.super Lkotlin/io/encoding/Base64;
.source "Base64.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/io/encoding/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Default"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u0005\n\u0002\u0008\u0003\n\u0002\u0010\u0012\n\u0002\u0008\n\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u000f\u0010\u0004\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0006\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0007\u001a\u00020\u0005X\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0008\u001a\u00020\u0005X\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\t\u001a\u00020\nX\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000b\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000c\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\r\u001a\u00020\u000eX\u0080\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0015\u0010\u0011\u001a\u00020\u0001X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u0015\u0010\u0014\u001a\u00020\u0001X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0013R\u0015\u0010\u0016\u001a\u00020\u0001X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0013\u00a8\u0006\u0018"
    }
    d2 = {
        "Lkotlin/io/encoding/Base64$Default;",
        "Lkotlin/io/encoding/Base64;",
        "<init>",
        "()V",
        "bitsPerByte",
        "",
        "bitsPerSymbol",
        "bytesPerGroup",
        "symbolsPerGroup",
        "padSymbol",
        "",
        "lineLengthMime",
        "lineLengthPem",
        "mimeLineSeparatorSymbols",
        "",
        "getMimeLineSeparatorSymbols$kotlin_stdlib",
        "()[B",
        "UrlSafe",
        "getUrlSafe",
        "()Lkotlin/io/encoding/Base64;",
        "Mime",
        "getMime",
        "Pem",
        "getPem",
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


# direct methods
.method private constructor <init>()V
    .registers 7

    .line 707
    sget-object v4, Lkotlin/io/encoding/Base64$PaddingOption;->PRESENT:Lkotlin/io/encoding/Base64$PaddingOption;

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, -0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lkotlin/io/encoding/Base64;-><init>(ZZILkotlin/io/encoding/Base64$PaddingOption;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lkotlin/io/encoding/Base64$Default;-><init>()V

    return-void
.end method


# virtual methods
.method public final getMime()Lkotlin/io/encoding/Base64;
    .registers 1

    .line 753
    # getter for: Lkotlin/io/encoding/Base64;->Mime:Lkotlin/io/encoding/Base64;
    invoke-static {}, Lkotlin/io/encoding/Base64;->access$getMime$cp()Lkotlin/io/encoding/Base64;

    move-result-object p0

    return-object p0
.end method

.method public final getMimeLineSeparatorSymbols$kotlin_stdlib()[B
    .registers 1

    .line 719
    # getter for: Lkotlin/io/encoding/Base64;->mimeLineSeparatorSymbols:[B
    invoke-static {}, Lkotlin/io/encoding/Base64;->access$getMimeLineSeparatorSymbols$cp()[B

    move-result-object p0

    return-object p0
.end method

.method public final getPem()Lkotlin/io/encoding/Base64;
    .registers 1

    .line 770
    # getter for: Lkotlin/io/encoding/Base64;->Pem:Lkotlin/io/encoding/Base64;
    invoke-static {}, Lkotlin/io/encoding/Base64;->access$getPem$cp()Lkotlin/io/encoding/Base64;

    move-result-object p0

    return-object p0
.end method

.method public final getUrlSafe()Lkotlin/io/encoding/Base64;
    .registers 1

    .line 736
    # getter for: Lkotlin/io/encoding/Base64;->UrlSafe:Lkotlin/io/encoding/Base64;
    invoke-static {}, Lkotlin/io/encoding/Base64;->access$getUrlSafe$cp()Lkotlin/io/encoding/Base64;

    move-result-object p0

    return-object p0
.end method
