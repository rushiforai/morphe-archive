.class final Lcom/mm/mmfile/UploaderHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mm/mmfile/UploaderHelper;->setPauseUploadTaskWhenExitApp(Landroid/content/Context;[Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
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
.method public onBack()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/mm/mmfile/UploaderHelper;->pauseUploadTask()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFront()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/mm/mmfile/UploaderHelper;->resumeUploadTask()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
