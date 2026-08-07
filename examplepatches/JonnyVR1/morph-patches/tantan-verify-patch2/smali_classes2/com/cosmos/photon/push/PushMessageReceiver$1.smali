.class Lcom/cosmos/photon/push/PushMessageReceiver$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PushMessageReceiver;->getLargeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/PushMessageReceiver;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/PushMessageReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushMessageReceiver$1;->this$0:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    return-void
.end method

.method public onLowMemory()V
    .locals 0

    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/cosmos/photon/push/PushMessageReceiver$1;->this$0:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/cosmos/photon/push/PushMessageReceiver;->access$000(Lcom/cosmos/photon/push/PushMessageReceiver;)Lcom/cosmos/photon/push/image/ImageLoader;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/cosmos/photon/push/image/ImageLoader;->clearMemCache()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
