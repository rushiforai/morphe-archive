.class public Lorg/spongycastle/asn1/OIDTokenizer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private index:I

.field private oid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/asn1/OIDTokenizer;->oid:Ljava/lang/String;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lorg/spongycastle/asn1/OIDTokenizer;->index:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public hasMoreTokens()Z
    .locals 1

    .line 1
    iget p0, p0, Lorg/spongycastle/asn1/OIDTokenizer;->index:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public nextToken()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/asn1/OIDTokenizer;->index:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v2, p0, Lorg/spongycastle/asn1/OIDTokenizer;->oid:Ljava/lang/String;

    .line 9
    .line 10
    const/16 v3, 0x2e

    .line 11
    .line 12
    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->indexOf(II)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v2, p0, Lorg/spongycastle/asn1/OIDTokenizer;->oid:Ljava/lang/String;

    .line 17
    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    iget v0, p0, Lorg/spongycastle/asn1/OIDTokenizer;->index:I

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput v1, p0, Lorg/spongycastle/asn1/OIDTokenizer;->index:I

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    iget v1, p0, Lorg/spongycastle/asn1/OIDTokenizer;->index:I

    .line 30
    .line 31
    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    iput v0, p0, Lorg/spongycastle/asn1/OIDTokenizer;->index:I

    .line 38
    .line 39
    return-object v1
.end method
