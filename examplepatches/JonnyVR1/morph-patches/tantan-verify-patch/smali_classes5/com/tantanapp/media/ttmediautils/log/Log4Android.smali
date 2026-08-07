.class public Lcom/tantanapp/media/ttmediautils/log/Log4Android;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "momo"

.field public static enableSaveLog:Z

.field private static instance:Lcom/tantanapp/media/ttmediautils/log/Log4Android;


# instance fields
.field private isDebug:Z

.field private msgPostfix:Ljava/lang/String;

.field private msgPrefix:Ljava/lang/String;

.field private processName:Ljava/lang/String;

.field private saveFile:Ljava/io/File;

.field private tag:Ljava/lang/String;

.field private writer:Ljava/io/BufferedWriter;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    const-string v0, "momo"

    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    .line 127
    const-string v0, ""

    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPrefix:Ljava/lang/String;

    .line 128
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPostfix:Ljava/lang/String;

    const/4 v0, 0x0

    .line 129
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    .line 130
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writer:Ljava/io/BufferedWriter;

    .line 131
    sget-boolean v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->DEBUGGABLE:Z

    iput-boolean v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    return-void
.end method

.method private constructor <init>(Ljava/io/File;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "momo"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPrefix:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPostfix:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writer:Ljava/io/BufferedWriter;

    .line 18
    .line 19
    sget-boolean v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->DEBUGGABLE:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v1, "auto_create_"

    .line 43
    .line 44
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, ".log"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v2, "Warning: saveFile is a directory, path = \u2018"

    .line 66
    .line 67
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v2, "\u2019. create a new file \u2018"

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v2, "\u2019"

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-static {v1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->printLog(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    new-instance v1, Ljava/io/File;

    .line 98
    .line 99
    invoke-direct {v1, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :catch_0
    move-exception p1

    .line 107
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 108
    .line 109
    .line 110
    :goto_0
    move-object p1, v1

    .line 111
    :cond_1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    .line 112
    .line 113
    :cond_2
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 122
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    const-string v0, "momo"

    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    .line 116
    const-string v0, ""

    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPrefix:Ljava/lang/String;

    .line 117
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPostfix:Ljava/lang/String;

    const/4 v0, 0x0

    .line 118
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    .line 119
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writer:Ljava/io/BufferedWriter;

    .line 120
    sget-boolean v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->DEBUGGABLE:Z

    iput-boolean v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 121
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->setTag(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    .line 123
    invoke-direct {p0, p2}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;-><init>(Ljava/io/File;)V

    .line 124
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->setTag(Ljava/lang/String;)V

    return-void
.end method

.method public static formatErrorStack(Ljava/lang/Appendable;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    new-instance p1, Ljava/io/StringWriter;

    .line 2
    .line 3
    const/16 v0, 0x200

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/io/StringWriter;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/io/PrintWriter;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 11
    .line 12
    .line 13
    :goto_0
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p0, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static formatErrorStack(Ljava/lang/Appendable;Ljava/lang/Throwable;)V
    .locals 1

    .line 38
    const-string v0, ""

    invoke-static {p0, v0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->formatErrorStack(Ljava/lang/Appendable;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static getInstance()Lcom/tantanapp/media/ttmediautils/log/Log4Android;
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->instance:Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->instance:Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->instance:Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->instance:Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 27
    .line 28
    return-object v0
.end method

.method public static printLog(Ljava/lang/String;)V
    .locals 2

    .line 222
    sget-boolean v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->DEBUGGABLE:Z

    if-eqz v0, :cond_0

    .line 223
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TTMedia==** "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ttmedia"

    invoke-static {v0, p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static printLog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 219
    sget-boolean v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->DEBUGGABLE:Z

    if-eqz v0, :cond_0

    .line 220
    invoke-static {p0, p1}, Lcom/tantanapp/media/ttmediautils/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private saveLog(Ljava/lang/CharSequence;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writer:Ljava/io/BufferedWriter;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/io/BufferedWriter;

    .line 16
    .line 17
    new-instance v1, Ljava/io/OutputStreamWriter;

    .line 18
    .line 19
    new-instance v2, Ljava/io/FileOutputStream;

    .line 20
    .line 21
    iget-object v3, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writer:Ljava/io/BufferedWriter;

    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writer:Ljava/io/BufferedWriter;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writer:Ljava/io/BufferedWriter;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    :catch_0
    :cond_1
    return-void
.end method

.method public static saveLog(Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;Ljava/io/File;)V
    .locals 0

    .line 51
    invoke-static {p3, p0}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writeToFile(Ljava/io/File;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static saveLog(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 48
    invoke-static {p0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->formatErrorStack(Ljava/lang/Appendable;Ljava/lang/Throwable;)V

    .line 49
    :cond_0
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;->LOG_ERROR:Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;

    invoke-static {p0, p2, p1, p3}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveLog(Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;Ljava/io/File;)V

    return-void
.end method

.method public static saveLog(Ljava/lang/Throwable;Ljava/lang/String;Ljava/io/File;)V
    .locals 1

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p0, :cond_0

    .line 46
    invoke-static {v0, p0}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->formatErrorStack(Ljava/lang/Appendable;Ljava/lang/Throwable;)V

    .line 47
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;->LOG_ERROR:Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;

    invoke-static {p0, p1, v0, p2}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveLog(Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;Ljava/io/File;)V

    return-void
.end method

.method public static writeToFile(Ljava/io/File;Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/io/FileWriter;

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-direct {v1, p0, v2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6
    .line 7
    .line 8
    :try_start_1
    invoke-virtual {v1, p1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    .line 13
    .line 14
    :try_start_2
    invoke-virtual {v1}, Ljava/io/Writer;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 15
    .line 16
    .line 17
    goto :goto_2

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    move-object v0, v1

    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-object v0, v1

    .line 22
    goto :goto_1

    .line 23
    :catchall_1
    move-exception p0

    .line 24
    :goto_0
    if-eqz v0, :cond_0

    .line 25
    .line 26
    :try_start_3
    invoke-virtual {v0}, Ljava/io/Writer;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 27
    .line 28
    .line 29
    :catch_1
    :cond_0
    throw p0

    .line 30
    :catch_2
    :goto_1
    if-eqz v0, :cond_1

    .line 31
    .line 32
    :try_start_4
    invoke-virtual {v0}, Ljava/io/Writer;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 33
    .line 34
    .line 35
    :catch_3
    :cond_1
    :goto_2
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writer:Ljava/io/BufferedWriter;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->writer:Ljava/io/BufferedWriter;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    :catch_0
    :cond_0
    return-void
.end method

.method public closeDebug()Lcom/tantanapp/media/ttmediautils/log/Log4Android;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public d(Ljava/lang/Object;)V
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->d(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPrefix:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p2, "null"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPostfix:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p1, p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPrefix:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p2, "null"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPostfix:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p2, "%s"

    .line 37
    .line 38
    invoke-static {p1, p3, p2, p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    invoke-virtual {p0, v0, p1, p2}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public e(Ljava/lang/Throwable;)V
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public getMsgPostfix()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPostfix:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMsgPrefix()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPrefix:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSaveFile()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ljava/lang/Object;)V
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->i(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public i(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPrefix:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p2, "null"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPostfix:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p1, p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public isDebug()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 2
    .line 3
    return p0
.end method

.method public log4Cast(Ljava/lang/String;J)J
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-boolean v2, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p1, " "

    .line 19
    .line 20
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    sub-long p1, v0, p2

    .line 24
    .line 25
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->d(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-wide v0
.end method

.method public longInfo(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xfa0

    .line 6
    .line 7
    if-le v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->i(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->longInfo(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->i(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public openDebug()Lcom/tantanapp/media/ttmediautils/log/Log4Android;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public printLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;)V
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    sget-boolean v0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->enableSaveLog:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    move v0, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    :goto_0
    if-eqz v0, :cond_4

    .line 22
    .line 23
    iget-object v2, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->processName:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/app/AppContext;->getCurrentProcessName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iput-object v2, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->processName:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object v2, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->processName:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_3

    .line 40
    .line 41
    const-string v2, "unknown"

    .line 42
    .line 43
    iput-object v2, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->processName:Ljava/lang/String;

    .line 44
    .line 45
    :cond_3
    new-instance v2, Ljava/text/SimpleDateFormat;

    .line 46
    .line 47
    const-string v3, "MM-dd HH:mm:ss.SSS"

    .line 48
    .line 49
    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v4, Ljava/util/Date;

    .line 58
    .line 59
    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v2, " "

    .line 70
    .line 71
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget-object v4, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->processName:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    new-instance v4, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v5, "/"

    .line 95
    .line 96
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_4
    const/4 v3, 0x0

    .line 114
    :goto_1
    sget-object v2, Lcom/tantanapp/media/ttmediautils/log/Log4Android$1;->$SwitchMap$com$tantanapp$media$ttmediautils$log$Log4Android$LOG_LEVEL:[I

    .line 115
    .line 116
    invoke-virtual {p4}, Ljava/lang/Enum;->ordinal()I

    .line 117
    .line 118
    .line 119
    move-result p4

    .line 120
    aget p4, v2, p4

    .line 121
    .line 122
    if-eq p4, v1, :cond_d

    .line 123
    .line 124
    const/4 v1, 0x2

    .line 125
    if-eq p4, v1, :cond_a

    .line 126
    .line 127
    const/4 p3, 0x3

    .line 128
    if-eq p4, p3, :cond_8

    .line 129
    .line 130
    const/4 p3, 0x4

    .line 131
    if-eq p4, p3, :cond_7

    .line 132
    .line 133
    const/4 p3, 0x5

    .line 134
    if-eq p4, p3, :cond_5

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_5
    iget-boolean p3, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 138
    .line 139
    if-eqz p3, :cond_6

    .line 140
    .line 141
    invoke-static {p1, p2}, Lcom/tantanapp/media/ttmediautils/log/SLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    :cond_6
    if-eqz v0, :cond_f

    .line 145
    .line 146
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_7
    iget-boolean p3, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 151
    .line 152
    if-eqz p3, :cond_f

    .line 153
    .line 154
    invoke-static {p1, p2}, Lcom/tantanapp/media/ttmediautils/log/SLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_8
    iget-boolean p3, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 159
    .line 160
    if-eqz p3, :cond_9

    .line 161
    .line 162
    invoke-static {p1, p2}, Lcom/tantanapp/media/ttmediautils/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_9
    if-eqz v0, :cond_f

    .line 166
    .line 167
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_a
    if-eqz v0, :cond_b

    .line 172
    .line 173
    invoke-static {v3, p3}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->formatErrorStack(Ljava/lang/Appendable;Ljava/lang/Throwable;)V

    .line 174
    .line 175
    .line 176
    :cond_b
    iget-boolean p4, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 177
    .line 178
    if-eqz p4, :cond_f

    .line 179
    .line 180
    if-nez p3, :cond_c

    .line 181
    .line 182
    invoke-static {p1, p2}, Lcom/tantanapp/media/ttmediautils/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_c
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p3

    .line 190
    invoke-static {p1, p2, p3}, Lcom/tantanapp/media/ttmediautils/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_d
    iget-boolean p3, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->isDebug:Z

    .line 195
    .line 196
    if-eqz p3, :cond_e

    .line 197
    .line 198
    invoke-static {p1, p2}, Lcom/tantanapp/media/ttmediautils/log/SLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_e
    if-eqz v0, :cond_f

    .line 202
    .line 203
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    :cond_f
    :goto_2
    if-eqz v0, :cond_10

    .line 207
    .line 208
    const-string p1, "\n"

    .line 209
    .line 210
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    if-eqz v0, :cond_10

    .line 214
    .line 215
    invoke-direct {p0, v3}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveLog(Ljava/lang/CharSequence;)V

    .line 216
    .line 217
    .line 218
    :cond_10
    return-void
.end method

.method public printLog(Ljava/lang/String;Ljava/lang/Throwable;Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;)V
    .locals 1

    const/4 v0, 0x0

    .line 221
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->printLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Lcom/tantanapp/media/ttmediautils/log/Log4Android$LOG_LEVEL;)V

    return-void
.end method

.method public saveLog(Ljava/io/File;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->saveFile:Ljava/io/File;

    return-void
.end method

.method public setMsgPostfix(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPostfix:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMsgPrefix(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPrefix:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public w(Ljava/lang/Object;)V
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->tag:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->w(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public w(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPrefix:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p2, "null"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->msgPostfix:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p1, p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
