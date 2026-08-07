.class public Lcom/p1/mobile/putong/data/SignOutParams;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private hasContract:Z

.field private inactiveCategory:Ljava/lang/String;

.field private inactiveType:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

.field private isLogOutAb:Z

.field private showUpdateDialog:Z


# direct methods
.method public constructor <init>(ZLcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;ZZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignOutParams;->inactiveCategory:Ljava/lang/String;

    .line 7
    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/SignOutParams;->showUpdateDialog:Z

    .line 9
    .line 10
    iput-object p2, p0, Lcom/p1/mobile/putong/data/SignOutParams;->inactiveType:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 11
    .line 12
    iput-boolean p3, p0, Lcom/p1/mobile/putong/data/SignOutParams;->hasContract:Z

    .line 13
    .line 14
    iput-boolean p4, p0, Lcom/p1/mobile/putong/data/SignOutParams;->isLogOutAb:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getInactiveCategory()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignOutParams;->inactiveCategory:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInactiveType()Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignOutParams;->inactiveType:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 2
    .line 3
    return-object p0
.end method

.method public isHasContract()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SignOutParams;->hasContract:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLogOutAb()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SignOutParams;->isLogOutAb:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowUpdateDialog()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SignOutParams;->showUpdateDialog:Z

    .line 2
    .line 3
    return p0
.end method

.method public setHasContract(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/SignOutParams;->hasContract:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInactiveCategory(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignOutParams;->inactiveCategory:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setInactiveType(Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignOutParams;->inactiveType:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 2
    .line 3
    return-void
.end method

.method public setLogOutAb(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/SignOutParams;->isLogOutAb:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowUpdateDialog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/SignOutParams;->showUpdateDialog:Z

    .line 2
    .line 3
    return-void
.end method
