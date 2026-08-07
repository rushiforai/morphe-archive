.class public Lcom/idv/identity/platform/config/FaceConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private alertSupportFailedConfirmColor:Ljava/lang/String;

.field private alertSupportFailedMsgColor:Ljava/lang/String;

.field private alertSupportFailedTitleColor:Ljava/lang/String;

.field private autoScanBase64:Ljava/lang/String;

.field private exitAlertCancelColor:Ljava/lang/String;

.field private exitAlertConfirmationColor:Ljava/lang/String;

.field private exitAlertMessageColor:Ljava/lang/String;

.field private exitAlertTitleColor:Ljava/lang/String;

.field private exitIconBase64:Ljava/lang/String;

.field private faceBGColor:Ljava/lang/String;

.field private faceProgressEndColor:Ljava/lang/String;

.field private faceProgressStartColor:Ljava/lang/String;

.field private faceTipColor:Ljava/lang/String;

.field private faceTitleColor:Ljava/lang/String;

.field private interruptedAlertConfirmColor:Ljava/lang/String;

.field private interruptedAlertMessageColor:Ljava/lang/String;

.field private interruptedAlertTitleColor:Ljava/lang/String;

.field private opFailedConfirmColor:Ljava/lang/String;

.field private opFailedTipColor:Ljava/lang/String;

.field private opFailedTitleColor:Ljava/lang/String;

.field private permissionFailedAlertConfirmColor:Ljava/lang/String;

.field private permissionFailedAlertMessageColor:Ljava/lang/String;

.field private permissionFailedAlertTitleColor:Ljava/lang/String;

.field private timeoutAlertConfirmationColor:Ljava/lang/String;

.field private timeoutAlertMessageColor:Ljava/lang/String;

.field private timeoutAlertTitleColor:Ljava/lang/String;

.field private tooManyRetriesAlertConfirmColor:Ljava/lang/String;

.field private tooManyRetriesAlertMessageColor:Ljava/lang/String;

.field private tooManyRetriesAlertTitleColor:Ljava/lang/String;

.field private verifyLoadingColor:Ljava/lang/String;

.field private verifyNetworkErrorAlertCancelColor:Ljava/lang/String;

.field private verifyNetworkErrorAlertConfirmColor:Ljava/lang/String;

.field private verifyNetworkErrorAlertMessageColor:Ljava/lang/String;

