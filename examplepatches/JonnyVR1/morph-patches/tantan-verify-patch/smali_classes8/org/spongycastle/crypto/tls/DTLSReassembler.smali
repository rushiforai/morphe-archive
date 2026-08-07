.class Lorg/spongycastle/crypto/tls/DTLSReassembler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;
    }
.end annotation


# instance fields
.field private final body:[B

.field private missing:Ljava/util/Vector;

.field private final msg_type:S


# direct methods
.method public constructor <init>(SI)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/Vector;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 10
    .line 11
    iput-short p1, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->msg_type:S

    .line 12
    .line 13
    new-array p1, p2, [B

    .line 14
    .line 15
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    .line 16
    .line 17
    new-instance p0, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;-><init>(II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public contributeFragment(SI[BIII)V
    .locals 5

    .line 1
    add-int v0, p5, p6

    .line 2
    .line 3
    iget-short v1, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->msg_type:S

    .line 4
    .line 5
    if-ne v1, p1, :cond_7

    .line 6
    .line 7
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    .line 8
    .line 9
    array-length p1, p1

    .line 10
    if-ne p1, p2, :cond_7

    .line 11
    .line 12
    if-le v0, p2, :cond_0

    .line 13
    .line 14
    goto/16 :goto_2

    .line 15
    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    if-nez p6, :cond_1

    .line 18
    .line 19
    if-nez p5, :cond_7

    .line 20
    .line 21
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/util/Vector;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_7

    .line 28
    .line 29
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 30
    .line 31
    invoke-virtual {p2}, Ljava/util/Vector;->firstElement()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    .line 36
    .line 37
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-nez p2, :cond_7

    .line 42
    .line 43
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/util/Vector;->removeElementAt(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    :goto_0
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 50
    .line 51
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-ge p1, p2, :cond_7

    .line 56
    .line 57
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    check-cast p2, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    .line 64
    .line 65
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getStart()I

    .line 66
    .line 67
    .line 68
    move-result p6

    .line 69
    if-lt p6, v0, :cond_2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    .line 73
    .line 74
    .line 75
    move-result p6

    .line 76
    if-le p6, p5, :cond_6

    .line 77
    .line 78
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getStart()I

    .line 79
    .line 80
    .line 81
    move-result p6

    .line 82
    invoke-static {p6, p5}, Ljava/lang/Math;->max(II)I

    .line 83
    .line 84
    .line 85
    move-result p6

    .line 86
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    sub-int v2, v1, p6

    .line 95
    .line 96
    add-int v3, p4, p6

    .line 97
    .line 98
    sub-int/2addr v3, p5

    .line 99
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    .line 100
    .line 101
    invoke-static {p3, v3, v4, p6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getStart()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-ne p6, v2, :cond_4

    .line 109
    .line 110
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    .line 111
    .line 112
    .line 113
    move-result p6

    .line 114
    if-ne v1, p6, :cond_3

    .line 115
    .line 116
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 117
    .line 118
    add-int/lit8 p6, p1, -0x1

    .line 119
    .line 120
    invoke-virtual {p2, p1}, Ljava/util/Vector;->removeElementAt(I)V

    .line 121
    .line 122
    .line 123
    move p1, p6

    .line 124
    goto :goto_1

    .line 125
    :cond_3
    invoke-virtual {p2, v1}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->setStart(I)V

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_4
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-eq v1, v2, :cond_5

    .line 134
    .line 135
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 136
    .line 137
    new-instance v3, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    .line 138
    .line 139
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    invoke-direct {v3, v1, v4}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;-><init>(II)V

    .line 144
    .line 145
    .line 146
    add-int/lit8 p1, p1, 0x1

    .line 147
    .line 148
    invoke-virtual {v2, v3, p1}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 149
    .line 150
    .line 151
    :cond_5
    invoke-virtual {p2, p6}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->setEnd(I)V

    .line 152
    .line 153
    .line 154
    :cond_6
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_7
    :goto_2
    return-void
.end method

.method public getBodyIfComplete()[B
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public getMsgType()S
    .locals 0

    .line 1
    iget-short p0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->msg_type:S

    .line 2
    .line 3
    return p0
.end method

.method public reset()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 7
    .line 8
    new-instance v1, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    .line 9
    .line 10
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    .line 11
    .line 12
    array-length p0, p0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v1, v2, p0}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;-><init>(II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
