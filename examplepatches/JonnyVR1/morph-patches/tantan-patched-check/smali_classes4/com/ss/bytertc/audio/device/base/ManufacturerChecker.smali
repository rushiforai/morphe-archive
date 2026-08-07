.class public Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;
    }
.end annotation


# static fields
.field private static final hrType:Ljava/lang/String; = "ronoh"

.field private static final hwType:Ljava/lang/String; = "iewauh"

.field private static final oneType:Ljava/lang/String; = "sulpeno"

.field private static final realType:Ljava/lang/String; = "emlaer"

.field private static final rmType:Ljava/lang/String; = "imder"

.field private static typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type; = null

.field private static final voType:Ljava/lang/String; = "oviv"

.field private static final xmType:Ljava/lang/String; = "imoaix"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;
    .locals 1

    .line 153
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-static {v0}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType(Ljava/lang/String;)Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    move-result-object v0

    return-object v0
.end method

.method public static getManufacturerType(Ljava/lang/String;)Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    if-eqz p0, :cond_a

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    goto/16 :goto_2

    .line 15
    .line 16
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "imoaix"

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    sget-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->XM:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 42
    .line 43
    sput-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    const-string v0, "imder"

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    sget-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->RM:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 55
    .line 56
    sput-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    const-string v0, "iewauh"

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    sget-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->HW:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 68
    .line 69
    sput-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    const-string v0, "ronoh"

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_5

    .line 79
    .line 80
    sget-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->HR:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 81
    .line 82
    sput-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_5
    const-string v0, "oviv"

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_6

    .line 92
    .line 93
    sget-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->VO:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 94
    .line 95
    sput-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    const/4 v1, 0x4

    .line 103
    if-ne v0, v1, :cond_7

    .line 104
    .line 105
    const-string v0, "op"

    .line 106
    .line 107
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_7

    .line 112
    .line 113
    const-string v0, "po"

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_9

    .line 120
    .line 121
    :cond_7
    const-string v0, "sulpeno"

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_9

    .line 128
    .line 129
    const-string v0, "emlaer"

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-eqz p0, :cond_8

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_8
    sget-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->UNKNOWN:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 139
    .line 140
    sput-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_9
    :goto_0
    sget-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->OP:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 144
    .line 145
    sput-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 146
    .line 147
    :goto_1
    sget-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->typeResult:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 148
    .line 149
    return-object p0

    .line 150
    :cond_a
    :goto_2
    sget-object p0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->UNKNOWN:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 151
    .line 152
    return-object p0
.end method
