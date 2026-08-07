.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

.field program:Ll/d33;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;Ll/d33;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->program:Ll/d33;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 7
    .line 8
    return-void
.end method

.method public static drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameTexture()[I

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/d33;->updateGeomtryInfo(Ll/lim;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/d33;->drawFrame([I)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void

    .line 19
    :cond_2
    :goto_0
    const-string p0, "FilterProcess"

    .line 20
    .line 21
    const-string p1, "Input Parameter is invalid !"

    .line 22
    .line 23
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static drawTexture(Ll/d33;Ll/lim;I)V
    .locals 0

    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 27
    :cond_0
    filled-new-array {p2}, [I

    move-result-object p2

    .line 28
    invoke-virtual {p0, p1}, Ll/d33;->updateGeomtryInfo(Ll/lim;)V

    .line 29
    invoke-virtual {p0, p2}, Ll/d33;->drawFrame([I)V

    return-void

    .line 30
    :cond_1
    :goto_0
    const-string p0, "FilterProcess"

    const-string p1, "Input Parameter is invalid !"

    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public recycleData()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->program:Ll/d33;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/d33;->destroy()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->program:Ll/d33;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public renderRunning(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->program:Ll/d33;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->setTimeStamp(J)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->program:Ll/d33;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    :goto_0
    const-string p0, "FilterProcess"

    .line 22
    .line 23
    const-string p1, "Info is null or program is null"

    .line 24
    .line 25
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "FilterProcess"

    .line 6
    .line 7
    const-string p1, "Info is null or program is null"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->setTimeStamp(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public updateRnederSize(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/lim;->setBaseRenderSize(II)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "FilterProcess"

    .line 10
    .line 11
    const-string p1, "Info is null"

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
