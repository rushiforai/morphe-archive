.class Lcn/shuzilm/core/AIClient$AO;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final synthetic a:Lcn/shuzilm/core/AIClient;

.field private b:[I

.field private c:[I

.field private d:Landroid/content/Context;

.field private e:[I


# direct methods
.method private constructor <init>(Lcn/shuzilm/core/AIClient;Landroid/content/Context;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/AIClient$AO;->a:Lcn/shuzilm/core/AIClient;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x34

    .line 7
    .line 8
    new-array p1, p1, [I

    .line 9
    .line 10
    fill-array-data p1, :array_0

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcn/shuzilm/core/AIClient$AO;->b:[I

    .line 14
    .line 15
    const/16 p1, 0xea

    .line 16
    .line 17
    const/16 v0, 0xec

    .line 18
    .line 19
    const/16 v1, 0xe7

    .line 20
    .line 21
    const/16 v2, 0xe2

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    filled-new-array {v1, p1, v2, v0, v3}, [I

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcn/shuzilm/core/AIClient$AO;->c:[I

    .line 29
    .line 30
    const/16 p1, 0x8

    .line 31
    .line 32
    new-array p1, p1, [I

    .line 33
    .line 34
    fill-array-data p1, :array_1

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcn/shuzilm/core/AIClient$AO;->e:[I

    .line 38
    .line 39
    iput-object p2, p0, Lcn/shuzilm/core/AIClient$AO;->d:Landroid/content/Context;

    .line 40
    .line 41
    return-void

    .line 42
    nop

    .line 43
    :array_0
    .array-data 4
        0xf6
        0xfb
        0xf3
        0xfd
        0x9d
        0xd6
        0xfb
        0xc0
        0xd7
        0xdb
        0xd4
        0xdb
        0xc6
        0xdc
        0xd7
        0xd6
        0xfb
        0x9d
        0xc0
        0xd7
        0xd6
        0xdb
        0xc4
        0xdd
        0xc0
        0xe2
        0xd6
        0xfb
        0x9c
        0xc1
        0xdf
        0xc4
        0x9c
        0xdd
        0xc4
        0xdb
        0xc4
        0x9c
        0xdf
        0xdd
        0xd1
        0x9d
        0x9d
        0x88
        0xc6
        0xdc
        0xd7
        0xc6
        0xdc
        0xdd
        0xd1
        0x0
    .end array-data

    .line 44
    .line 45
    .line 46
    .line 47
    :array_1
    .array-data 4
        0xc2
        0xcf
        0xc7
        0xc9
        0xf2
        0xe3
        0xe1
        0x0
    .end array-data
.end method

.method public synthetic constructor <init>(Lcn/shuzilm/core/AIClient;Landroid/content/Context;Lcn/shuzilm/core/AIClient$1;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1, p2}, Lcn/shuzilm/core/AIClient$AO;-><init>(Lcn/shuzilm/core/AIClient;Landroid/content/Context;)V

    return-void
.end method

.method private a()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    .line 114
    :try_start_0
    iget-object v1, p0, Lcn/shuzilm/core/AIClient$AO;->a:Lcn/shuzilm/core/AIClient;

    invoke-static {}, Lcn/shuzilm/core/AIClient;->b()[I

    move-result-object v2

    invoke-static {v1, v2}, Lcn/shuzilm/core/AIClient;->a(Lcn/shuzilm/core/AIClient;[I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 115
    iget-object v2, p0, Lcn/shuzilm/core/AIClient$AO;->d:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 116
    :cond_0
    iget-object v2, p0, Lcn/shuzilm/core/AIClient$AO;->a:Lcn/shuzilm/core/AIClient;

    iget-object p0, p0, Lcn/shuzilm/core/AIClient$AO;->e:[I

    invoke-static {v2, p0}, Lcn/shuzilm/core/AIClient;->a(Lcn/shuzilm/core/AIClient;[I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0, v0, v0}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p0

    .line 117
    invoke-virtual {v1}, Landroid/content/ContentProviderClient;->close()V

    if-nez p0, :cond_1

    goto :goto_0

    .line 118
    :cond_1
    const-string v1, "code"

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-nez v1, :cond_2

    .line 119
    const-string v1, "id"

    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    :cond_2
    :goto_0
    return-object v0
.end method

.method private a(I)Ljava/lang/String;
    .locals 8

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v0, 0x1b

    .line 8
    .line 9
    if-le p1, v0, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcn/shuzilm/core/AIClient$AO;->a:Lcn/shuzilm/core/AIClient;

    .line 12
    .line 13
    iget-object v0, p0, Lcn/shuzilm/core/AIClient$AO;->b:[I

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcn/shuzilm/core/AIClient;->a(Lcn/shuzilm/core/AIClient;[I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object p0, p0, Lcn/shuzilm/core/AIClient$AO;->d:Landroid/content/Context;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const/4 v6, 0x0

    .line 30
    const/4 v7, 0x0

    .line 31
    const/4 v4, 0x0

    .line 32
    const/4 v5, 0x0

    .line 33
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v0, 0x5

    .line 39
    if-ne p1, v0, :cond_1

    .line 40
    .line 41
    iget-object p1, p0, Lcn/shuzilm/core/AIClient$AO;->a:Lcn/shuzilm/core/AIClient;

    .line 42
    .line 43
    invoke-static {}, Lcn/shuzilm/core/AIClient;->a()[I

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p1, v0}, Lcn/shuzilm/core/AIClient;->a(Lcn/shuzilm/core/AIClient;[I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    iget-object p1, p0, Lcn/shuzilm/core/AIClient$AO;->d:Landroid/content/Context;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    const/4 p1, 0x1

    .line 62
    new-array v6, p1, [Ljava/lang/String;

    .line 63
    .line 64
    iget-object p1, p0, Lcn/shuzilm/core/AIClient$AO;->a:Lcn/shuzilm/core/AIClient;

    .line 65
    .line 66
    iget-object p0, p0, Lcn/shuzilm/core/AIClient$AO;->c:[I

    .line 67
    .line 68
    invoke-static {p1, p0}, Lcn/shuzilm/core/AIClient;->a(Lcn/shuzilm/core/AIClient;[I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const/4 p1, 0x0

    .line 73
    aput-object p0, v6, p1

    .line 74
    .line 75
    const/4 v7, 0x0

    .line 76
    const/4 v4, 0x0

    .line 77
    const/4 v5, 0x0

    .line 78
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    move-object p0, v1

    .line 84
    :goto_0
    if-eqz p0, :cond_3

    .line 85
    .line 86
    invoke-interface {p0}, Landroid/database/Cursor;->isClosed()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_3

    .line 91
    .line 92
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_2

    .line 97
    .line 98
    const-string p1, "value"

    .line 99
    .line 100
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    :cond_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    .line 110
    .line 111
    :catchall_0
    :cond_3
    return-object v1
.end method

.method public static synthetic a(Lcn/shuzilm/core/AIClient$AO;)Ljava/lang/String;
    .locals 0

    .line 112
    invoke-direct {p0}, Lcn/shuzilm/core/AIClient$AO;->a()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcn/shuzilm/core/AIClient$AO;I)Ljava/lang/String;
    .locals 0

    .line 113
    invoke-direct {p0, p1}, Lcn/shuzilm/core/AIClient$AO;->a(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