.field private verifyNetworkErrorAlertTitleColor:Ljava/lang/String;


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
.method public getAlertSupportFailedConfirmColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedConfirmColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAlertSupportFailedMsgColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedMsgColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAlertSupportFailedTitleColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAutoScanBase64()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->autoScanBase64:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDialogCamOpenFailedConfig()Ll/azb$a;
    .locals 3

    .line 1
    new-instance v0, Ll/azb$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/azb$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedTitleColor:Ljava/lang/String;

    .line 7
    .line 8
    sget v2, Ll/y8c0;->d:I

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, v0, Ll/azb$a;->a:I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedMsgColor:Ljava/lang/String;

    .line 17
    .line 18
    sget v2, Ll/y8c0;->c:I

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, v0, Ll/azb$a;->b:I

    .line 25
    .line 26
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedConfirmColor:Ljava/lang/String;

    .line 27
    .line 28
    sget v1, Ll/y8c0;->b:I

    .line 29
    .line 30
    invoke-static {p0, v1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    iput p0, v0, Ll/azb$a;->c:I

    .line 35
    .line 36
    return-object v0
.end method

.method public getDialogExitConfig()Ll/azb$a;
    .locals 3

    .line 1
    new-instance v0, Ll/azb$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/azb$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertTitleColor:Ljava/lang/String;

    .line 7
    .line 8
    sget v2, Ll/y8c0;->d:I

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, v0, Ll/azb$a;->a:I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertMessageColor:Ljava/lang/String;

    .line 17
    .line 18
    sget v2, Ll/y8c0;->c:I

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, v0, Ll/azb$a;->b:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertCancelColor:Ljava/lang/String;

    .line 27
    .line 28
    sget v2, Ll/y8c0;->a:I

    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput v1, v0, Ll/azb$a;->d:I

    .line 35
    .line 36
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertConfirmationColor:Ljava/lang/String;

    .line 37
    .line 38
    sget v1, Ll/y8c0;->b:I

    .line 39
    .line 40
    invoke-static {p0, v1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    iput p0, v0, Ll/azb$a;->c:I

    .line 45
    .line 46
    return-object v0
.end method

.method public getDialogSDKErrConfig()Ll/azb$a;
    .locals 3

    .line 1
    new-instance v0, Ll/azb$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/azb$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedTitleColor:Ljava/lang/String;

    .line 7
    .line 8
    sget v2, Ll/y8c0;->d:I

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, v0, Ll/azb$a;->a:I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedTipColor:Ljava/lang/String;

    .line 17
    .line 18
    sget v2, Ll/y8c0;->c:I

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, v0, Ll/azb$a;->b:I

    .line 25
    .line 26
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedConfirmColor:Ljava/lang/String;

    .line 27
    .line 28
    sget v1, Ll/y8c0;->b:I

    .line 29
    .line 30
    invoke-static {p0, v1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    iput p0, v0, Ll/azb$a;->c:I

    .line 35
    .line 36
    return-object v0
.end method

.method public getDialogTimeOutConfig()Ll/azb$a;
    .locals 3

    .line 1
    new-instance v0, Ll/azb$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/azb$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertTitleColor:Ljava/lang/String;

    .line 7
    .line 8
    sget v2, Ll/y8c0;->d:I

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, v0, Ll/azb$a;->a:I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertMessageColor:Ljava/lang/String;

    .line 17
    .line 18
    sget v2, Ll/y8c0;->c:I

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, v0, Ll/azb$a;->b:I

    .line 25
    .line 26
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertConfirmationColor:Ljava/lang/String;

    .line 27
    .line 28
    sget v1, Ll/y8c0;->b:I

    .line 29
    .line 30
    invoke-static {p0, v1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    iput p0, v0, Ll/azb$a;->c:I

    .line 35
    .line 36
    return-object v0
.end method

.method public getDialogTooManyRetriesConfig()Ll/azb$a;
    .locals 3

    .line 1
    new-instance v0, Ll/azb$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/azb$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertTitleColor:Ljava/lang/String;

    .line 7
    .line 8
    sget v2, Ll/y8c0;->d:I

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, v0, Ll/azb$a;->a:I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertMessageColor:Ljava/lang/String;

    .line 17
    .line 18
    sget v2, Ll/y8c0;->c:I

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, v0, Ll/azb$a;->b:I

    .line 25
    .line 26
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertConfirmColor:Ljava/lang/String;

    .line 27
    .line 28
    sget v1, Ll/y8c0;->b:I

    .line 29
    .line 30
    invoke-static {p0, v1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    iput p0, v0, Ll/azb$a;->c:I

    .line 35
    .line 36
    return-object v0
.end method

.method public getExitAlertCancelColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertCancelColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExitAlertConfirmationColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertConfirmationColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExitAlertMessageColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertMessageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExitAlertTitleColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExitIconBase64()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitIconBase64:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceBGColor(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceBGColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFaceProgressEndColor(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceProgressEndColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFaceProgressStartColor(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceProgressStartColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFaceTipColor(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceTipColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFaceTitleColor(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOpFailedConfirmColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedConfirmColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpFailedTipColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedTipColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpFailedTitleColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeoutAlertConfirmationColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertConfirmationColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeoutAlertMessageColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertMessageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeoutAlertTitleColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTooManyRetriesAlertConfirmColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertConfirmColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTooManyRetriesAlertMessageColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertMessageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTooManyRetriesAlertTitleColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVerifyLoadingColor(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyLoadingColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/z4d0;->d(Ljava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setAlertSupportFailedConfirmColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedConfirmColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAlertSupportFailedMsgColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedMsgColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAlertSupportFailedTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAutoScanBase64(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->autoScanBase64:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setExitAlertCancelColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertCancelColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setExitAlertConfirmationColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertConfirmationColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setExitAlertMessageColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertMessageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setExitAlertTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setExitIconBase64(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitIconBase64:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceBGColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceBGColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceProgressEndColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceProgressEndColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceProgressStartColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceProgressStartColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceTipColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceTipColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setInterruptedAlertConfirmColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->interruptedAlertConfirmColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setInterruptedAlertMessageColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->interruptedAlertMessageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setInterruptedAlertTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->interruptedAlertTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOpFailedConfirmColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedConfirmColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOpFailedTipColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedTipColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOpFailedTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPermissionFailedAlertConfirmColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->permissionFailedAlertConfirmColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPermissionFailedAlertMessageColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->permissionFailedAlertMessageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPermissionFailedAlertTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->permissionFailedAlertTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeoutAlertConfirmationColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertConfirmationColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeoutAlertMessageColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertMessageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeoutAlertTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTooManyRetriesAlertConfirmColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertConfirmColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTooManyRetriesAlertMessageColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertMessageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTooManyRetriesAlertTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVerifyLoadingColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyLoadingColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVerifyNetworkErrorAlertCancelColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyNetworkErrorAlertCancelColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVerifyNetworkErrorAlertConfirmColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyNetworkErrorAlertConfirmColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVerifyNetworkErrorAlertMessageColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyNetworkErrorAlertMessageColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVerifyNetworkErrorAlertTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyNetworkErrorAlertTitleColor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "FaceConfig{faceTitleColor=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceTitleColor:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', faceTipColor=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceTipColor:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', faceBGColor=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceBGColor:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', faceProgressStartColor=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceProgressStartColor:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', faceProgressEndColor=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->faceProgressEndColor:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', exitIconBase64=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitIconBase64:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', interruptedAlertTitleColor=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->interruptedAlertTitleColor:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', interruptedAlertMessageColor=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->interruptedAlertMessageColor:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', interruptedAlertConfirmColor=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->interruptedAlertConfirmColor:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, "\', tooManyRetriesAlertTitleColor=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertTitleColor:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "\', tooManyRetriesAlertMessageColor=\'"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertMessageColor:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, "\', tooManyRetriesAlertConfirmColor=\'"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->tooManyRetriesAlertConfirmColor:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, "\', exitAlertTitleColor=\'"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertTitleColor:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, "\', exitAlertMessageColor=\'"

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertMessageColor:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, "\', exitAlertCancelColor=\'"

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertCancelColor:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, "\', exitAlertConfirmationColor=\'"

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->exitAlertConfirmationColor:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, "\', opFailedTitleColor=\'"

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedTitleColor:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, "\', opFailedTipColor=\'"

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedTipColor:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, "\', opFailedConfirmColor=\'"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->opFailedConfirmColor:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v1, "\', timeoutAlertTitleColor=\'"

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertTitleColor:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v1, "\', timeoutAlertMessageColor=\'"

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertMessageColor:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v1, "\', timeoutAlertConfirmationColor=\'"

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->timeoutAlertConfirmationColor:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v1, "\', alertSupportFailedTitleColor=\'"

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedTitleColor:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v1, "\', alertSupportFailedMsgColor=\'"

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedMsgColor:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v1, "\', alertSupportFailedConfirmColor=\'"

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->alertSupportFailedConfirmColor:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    const-string v1, "\', permissionFailedAlertTitleColor=\'"

    .line 254
    .line 255
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->permissionFailedAlertTitleColor:Ljava/lang/String;

    .line 259
    .line 260
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v1, "\', permissionFailedAlertMessageColor=\'"

    .line 264
    .line 265
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->permissionFailedAlertMessageColor:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    const-string v1, "\', permissionFailedAlertConfirmColor=\'"

    .line 274
    .line 275
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->permissionFailedAlertConfirmColor:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v1, "\', verifyNetworkErrorAlertTitleColor=\'"

    .line 284
    .line 285
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyNetworkErrorAlertTitleColor:Ljava/lang/String;

    .line 289
    .line 290
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    const-string v1, "\', verifyNetworkErrorAlertMessageColor=\'"

    .line 294
    .line 295
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyNetworkErrorAlertMessageColor:Ljava/lang/String;

    .line 299
    .line 300
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    const-string v1, "\', verifyNetworkErrorAlertCancelColor=\'"

    .line 304
    .line 305
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyNetworkErrorAlertCancelColor:Ljava/lang/String;

    .line 309
    .line 310
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    const-string v1, "\', verifyNetworkErrorAlertConfirmColor=\'"

    .line 314
    .line 315
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    iget-object v1, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyNetworkErrorAlertConfirmColor:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    const-string v1, "\', verifyLoadingColor=\'"

    .line 324
    .line 325
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    iget-object p0, p0, Lcom/idv/identity/platform/config/FaceConfig;->verifyLoadingColor:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    const-string p0, "\'}"

    .line 334
    .line 335
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    return-object p0
.end method
