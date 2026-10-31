.class public Lcom/samsung/android/knox/SemPersonaManager;
.super Ljava/lang/Object;


.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static getKnoxInfoForApp(Landroid/content/Context;)Landroid/os/Bundle;
    .locals 2
    new-instance v0, Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V
    return-object v0
.end method

.method public getMoveToKnoxMenuList(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 2
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    return-object v0
.end method

.method public static isKnoxId(I)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

.method public static isSecureFolderId(I)Z
    .locals 2
    const/4 v0, 0x0
    return v0
.end method

