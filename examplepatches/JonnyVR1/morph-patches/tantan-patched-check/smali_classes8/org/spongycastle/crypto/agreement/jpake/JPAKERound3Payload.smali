.class public Lorg/spongycastle/crypto/agreement/jpake/JPAKERound3Payload;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final macTag:Ljava/math/BigInteger;

.field private final participantId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/math/BigInteger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/jpake/JPAKERound3Payload;->participantId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/crypto/agreement/jpake/JPAKERound3Payload;->macTag:Ljava/math/BigInteger;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getMacTag()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/agreement/jpake/JPAKERound3Payload;->macTag:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getParticipantId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/agreement/jpake/JPAKERound3Payload;->participantId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
