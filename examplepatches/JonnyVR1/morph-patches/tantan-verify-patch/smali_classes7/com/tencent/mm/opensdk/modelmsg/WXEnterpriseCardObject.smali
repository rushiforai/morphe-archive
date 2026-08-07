.class public Lcom/tencent/mm/opensdk/modelmsg/WXEnterpriseCardObject;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;


# static fields
.field private static final LENGTH_LIMIT:I = 0x2800

.field private static final TAG:Ljava/lang/String; = "MicroMsg.SDK.WXEnterpriseCardObject"


# instance fields
.field public cardInfo:Ljava/lang/String;

.field public msgType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkArgs()Z
    .locals 1

    iget-object p0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXEnterpriseCardObject;->cardInfo:Ljava/lang/String;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    const-string p0, "MicroMsg.SDK.WXEnterpriseCardObject"

    const-string v0, "checkArgs fail, cardInfo is invalid"

    invoke-static {p0, v0}, Lcom/tencent/mm/opensdk/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public serialize(Landroid/os/Bundle;)V
    .locals 2

    iget v0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXEnterpriseCardObject;->msgType:I

    const-string v1, "_wxenterprisecard_msgtype"

    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    iget-object p0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXEnterpriseCardObject;->cardInfo:Ljava/lang/String;

    const-string v0, "_wxenterprisecard_cardinfo"

    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public type()I
    .locals 0

    const/16 p0, 0x2d

    return p0
.end method

.method public unserialize(Landroid/os/Bundle;)V
    .locals 1

    const-string v0, "_wxenterprisecard_msgtype"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXEnterpriseCardObject;->msgType:I

    const-string v0, "_wxenterprisecard_cardinfo"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/mm/opensdk/modelmsg/WXEnterpriseCardObject;->cardInfo:Ljava/lang/String;

    return-void
.end method
