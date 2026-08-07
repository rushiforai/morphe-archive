.class public final Lcom/momocv/CpuUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static exitOpenCL:I = -0x1

.field private static qualcommCPU:I = -0x1


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

.method public static getCpuModel()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "/proc/cpuinfo"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/io/FileReader;

    .line 4
    .line 5
    invoke-direct {v1, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/io/BufferedReader;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    const-string v2, "Hardware"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 28
    .line 29
    .line 30
    const-string v0, ":"

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x1

    .line 37
    aget-object v0, v0, v1

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    return-object v0

    .line 44
    :cond_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    :catch_0
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 48
    .line 49
    return-object v0
.end method

.method public static rightHardware()Z
    .locals 6

    .line 1
    sget v0, Lcom/momocv/CpuUtils;->exitOpenCL:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_8

    .line 5
    .line 6
    sget v2, Lcom/momocv/CpuUtils;->qualcommCPU:I

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto/16 :goto_5

    .line 11
    .line 12
    :cond_0
    const/4 v2, -0x1

    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    const-string v0, "/system/vendor/lib/libOpenCL.so"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/momocv/FileUtil;->exist(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sput v0, Lcom/momocv/CpuUtils;->exitOpenCL:I

    .line 22
    .line 23
    :cond_1
    sget v0, Lcom/momocv/CpuUtils;->qualcommCPU:I

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    if-ne v0, v2, :cond_7

    .line 27
    .line 28
    const-string v0, "/proc/cpuinfo"

    .line 29
    .line 30
    invoke-static {v0}, Lcom/momocv/FileUtil;->readString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const-string v4, "qcom"

    .line 39
    .line 40
    const-string v5, "qualcomm"

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    sput v1, Lcom/momocv/CpuUtils;->qualcommCPU:I

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_4

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    move v0, v1

    .line 69
    goto :goto_1

    .line 70
    :cond_4
    :goto_0
    move v0, v3

    .line 71
    :goto_1
    sput v0, Lcom/momocv/CpuUtils;->qualcommCPU:I

    .line 72
    .line 73
    :goto_2
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 74
    .line 75
    sget v2, Lcom/momocv/CpuUtils;->qualcommCPU:I

    .line 76
    .line 77
    if-nez v2, :cond_7

    .line 78
    .line 79
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_7

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_6

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_5

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_5
    move v0, v1

    .line 107
    goto :goto_4

    .line 108
    :cond_6
    :goto_3
    move v0, v3

    .line 109
    :goto_4
    sput v0, Lcom/momocv/CpuUtils;->qualcommCPU:I

    .line 110
    .line 111
    :cond_7
    sget v0, Lcom/momocv/CpuUtils;->exitOpenCL:I

    .line 112
    .line 113
    if-ne v0, v3, :cond_8

    .line 114
    .line 115
    sget v0, Lcom/momocv/CpuUtils;->qualcommCPU:I

    .line 116
    .line 117
    if-ne v0, v3, :cond_8

    .line 118
    .line 119
    return v3

    .line 120
    :cond_8
    :goto_5
    return v1
.end method
