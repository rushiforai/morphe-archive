.class public final Lcom/google/protobuf/ByteString$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/ByteString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation


# instance fields
.field public final a:Lcom/google/protobuf/CodedOutputStream;

.field public final b:[B


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-array p1, p1, [B

    .line 5
    .line 6
    iput-object p1, p0, Lcom/google/protobuf/ByteString$e;->b:[B

    .line 7
    .line 8
    invoke-static {p1}, Lcom/google/protobuf/CodedOutputStream;->W([B)Lcom/google/protobuf/CodedOutputStream;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/google/protobuf/ByteString$e;->a:Lcom/google/protobuf/CodedOutputStream;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(ILcom/google/protobuf/ByteString$a;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/protobuf/ByteString$e;-><init>(I)V

    return-void
.end method


# virtual methods
.method public a()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/ByteString$e;->a:Lcom/google/protobuf/CodedOutputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/CodedOutputStream;->e()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/google/protobuf/ByteString$LiteralByteString;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/protobuf/ByteString$e;->b:[B

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/google/protobuf/ByteString$LiteralByteString;-><init>([B)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public b()Lcom/google/protobuf/CodedOutputStream;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/ByteString$e;->a:Lcom/google/protobuf/CodedOutputStream;

    .line 2
    .line 3
    return-object p0
.end method
