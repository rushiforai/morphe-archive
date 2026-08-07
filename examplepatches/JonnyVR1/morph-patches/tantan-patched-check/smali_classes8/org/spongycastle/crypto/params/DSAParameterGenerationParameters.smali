.class public Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DIGITAL_SIGNATURE_USAGE:I = 0x1

.field public static final KEY_ESTABLISHMENT_USAGE:I = 0x2


# instance fields
.field private final certainty:I

.field private final l:I

.field private final n:I

.field private final random:Ljava/security/SecureRandom;

.field private final usageIndex:I


# direct methods
.method public constructor <init>(IIILjava/security/SecureRandom;)V
    .locals 6

    const/4 v5, -0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    .line 15
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;-><init>(IIILjava/security/SecureRandom;I)V

    return-void
.end method

.method public constructor <init>(IIILjava/security/SecureRandom;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->l:I

    .line 5
    .line 6
    iput p2, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->n:I

    .line 7
    .line 8
    iput p3, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->certainty:I

    .line 9
    .line 10
    iput p5, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->usageIndex:I

    .line 11
    .line 12
    iput-object p4, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->random:Ljava/security/SecureRandom;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getCertainty()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->certainty:I

    .line 2
    .line 3
    return p0
.end method

.method public getL()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public getN()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getRandom()Ljava/security/SecureRandom;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->random:Ljava/security/SecureRandom;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUsageIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->usageIndex:I

    .line 2
    .line 3
    return p0
.end method
