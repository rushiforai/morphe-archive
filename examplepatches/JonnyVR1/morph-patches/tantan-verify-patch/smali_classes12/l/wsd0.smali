.class public Ll/wsd0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:J

.field private static b:J

.field private static c:Ll/wsd0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/wsd0;->c()V

    .line 5
    .line 6
    .line 7
    sget-wide v0, Ll/wsd0;->a:J

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget-wide v0, Ll/wsd0;->b:J

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    invoke-direct {p0}, Ll/wsd0;->d()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static a()Ll/wsd0;
    .locals 1

    .line 1
    sget-object v0, Ll/wsd0;->c:Ll/wsd0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/wsd0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/wsd0;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/wsd0;->c:Ll/wsd0;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/wsd0;->c:Ll/wsd0;

    .line 13
    .line 14
    return-object v0
.end method

.method private c()V
    .locals 3

    .line 1
    invoke-static {}, Ll/eiw;->a()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0x28

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    fill-array-data v0, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p0, v0}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    :try_start_0
    new-instance v0, Landroid/os/StatFs;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-direct {v0, p0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/os/StatFs;->getTotalBytes()J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    sput-wide v1, Ll/wsd0;->a:J

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/os/StatFs;->getAvailableBytes()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    sput-wide v0, Ll/wsd0;->b:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    const-wide/16 v0, 0x0

    .line 59
    .line 60
    sput-wide v0, Ll/wsd0;->a:J

    .line 61
    .line 62
    sput-wide v0, Ll/wsd0;->b:J

    .line 63
    .line 64
    :cond_2
    :goto_0
    return-void

    .line 65
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x41t
        0x52t
        0x13t
        0xbt
        0x59t
        0x15t
        0x42t
        0x5et
        0xet
        0x8t
        0x1et
        0x34t
        0x74t
        0x76t
        0x25t
        0x39t
        0x75t
        0x3et
        0x65t
        0x72t
        0x33t
        0x28t
        0x71t
        0x2at
        0x6et
        0x64t
        0x35t
        0x29t
        0x62t
        0x27t
        0x76t
        0x72t
    .end array-data
.end method

.method private d()V
    .locals 5

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [B

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, 0xb

    .line 12
    .line 13
    new-array v0, v0, [B

    .line 14
    .line 15
    fill-array-data v0, :array_1

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    filled-new-array {p0, v0}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-static {p0, v0}, Ll/r4f0;->a([Ljava/lang/String;Z)Ll/r4f0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p0, p0, Ll/r4f0$a;->b:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "\n"

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    array-length v1, p0

    .line 40
    :goto_0
    if-ge v0, v1, :cond_2

    .line 41
    .line 42
    aget-object v2, p0, v0

    .line 43
    .line 44
    const/16 v3, 0xa

    .line 45
    .line 46
    new-array v3, v3, [B

    .line 47
    .line 48
    fill-array-data v3, :array_2

    .line 49
    .line 50
    .line 51
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_0

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    const/16 v3, 0x1b

    .line 63
    .line 64
    new-array v3, v3, [B

    .line 65
    .line 66
    fill-array-data v3, :array_3

    .line 67
    .line 68
    .line 69
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_1

    .line 86
    .line 87
    const/4 v3, 0x1

    .line 88
    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v3

    .line 96
    sput-wide v3, Ll/wsd0;->a:J

    .line 97
    .line 98
    const/4 v3, 0x3

    .line 99
    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 104
    .line 105
    .line 106
    move-result-wide v2

    .line 107
    sput-wide v2, Ll/wsd0;->b:J

    .line 108
    .line 109
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_2
    return-void

    .line 113
    :array_0
    .array-data 1
        0x54t
        0x0t
    .end array-data

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    nop

    .line 119
    :array_1
    .array-data 1
        0x1ft
        0xbt
        0x5ft
        0x43t
        0x4et
        0x15t
        0x54t
        0x5t
        0x50t
        0x45t
        0x5t
    .end array-data

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    :array_2
    .array-data 1
        0x76t
        0xft
        0x5dt
        0x52t
        0x12t
        0x1ft
        0x43t
        0x12t
        0x54t
        0x5at
    .end array-data

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    nop

    .line 139
    :array_3
    .array-data 1
        0x6ct
        0x15t
        0x1at
        0x1ft
        0x3dt
        0x2t
        0x1bt
        0x4ft
        0x6dt
        0x44t
        0x4at
        0x4et
        0x6ct
        0x2t
        0x1at
        0x1et
        0x3dt
        0x15t
        0x1bt
        0x4et
        0x6dt
        0x53t
        0x4at
        0x4ft
        0x6ct
        0x15t
        0x1at
    .end array-data
.end method


# virtual methods
.method public b()Ljava/lang/Long;
    .locals 2

    .line 1
    sget-wide v0, Ll/wsd0;->a:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
