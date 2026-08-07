.class public Lcom/momo/mcamera/mask/LookUpModel;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private folder:Ljava/lang/String;

.field private hiddenTriggerType:I

.field private lookupPath:Ljava/lang/String;

.field private presetFilter:Lcom/momo/mcamera/filtermanager/MMPresetFilter;

.field private triggerType:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/LookUpModel;->triggerType:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/LookUpModel;->hiddenTriggerType:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getFolder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LookUpModel;->folder:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHiddenTriggerType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/LookUpModel;->hiddenTriggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public getLookupPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LookUpModel;->lookupPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPresetFilter()Lcom/momo/mcamera/filtermanager/MMPresetFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LookUpModel;->presetFilter:Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggerType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/LookUpModel;->triggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public setFolder(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/LookUpModel;->folder:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHiddenTriggerType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/LookUpModel;->hiddenTriggerType:I

    .line 2
    .line 3
    return-void
.end method

.method public setLookupPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/LookUpModel;->lookupPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPresetFilter(Lcom/momo/mcamera/filtermanager/MMPresetFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/LookUpModel;->presetFilter:Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/LookUpModel;->triggerType:I

    .line 2
    .line 3
    return-void
.end method
