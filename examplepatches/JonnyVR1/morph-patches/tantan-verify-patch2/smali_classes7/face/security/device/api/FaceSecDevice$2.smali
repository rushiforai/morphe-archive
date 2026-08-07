.class Lface/security/device/api/FaceSecDevice$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lface/security/device/api/FaceSecDevice;->initCommonEx(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lface/security/device/api/FaceSecInitListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lface/security/device/api/FaceSecDevice;


# direct methods
.method public constructor <init>(Lface/security/device/api/FaceSecDevice;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lface/security/device/api/FaceSecDevice$2;->this$0:Lface/security/device/api/FaceSecDevice;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    invoke-static {}, Lface/security/device/api/FaceSecDevice;->getInstance()Lface/security/device/api/FaceSecDevice;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lface/security/device/api/FaceSecDevice;->access$100(Lface/security/device/api/FaceSecDevice;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
