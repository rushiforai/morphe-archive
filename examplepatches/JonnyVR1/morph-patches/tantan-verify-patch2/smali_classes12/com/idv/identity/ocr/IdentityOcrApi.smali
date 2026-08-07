.class public Lcom/idv/identity/ocr/IdentityOcrApi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static s_instance:Lcom/idv/identity/ocr/IdentityOcrApi;


# instance fields
.field private ocrBankCardModelFiles:[Ljava/lang/String;

.field private ocrIDCardModelFiles:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/ocr/IdentityOcrApi;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/idv/identity/ocr/IdentityOcrApi;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/idv/identity/ocr/IdentityOcrApi;->s_instance:Lcom/idv/identity/ocr/IdentityOcrApi;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/idv/identity/ocr/IdentityOcrApi;->ocrIDCardModelFiles:[Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/idv/identity/ocr/IdentityOcrApi;->ocrBankCardModelFiles:[Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public static getInstance()Lcom/idv/identity/ocr/IdentityOcrApi;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/ocr/IdentityOcrApi;->s_instance:Lcom/idv/identity/ocr/IdentityOcrApi;

    .line 2
    .line 3
    return-object v0
.end method

.method private init(Landroid/content/Context;)Z
    .locals 2

    .line 1
    const-string v0, "ocr_idcard"

    .line 2
    .line 3
    const-string v1, "idcard"

    .line 4
    .line 5
    invoke-direct {p0, p1, v0, v1}, Lcom/idv/identity/ocr/IdentityOcrApi;->releaseAssetsModels(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/idv/identity/ocr/IdentityOcrApi;->ocrIDCardModelFiles:[Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "ocr_bankcard"

    .line 12
    .line 13
    const-string v1, "bankcard"

    .line 14
    .line 15
    invoke-direct {p0, p1, v0, v1}, Lcom/idv/identity/ocr/IdentityOcrApi;->releaseAssetsModels(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/idv/identity/ocr/IdentityOcrApi;->ocrBankCardModelFiles:[Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityOcrApi;->ocrIDCardModelFiles:[Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method private releaseAssetsModels(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 11

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v0, "/"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p2, Ljava/io/File;

    .line 30
    .line 31
    invoke-direct {p2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    const/4 v1, 0x0

    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    return-object v1

    .line 48
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, p3}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    array-length v2, p0

    .line 59
    if-lez v2, :cond_2

    .line 60
    .line 61
    array-length v2, p0

    .line 62
    new-array v1, v2, [Ljava/lang/String;

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    move v3, v2

    .line 66
    :goto_0
    array-length v4, p0

    .line 67
    if-ge v3, v4, :cond_2

    .line 68
    .line 69
    aget-object v4, p0, v3

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    new-instance v6, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    invoke-virtual {v5, v6}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    new-instance v6, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    new-instance v6, Ljava/io/FileOutputStream;

    .line 116
    .line 117
    invoke-direct {v6, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    const/16 v7, 0x400

    .line 121
    .line 122
    new-array v8, v7, [B

    .line 123
    .line 124
    :goto_1
    invoke-virtual {v5, v8, v2, v7}, Ljava/io/InputStream;->read([BII)I

    .line 125
    .line 126
    .line 127
    move-result v9

    .line 128
    const/4 v10, -0x1

    .line 129
    if-eq v10, v9, :cond_1

    .line 130
    .line 131
    invoke-virtual {v6, v8, v2, v9}, Ljava/io/FileOutputStream;->write([BII)V

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :catch_0
    move-exception p0

    .line 136
    goto :goto_2

    .line 137
    :cond_1
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 141
    .line 142
    .line 143
    aput-object v4, v1, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    .line 145
    add-int/lit8 v3, v3, 0x1

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_2
    return-object v1

    .line 149
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 150
    .line 151
    .line 152
    return-object v1
.end method


# virtual methods
.method public getOcrBankCardModelFiles()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityOcrApi;->ocrBankCardModelFiles:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOcrIDCardModelFiles()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityOcrApi;->ocrIDCardModelFiles:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public startPassport(Landroid/content/Context;Z)Z
    .locals 4

    .line 1
    const-string p0, "status"

    .line 2
    .line 3
    const-string v0, "navigatePassport"

    .line 4
    .line 5
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    .line 6
    .line 7
    const-class v2, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 8
    .line 9
    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    const-string v2, "isEnabled"

    .line 13
    .line 14
    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-object p2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 25
    .line 26
    const-string v1, "success"

    .line 27
    .line 28
    filled-new-array {p0, v1}, [Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p1, p2, v0, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :catch_0
    move-exception p1

    .line 38
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 43
    .line 44
    const-string v2, "exception"

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v3, "catchException"

    .line 51
    .line 52
    filled-new-array {p0, v3, v2, p1}, [Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p2, v1, v0, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public startScan(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/IdentityOcrApi;->init(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    new-instance p0, Landroid/content/Intent;

    .line 5
    .line 6
    const-class v0, Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0
.end method
