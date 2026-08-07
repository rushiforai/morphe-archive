.class public Lcom/immomo/momoenc/exception/BaseHttpRepostException;
.super Ljava/lang/Exception;
.source "SourceFile"


# static fields
.field protected static RepostExceptionCount:I

.field protected static reported:Z

.field protected static startRecordTime:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->countExctionTimes()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static isPostTimesIllegal()Z
    .locals 2

    .line 1
    sget v0, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->RepostExceptionCount:I

    .line 2
    .line 3
    const/16 v1, 0x32

    .line 4
    .line 5
    if-le v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method

.method public static resetIllegalStatus()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput v0, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->RepostExceptionCount:I

    .line 3
    .line 4
    sput-boolean v0, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->reported:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public countExctionTimes()V
    .locals 7

    .line 1
    sget v0, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->RepostExceptionCount:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    sput v0, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->RepostExceptionCount:I

    .line 6
    .line 7
    sget-object v0, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->startRecordTime:Ljava/util/Date;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/Date;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->startRecordTime:Ljava/util/Date;

    .line 17
    .line 18
    :cond_0
    invoke-static {}, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->isPostTimesIllegal()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    sget-boolean v0, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->reported:Z

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    sput-boolean v1, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->reported:Z

    .line 29
    .line 30
    new-instance v0, Ljava/util/Date;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ljava/lang/Exception;

    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v3, "(BaseHttpRepostException so muchtimes - starttime: "

    .line 40
    .line 41
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object v3, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->startRecordTime:Ljava/util/Date;

    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v3, "  reportTime:"

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 59
    .line 60
    .line 61
    move-result-wide v3

    .line 62
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v3, ")"

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p0, "totle:"

    .line 78
    .line 79
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 83
    .line 84
    .line 85
    move-result-wide v3

    .line 86
    sget-object p0, Lcom/immomo/momoenc/exception/BaseHttpRepostException;->startRecordTime:Ljava/util/Date;

    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 89
    .line 90
    .line 91
    move-result-wide v5

    .line 92
    sub-long/2addr v3, v5

    .line 93
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-direct {v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/k0f;->b(Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    :cond_1
    return-void
.end method
