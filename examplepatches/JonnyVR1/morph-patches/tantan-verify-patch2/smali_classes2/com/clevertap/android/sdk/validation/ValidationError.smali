.class public final enum Lcom/clevertap/android/sdk/validation/ValidationError;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/validation/ValidationError;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008%\n\u0002\u0010\u0011\n\u0002\u0008\u0002\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0019\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001f\u0010)\u001a\u00020\u00052\u0012\u0010*\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00050+\"\u00020\u0005\u00a2\u0006\u0002\u0010,R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000j\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013j\u0002\u0008\u0014j\u0002\u0008\u0015j\u0002\u0008\u0016j\u0002\u0008\u0017j\u0002\u0008\u0018j\u0002\u0008\u0019j\u0002\u0008\u001aj\u0002\u0008\u001bj\u0002\u0008\u001cj\u0002\u0008\u001dj\u0002\u0008\u001ej\u0002\u0008\u001fj\u0002\u0008 j\u0002\u0008!j\u0002\u0008\"j\u0002\u0008#j\u0002\u0008$j\u0002\u0008%j\u0002\u0008&j\u0002\u0008\'j\u0002\u0008(\u00a8\u0006-"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/validation/ValidationError;",
        "",
        "code",
        "",
        "messageTemplate",
        "",
        "<init>",
        "(Ljava/lang/String;IILjava/lang/String;)V",
        "getCode",
        "()I",
        "EVENT_NAME_NULL",
        "EVENT_NAME_TOO_LONG",
        "EVENT_NAME_INVALID_CHARACTERS",
        "INVALID_COUNTRY_CODE",
        "INVALID_PHONE",
        "EMPTY_KEY",
        "EMPTY_KEY_ABORT",
        "PROP_VALUE_NOT_PRIMITIVE",
        "CHANNEL_ID_MISSING_IN_PAYLOAD",
        "CHANNEL_ID_NOT_REGISTERED",
        "NOTIFICATION_VIEWED_DISABLED",
        "RESTRICTED_EVENT_NAME",
        "DISCARDED_EVENT_NAME",
        "USE_CUSTOM_ID_FALLBACK",
        "USE_CUSTOM_ID_MISSING_IN_MANIFEST",
        "UNABLE_TO_SET_CT_CUSTOM_ID",
        "INVALID_CT_CUSTOM_ID",
        "KEY_INVALID_CHARACTERS",
        "KEY_LENGTH_EXCEEDED",
        "VALUE_CHARS_LIMIT_EXCEEDED",
        "VALUE_INVALID_CHARACTERS",
        "CHARGED_EVENT_TOO_MANY_ITEMS",
        "RESTRICTED_MULTI_VALUE_KEY",
        "PROFILE_IDENTIFIERS_MISMATCH",
        "DEPTH_LIMIT_EXCEEDED",
        "ARRAY_KEY_COUNT_LIMIT_EXCEEDED",
        "OBJECT_KEY_COUNT_LIMIT_EXCEEDED",
        "ARRAY_LENGTH_LIMIT_EXCEEDED",
        "KV_PAIR_COUNT_LIMIT_EXCEEDED",
        "NULL_VALUE_REMOVED",
        "EMPTY_VALUE_REMOVED",
        "getMessage",
        "values",
        "",
        "([Ljava/lang/String;)Ljava/lang/String;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum ARRAY_KEY_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum ARRAY_LENGTH_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum CHANNEL_ID_MISSING_IN_PAYLOAD:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum CHANNEL_ID_NOT_REGISTERED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum CHARGED_EVENT_TOO_MANY_ITEMS:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum DEPTH_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum DISCARDED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum EMPTY_KEY:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum EMPTY_KEY_ABORT:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum EMPTY_VALUE_REMOVED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum EVENT_NAME_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum EVENT_NAME_NULL:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum EVENT_NAME_TOO_LONG:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum INVALID_COUNTRY_CODE:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum INVALID_CT_CUSTOM_ID:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum INVALID_PHONE:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum KEY_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum KEY_LENGTH_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum KV_PAIR_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum NOTIFICATION_VIEWED_DISABLED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum NULL_VALUE_REMOVED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum OBJECT_KEY_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum PROFILE_IDENTIFIERS_MISMATCH:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum PROP_VALUE_NOT_PRIMITIVE:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum RESTRICTED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum RESTRICTED_MULTI_VALUE_KEY:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum UNABLE_TO_SET_CT_CUSTOM_ID:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum USE_CUSTOM_ID_FALLBACK:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum USE_CUSTOM_ID_MISSING_IN_MANIFEST:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum VALUE_CHARS_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

