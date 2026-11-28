.class final Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Huffman;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Node"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0008\u0008\u0008\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0002\u0010\u0003B\u0019\u0008\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0002\u0010\u0007R\u001d\u0010\u0008\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0000\u0018\u00010\t\u00a2\u0006\n\n\u0002\u0010\u000c\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0011\u0010\u000f\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u000e\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;",
        "",
        "<init>",
        "()V",
        "symbol",
        "",
        "bits",
        "(II)V",
        "children",
        "",
        "getChildren",
        "()[Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;",
        "[Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;",
        "getSymbol",
        "()I",
        "terminalBitCount",
        "getTerminalBitCount",
        "okhttp"
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
.field private final children:[Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;

.field private final symbol:I

.field private final terminalBitCount:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 682
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 683
    const/16 v0, 0x100

    new-array v0, v0, [Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;->children:[Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;

    .line 684
    const/4 v0, 0x0

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;->symbol:I

    .line 685
    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;->terminalBitCount:I

    return-void
.end method

.method public constructor <init>(II)V
    .registers 4

    .line 689
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 690
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;->children:[Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;

    .line 691
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;->symbol:I

    and-int/lit8 p2, p2, 0x7

    if-nez p2, :cond_0

    const/16 p2, 0x8

    .line 693
    :cond_0
    iput p2, p0, Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;->terminalBitCount:I

    return-void
.end method


# virtual methods
.method public final getChildren()[Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;
    .registers 2

    .line 673
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;->children:[Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;

    return-object v0
.end method

.method public final getSymbol()I
    .registers 2

    .line 676
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;->symbol:I

    return v0
.end method

.method public final getTerminalBitCount()I
    .registers 2

    .line 679
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Huffman$Node;->terminalBitCount:I

    return v0
.end method
