.class Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;
.source "SourceFile"


# instance fields
.field private groupInitialized:Z

.field protected groupRenderIndex:I

.field protected headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

.field protected templateProgramGroups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupInitialized:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public addRenderGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->destroy()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 38
    .line 39
    return-void
.end method

.method public handleSizeChange()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v1, v2, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->updateRenderSize(II)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-void
.end method

.method public initWithGLContext()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wej;->setBackgroundRed(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/wej;->setBackgroundGreen(F)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/wej;->setBackgroundBlue(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/wej;->setBackgroundAlpha(F)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupInitialized:Z

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->initAllInfo()Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupInitialized:Z

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public onDrawPrograms()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ge v0, v1, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->getRendingStatus()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x3

    .line 28
    if-ne v0, v1, :cond_2

    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->recycleImageBuffers()V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 38
    .line 39
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 40
    .line 41
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 48
    .line 49
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 50
    .line 51
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 54
    .line 55
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-wide v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->setTimeStamp(J)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->drawGroup()V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method

.method public resetGroupStatus()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 10
    .line 11
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->firstTimestamp:J

    .line 14
    .line 15
    return-void
.end method
