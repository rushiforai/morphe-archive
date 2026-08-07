.class public Lcom/tantanapp/beatles/v2/data/Device;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private arch:[Ljava/lang/String;

.field private bootTime:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "boot_time"
    .end annotation
.end field

.field private brand:Ljava/lang/String;

.field private connectionType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "connection_type"
    .end annotation
.end field

.field private currentArch:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "arch_active"
    .end annotation
.end field

.field private externalFreeStorage:Ljava/lang/Long;

.field private externalStorageSize:Ljava/lang/Long;

.field private family:Ljava/lang/String;

.field private freeMemory:Ljava/lang/Long;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "free_memory"
    .end annotation
.end field

.field private freeStorage:Ljava/lang/Long;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "free_storage"
    .end annotation
.end field

.field private id:Ljava/lang/String;

.field private lowMemory:Ljava/lang/Boolean;

.field private manufacturer:Ljava/lang/String;

.field private memorySize:Ljava/lang/Long;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "memory_size"
    .end annotation
.end field

.field private model:Ljava/lang/String;

.field private modelId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "model_id"
    .end annotation
.end field

.field private screenDensity:Ljava/lang/Float;

.field private screenDpi:Ljava/lang/Integer;

.field private screenHeightPixels:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "screen_height"
    .end annotation
.end field

.field private screenWidthPixels:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "screen_width"
    .end annotation
.end field

.field private storageSize:Ljava/lang/Long;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "storage_size"
    .end annotation
.end field

.field private usableMemory:Ljava/lang/Long;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "usable_memory"
    .end annotation
.end field


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
.method public getArch()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->arch:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBootTime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->bootTime:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBrand()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->brand:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getConnectionType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->connectionType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentArch()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->currentArch:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExternalFreeStorage()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->externalFreeStorage:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExternalStorageSize()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->externalStorageSize:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFamily()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->family:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFreeMemory()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->freeMemory:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFreeStorage()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->freeStorage:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLowMemory()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->lowMemory:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getManufacturer()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->manufacturer:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMemorySize()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->memorySize:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->model:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModelId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->modelId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScreenDensity()Ljava/lang/Float;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->screenDensity:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScreenDpi()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->screenDpi:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScreenHeightPixels()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->screenHeightPixels:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScreenWidthPixels()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->screenWidthPixels:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStorageSize()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->storageSize:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUsableMemory()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/Device;->usableMemory:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public setArch([Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->arch:[Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setBootTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->bootTime:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setBrand(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->brand:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setConnectionType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->connectionType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCurrentArch(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->currentArch:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setExternalFreeStorage(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->externalFreeStorage:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setExternalStorageSize(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->externalStorageSize:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setFamily(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->family:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFreeMemory(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->freeMemory:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setFreeStorage(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->freeStorage:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLowMemory(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->lowMemory:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public setManufacturer(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->manufacturer:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMemorySize(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->memorySize:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setModel(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->model:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setModelId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->modelId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setScreenDensity(F)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->screenDensity:Ljava/lang/Float;

    .line 6
    .line 7
    return-void
.end method

.method public setScreenDpi(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->screenDpi:Ljava/lang/Integer;

    .line 6
    .line 7
    return-void
.end method

.method public setScreenHeightPixels(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->screenHeightPixels:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method public setScreenWidthPixels(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->screenWidthPixels:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method public setStorageSize(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->storageSize:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setUsableMemory(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/Device;->usableMemory:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method