.field public static final enum VALUE_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;


# instance fields
.field private final code:I

.field private final messageTemplate:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/validation/ValidationError;
    .locals 32

    sget-object v1, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_NULL:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v2, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_TOO_LONG:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v3, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v4, Lcom/clevertap/android/sdk/validation/ValidationError;->INVALID_COUNTRY_CODE:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v5, Lcom/clevertap/android/sdk/validation/ValidationError;->INVALID_PHONE:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v6, Lcom/clevertap/android/sdk/validation/ValidationError;->EMPTY_KEY:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v7, Lcom/clevertap/android/sdk/validation/ValidationError;->EMPTY_KEY_ABORT:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v8, Lcom/clevertap/android/sdk/validation/ValidationError;->PROP_VALUE_NOT_PRIMITIVE:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v9, Lcom/clevertap/android/sdk/validation/ValidationError;->CHANNEL_ID_MISSING_IN_PAYLOAD:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v10, Lcom/clevertap/android/sdk/validation/ValidationError;->CHANNEL_ID_NOT_REGISTERED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v11, Lcom/clevertap/android/sdk/validation/ValidationError;->NOTIFICATION_VIEWED_DISABLED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v12, Lcom/clevertap/android/sdk/validation/ValidationError;->RESTRICTED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v13, Lcom/clevertap/android/sdk/validation/ValidationError;->DISCARDED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v14, Lcom/clevertap/android/sdk/validation/ValidationError;->USE_CUSTOM_ID_FALLBACK:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v15, Lcom/clevertap/android/sdk/validation/ValidationError;->USE_CUSTOM_ID_MISSING_IN_MANIFEST:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v16, Lcom/clevertap/android/sdk/validation/ValidationError;->UNABLE_TO_SET_CT_CUSTOM_ID:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v17, Lcom/clevertap/android/sdk/validation/ValidationError;->INVALID_CT_CUSTOM_ID:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v18, Lcom/clevertap/android/sdk/validation/ValidationError;->KEY_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v19, Lcom/clevertap/android/sdk/validation/ValidationError;->KEY_LENGTH_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v20, Lcom/clevertap/android/sdk/validation/ValidationError;->VALUE_CHARS_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v21, Lcom/clevertap/android/sdk/validation/ValidationError;->VALUE_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v22, Lcom/clevertap/android/sdk/validation/ValidationError;->CHARGED_EVENT_TOO_MANY_ITEMS:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v23, Lcom/clevertap/android/sdk/validation/ValidationError;->RESTRICTED_MULTI_VALUE_KEY:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v24, Lcom/clevertap/android/sdk/validation/ValidationError;->PROFILE_IDENTIFIERS_MISMATCH:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v25, Lcom/clevertap/android/sdk/validation/ValidationError;->DEPTH_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v26, Lcom/clevertap/android/sdk/validation/ValidationError;->ARRAY_KEY_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v27, Lcom/clevertap/android/sdk/validation/ValidationError;->OBJECT_KEY_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v28, Lcom/clevertap/android/sdk/validation/ValidationError;->ARRAY_LENGTH_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v29, Lcom/clevertap/android/sdk/validation/ValidationError;->KV_PAIR_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v30, Lcom/clevertap/android/sdk/validation/ValidationError;->NULL_VALUE_REMOVED:Lcom/clevertap/android/sdk/validation/ValidationError;

    sget-object v31, Lcom/clevertap/android/sdk/validation/ValidationError;->EMPTY_VALUE_REMOVED:Lcom/clevertap/android/sdk/validation/ValidationError;

    filled-new-array/range {v1 .. v31}, [Lcom/clevertap/android/sdk/validation/ValidationError;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 2
    .line 3
    const-string v1, "Event Name is null/empty"

    .line 4
    .line 5
    const-string v2, "EVENT_NAME_NULL"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/16 v4, 0x1fe

    .line 9
    .line 10
    invoke-direct {v0, v2, v3, v4, v1}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_NULL:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 14
    .line 15
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    const-string v2, "Event name \'%s\' exceeds the limit of %s characters. Trimmed to \'%s\'"

    .line 19
    .line 20
    const-string v3, "EVENT_NAME_TOO_LONG"

    .line 21
    .line 22
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_TOO_LONG:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 26
    .line 27
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    const-string v2, "Event name \'%s\' contains invalid characters. Cleaned to \'%s\'"

    .line 31
    .line 32
    const-string v3, "EVENT_NAME_INVALID_CHARACTERS"

    .line 33
    .line 34
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 38
    .line 39
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 40
    .line 41
    const-string v1, "Device country code not available and profile phone: %s does not appear to start with country code"

    .line 42
    .line 43
    const-string v2, "INVALID_COUNTRY_CODE"

    .line 44
    .line 45
    const/4 v3, 0x3

    .line 46
    const/16 v4, 0x200

    .line 47
    .line 48
    invoke-direct {v0, v2, v3, v4, v1}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->INVALID_COUNTRY_CODE:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 52
    .line 53
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 54
    .line 55
    const/4 v1, 0x4

    .line 56
    const-string v2, "Invalid phone number"

    .line 57
    .line 58
    const-string v3, "INVALID_PHONE"

    .line 59
    .line 60
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->INVALID_PHONE:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 64
    .line 65
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 66
    .line 67
    const/4 v1, 0x5

    .line 68
    const-string v2, "Found an empty key. Skipping and continuing"

    .line 69
    .line 70
    const-string v3, "EMPTY_KEY"

    .line 71
    .line 72
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->EMPTY_KEY:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 76
    .line 77
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 78
    .line 79
    const/4 v1, 0x6

    .line 80
    const-string v2, "Found an empty key. Aborting the operation"

    .line 81
    .line 82
    const-string v3, "EMPTY_KEY_ABORT"

    .line 83
    .line 84
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->EMPTY_KEY_ABORT:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 88
    .line 89
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 90
    .line 91
    const/4 v1, 0x7

    .line 92
    const-string v2, "Property value for property %s wasn\'t a primitive (%s)"

    .line 93
    .line 94
    const-string v3, "PROP_VALUE_NOT_PRIMITIVE"

    .line 95
    .line 96
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 97
    .line 98
    .line 99
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->PROP_VALUE_NOT_PRIMITIVE:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 100
    .line 101
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 102
    .line 103
    const/16 v1, 0x8

    .line 104
    .line 105
    const-string v2, "ChannelId is required for API 26+ but not provided in the notification payload. Falling to default channel: %s"

    .line 106
    .line 107
    const-string v3, "CHANNEL_ID_MISSING_IN_PAYLOAD"

    .line 108
    .line 109
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->CHANNEL_ID_MISSING_IN_PAYLOAD:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 113
    .line 114
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 115
    .line 116
    const/16 v1, 0x9

    .line 117
    .line 118
    const-string v2, "Unable to render notification on channelId: %s as it is not registered by the app. Falling to default channel. "

    .line 119
    .line 120
    const-string v3, "CHANNEL_ID_NOT_REGISTERED"

    .line 121
    .line 122
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 123
    .line 124
    .line 125
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->CHANNEL_ID_NOT_REGISTERED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 126
    .line 127
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 128
    .line 129
    const/16 v1, 0xa

    .line 130
    .line 131
    const-string v2, "Recording of Notification Viewed is disabled in the CleverTap Dashboard for notification payload: %s"

    .line 132
    .line 133
    const-string v3, "NOTIFICATION_VIEWED_DISABLED"

    .line 134
    .line 135
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->NOTIFICATION_VIEWED_DISABLED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 139
    .line 140
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 141
    .line 142
    const-string v1, "%s is a restricted event name. Last event aborted."

    .line 143
    .line 144
    const-string v2, "RESTRICTED_EVENT_NAME"

    .line 145
    .line 146
    const/16 v3, 0xb

    .line 147
    .line 148
    const/16 v4, 0x201

    .line 149
    .line 150
    invoke-direct {v0, v2, v3, v4, v1}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 151
    .line 152
    .line 153
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->RESTRICTED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 154
    .line 155
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 156
    .line 157
    const/16 v1, 0xc

    .line 158
    .line 159
    const-string v2, "%s is a discarded event name. Last event aborted."

    .line 160
    .line 161
    const-string v3, "DISCARDED_EVENT_NAME"

    .line 162
    .line 163
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 164
    .line 165
    .line 166
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->DISCARDED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 167
    .line 168
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 169
    .line 170
    const-string v1, "CLEVERTAP_USE_CUSTOM_ID has been specified in the AndroidManifest.xml/Instance Configuration. CleverTap SDK will create a fallback device ID"

    .line 171
    .line 172
    const-string v2, "USE_CUSTOM_ID_FALLBACK"

    .line 173
    .line 174
    const/16 v3, 0xd

    .line 175
    .line 176
    const/16 v4, 0x202

    .line 177
    .line 178
    invoke-direct {v0, v2, v3, v4, v1}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 179
    .line 180
    .line 181
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->USE_CUSTOM_ID_FALLBACK:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 182
    .line 183
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 184
    .line 185
    const/16 v1, 0xe

    .line 186
    .line 187
    const-string v2, "CLEVERTAP_USE_CUSTOM_ID has not been specified in the AndroidManifest.xml. Custom CleverTap ID passed will not be used."

    .line 188
    .line 189
    const-string v3, "USE_CUSTOM_ID_MISSING_IN_MANIFEST"

    .line 190
    .line 191
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 192
    .line 193
    .line 194
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->USE_CUSTOM_ID_MISSING_IN_MANIFEST:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 195
    .line 196
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 197
    .line 198
    const/16 v1, 0xf

    .line 199
    .line 200
    const-string v2, "CleverTap ID - %s already exists. Unable to set custom CleverTap ID - %s"

    .line 201
    .line 202
    const-string v3, "UNABLE_TO_SET_CT_CUSTOM_ID"

    .line 203
    .line 204
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 205
    .line 206
    .line 207
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->UNABLE_TO_SET_CT_CUSTOM_ID:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 208
    .line 209
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 210
    .line 211
    const/16 v1, 0x10

    .line 212
    .line 213
    const-string v2, "Attempted to set invalid custom CleverTap ID - %s, falling back to default error CleverTap ID - %s"

    .line 214
    .line 215
    const-string v3, "INVALID_CT_CUSTOM_ID"

    .line 216
    .line 217
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 218
    .line 219
    .line 220
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->INVALID_CT_CUSTOM_ID:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 221
    .line 222
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 223
    .line 224
    const-string v1, "Key \'%s\' contains invalid characters. Cleaned to \'%s\'"

    .line 225
    .line 226
    const-string v2, "KEY_INVALID_CHARACTERS"

    .line 227
    .line 228
    const/16 v3, 0x11

    .line 229
    .line 230
    const/16 v4, 0x208

    .line 231
    .line 232
    invoke-direct {v0, v2, v3, v4, v1}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 233
    .line 234
    .line 235
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->KEY_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 236
    .line 237
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 238
    .line 239
    const/16 v1, 0x12

    .line 240
    .line 241
    const-string v2, "Key \'%s\' exceeds the limit of %s characters. Trimmed to \'%s\'"

    .line 242
    .line 243
    const-string v3, "KEY_LENGTH_EXCEEDED"

    .line 244
    .line 245
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 246
    .line 247
    .line 248
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->KEY_LENGTH_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 249
    .line 250
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 251
    .line 252
    const-string v1, "Value \'%s\' for key \'%s\' exceeds the limit of %s characters. Trimmed to \'%s\'"

    .line 253
    .line 254
    const-string v2, "VALUE_CHARS_LIMIT_EXCEEDED"

    .line 255
    .line 256
    const/16 v3, 0x13

    .line 257
    .line 258
    const/16 v4, 0x209

    .line 259
    .line 260
    invoke-direct {v0, v2, v3, v4, v1}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 261
    .line 262
    .line 263
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->VALUE_CHARS_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 264
    .line 265
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 266
    .line 267
    const/16 v1, 0x14

    .line 268
    .line 269
    const-string v2, "Value \'%s\' for key \'%s\' contains invalid characters. Cleaned to \'%s\'"

    .line 270
    .line 271
    const-string v3, "VALUE_INVALID_CHARACTERS"

    .line 272
    .line 273
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 274
    .line 275
    .line 276
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->VALUE_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 277
    .line 278
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 279
    .line 280
    const/16 v1, 0x20a

    .line 281
    .line 282
    const-string v2, "Charged event contained more than 50 items."

    .line 283
    .line 284
    const-string v3, "CHARGED_EVENT_TOO_MANY_ITEMS"

    .line 285
    .line 286
    const/16 v4, 0x15

    .line 287
    .line 288
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 289
    .line 290
    .line 291
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->CHARGED_EVENT_TOO_MANY_ITEMS:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 292
    .line 293
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 294
    .line 295
    const/16 v1, 0x20b

    .line 296
    .line 297
    const-string v2, "%s... is a restricted key for multi-value properties. Dropped."

    .line 298
    .line 299
    const-string v3, "RESTRICTED_MULTI_VALUE_KEY"

    .line 300
    .line 301
    const/16 v4, 0x16

    .line 302
    .line 303
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 304
    .line 305
    .line 306
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->RESTRICTED_MULTI_VALUE_KEY:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 307
    .line 308
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 309
    .line 310
    const/16 v1, 0x213

    .line 311
    .line 312
    const-string v2, "Profile Identifiers mismatch with the previously saved ones"

    .line 313
    .line 314
    const-string v3, "PROFILE_IDENTIFIERS_MISMATCH"

    .line 315
    .line 316
    const/16 v4, 0x17

    .line 317
    .line 318
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 319
    .line 320
    .line 321
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->PROFILE_IDENTIFIERS_MISMATCH:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 322
    .line 323
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 324
    .line 325
    const/16 v1, 0x21c

    .line 326
    .line 327
    const-string v2, "Event data exceeded maximum nesting depth. Depth: %s, Limit: %s"

    .line 328
    .line 329
    const-string v3, "DEPTH_LIMIT_EXCEEDED"

    .line 330
    .line 331
    const/16 v4, 0x18

    .line 332
    .line 333
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 334
    .line 335
    .line 336
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->DEPTH_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 337
    .line 338
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 339
    .line 340
    const/16 v1, 0x21d

    .line 341
    .line 342
    const-string v2, "Event data exceeded maximum array key count. Count: %s, Limit: %s"

    .line 343
    .line 344
    const-string v3, "ARRAY_KEY_COUNT_LIMIT_EXCEEDED"

    .line 345
    .line 346
    const/16 v4, 0x19

    .line 347
    .line 348
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 349
    .line 350
    .line 351
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->ARRAY_KEY_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 352
    .line 353
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 354
    .line 355
    const/16 v1, 0x21e

    .line 356
    .line 357
    const-string v2, "Event data exceeded maximum object key count. Count: %s, Limit: %s"

    .line 358
    .line 359
    const-string v3, "OBJECT_KEY_COUNT_LIMIT_EXCEEDED"

    .line 360
    .line 361
    const/16 v4, 0x1a

    .line 362
    .line 363
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 364
    .line 365
    .line 366
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->OBJECT_KEY_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 367
    .line 368
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 369
    .line 370
    const/16 v1, 0x21f

    .line 371
    .line 372
    const-string v2, "Event data exceeded maximum array length. Length: %s, Limit: %s"

    .line 373
    .line 374
    const-string v3, "ARRAY_LENGTH_LIMIT_EXCEEDED"

    .line 375
    .line 376
    const/16 v4, 0x1b

    .line 377
    .line 378
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 379
    .line 380
    .line 381
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->ARRAY_LENGTH_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 382
    .line 383
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 384
    .line 385
    const/16 v1, 0x220

    .line 386
    .line 387
    const-string v2, "Event data exceeded maximum key-value pair count. Count: %s, Limit: %s"

    .line 388
    .line 389
    const-string v3, "KV_PAIR_COUNT_LIMIT_EXCEEDED"

    .line 390
    .line 391
    const/16 v4, 0x1c

    .line 392
    .line 393
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 394
    .line 395
    .line 396
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->KV_PAIR_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 397
    .line 398
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 399
    .line 400
    const-string v1, "Null value for key \'%s\' was removed"

    .line 401
    .line 402
    const-string v2, "NULL_VALUE_REMOVED"

    .line 403
    .line 404
    const/16 v3, 0x1d

    .line 405
    .line 406
    const/16 v4, 0x221

    .line 407
    .line 408
    invoke-direct {v0, v2, v3, v4, v1}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 409
    .line 410
    .line 411
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->NULL_VALUE_REMOVED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 412
    .line 413
    new-instance v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 414
    .line 415
    const/16 v1, 0x1e

    .line 416
    .line 417
    const-string v2, "Empty value for key \'%s\' was removed"

    .line 418
    .line 419
    const-string v3, "EMPTY_VALUE_REMOVED"

    .line 420
    .line 421
    invoke-direct {v0, v3, v1, v4, v2}, Lcom/clevertap/android/sdk/validation/ValidationError;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 422
    .line 423
    .line 424
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->EMPTY_VALUE_REMOVED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 425
    .line 426
    invoke-static {}, Lcom/clevertap/android/sdk/validation/ValidationError;->$values()[Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 427
    .line 428
    .line 429
    move-result-object v0

    .line 430
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->$VALUES:[Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 431
    .line 432
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    sput-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 437
    .line 438
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/clevertap/android/sdk/validation/ValidationError;->code:I

    .line 5
    .line 6
    iput-object p4, p0, Lcom/clevertap/android/sdk/validation/ValidationError;->messageTemplate:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/clevertap/android/sdk/validation/ValidationError;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/validation/ValidationError;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/validation/ValidationError;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->$VALUES:[Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/validation/ValidationError;->code:I

    .line 2
    .line 3
    return p0
.end method

.method public final varargs getMessage([Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/clevertap/android/sdk/validation/ValidationError;->messageTemplate:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/clevertap/android/sdk/validation/ValidationError;->messageTemplate:Ljava/lang/String;

    .line 13
    .line 14
    array-length v0, p1

    .line 15
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    array-length v0, p1

    .line 20
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method
