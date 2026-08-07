.class public final Ll/y5r0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final e:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/nio/channels/FileLock;

.field private c:Ljava/lang/String;

.field private d:Ljava/io/RandomAccessFile;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/y5r0;->e:Ljava/util/Set;

    .line 11
    .line 12
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y5r0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/io/File;)Ll/y5r0;
    .locals 5

    .line 1
    const-string v0, "Locked: "

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Locking: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, ".LOCK"

    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v1, Ljava/io/File;

    .line 46
    .line 47
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_0

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 64
    .line 65
    .line 66
    :cond_0
    sget-object v2, Ll/y5r0;->e:Ljava/util/Set;

    .line 67
    .line 68
    invoke-interface {v2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_5

    .line 73
    .line 74
    new-instance v3, Ll/y5r0;

    .line 75
    .line 76
    invoke-direct {v3, p0}, Ll/y5r0;-><init>(Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    iput-object p1, v3, Ll/y5r0;->c:Ljava/lang/String;

    .line 80
    .line 81
    :try_start_0
    new-instance p0, Ljava/io/RandomAccessFile;

    .line 82
    .line 83
    const-string v4, "rw"

    .line 84
    .line 85
    invoke-direct {p0, v1, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iput-object p0, v3, Ll/y5r0;->d:Ljava/io/RandomAccessFile;

    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iput-object p0, v3, Ll/y5r0;->b:Ljava/nio/channels/FileLock;

    .line 99
    .line 100
    new-instance p0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string p1, " :"

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object p1, v3, Ll/y5r0;->b:Ljava/nio/channels/FileLock;

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {p0}, Ll/ouq0;->z(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    .line 124
    .line 125
    iget-object p0, v3, Ll/y5r0;->b:Ljava/nio/channels/FileLock;

    .line 126
    .line 127
    if-nez p0, :cond_2

    .line 128
    .line 129
    iget-object p0, v3, Ll/y5r0;->d:Ljava/io/RandomAccessFile;

    .line 130
    .line 131
    if-eqz p0, :cond_1

    .line 132
    .line 133
    invoke-static {p0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 134
    .line 135
    .line 136
    :cond_1
    iget-object p0, v3, Ll/y5r0;->c:Ljava/lang/String;

    .line 137
    .line 138
    invoke-interface {v2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    :cond_2
    return-object v3

    .line 142
    :catchall_0
    move-exception p0

    .line 143
    iget-object p1, v3, Ll/y5r0;->b:Ljava/nio/channels/FileLock;

    .line 144
    .line 145
    if-nez p1, :cond_4

    .line 146
    .line 147
    iget-object p1, v3, Ll/y5r0;->d:Ljava/io/RandomAccessFile;

    .line 148
    .line 149
    if-eqz p1, :cond_3

    .line 150
    .line 151
    invoke-static {p1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 152
    .line 153
    .line 154
    :cond_3
    sget-object p1, Ll/y5r0;->e:Ljava/util/Set;

    .line 155
    .line 156
    iget-object v0, v3, Ll/y5r0;->c:Ljava/lang/String;

    .line 157
    .line 158
    invoke-interface {p1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    :cond_4
    throw p0

    .line 162
    :cond_5
    const-string p0, "abtain lock failure"

    .line 163
    .line 164
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    const/4 p0, 0x0

    .line 168
    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "unLock: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/y5r0;->b:Ljava/nio/channels/FileLock;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/y5r0;->b:Ljava/nio/channels/FileLock;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    :try_start_0
    iget-object v0, p0, Ll/y5r0;->b:Ljava/nio/channels/FileLock;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    :catch_0
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Ll/y5r0;->b:Ljava/nio/channels/FileLock;

    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/y5r0;->d:Ljava/io/RandomAccessFile;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-static {v0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    sget-object v0, Ll/y5r0;->e:Ljava/util/Set;

    .line 46
    .line 47
    iget-object p0, p0, Ll/y5r0;->c:Ljava/lang/String;

    .line 48
    .line 49
    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    return-void
.end method
