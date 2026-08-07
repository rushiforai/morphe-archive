.class public Lcom/tencent/open/log/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:I = 0x3c

.field public static b:I = 0x3c

.field public static c:Ljava/lang/String; = "OpenSDK.Client.File.Tracer"

.field public static d:Ljava/lang/String;

.field public static e:Ljava/lang/String;

.field public static f:J

.field public static g:I

.field public static h:I

.field public static i:I

.field public static j:Ljava/lang/String;

.field public static k:Ljava/lang/String;

.field public static l:Ljava/lang/String;

.field public static m:I

.field public static n:J

.field public static o:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Tencent"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "msflogs"

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "com"

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, "tencent"

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, "mobileqq"

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sput-object v0, Lcom/tencent/open/log/c;->d:Ljava/lang/String;

    .line 50
    .line 51
    const-string v0, ".log"

    .line 52
    .line 53
    sput-object v0, Lcom/tencent/open/log/c;->e:Ljava/lang/String;

    .line 54
    .line 55
    const-wide/32 v2, 0x800000

    .line 56
    .line 57
    .line 58
    sput-wide v2, Lcom/tencent/open/log/c;->f:J

    .line 59
    .line 60
    const/high16 v0, 0x40000

    .line 61
    .line 62
    sput v0, Lcom/tencent/open/log/c;->g:I

    .line 63
    .line 64
    const/16 v0, 0x400

    .line 65
    .line 66
    sput v0, Lcom/tencent/open/log/c;->h:I

    .line 67
    .line 68
    const/16 v0, 0x2710

    .line 69
    .line 70
    sput v0, Lcom/tencent/open/log/c;->i:I

    .line 71
    .line 72
    const-string v0, "debug.file.blockcount"

    .line 73
    .line 74
    sput-object v0, Lcom/tencent/open/log/c;->j:Ljava/lang/String;

    .line 75
    .line 76
    const-string v0, "debug.file.keepperiod"

    .line 77
    .line 78
    sput-object v0, Lcom/tencent/open/log/c;->k:Ljava/lang/String;

    .line 79
    .line 80
    const-string v0, "debug.file.tracelevel"

    .line 81
    .line 82
    sput-object v0, Lcom/tencent/open/log/c;->l:Ljava/lang/String;

    .line 83
    .line 84
    const/16 v0, 0x18

    .line 85
    .line 86
    sput v0, Lcom/tencent/open/log/c;->m:I

    .line 87
    .line 88
    const-wide/32 v2, 0x240c8400

    .line 89
    .line 90
    .line 91
    sput-wide v2, Lcom/tencent/open/log/c;->n:J

    .line 92
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    sget-object v2, Lcom/tencent/connect/common/Constants;->APP_SPECIFIC_ROOT:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v1, "logs"

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sput-object v0, Lcom/tencent/open/log/c;->o:Ljava/lang/String;

    .line 116
    .line 117
    return-void
.end method
