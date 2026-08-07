.class Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->finish()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$1;->this$0:Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public receivedHandshakeRecord(I[BII)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    if-ge p4, v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    add-int/lit8 v1, p3, 0x9

    .line 8
    .line 9
    invoke-static {p2, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24([BI)I

    .line 10
    .line 11
    .line 12
    move-result v8

    .line 13
    add-int/lit8 v1, v8, 0xc

    .line 14
    .line 15
    if-eq p4, v1, :cond_1

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    add-int/lit8 p4, p3, 0x4

    .line 19
    .line 20
    invoke-static {p2, p4}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    .line 21
    .line 22
    .line 23
    move-result p4

    .line 24
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$1;->this$0:Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;

    .line 25
    .line 26
    invoke-static {v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->access$100(Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-lt p4, v1, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    invoke-static {p2, p3}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/16 v1, 0x14

    .line 38
    .line 39
    if-ne v3, v1, :cond_3

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const/4 v1, 0x0

    .line 44
    :goto_0
    if-eq p1, v1, :cond_4

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_4
    add-int/lit8 p1, p3, 0x1

    .line 48
    .line 49
    invoke-static {p2, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24([BI)I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    add-int/lit8 p1, p3, 0x6

    .line 54
    .line 55
    invoke-static {p2, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24([BI)I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    add-int p1, v7, v8

    .line 60
    .line 61
    if-le p1, v4, :cond_5

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_5
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$1;->this$0:Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;

    .line 65
    .line 66
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->access$200(Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;)Ljava/util/Hashtable;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p4}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p4

    .line 74
    invoke-virtual {p1, p4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    move-object v2, p1

    .line 79
    check-cast v2, Lorg/spongycastle/crypto/tls/DTLSReassembler;

    .line 80
    .line 81
    if-eqz v2, :cond_6

    .line 82
    .line 83
    add-int/lit8 v6, p3, 0xc

    .line 84
    .line 85
    move-object v5, p2

    .line 86
    invoke-virtual/range {v2 .. v8}, Lorg/spongycastle/crypto/tls/DTLSReassembler;->contributeFragment(SI[BIII)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$1;->this$0:Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;

    .line 90
    .line 91
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->access$200(Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;)Ljava/util/Hashtable;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->access$300(Ljava/util/Hashtable;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_6

    .line 100
    .line 101
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$1;->this$0:Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;

    .line 102
    .line 103
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->access$400(Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$1;->this$0:Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;

    .line 107
    .line 108
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->access$200(Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;)Ljava/util/Hashtable;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->access$500(Ljava/util/Hashtable;)V

    .line 113
    .line 114
    .line 115
    :cond_6
    :goto_1
    return-void
.end method
