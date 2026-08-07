.class public Ll/nbz$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nbz;->o2(Ljava/util/ArrayList;Ll/clz;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/data/Message;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CommonTipBox;->new_()Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 16
    .line 17
    const-string p1, "verify"

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->type:Ljava/lang/String;

    .line 20
    .line 21
    const-string p1, "\u8ba9\u5173\u7cfb\u66f4\u8fd1\u4e00\u6b65"

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->title:Ljava/lang/String;

    .line 24
    .line 25
    const-string p1, "\u4ed6\u8bda\u5fc3\u5e0c\u671b\u4f60\u5b8c\u6210\u771f\u4eba\u8ba4\u8bc1\uff0c\u4f53\u73b0\u4f60\u7684\u4ea4\u53cb\u8bda\u610f\uff0c\u8ba9\u5f7c\u6b64\u5173\u7cfb\u66f4\u7d27\u5bc6"

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->subtitle:Ljava/lang/String;

    .line 28
    .line 29
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IldaQ09KQUdJUDUyREJXUzZESE9aWUszWkpPVVFERjE0IiwidyI6MTI2LCJoIjoxMjYsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDI2NTIwNTE3MjczMjI2MDc1MH0.png"

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->iconUrl:Ljava/lang/String;

    .line 32
    .line 33
    const-string p1, "\u53bb\u8ba4\u8bc1"

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->button:Ljava/lang/String;

    .line 36
    .line 37
    const-string p1, "tantanapp://verificationcenter"

    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->schema:Ljava/lang/String;

    .line 40
    .line 41
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nbz$d;->a(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
