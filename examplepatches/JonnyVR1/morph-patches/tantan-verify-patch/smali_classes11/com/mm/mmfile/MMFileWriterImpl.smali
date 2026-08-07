.class Lcom/mm/mmfile/MMFileWriterImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mm/mmfile/IMMFileWriter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static varargs write(Lcom/mm/mmfile/MMFile;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4

    .line 66
    array-length v0, p2

    const/4 v1, 0x1

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/String;

    .line 67
    array-length v2, p2

    const/4 v3, 0x0

    invoke-static {p2, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v0, v3

    .line 69
    invoke-virtual {p0, p1, v0}, Lcom/mm/mmfile/MMFile;->write(Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public write(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 62
    invoke-static {p1}, Lcom/mm/mmfile/MMFileRegister;->getStrategy(Ljava/lang/String;)Lcom/mm/mmfile/Strategy;

    move-result-object p0

    .line 63
    invoke-virtual {p0}, Lcom/mm/mmfile/Strategy;->getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;

    move-result-object v0

    invoke-static {v0}, Lcom/mm/mmfile/MMFile;->get(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/MMFile;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 64
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p2, p0}, Lcom/mm/mmfile/MMFileWriterImpl;->write(Lcom/mm/mmfile/MMFile;Ljava/lang/String;[Ljava/lang/String;)V

    return-void

    .line 65
    :cond_0
    const-string p2, " do not bind strategy: "

    invoke-static {p1, p2, p0}, Ll/tmw;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public varargs write(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    aget-object v0, p2, p0

    .line 3
    .line 4
    invoke-static {v0}, Lcom/mm/mmfile/MMFileRegister;->getStrategy(Ljava/lang/String;)Lcom/mm/mmfile/Strategy;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/mm/mmfile/Strategy;->getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Lcom/mm/mmfile/MMFile;->get(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/MMFile;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-static {v1, p1, p2}, Lcom/mm/mmfile/MMFileWriterImpl;->write(Lcom/mm/mmfile/MMFile;Ljava/lang/String;[Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    aget-object p0, p2, p0

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p0, " do not bind strategy: "

    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p2, ", heads: "

    .line 47
    .line 48
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p1
.end method
