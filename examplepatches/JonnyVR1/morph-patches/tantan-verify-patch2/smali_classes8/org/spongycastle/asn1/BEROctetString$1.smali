.class Lorg/spongycastle/asn1/BEROctetString$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/spongycastle/asn1/BEROctetString;->getObjects()Ljava/util/Enumeration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field counter:I

.field final synthetic this$0:Lorg/spongycastle/asn1/BEROctetString;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/BEROctetString;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/BEROctetString$1;->this$0:Lorg/spongycastle/asn1/BEROctetString;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lorg/spongycastle/asn1/BEROctetString$1;->counter:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/asn1/BEROctetString$1;->counter:I

    .line 2
    .line 3
    iget-object p0, p0, Lorg/spongycastle/asn1/BEROctetString$1;->this$0:Lorg/spongycastle/asn1/BEROctetString;

    .line 4
    .line 5
    invoke-static {p0}, Lorg/spongycastle/asn1/BEROctetString;->access$000(Lorg/spongycastle/asn1/BEROctetString;)[Lorg/spongycastle/asn1/ASN1OctetString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    array-length p0, p0

    .line 10
    if-ge v0, p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/BEROctetString$1;->this$0:Lorg/spongycastle/asn1/BEROctetString;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/asn1/BEROctetString;->access$000(Lorg/spongycastle/asn1/BEROctetString;)[Lorg/spongycastle/asn1/ASN1OctetString;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lorg/spongycastle/asn1/BEROctetString$1;->counter:I

    .line 8
    .line 9
    add-int/lit8 v2, v1, 0x1

    .line 10
    .line 11
    iput v2, p0, Lorg/spongycastle/asn1/BEROctetString$1;->counter:I

    .line 12
    .line 13
    aget-object p0, v0, v1

    .line 14
    .line 15
    return-object p0
.end method
