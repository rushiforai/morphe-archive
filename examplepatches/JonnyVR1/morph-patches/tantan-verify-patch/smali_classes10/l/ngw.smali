.class public Ll/ngw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/regex/Pattern;

.field public static final b:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "((\\[\\d{2}:\\d{2}\\.\\d{2,3}\\])+)(.+)"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/ngw;->a:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    const-string v0, "\\[(\\d{2}):(\\d{2})\\.(\\d{2,3})\\]"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/ngw;->b:Ljava/util/regex/Pattern;

    .line 16
    .line 17
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

.method public static a(Ljava/lang/String;)Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Ll/ngw;->a:Ljava/util/regex/Pattern;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_1
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-nez v2, :cond_2

    .line 32
    .line 33
    return-object v1

    .line 34
    :cond_2
    const/4 v1, 0x3

    .line 35
    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance v3, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    sget-object v4, Ll/ngw;->b:Ljava/util/regex/Pattern;

    .line 45
    .line 46
    invoke-virtual {v4, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    :goto_0
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_4

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 61
    .line 62
    .line 63
    move-result-wide v4

    .line 64
    const/4 v6, 0x2

    .line 65
    invoke-virtual {v2, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 70
    .line 71
    .line 72
    move-result-wide v7

    .line 73
    invoke-virtual {v2, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v9

    .line 77
    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 78
    .line 79
    .line 80
    move-result-wide v10

    .line 81
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 82
    .line 83
    .line 84
    move-result v9

    .line 85
    if-ne v9, v6, :cond_3

    .line 86
    .line 87
    const-wide/16 v12, 0xa

    .line 88
    .line 89
    mul-long/2addr v10, v12

    .line 90
    :cond_3
    const-wide/32 v12, 0xea60

    .line 91
    .line 92
    .line 93
    mul-long/2addr v4, v12

    .line 94
    const-wide/16 v12, 0x3e8

    .line 95
    .line 96
    mul-long/2addr v7, v12

    .line 97
    add-long/2addr v4, v7

    .line 98
    add-long/2addr v4, v10

    .line 99
    new-instance v6, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;

    .line 100
    .line 101
    invoke-direct {v6}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-wide v4, v6, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->begin:J

    .line 105
    .line 106
    iput-object p0, v6, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->word:Ljava/lang/String;

    .line 107
    .line 108
    sget-object v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;->Chinese:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;

    .line 109
    .line 110
    iput-object v4, v6, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->lang:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Lang;

    .line 111
    .line 112
    new-instance v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 113
    .line 114
    invoke-direct {v4, v6}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;)V

    .line 115
    .line 116
    .line 117
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_4
    return-object v3
.end method

.method public static b(Ljava/io/File;)Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;
    .locals 6

    .line 1
    if-eqz p0, :cond_6

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 11
    .line 12
    const-string v1, "Default"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->setLrcBeans(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    .line 26
    .line 27
    new-instance v3, Ljava/io/InputStreamReader;

    .line 28
    .line 29
    new-instance v4, Ljava/io/FileInputStream;

    .line 30
    .line 31
    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "utf-8"

    .line 35
    .line 36
    invoke-direct {v3, v4, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-static {p0}, Ll/ngw;->a(Ljava/lang/String;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_1

    .line 59
    .line 60
    invoke-interface {v1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    :catch_0
    const/4 p0, 0x0

    .line 68
    move v2, p0

    .line 69
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    add-int/lit8 v3, v3, -0x1

    .line 74
    .line 75
    if-ge v2, v3, :cond_5

    .line 76
    .line 77
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 82
    .line 83
    add-int/lit8 v2, v2, 0x1

    .line 84
    .line 85
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 90
    .line 91
    iget-object v5, v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 92
    .line 93
    if-eqz v5, :cond_3

    .line 94
    .line 95
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    if-gtz v5, :cond_4

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_4
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;

    .line 109
    .line 110
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->getStartTime()J

    .line 111
    .line 112
    .line 113
    move-result-wide v4

    .line 114
    iput-wide v4, v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->end:J

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_5
    return-object v0

    .line 118
    :cond_6
    :goto_2
    const/4 p0, 0x0

    .line 119
    return-object p0
.end method
