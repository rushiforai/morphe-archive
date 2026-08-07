.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;
.source "SourceFile"


# instance fields
.field nextGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic addRenderGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->addRenderGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;->nextGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic drawSub()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawSub()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public handleSizeChange()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDrawPrograms()V
    .locals 5

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
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x3

    .line 9
    if-lez v0, :cond_2

    .line 10
    .line 11
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 12
    .line 13
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-ge v0, v3, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->getRendingStatus()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-ne v0, v2, :cond_2

    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->recycleImageBuffers()V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 39
    .line 40
    iget v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 41
    .line 42
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 49
    .line 50
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 51
    .line 52
    add-int/2addr v0, v1

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
    iget-wide v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 60
    .line 61
    invoke-virtual {v0, v3, v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->setTimeStamp(J)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->drawGroup()V

    .line 67
    .line 68
    .line 69
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-le v0, v1, :cond_5

    .line 76
    .line 77
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 78
    .line 79
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-ge v0, v1, :cond_5

    .line 86
    .line 87
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 88
    .line 89
    if-eqz v0, :cond_5

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->getRendingStatus()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    const/4 v1, 0x2

    .line 96
    if-eq v0, v1, :cond_4

    .line 97
    .line 98
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->headGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->getRendingStatus()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-ne v0, v2, :cond_5

    .line 105
    .line 106
    :cond_4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->templateProgramGroups:Ljava/util/List;

    .line 107
    .line 108
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->groupRenderIndex:I

    .line 109
    .line 110
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 115
    .line 116
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;->nextGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 117
    .line 118
    if-eqz v0, :cond_5

    .line 119
    .line 120
    iget-wide v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 121
    .line 122
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->setTimeStamp(J)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;->nextGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->drawGroup()V

    .line 128
    .line 129
    .line 130
    :cond_5
    return-void
.end method

.method public resetGroupStatus()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/EsProgramGroupRenderFilter;->resetGroupStatus()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;->nextGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 6
    .line 7
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->setTimeStamp(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setTotalFrameCount(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->setTotalFrameCount(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic snapPicture(II)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->snapPicture(II)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
