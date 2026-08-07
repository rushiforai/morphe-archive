.class public final enum Lcom/hellogroup/mk/core/log/page/MKPageLogType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/hellogroup/mk/core/log/page/MKPageLogType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u00087\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B;\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\n\u0012\u0008\u0008\u0002\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0002\u0010\u000cR\u0011\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0011\u0010\t\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u0011\u0010\u0008\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0011R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016j\u0002\u0008\u0017j\u0002\u0008\u0018j\u0002\u0008\u0019j\u0002\u0008\u001aj\u0002\u0008\u001bj\u0002\u0008\u001cj\u0002\u0008\u001dj\u0002\u0008\u001ej\u0002\u0008\u001fj\u0002\u0008 j\u0002\u0008!j\u0002\u0008\"j\u0002\u0008#j\u0002\u0008$j\u0002\u0008%j\u0002\u0008&j\u0002\u0008\'j\u0002\u0008(j\u0002\u0008)j\u0002\u0008*j\u0002\u0008+j\u0002\u0008,j\u0002\u0008-j\u0002\u0008.j\u0002\u0008/j\u0002\u00080j\u0002\u00081j\u0002\u00082j\u0002\u00083j\u0002\u00084j\u0002\u00085j\u0002\u00086j\u0002\u00087j\u0002\u00088j\u0002\u00089j\u0002\u0008:j\u0002\u0008;j\u0002\u0008<j\u0002\u0008=j\u0002\u0008>j\u0002\u0008?j\u0002\u0008@\u00a8\u0006A"
    }
    d2 = {
        "Lcom/hellogroup/mk/core/log/page/MKPageLogType;",
        "",
        "logLevel",
        "Lcom/hellogroup/mk/core/log/core/MKLogLevel;",
        "code",
        "",
        "source",
        "Lcom/hellogroup/mk/core/log/core/MKLogSource;",
        "content",
        "appendSpace",
        "",
        "allLogRecord",
        "(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZ)V",
        "getAllLogRecord",
        "()Z",
        "getAppendSpace",
        "getCode",
        "()Ljava/lang/String;",
        "getContent",
        "getLogLevel",
        "()Lcom/hellogroup/mk/core/log/core/MKLogLevel;",
        "getSource",
        "()Lcom/hellogroup/mk/core/log/core/MKLogSource;",
        "PROCESS_GONE",
        "WHITE_SCREEN_NATIVE",
        "HTML_FAIL",
        "RECEIVED_ERROR",
        "BRIDGE_NOT_FOUND",
        "KILLED_BY_SYSTEM",
        "RECOVERY",
        "NATIVE_ERROR",
        "NATIVE_OVERTIME",
        "WHITE_SCREEN_JS",
        "WINDOW_ON_ERROR",
        "CONSOLE_ERROR",
        "RECEIVED_TITLE",
        "CONSOLE_LOG",
        "MWC_ERR_NATIVE_LOG",
        "MWC_ERR_JS_LOG",
        "ON_WEB_VIEW_CREATE",
        "ON_PAGE_START",
        "ON_PAGE_FINISHED",
        "ON_DESTROY",
        "ON_RESUME",
        "ON_PAUSE",
        "APP_FOREGROUND",
        "APP_BACKGROUND",
        "APP_DESTROY",
        "ON_LOAD_RESOURCE",
        "SHOW_LOADING_PAGE",
        "HIDE_LOADING_PAGE",
        "SHOW_WHITE_SCREEN_PAGE_NATIVE",
        "HIDE_WHITE_SCREEN_PAGE",
        "APPLICATION_CRASH",
        "OFFLINE_ERROR",
        "CREATE_TIMER",
        "CLOSE_TIMER",
        "JS_BRIDGE",
        "SHOW_WHITE_SCREEN_PAGE_JS",
        "INTERCEPT_FILE",
        "COMMON_LOG",
        "MWC_LOG_DEBUG",
        "MWC_LOG_INFO",
        "MWC_LOG_WARN",
        "BRIDGE_CALL",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum APPLICATION_CRASH:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum APP_BACKGROUND:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum APP_DESTROY:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum APP_FOREGROUND:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum BRIDGE_CALL:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum BRIDGE_NOT_FOUND:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum CLOSE_TIMER:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum COMMON_LOG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum CONSOLE_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum CONSOLE_LOG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum CREATE_TIMER:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum HIDE_LOADING_PAGE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum HIDE_WHITE_SCREEN_PAGE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum HTML_FAIL:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum INTERCEPT_FILE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum JS_BRIDGE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum KILLED_BY_SYSTEM:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum MWC_ERR_JS_LOG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum MWC_ERR_NATIVE_LOG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum MWC_LOG_DEBUG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum MWC_LOG_INFO:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum MWC_LOG_WARN:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum NATIVE_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum NATIVE_OVERTIME:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum OFFLINE_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum ON_DESTROY:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum ON_LOAD_RESOURCE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum ON_PAGE_FINISHED:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum ON_PAGE_START:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum ON_PAUSE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum ON_RESUME:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum ON_WEB_VIEW_CREATE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum PROCESS_GONE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum RECEIVED_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum RECEIVED_TITLE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum RECOVERY:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum SHOW_LOADING_PAGE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum SHOW_WHITE_SCREEN_PAGE_JS:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum SHOW_WHITE_SCREEN_PAGE_NATIVE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum WHITE_SCREEN_JS:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum WHITE_SCREEN_NATIVE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

.field public static final enum WINDOW_ON_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;


# instance fields
.field private final allLogRecord:Z

.field private final appendSpace:Z

.field private final code:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final content:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final logLevel:Lcom/hellogroup/mk/core/log/core/MKLogLevel;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final source:Lcom/hellogroup/mk/core/log/core/MKLogSource;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 57

    .line 1
    new-instance v0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 2
    .line 3
    sget-object v4, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->ERROR:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 4
    .line 5
    sget-object v10, Lcom/hellogroup/mk/core/log/core/MKLogSource;->NATIVE:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 6
    .line 7
    const/16 v9, 0x30

    .line 8
    .line 9
    move-object v6, v10

    .line 10
    const/4 v10, 0x0

    .line 11
    const-string v1, "PROCESS_GONE"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    move-object v3, v4

    .line 15
    const-string v4, "ERR_1.1"

    .line 16
    .line 17
    move-object v5, v6

    .line 18
    const-string v6, "[LC]onRenderProcessGone"

    .line 19
    .line 20
    const/4 v7, 0x0

    .line 21
    const/4 v8, 0x0

    .line 22
    invoke-direct/range {v0 .. v10}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 23
    .line 24
    .line 25
    move-object v4, v3

    .line 26
    move-object v10, v5

    .line 27
    sput-object v0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->PROCESS_GONE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 28
    .line 29
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 30
    .line 31
    move-object v6, v10

    .line 32
    const/16 v10, 0x30

    .line 33
    .line 34
    const/4 v11, 0x0

    .line 35
    const-string v2, "WHITE_SCREEN_NATIVE"

    .line 36
    .line 37
    const/4 v3, 0x1

    .line 38
    const-string v5, "ERR_1.2"

    .line 39
    .line 40
    const-string v7, "[LC]showWhiteScreenPage"

    .line 41
    .line 42
    const/4 v9, 0x0

    .line 43
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 44
    .line 45
    .line 46
    move-object/from16 v16, v1

    .line 47
    .line 48
    move-object v10, v6

    .line 49
    sput-object v16, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->WHITE_SCREEN_NATIVE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 50
    .line 51
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 52
    .line 53
    const/16 v10, 0x20

    .line 54
    .line 55
    const-string v2, "HTML_FAIL"

    .line 56
    .line 57
    const/4 v3, 0x2

    .line 58
    const-string v5, "ERR_1.3"

    .line 59
    .line 60
    const-string v7, "[LC]"

    .line 61
    .line 62
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 63
    .line 64
    .line 65
    move-object/from16 v17, v1

    .line 66
    .line 67
    move-object v10, v6

    .line 68
    sput-object v17, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->HTML_FAIL:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 69
    .line 70
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 71
    .line 72
    const/16 v10, 0x30

    .line 73
    .line 74
    const-string v2, "RECEIVED_ERROR"

    .line 75
    .line 76
    const/4 v3, 0x3

    .line 77
    const-string v5, "ERR_2.1"

    .line 78
    .line 79
    const-string v7, "[LC]onReceivedError"

    .line 80
    .line 81
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 82
    .line 83
    .line 84
    move-object/from16 v18, v1

    .line 85
    .line 86
    move-object v10, v6

    .line 87
    sput-object v18, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->RECEIVED_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 88
    .line 89
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 90
    .line 91
    const/16 v10, 0x30

    .line 92
    .line 93
    const-string v2, "BRIDGE_NOT_FOUND"

    .line 94
    .line 95
    const/4 v3, 0x4

    .line 96
    const-string v5, "ERR_2.4"

    .line 97
    .line 98
    const-string v7, "[MB]bridge not found"

    .line 99
    .line 100
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 101
    .line 102
    .line 103
    move-object/from16 v19, v1

    .line 104
    .line 105
    move-object v10, v6

    .line 106
    sput-object v19, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->BRIDGE_NOT_FOUND:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 107
    .line 108
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 109
    .line 110
    const/16 v10, 0x30

    .line 111
    .line 112
    const-string v2, "KILLED_BY_SYSTEM"

    .line 113
    .line 114
    const/4 v3, 0x5

    .line 115
    const-string v5, "ERR_4.1"

    .line 116
    .line 117
    const-string v7, "killed by system"

    .line 118
    .line 119
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 120
    .line 121
    .line 122
    move-object/from16 v20, v1

    .line 123
    .line 124
    move-object v10, v6

    .line 125
    sput-object v20, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->KILLED_BY_SYSTEM:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 126
    .line 127
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 128
    .line 129
    const/16 v10, 0x30

    .line 130
    .line 131
    const-string v2, "RECOVERY"

    .line 132
    .line 133
    const/4 v3, 0x6

    .line 134
    const-string v5, "ERR_4.2"

    .line 135
    .line 136
    const-string v7, "reload webView success"

    .line 137
    .line 138
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 139
    .line 140
    .line 141
    move-object/from16 v21, v1

    .line 142
    .line 143
    move-object v10, v6

    .line 144
    sput-object v21, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->RECOVERY:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 145
    .line 146
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 147
    .line 148
    const/16 v10, 0x30

    .line 149
    .line 150
    const-string v2, "NATIVE_ERROR"

    .line 151
    .line 152
    const/4 v3, 0x7

    .line 153
    const-string v5, "ERR_5.1"

    .line 154
    .line 155
    const-string v7, "[LC]Naitive Error"

    .line 156
    .line 157
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 158
    .line 159
    .line 160
    move-object/from16 v22, v1

    .line 161
    .line 162
    move-object v10, v6

    .line 163
    sput-object v22, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->NATIVE_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 164
    .line 165
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 166
    .line 167
    const/16 v10, 0x30

    .line 168
    .line 169
    const-string v2, "NATIVE_OVERTIME"

    .line 170
    .line 171
    const/16 v3, 0x8

    .line 172
    .line 173
    const-string v5, "ERR_5.2"

    .line 174
    .line 175
    const-string v7, "[LC]Naitive OverTime"

    .line 176
    .line 177
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 178
    .line 179
    .line 180
    move-object/from16 v23, v1

    .line 181
    .line 182
    move-object v12, v6

    .line 183
    sput-object v23, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->NATIVE_OVERTIME:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 184
    .line 185
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 186
    .line 187
    sget-object v6, Lcom/hellogroup/mk/core/log/core/MKLogSource;->JS:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 188
    .line 189
    const-string v2, "WHITE_SCREEN_JS"

    .line 190
    .line 191
    const/16 v3, 0x9

    .line 192
    .line 193
    const-string v5, "ERR_1.4"

    .line 194
    .line 195
    const-string v7, "[LC]showWhiteScreenPage"

    .line 196
    .line 197
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 198
    .line 199
    .line 200
    move-object/from16 v35, v1

    .line 201
    .line 202
    sput-object v35, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->WHITE_SCREEN_JS:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 203
    .line 204
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 205
    .line 206
    const-string v2, "WINDOW_ON_ERROR"

    .line 207
    .line 208
    const/16 v3, 0xa

    .line 209
    .line 210
    const-string v5, "ERR_2.3"

    .line 211
    .line 212
    const-string v7, "[WE]window.onerror"

    .line 213
    .line 214
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 215
    .line 216
    .line 217
    move-object/from16 v36, v1

    .line 218
    .line 219
    sput-object v36, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->WINDOW_ON_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 220
    .line 221
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 222
    .line 223
    const-string v2, "CONSOLE_ERROR"

    .line 224
    .line 225
    const/16 v3, 0xb

    .line 226
    .line 227
    const-string v5, "ERR_3.1"

    .line 228
    .line 229
    const-string v7, "[JE]console.onerror"

    .line 230
    .line 231
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 232
    .line 233
    .line 234
    move-object/from16 v37, v1

    .line 235
    .line 236
    move-object/from16 v29, v6

    .line 237
    .line 238
    sput-object v37, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->CONSOLE_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 239
    .line 240
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 241
    .line 242
    const-string v2, "RECEIVED_TITLE"

    .line 243
    .line 244
    const/16 v3, 0xc

    .line 245
    .line 246
    const-string v5, "ERR_1.5"

    .line 247
    .line 248
    const-string v7, "[LC]onReceivedTitle"

    .line 249
    .line 250
    move-object v6, v12

    .line 251
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 252
    .line 253
    .line 254
    move-object/from16 v38, v1

    .line 255
    .line 256
    move-object v10, v6

    .line 257
    sput-object v38, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->RECEIVED_TITLE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 258
    .line 259
    new-instance v24, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 260
    .line 261
    sget-object v8, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->INFO:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 262
    .line 263
    const/16 v31, 0x0

    .line 264
    .line 265
    const/16 v32, 0x1

    .line 266
    .line 267
    const-string v25, "CONSOLE_LOG"

    .line 268
    .line 269
    const/16 v26, 0xd

    .line 270
    .line 271
    const-string v28, "log"

    .line 272
    .line 273
    const-string v30, "[JL]"

    .line 274
    .line 275
    move-object/from16 v27, v8

    .line 276
    .line 277
    invoke-direct/range {v24 .. v32}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZ)V

    .line 278
    .line 279
    .line 280
    move-object/from16 v39, v24

    .line 281
    .line 282
    sput-object v39, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->CONSOLE_LOG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 283
    .line 284
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 285
    .line 286
    const/16 v10, 0x30

    .line 287
    .line 288
    const-string v2, "MWC_ERR_NATIVE_LOG"

    .line 289
    .line 290
    const/16 v3, 0xe

    .line 291
    .line 292
    const-string v5, "MWC_ERR"

    .line 293
    .line 294
    const-string v7, "[MWC]Error"

    .line 295
    .line 296
    const/4 v8, 0x0

    .line 297
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 298
    .line 299
    .line 300
    move-object/from16 v40, v1

    .line 301
    .line 302
    sput-object v40, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->MWC_ERR_NATIVE_LOG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 303
    .line 304
    new-instance v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 305
    .line 306
    const-string v2, "MWC_ERR_JS_LOG"

    .line 307
    .line 308
    const/16 v3, 0xf

    .line 309
    .line 310
    const-string v5, "MWC_ERR"

    .line 311
    .line 312
    const-string v7, "[MWC]Error"

    .line 313
    .line 314
    move-object/from16 v6, v29

    .line 315
    .line 316
    invoke-direct/range {v1 .. v11}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 317
    .line 318
    .line 319
    sput-object v1, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->MWC_ERR_JS_LOG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 320
    .line 321
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 322
    .line 323
    const/16 v14, 0x30

    .line 324
    .line 325
    const/4 v15, 0x0

    .line 326
    const-string v6, "ON_WEB_VIEW_CREATE"

    .line 327
    .line 328
    const/16 v7, 0x10

    .line 329
    .line 330
    const-string v9, "log"

    .line 331
    .line 332
    const-string v11, "[LC]onWebViewCreate"

    .line 333
    .line 334
    move-object v10, v12

    .line 335
    const/4 v12, 0x0

    .line 336
    const/4 v13, 0x0

    .line 337
    move-object/from16 v8, v27

    .line 338
    .line 339
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 340
    .line 341
    .line 342
    move-object/from16 v3, v17

    .line 343
    .line 344
    move-object/from16 v17, v5

    .line 345
    .line 346
    sput-object v17, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->ON_WEB_VIEW_CREATE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 347
    .line 348
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 349
    .line 350
    const-string v6, "ON_PAGE_START"

    .line 351
    .line 352
    const/16 v7, 0x11

    .line 353
    .line 354
    const-string v9, "log"

    .line 355
    .line 356
    const-string v11, "[LC]onPageStart"

    .line 357
    .line 358
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 359
    .line 360
    .line 361
    move-object/from16 v4, v18

    .line 362
    .line 363
    move-object/from16 v18, v5

    .line 364
    .line 365
    sput-object v18, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->ON_PAGE_START:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 366
    .line 367
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 368
    .line 369
    const-string v6, "ON_PAGE_FINISHED"

    .line 370
    .line 371
    const/16 v7, 0x12

    .line 372
    .line 373
    const-string v9, "log"

    .line 374
    .line 375
    const-string v11, "[LC]onPageFinished"

    .line 376
    .line 377
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 378
    .line 379
    .line 380
    move-object/from16 v2, v19

    .line 381
    .line 382
    move-object/from16 v19, v5

    .line 383
    .line 384
    sput-object v19, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->ON_PAGE_FINISHED:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 385
    .line 386
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 387
    .line 388
    const-string v6, "ON_DESTROY"

    .line 389
    .line 390
    const/16 v7, 0x13

    .line 391
    .line 392
    const-string v9, "log"

    .line 393
    .line 394
    const-string v11, "[LC]destroy"

    .line 395
    .line 396
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 397
    .line 398
    .line 399
    move-object/from16 v41, v20

    .line 400
    .line 401
    move-object/from16 v20, v5

    .line 402
    .line 403
    sput-object v20, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->ON_DESTROY:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 404
    .line 405
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 406
    .line 407
    const-string v6, "ON_RESUME"

    .line 408
    .line 409
    const/16 v7, 0x14

    .line 410
    .line 411
    const-string v9, "log"

    .line 412
    .line 413
    const-string v11, "[LC]onResume"

    .line 414
    .line 415
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 416
    .line 417
    .line 418
    move-object/from16 v42, v21

    .line 419
    .line 420
    move-object/from16 v21, v5

    .line 421
    .line 422
    sput-object v21, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->ON_RESUME:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 423
    .line 424
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 425
    .line 426
    const-string v6, "ON_PAUSE"

    .line 427
    .line 428
    const/16 v7, 0x15

    .line 429
    .line 430
    const-string v9, "log"

    .line 431
    .line 432
    const-string v11, "[LC]onPause"

    .line 433
    .line 434
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 435
    .line 436
    .line 437
    move-object/from16 v43, v22

    .line 438
    .line 439
    move-object/from16 v22, v5

    .line 440
    .line 441
    sput-object v22, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->ON_PAUSE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 442
    .line 443
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 444
    .line 445
    const-string v6, "APP_FOREGROUND"

    .line 446
    .line 447
    const/16 v7, 0x16

    .line 448
    .line 449
    const-string v9, "log"

    .line 450
    .line 451
    const-string v11, "[LC]appForeground"

    .line 452
    .line 453
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 454
    .line 455
    .line 456
    move-object/from16 v44, v23

    .line 457
    .line 458
    move-object/from16 v23, v5

    .line 459
    .line 460
    sput-object v23, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->APP_FOREGROUND:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 461
    .line 462
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 463
    .line 464
    const-string v6, "APP_BACKGROUND"

    .line 465
    .line 466
    const/16 v7, 0x17

    .line 467
    .line 468
    const-string v9, "log"

    .line 469
    .line 470
    const-string v11, "[LC]appBackground"

    .line 471
    .line 472
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 473
    .line 474
    .line 475
    move-object/from16 v45, v5

    .line 476
    .line 477
    sput-object v45, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->APP_BACKGROUND:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 478
    .line 479
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 480
    .line 481
    const-string v6, "APP_DESTROY"

    .line 482
    .line 483
    const/16 v7, 0x18

    .line 484
    .line 485
    const-string v9, "log"

    .line 486
    .line 487
    const-string v11, "[LC]AppDestroy"

    .line 488
    .line 489
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 490
    .line 491
    .line 492
    move-object/from16 v46, v5

    .line 493
    .line 494
    sput-object v46, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->APP_DESTROY:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 495
    .line 496
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 497
    .line 498
    const-string v6, "ON_LOAD_RESOURCE"

    .line 499
    .line 500
    const/16 v7, 0x19

    .line 501
    .line 502
    const-string v9, "log"

    .line 503
    .line 504
    const-string v11, "[LC]onLoadResource"

    .line 505
    .line 506
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 507
    .line 508
    .line 509
    move-object/from16 v47, v5

    .line 510
    .line 511
    sput-object v47, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->ON_LOAD_RESOURCE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 512
    .line 513
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 514
    .line 515
    const-string v6, "SHOW_LOADING_PAGE"

    .line 516
    .line 517
    const/16 v7, 0x1a

    .line 518
    .line 519
    const-string v9, "log"

    .line 520
    .line 521
    const-string v11, "[LC]showLoadingPage"

    .line 522
    .line 523
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 524
    .line 525
    .line 526
    move-object/from16 v48, v5

    .line 527
    .line 528
    sput-object v48, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->SHOW_LOADING_PAGE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 529
    .line 530
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 531
    .line 532
    const-string v6, "HIDE_LOADING_PAGE"

    .line 533
    .line 534
    const/16 v7, 0x1b

    .line 535
    .line 536
    const-string v9, "log"

    .line 537
    .line 538
    const-string v11, "[LC]hideLoadingPage"

    .line 539
    .line 540
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 541
    .line 542
    .line 543
    move-object/from16 v49, v5

    .line 544
    .line 545
    sput-object v49, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->HIDE_LOADING_PAGE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 546
    .line 547
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 548
    .line 549
    const-string v6, "SHOW_WHITE_SCREEN_PAGE_NATIVE"

    .line 550
    .line 551
    const/16 v7, 0x1c

    .line 552
    .line 553
    const-string v9, "log"

    .line 554
    .line 555
    const-string v11, "[LC]showWhiteScreenPage"

    .line 556
    .line 557
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 558
    .line 559
    .line 560
    move-object/from16 v50, v5

    .line 561
    .line 562
    sput-object v50, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->SHOW_WHITE_SCREEN_PAGE_NATIVE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 563
    .line 564
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 565
    .line 566
    const-string v6, "HIDE_WHITE_SCREEN_PAGE"

    .line 567
    .line 568
    const/16 v7, 0x1d

    .line 569
    .line 570
    const-string v9, "log"

    .line 571
    .line 572
    const-string v11, "[LC]hideWhiteScreenPage"

    .line 573
    .line 574
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 575
    .line 576
    .line 577
    move-object/from16 v51, v5

    .line 578
    .line 579
    sput-object v51, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->HIDE_WHITE_SCREEN_PAGE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 580
    .line 581
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 582
    .line 583
    const-string v6, "APPLICATION_CRASH"

    .line 584
    .line 585
    const/16 v7, 0x1e

    .line 586
    .line 587
    const-string v9, "log"

    .line 588
    .line 589
    const-string v11, "[LC]Application Crash"

    .line 590
    .line 591
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 592
    .line 593
    .line 594
    move-object/from16 v52, v5

    .line 595
    .line 596
    sput-object v52, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->APPLICATION_CRASH:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 597
    .line 598
    new-instance v32, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 599
    .line 600
    const-string v6, "OFFLINE_ERROR"

    .line 601
    .line 602
    const/16 v7, 0x1f

    .line 603
    .line 604
    const-string v9, "log"

    .line 605
    .line 606
    const-string v11, "[LC]offline error"

    .line 607
    .line 608
    move-object/from16 v5, v32

    .line 609
    .line 610
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 611
    .line 612
    .line 613
    move-object/from16 v53, v5

    .line 614
    .line 615
    sput-object v53, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->OFFLINE_ERROR:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 616
    .line 617
    new-instance v33, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 618
    .line 619
    const-string v6, "CREATE_TIMER"

    .line 620
    .line 621
    const/16 v7, 0x20

    .line 622
    .line 623
    const-string v9, "log"

    .line 624
    .line 625
    const-string v11, "[MM]createTimer"

    .line 626
    .line 627
    move-object/from16 v5, v33

    .line 628
    .line 629
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 630
    .line 631
    .line 632
    move-object/from16 v54, v5

    .line 633
    .line 634
    sput-object v54, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->CREATE_TIMER:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 635
    .line 636
    new-instance v34, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 637
    .line 638
    const-string v6, "CLOSE_TIMER"

    .line 639
    .line 640
    const/16 v7, 0x21

    .line 641
    .line 642
    const-string v9, "log"

    .line 643
    .line 644
    const-string v11, "[MM]closeTimer"

    .line 645
    .line 646
    move-object/from16 v5, v34

    .line 647
    .line 648
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 649
    .line 650
    .line 651
    move-object/from16 v55, v5

    .line 652
    .line 653
    sput-object v55, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->CLOSE_TIMER:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 654
    .line 655
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 656
    .line 657
    const-string v6, "JS_BRIDGE"

    .line 658
    .line 659
    const/16 v7, 0x22

    .line 660
    .line 661
    const-string v9, "log"

    .line 662
    .line 663
    const-string v11, "[JB]JS Bridge"

    .line 664
    .line 665
    invoke-direct/range {v5 .. v15}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 666
    .line 667
    .line 668
    move-object/from16 v14, v35

    .line 669
    .line 670
    move-object/from16 v35, v5

    .line 671
    .line 672
    sput-object v35, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->JS_BRIDGE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 673
    .line 674
    new-instance v24, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 675
    .line 676
    const/16 v33, 0x30

    .line 677
    .line 678
    const/16 v34, 0x0

    .line 679
    .line 680
    const-string v25, "SHOW_WHITE_SCREEN_PAGE_JS"

    .line 681
    .line 682
    const/16 v26, 0x23

    .line 683
    .line 684
    const-string v28, "log"

    .line 685
    .line 686
    const-string v30, "[JB]showWhiteScreenPage"

    .line 687
    .line 688
    const/16 v32, 0x0

    .line 689
    .line 690
    invoke-direct/range {v24 .. v34}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 691
    .line 692
    .line 693
    move-object/from16 v15, v36

    .line 694
    .line 695
    move-object/from16 v36, v24

    .line 696
    .line 697
    sput-object v36, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->SHOW_WHITE_SCREEN_PAGE_JS:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 698
    .line 699
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 700
    .line 701
    const/4 v13, 0x1

    .line 702
    const-string v6, "INTERCEPT_FILE"

    .line 703
    .line 704
    const/16 v7, 0x24

    .line 705
    .line 706
    const-string v9, "log"

    .line 707
    .line 708
    const-string v11, "[IL]"

    .line 709
    .line 710
    invoke-direct/range {v5 .. v13}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZ)V

    .line 711
    .line 712
    .line 713
    move-object/from16 v56, v37

    .line 714
    .line 715
    move-object/from16 v37, v5

    .line 716
    .line 717
    sput-object v37, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->INTERCEPT_FILE:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 718
    .line 719
    new-instance v24, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 720
    .line 721
    const/16 v33, 0x20

    .line 722
    .line 723
    const-string v25, "COMMON_LOG"

    .line 724
    .line 725
    const/16 v26, 0x25

    .line 726
    .line 727
    const-string v28, "log"

    .line 728
    .line 729
    const-string v30, "[LC]"

    .line 730
    .line 731
    invoke-direct/range {v24 .. v34}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 732
    .line 733
    .line 734
    sput-object v24, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->COMMON_LOG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 735
    .line 736
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 737
    .line 738
    const/4 v12, 0x1

    .line 739
    const-string v6, "MWC_LOG_DEBUG"

    .line 740
    .line 741
    const/16 v7, 0x26

    .line 742
    .line 743
    const-string v9, "MWC_DEBUG"

    .line 744
    .line 745
    const-string v11, "[MWC]Log"

    .line 746
    .line 747
    invoke-direct/range {v5 .. v13}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZ)V

    .line 748
    .line 749
    .line 750
    move-object/from16 v25, v14

    .line 751
    .line 752
    move-object/from16 v14, v39

    .line 753
    .line 754
    move-object/from16 v39, v5

    .line 755
    .line 756
    sput-object v39, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->MWC_LOG_DEBUG:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 757
    .line 758
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 759
    .line 760
    const-string v6, "MWC_LOG_INFO"

    .line 761
    .line 762
    const/16 v7, 0x27

    .line 763
    .line 764
    const-string v9, "MWC_INFO"

    .line 765
    .line 766
    const-string v11, "[MWC]Log"

    .line 767
    .line 768
    invoke-direct/range {v5 .. v13}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZ)V

    .line 769
    .line 770
    .line 771
    move-object/from16 v26, v15

    .line 772
    .line 773
    move-object/from16 v15, v40

    .line 774
    .line 775
    move-object/from16 v40, v5

    .line 776
    .line 777
    sput-object v40, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->MWC_LOG_INFO:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 778
    .line 779
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 780
    .line 781
    const-string v6, "MWC_LOG_WARN"

    .line 782
    .line 783
    const/16 v7, 0x28

    .line 784
    .line 785
    const-string v9, "MWC_WARN"

    .line 786
    .line 787
    const-string v11, "[MWC]Log"

    .line 788
    .line 789
    invoke-direct/range {v5 .. v13}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZ)V

    .line 790
    .line 791
    .line 792
    move-object/from16 v27, v41

    .line 793
    .line 794
    move-object/from16 v41, v5

    .line 795
    .line 796
    sput-object v41, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->MWC_LOG_WARN:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 797
    .line 798
    new-instance v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 799
    .line 800
    const-string v6, "BRIDGE_CALL"

    .line 801
    .line 802
    const/16 v7, 0x29

    .line 803
    .line 804
    const-string v9, "log"

    .line 805
    .line 806
    const-string v11, "[MB]BridgeCall"

    .line 807
    .line 808
    invoke-direct/range {v5 .. v13}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZ)V

    .line 809
    .line 810
    .line 811
    sput-object v5, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->BRIDGE_CALL:Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 812
    .line 813
    move-object/from16 v10, v25

    .line 814
    .line 815
    move-object/from16 v11, v26

    .line 816
    .line 817
    move-object/from16 v6, v27

    .line 818
    .line 819
    move-object/from16 v13, v38

    .line 820
    .line 821
    move-object/from16 v7, v42

    .line 822
    .line 823
    move-object/from16 v8, v43

    .line 824
    .line 825
    move-object/from16 v9, v44

    .line 826
    .line 827
    move-object/from16 v25, v46

    .line 828
    .line 829
    move-object/from16 v26, v47

    .line 830
    .line 831
    move-object/from16 v27, v48

    .line 832
    .line 833
    move-object/from16 v28, v49

    .line 834
    .line 835
    move-object/from16 v29, v50

    .line 836
    .line 837
    move-object/from16 v30, v51

    .line 838
    .line 839
    move-object/from16 v31, v52

    .line 840
    .line 841
    move-object/from16 v32, v53

    .line 842
    .line 843
    move-object/from16 v33, v54

    .line 844
    .line 845
    move-object/from16 v34, v55

    .line 846
    .line 847
    move-object/from16 v12, v56

    .line 848
    .line 849
    move-object/from16 v42, v5

    .line 850
    .line 851
    move-object/from16 v38, v24

    .line 852
    .line 853
    move-object/from16 v24, v45

    .line 854
    .line 855
    move-object v5, v2

    .line 856
    move-object/from16 v2, v16

    .line 857
    .line 858
    move-object/from16 v16, v1

    .line 859
    .line 860
    move-object v1, v0

    .line 861
    filled-new-array/range {v1 .. v42}, [Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 862
    .line 863
    .line 864
    move-result-object v0

    .line 865
    sput-object v0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->$VALUES:[Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    .line 866
    .line 867
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hellogroup/mk/core/log/core/MKLogLevel;",
            "Ljava/lang/String;",
            "Lcom/hellogroup/mk/core/log/core/MKLogSource;",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->logLevel:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    iput-object p4, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->code:Ljava/lang/String;

    iput-object p5, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->source:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    iput-object p6, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->content:Ljava/lang/String;

    iput-boolean p7, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->appendSpace:Z

    iput-boolean p8, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->allLogRecord:Z

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 10

    .line 1
    and-int/lit8 v0, p9, 0x10

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    move v8, v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move/from16 v8, p7

    .line 9
    .line 10
    :goto_0
    and-int/lit8 v0, p9, 0x20

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    move v9, v0

    .line 16
    :goto_1
    move-object v1, p0

    .line 17
    move-object v2, p1

    .line 18
    move v3, p2

    .line 19
    move-object v4, p3

    .line 20
    move-object v5, p4

    .line 21
    move-object v6, p5

    .line 22
    move-object/from16 v7, p6

    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_1
    move/from16 v9, p8

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :goto_2
    invoke-direct/range {v1 .. v9}, Lcom/hellogroup/mk/core/log/page/MKPageLogType;-><init>(Ljava/lang/String;ILcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;ZZ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/hellogroup/mk/core/log/page/MKPageLogType;
    .locals 1

    const-class v0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    return-object p0
.end method

.method public static values()[Lcom/hellogroup/mk/core/log/page/MKPageLogType;
    .locals 1

    sget-object v0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->$VALUES:[Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    invoke-virtual {v0}, [Lcom/hellogroup/mk/core/log/page/MKPageLogType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/hellogroup/mk/core/log/page/MKPageLogType;

    return-object v0
.end method


# virtual methods
.method public final getAllLogRecord()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->allLogRecord:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getAppendSpace()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->appendSpace:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getCode()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->code:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getContent()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->content:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getLogLevel()Lcom/hellogroup/mk/core/log/core/MKLogLevel;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->logLevel:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSource()Lcom/hellogroup/mk/core/log/core/MKLogSource;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/page/MKPageLogType;->source:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 2
    .line 3
    return-object p0
.end method
