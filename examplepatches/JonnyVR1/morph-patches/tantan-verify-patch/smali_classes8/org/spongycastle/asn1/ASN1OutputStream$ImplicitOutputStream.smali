.class Lorg/spongycastle/asn1/ASN1OutputStream$ImplicitOutputStream;
.super Lorg/spongycastle/asn1/ASN1OutputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/asn1/ASN1OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ImplicitOutputStream"
.end annotation


# instance fields
.field private first:Z

.field final synthetic this$0:Lorg/spongycastle/asn1/ASN1OutputStream;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1OutputStream;Ljava/io/OutputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1OutputStream$ImplicitOutputStream;->this$0:Lorg/spongycastle/asn1/ASN1OutputStream;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lorg/spongycastle/asn1/ASN1OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lorg/spongycastle/asn1/ASN1OutputStream$ImplicitOutputStream;->first:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/asn1/ASN1OutputStream$ImplicitOutputStream;->first:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lorg/spongycastle/asn1/ASN1OutputStream$ImplicitOutputStream;->first:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-super {p0, p1}, Lorg/spongycastle/asn1/ASN1OutputStream;->write(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
