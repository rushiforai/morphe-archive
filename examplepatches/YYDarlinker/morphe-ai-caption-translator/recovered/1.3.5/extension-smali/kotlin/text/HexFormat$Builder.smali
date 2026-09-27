.class public final Lkotlin/text/HexFormat$Builder;
.super Ljava/lang/Object;
.source "HexFormat.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/text/HexFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\r\u0008A\u001a\u0002\u0008\u0004\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J*\u0010\u000b\u001a\u00020\u00152\u0017\u0010\u0016\u001a\u0013\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\u00150\u0017\u00a2\u0006\u0002\u0008\u0018H\u0087\u0088\u0004b\u0002\u0008\u0019\u00f8\u0001\u0000J*\u0010\u0010\u001a\u00020\u00152\u0017\u0010\u0016\u001a\u0013\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u00150\u0017\u00a2\u0006\u0002\u0008\u0018H\u0087\u0088\u0004b\u0002\u0008\u0019\u00f8\u0001\u0000J\u000e\u0010\u001a\u001a\u00020\u001bH\u0081\u0080\u0004b\u0002\u0008\u0004R\u001b\u0010\u0005\u001a\u00020\u0006X\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR\u0015\u0010\u000b\u001a\u00020\u000c8FX\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\r\u0010\u000eR\u0011\u0010\u000f\u001a\u0004\u0018\u00010\u000cX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0010\u001a\u00020\u00118FX\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0013R\u0011\u0010\u0014\u001a\u0004\u0018\u00010\u0011X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u001c"
    }
    d2 = {
        "Lkotlin/text/HexFormat$Builder;",
        "",
        "<init>",
        "()V",
        "Lkotlin/PublishedApi;",
        "upperCase",
        "",
        "getUpperCase",
        "()Z",
        "setUpperCase",
        "(Z)V",
        "bytes",
        "Lkotlin/text/HexFormat$BytesHexFormat$Builder;",
        "getBytes",
        "()Lkotlin/text/HexFormat$BytesHexFormat$Builder;",
        "_bytes",
        "number",
        "Lkotlin/text/HexFormat$NumberHexFormat$Builder;",
        "getNumber",
        "()Lkotlin/text/HexFormat$NumberHexFormat$Builder;",
        "_number",
        "",
        "builderAction",
        "Lkotlin/Function1;",
        "Lkotlin/ExtensionFunctionType;",
        "Lkotlin/internal/InlineOnly;",
        "build",
        "Lkotlin/text/HexFormat;",
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
.field private _bytes:Lkotlin/text/HexFormat$BytesHexFormat$Builder;

.field private _number:Lkotlin/text/HexFormat$NumberHexFormat$Builder;

.field private upperCase:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 645
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 653
    sget-object v0, Lkotlin/text/HexFormat;->Companion:Lkotlin/text/HexFormat$Companion;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$Companion;->getDefault()Lkotlin/text/HexFormat;

    move-result-object v0

    invoke-virtual {v0}, Lkotlin/text/HexFormat;->getUpperCase()Z

    move-result v0

    iput-boolean v0, p0, Lkotlin/text/HexFormat$Builder;->upperCase:Z

    return-void
.end method

.method private final bytes(Lkotlin/jvm/functions/Function1;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lkotlin/text/HexFormat$BytesHexFormat$Builder;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "builderAction"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 719
    invoke-virtual {p0}, Lkotlin/text/HexFormat$Builder;->getBytes()Lkotlin/text/HexFormat$BytesHexFormat$Builder;

    move-result-object p0

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private final number(Lkotlin/jvm/functions/Function1;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lkotlin/text/HexFormat$NumberHexFormat$Builder;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "builderAction"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 754
    invoke-virtual {p0}, Lkotlin/text/HexFormat$Builder;->getNumber()Lkotlin/text/HexFormat$NumberHexFormat$Builder;

    move-result-object p0

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final build()Lkotlin/text/HexFormat;
    .registers 4

    .line 759
    new-instance v0, Lkotlin/text/HexFormat;

    .line 760
    iget-boolean v1, p0, Lkotlin/text/HexFormat$Builder;->upperCase:Z

    .line 761
    iget-object v2, p0, Lkotlin/text/HexFormat$Builder;->_bytes:Lkotlin/text/HexFormat$BytesHexFormat$Builder;

    if-eqz v2, :cond_e

    invoke-virtual {v2}, Lkotlin/text/HexFormat$BytesHexFormat$Builder;->build$kotlin_stdlib()Lkotlin/text/HexFormat$BytesHexFormat;

    move-result-object v2

    if-nez v2, :cond_14

    :cond_e
    sget-object v2, Lkotlin/text/HexFormat$BytesHexFormat;->Companion:Lkotlin/text/HexFormat$BytesHexFormat$Companion;

    invoke-virtual {v2}, Lkotlin/text/HexFormat$BytesHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$BytesHexFormat;

    move-result-object v2

    .line 762
    :cond_14
    iget-object p0, p0, Lkotlin/text/HexFormat$Builder;->_number:Lkotlin/text/HexFormat$NumberHexFormat$Builder;

    if-eqz p0, :cond_1e

    invoke-virtual {p0}, Lkotlin/text/HexFormat$NumberHexFormat$Builder;->build$kotlin_stdlib()Lkotlin/text/HexFormat$NumberHexFormat;

    move-result-object p0

    if-nez p0, :cond_24

    :cond_1e
    sget-object p0, Lkotlin/text/HexFormat$NumberHexFormat;->Companion:Lkotlin/text/HexFormat$NumberHexFormat$Companion;

    invoke-virtual {p0}, Lkotlin/text/HexFormat$NumberHexFormat$Companion;->getDefault$kotlin_stdlib()Lkotlin/text/HexFormat$NumberHexFormat;

    move-result-object p0

    .line 759
    :cond_24
    invoke-direct {v0, v1, v2, p0}, Lkotlin/text/HexFormat;-><init>(ZLkotlin/text/HexFormat$BytesHexFormat;Lkotlin/text/HexFormat$NumberHexFormat;)V

    return-object v0
.end method

.method public final getBytes()Lkotlin/text/HexFormat$BytesHexFormat$Builder;
    .registers 2

    .line 663
    iget-object v0, p0, Lkotlin/text/HexFormat$Builder;->_bytes:Lkotlin/text/HexFormat$BytesHexFormat$Builder;

    if-nez v0, :cond_b

    .line 664
    new-instance v0, Lkotlin/text/HexFormat$BytesHexFormat$Builder;

    invoke-direct {v0}, Lkotlin/text/HexFormat$BytesHexFormat$Builder;-><init>()V

    iput-object v0, p0, Lkotlin/text/HexFormat$Builder;->_bytes:Lkotlin/text/HexFormat$BytesHexFormat$Builder;

    .line 666
    :cond_b
    iget-object p0, p0, Lkotlin/text/HexFormat$Builder;->_bytes:Lkotlin/text/HexFormat$BytesHexFormat$Builder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object p0
.end method

.method public final getNumber()Lkotlin/text/HexFormat$NumberHexFormat$Builder;
    .registers 2

    .line 679
    iget-object v0, p0, Lkotlin/text/HexFormat$Builder;->_number:Lkotlin/text/HexFormat$NumberHexFormat$Builder;

    if-nez v0, :cond_b

    .line 680
    new-instance v0, Lkotlin/text/HexFormat$NumberHexFormat$Builder;

    invoke-direct {v0}, Lkotlin/text/HexFormat$NumberHexFormat$Builder;-><init>()V

    iput-object v0, p0, Lkotlin/text/HexFormat$Builder;->_number:Lkotlin/text/HexFormat$NumberHexFormat$Builder;

    .line 682
    :cond_b
    iget-object p0, p0, Lkotlin/text/HexFormat$Builder;->_number:Lkotlin/text/HexFormat$NumberHexFormat$Builder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object p0
.end method

.method public final getUpperCase()Z
    .registers 1

    .line 653
    iget-boolean p0, p0, Lkotlin/text/HexFormat$Builder;->upperCase:Z

    return p0
.end method

.method public final setUpperCase(Z)V
    .registers 2

    .line 653
    iput-boolean p1, p0, Lkotlin/text/HexFormat$Builder;->upperCase:Z

    return-void
.end method
