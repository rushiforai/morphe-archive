.class Lorg/spongycastle/asn1/eac/Flags$StringJoiner;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/asn1/eac/Flags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "StringJoiner"
.end annotation


# instance fields
.field First:Z

.field b:Ljava/lang/StringBuffer;

.field mSeparator:Ljava/lang/String;

.field final synthetic this$0:Lorg/spongycastle/asn1/eac/Flags;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/eac/Flags;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->this$0:Lorg/spongycastle/asn1/eac/Flags;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->First:Z

    .line 8
    .line 9
    new-instance p1, Ljava/lang/StringBuffer;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->b:Ljava/lang/StringBuffer;

    .line 15
    .line 16
    iput-object p2, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->mSeparator:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->First:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->First:Z

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->b:Ljava/lang/StringBuffer;

    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->mSeparator:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object p0, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->b:Ljava/lang/StringBuffer;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/eac/Flags$StringJoiner;->b:Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
