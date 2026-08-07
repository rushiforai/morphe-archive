.class Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/camera/upload/a$a;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocalUrlMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/p1/mobile/putong/camera/upload/a$a<",
        "Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field private map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/HashMap;)V
    .locals 0
    .param p1    # Ljava/util/HashMap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    new-instance p1, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->map:Ljava/util/HashMap;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->map:Ljava/util/HashMap;

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/HashMap;Ll/kvh0;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;-><init>(Ljava/util/HashMap;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;)Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->map:Ljava/util/HashMap;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->saveUrlEntry(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private saveUrlEntry(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->map:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->map:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->map:Ljava/util/HashMap;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public trimAndCopy()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->map:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;-><init>(Ljava/util/HashMap;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public bridge synthetic trimAndCopy()Ljava/lang/Object;
    .locals 0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->trimAndCopy()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;

    move-result-object p0

    return-object p0
.end method
