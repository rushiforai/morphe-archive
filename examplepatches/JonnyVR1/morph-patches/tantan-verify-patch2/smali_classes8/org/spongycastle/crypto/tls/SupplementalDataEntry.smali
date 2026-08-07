.class public Lorg/spongycastle/crypto/tls/SupplementalDataEntry;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected data:[B

.field protected dataType:I


# direct methods
.method public constructor <init>(I[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lorg/spongycastle/crypto/tls/SupplementalDataEntry;->dataType:I

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/SupplementalDataEntry;->data:[B

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SupplementalDataEntry;->data:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getDataType()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/tls/SupplementalDataEntry;->dataType:I

    .line 2
    .line 3
    return p0
.end method
