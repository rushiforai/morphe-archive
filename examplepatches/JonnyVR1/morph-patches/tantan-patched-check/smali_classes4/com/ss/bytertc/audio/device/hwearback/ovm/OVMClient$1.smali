.class Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onResult(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$100(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x2

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$102(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;I)I

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$200(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$100(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-interface {p1, p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;->onResult(I)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
