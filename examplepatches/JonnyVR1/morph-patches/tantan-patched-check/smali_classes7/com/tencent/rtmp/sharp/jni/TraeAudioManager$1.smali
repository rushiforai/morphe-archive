.class Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->sendResBroadcast(Landroid/content/Intent;Ljava/util/HashMap;I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

.field final synthetic val$TAMOperation:Ljava/lang/String;

.field final synthetic val$TAMSessionId:Ljava/lang/Long;

.field final synthetic val$TAMerr:I

.field final synthetic val$TAMintent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;Landroid/content/Intent;Ljava/lang/Long;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMintent:Landroid/content/Intent;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMSessionId:Ljava/lang/Long;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMOperation:Ljava/lang/String;

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMerr:I

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMintent:Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_RES"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMintent:Landroid/content/Intent;

    .line 9
    .line 10
    const-string v1, "PARAM_SESSIONID"

    .line 11
    .line 12
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMSessionId:Ljava/lang/Long;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMintent:Landroid/content/Intent;

    .line 18
    .line 19
    const-string v1, "PARAM_OPERATION"

    .line 20
    .line 21
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMOperation:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMintent:Landroid/content/Intent;

    .line 27
    .line 28
    const-string v1, "PARAM_RES_ERRCODE"

    .line 29
    .line 30
    iget v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMerr:I

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_context:Landroid/content/Context;

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$1;->val$TAMintent:Landroid/content/Intent;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
