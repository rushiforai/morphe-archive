.class public Lorg/spongycastle/asn1/x509/X509NameTokenizer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private buf:Ljava/lang/StringBuffer;

.field private index:I

.field private separator:C

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x2c

    .line 19
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/x509/X509NameTokenizer;-><init>(Ljava/lang/String;C)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;C)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuffer;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->buf:Ljava/lang/StringBuffer;

    .line 10
    .line 11
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->value:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->index:I

    .line 15
    .line 16
    iput-char p2, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->separator:C

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public hasMoreTokens()Z
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->index:I

    .line 2
    .line 3
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eq v0, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public nextToken()Ljava/lang/String;
    .locals 7

    .line 1
    iget v0, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->index:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget v0, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->index:I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    add-int/2addr v0, v1

    .line 17
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->buf:Ljava/lang/StringBuffer;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 21
    .line 22
    .line 23
    move v2, v3

    .line 24
    move v4, v2

    .line 25
    :goto_0
    iget-object v5, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->value:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    if-eq v0, v5, :cond_7

    .line 32
    .line 33
    iget-object v5, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->value:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v5, v0}, Ljava/lang/String;->charAt(I)C

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    const/16 v6, 0x22

    .line 40
    .line 41
    if-ne v5, v6, :cond_2

    .line 42
    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    xor-int/lit8 v4, v4, 0x1

    .line 46
    .line 47
    :cond_1
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->buf:Ljava/lang/StringBuffer;

    .line 48
    .line 49
    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 50
    .line 51
    .line 52
    :goto_1
    move v2, v3

    .line 53
    goto :goto_3

    .line 54
    :cond_2
    if-nez v2, :cond_6

    .line 55
    .line 56
    if-eqz v4, :cond_3

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_3
    const/16 v6, 0x5c

    .line 60
    .line 61
    if-ne v5, v6, :cond_4

    .line 62
    .line 63
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->buf:Ljava/lang/StringBuffer;

    .line 64
    .line 65
    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 66
    .line 67
    .line 68
    move v2, v1

    .line 69
    goto :goto_3

    .line 70
    :cond_4
    iget-char v6, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->separator:C

    .line 71
    .line 72
    if-ne v5, v6, :cond_5

    .line 73
    .line 74
    goto :goto_4

    .line 75
    :cond_5
    iget-object v6, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->buf:Ljava/lang/StringBuffer;

    .line 76
    .line 77
    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 78
    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_6
    :goto_2
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->buf:Ljava/lang/StringBuffer;

    .line 82
    .line 83
    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_7
    :goto_4
    iput v0, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->index:I

    .line 91
    .line 92
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/X509NameTokenizer;->buf:Ljava/lang/StringBuffer;

    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0
.end method
