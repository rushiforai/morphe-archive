.class public Lcom/idv/identity/platform/config/DeviceSetting;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field algorithmAngle:I

.field algorithmAuto:Z

.field cameraAuto:Z

.field cameraID:I

.field displayAngle:I

.field displayAuto:Z

.field isp:Z

.field maxApiLevel:I

.field minApiLevel:I

.field slir:Z

.field width:I

.field widthAuto:Z

.field zoom:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->displayAuto:Z

    .line 6
    .line 7
    const/16 v1, 0x5a

    .line 8
    .line 9
    iput v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->displayAngle:I

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->cameraAuto:Z

    .line 12
    .line 13
    iput v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->cameraID:I

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->algorithmAuto:Z

    .line 16
    .line 17
    const/16 v1, 0x10e

    .line 18
    .line 19
    iput v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->algorithmAngle:I

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->widthAuto:Z

    .line 22
    .line 23
    const/16 v0, 0x280

    .line 24
    .line 25
    iput v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->width:I

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->zoom:I

    .line 29
    .line 30
    const/16 v1, 0x64

    .line 31
    .line 32
    iput v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->maxApiLevel:I

    .line 33
    .line 34
    iput v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->minApiLevel:I

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->isp:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->slir:Z

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public getAlgorithmAngle()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->algorithmAngle:I

    .line 2
    .line 3
    return p0
.end method

.method public getCameraID()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->cameraID:I

    .line 2
    .line 3
    return p0
.end method

.method public getDisplayAngle()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->displayAngle:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxApiLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->maxApiLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinApiLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->minApiLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public getZoom()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->zoom:I

    .line 2
    .line 3
    return p0
.end method

.method public isAlgorithmAuto()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->algorithmAuto:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCameraAuto()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->cameraAuto:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDisplayAuto()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->displayAuto:Z

    .line 2
    .line 3
    return p0
.end method

.method public isIsp()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->isp:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSlir()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->slir:Z

    .line 2
    .line 3
    return p0
.end method

.method public isWidthAuto()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->widthAuto:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAlgorithmAngle(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->algorithmAngle:I

    .line 2
    .line 3
    return-void
.end method

.method public setAlgorithmAuto(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->algorithmAuto:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCameraAuto(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->cameraAuto:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCameraID(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->cameraID:I

    .line 2
    .line 3
    return-void
.end method

.method public setDisplayAngle(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->displayAngle:I

    .line 2
    .line 3
    return-void
.end method

.method public setDisplayAuto(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->displayAuto:Z

    .line 2
    .line 3
    return-void
.end method

.method public setIsp(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->isp:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMaxApiLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->maxApiLevel:I

    .line 2
    .line 3
    return-void
.end method

.method public setMinApiLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->minApiLevel:I

    .line 2
    .line 3
    return-void
.end method

.method public setSlir(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->slir:Z

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->width:I

    .line 2
    .line 3
    return-void
.end method

.method public setWidthAuto(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->widthAuto:Z

    .line 2
    .line 3
    return-void
.end method

.method public setZoom(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->zoom:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "DeviceSetting{displayAuto="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->displayAuto:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", displayAngle="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->displayAngle:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", cameraAuto="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->cameraAuto:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", cameraID="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->cameraID:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", algorithmAuto="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->algorithmAuto:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", algorithmAngle="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->algorithmAngle:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", widthAuto="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->widthAuto:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", width="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->width:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", zoom="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->zoom:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", maxApiLevel="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->maxApiLevel:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", minApiLevel="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->minApiLevel:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", isp="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-boolean v1, p0, Lcom/idv/identity/platform/config/DeviceSetting;->isp:Z

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", slir="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-boolean p0, p0, Lcom/idv/identity/platform/config/DeviceSetting;->slir:Z

    .line 129
    .line 130
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const/16 p0, 0x7d

    .line 134
    .line 135
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0
.end method
