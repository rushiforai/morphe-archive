.class public Lcom/tencent/mm/opensdk/modelmsg/WXStateJumpMiniProgramInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/mm/opensdk/modelmsg/WXStateSceneDataObject$IWXStateJumpInfo;


# static fields
.field private static final TAG:Ljava/lang/String; = "MicroMsg.SDK.WXStateJumpUrlInfo"


# instance fields
.field public miniProgramType:I

.field public path:Ljava/lang/String;

.field public username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkArgs()Z
    .locals 1

    iget-object p0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXStateJumpMiniProgramInfo;->username:Ljava/lang/String;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-gtz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    const-string p0, "MicroMsg.SDK.WXStateJumpUrlInfo"

    const-string v0, "checkArgs fail, username is null"

    invoke-static {p0, v0}, Lcom/tencent/mm/opensdk/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public serialize(Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXStateJumpMiniProgramInfo;->username:Ljava/lang/String;

    const-string v1, "wx_state_jump_mini_program_username"

    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXStateJumpMiniProgramInfo;->path:Ljava/lang/String;

    const-string v1, "wx_state_jump_mini_program_path"

    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget p0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXStateJumpMiniProgramInfo;->miniProgramType:I

    const-string v0, "wx_state_jump_mini_program_type"

    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public type()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method

.method public unserialize(Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "wx_state_jump_mini_program_username"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXStateJumpMiniProgramInfo;->username:Ljava/lang/String;

    const-string v0, "wx_state_jump_mini_program_path"

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/mm/opensdk/modelmsg/WXStateJumpMiniProgramInfo;->path:Ljava/lang/String;

    const-string v0, "wx_state_jump_mini_program_type"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/tencent/mm/opensdk/modelmsg/WXStateJumpMiniProgramInfo;->miniProgramType:I

    return-void
.end method
