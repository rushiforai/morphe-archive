.class public Lorg/fourthline/cling/support/model/container/StorageVolume;
.super Lorg/fourthline/cling/support/model/container/Container;
.source "SourceFile"


# static fields
.field public static final CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 2
    .line 3
    const-string v1, "object.container.storageVolume"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/fourthline/cling/support/model/DIDLObject$Class;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/fourthline/cling/support/model/container/StorageVolume;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 44
    invoke-direct {p0}, Lorg/fourthline/cling/support/model/container/Container;-><init>()V

    .line 45
    sget-object v0, Lorg/fourthline/cling/support/model/container/StorageVolume;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->setClazz(Lorg/fourthline/cling/support/model/DIDLObject$Class;)Lorg/fourthline/cling/support/model/DIDLObject;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lorg/fourthline/cling/support/model/StorageMedium;)V
    .locals 11

    .line 1
    move-object/from16 v0, p6

    .line 2
    .line 3
    move-object/from16 v1, p7

    .line 4
    .line 5
    move-object/from16 v2, p8

    .line 6
    .line 7
    move-object/from16 v3, p9

    .line 8
    .line 9
    sget-object v9, Lorg/fourthline/cling/support/model/container/StorageVolume;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 10
    .line 11
    move-object v4, p0

    .line 12
    move-object v5, p1

    .line 13
    move-object v6, p2

    .line 14
    move-object v7, p3

    .line 15
    move-object v8, p4

    .line 16
    move-object/from16 v10, p5

    .line 17
    .line 18
    invoke-direct/range {v4 .. v10}, Lorg/fourthline/cling/support/model/container/Container;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/fourthline/cling/support/model/DIDLObject$Class;Ljava/lang/Integer;)V

    .line 19
    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/container/StorageVolume;->setStorageTotal(Ljava/lang/Long;)Lorg/fourthline/cling/support/model/container/StorageVolume;

    .line 24
    .line 25
    .line 26
    :cond_0
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/support/model/container/StorageVolume;->setStorageUsed(Ljava/lang/Long;)Lorg/fourthline/cling/support/model/container/StorageVolume;

    .line 29
    .line 30
    .line 31
    :cond_1
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Lorg/fourthline/cling/support/model/container/StorageVolume;->setStorageFree(Ljava/lang/Long;)Lorg/fourthline/cling/support/model/container/StorageVolume;

    .line 34
    .line 35
    .line 36
    :cond_2
    if-eqz v3, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0, v3}, Lorg/fourthline/cling/support/model/container/StorageVolume;->setStorageMedium(Lorg/fourthline/cling/support/model/StorageMedium;)Lorg/fourthline/cling/support/model/container/StorageVolume;

    .line 39
    .line 40
    .line 41
    :cond_3
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/fourthline/cling/support/model/container/Container;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lorg/fourthline/cling/support/model/StorageMedium;)V
    .locals 0

    .line 43
    invoke-virtual {p2}, Lorg/fourthline/cling/support/model/DIDLObject;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-direct/range {p0 .. p9}, Lorg/fourthline/cling/support/model/container/StorageVolume;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lorg/fourthline/cling/support/model/StorageMedium;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/container/Container;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lorg/fourthline/cling/support/model/container/Container;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    return-void
.end method


# virtual methods
.method public getStorageFree()Ljava/lang/Long;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_FREE;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->getFirstPropertyValue(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    return-object p0
.end method

.method public getStorageMedium()Lorg/fourthline/cling/support/model/StorageMedium;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_MEDIUM;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->getFirstPropertyValue(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/model/StorageMedium;

    .line 8
    .line 9
    return-object p0
.end method

.method public getStorageTotal()Ljava/lang/Long;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_TOTAL;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->getFirstPropertyValue(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    return-object p0
.end method

.method public getStorageUsed()Ljava/lang/Long;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_USED;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->getFirstPropertyValue(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    return-object p0
.end method

.method public setStorageFree(Ljava/lang/Long;)Lorg/fourthline/cling/support/model/container/StorageVolume;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_FREE;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_FREE;-><init>(Ljava/lang/Long;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->replaceFirstProperty(Lorg/fourthline/cling/support/model/DIDLObject$Property;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public setStorageMedium(Lorg/fourthline/cling/support/model/StorageMedium;)Lorg/fourthline/cling/support/model/container/StorageVolume;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_MEDIUM;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_MEDIUM;-><init>(Lorg/fourthline/cling/support/model/StorageMedium;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->replaceFirstProperty(Lorg/fourthline/cling/support/model/DIDLObject$Property;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public setStorageTotal(Ljava/lang/Long;)Lorg/fourthline/cling/support/model/container/StorageVolume;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_TOTAL;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_TOTAL;-><init>(Ljava/lang/Long;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->replaceFirstProperty(Lorg/fourthline/cling/support/model/DIDLObject$Property;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public setStorageUsed(Ljava/lang/Long;)Lorg/fourthline/cling/support/model/container/StorageVolume;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_USED;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$STORAGE_USED;-><init>(Ljava/lang/Long;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->replaceFirstProperty(Lorg/fourthline/cling/support/model/DIDLObject$Property;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method
