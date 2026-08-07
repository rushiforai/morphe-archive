.class public Lcom/meituan/robust/Patch;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private appHash:Ljava/lang/String;

.field private isAppliedSuccess:Z

.field private localPath:Ljava/lang/String;

.field private md5:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private patchesInfoImplClassFullName:Ljava/lang/String;

.field private tempPath:Ljava/lang/String;

.field private url:Ljava/lang/String;


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
.method public clone()Lcom/meituan/robust/Patch;
    .locals 0

    .line 1
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/meituan/robust/Patch;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :catch_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 10
    invoke-virtual {p0}, Lcom/meituan/robust/Patch;->clone()Lcom/meituan/robust/Patch;

    move-result-object p0

    return-object p0
.end method

.method public delete(Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getAppHash()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/meituan/robust/Patch;->appHash:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalPath()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/meituan/robust/Patch;->localPath:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, ".jar"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public getMd5()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/meituan/robust/Patch;->md5:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/meituan/robust/Patch;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPatchesInfoImplClassFullName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/meituan/robust/Patch;->patchesInfoImplClassFullName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTempPath()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/meituan/robust/Patch;->tempPath:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "_temp.jar"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/meituan/robust/Patch;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAppliedSuccess()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/meituan/robust/Patch;->isAppliedSuccess:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAppHash(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/meituan/robust/Patch;->appHash:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAppliedSuccess(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/meituan/robust/Patch;->isAppliedSuccess:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLocalPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/meituan/robust/Patch;->localPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMd5(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/meituan/robust/Patch;->md5:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/meituan/robust/Patch;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPatchesInfoImplClassFullName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/meituan/robust/Patch;->patchesInfoImplClassFullName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTempPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/meituan/robust/Patch;->tempPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/meituan/robust/Patch;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
