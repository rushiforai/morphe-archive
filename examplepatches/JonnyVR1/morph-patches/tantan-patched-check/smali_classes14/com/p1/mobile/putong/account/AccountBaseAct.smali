.class public Lcom/p1/mobile/putong/account/AccountBaseAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct$a;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct$a;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct$a;->a(Lcom/p1/mobile/putong/app/PutongAct;)Lcom/p1/mobile/putong/app/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->mediaPickerHandler:Lcom/p1/mobile/putong/app/a;

    .line 14
    .line 15
    return-void
.end method
