.class public Lcom/samsung/android/content/clipboard/SemClipboardManager;
.super Ljava/lang/Object;


.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public addClip(Landroid/content/Context;Lcom/samsung/android/content/clipboard/data/SemClipData;Lcom/samsung/android/content/clipboard/SemClipboardManager$OnAddClipResultListener;)V
    .locals 2
    return-void
.end method

.method public dismissDialog()V
    .locals 2
    return-void
.end method

.method public filterClip(ILcom/samsung/android/content/clipboard/SemClipboardManager$OnPasteListener;)V
    .locals 2
    return-void
.end method

.method public getClips()Ljava/util/List;
    .locals 2
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    return-object v0
.end method

.method public getCount()I
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public getLatestClip(I)Lcom/samsung/android/content/clipboard/data/SemClipData;
    .locals 2
    new-instance v0, Lcom/samsung/android/content/clipboard/data/SemClipData;
    invoke-direct {v0}, Lcom/samsung/android/content/clipboard/data/SemClipData;-><init>()V
    return-object v0
.end method

.method public isEnabled()Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public isShowing()Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public showDialog()V
    .locals 2
    return-void
.end method

