.class public final enum Lcom/clevertap/android/sdk/db/Table;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/db/Table;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0010\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/db/Table;",
        "",
        "tableName",
        "",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "getTableName",
        "()Ljava/lang/String;",
        "EVENTS",
        "PROFILE_EVENTS",
        "USER_PROFILES",
        "INBOX_MESSAGES",
        "PUSH_NOTIFICATIONS",
        "UNINSTALL_TS",
        "PUSH_NOTIFICATION_VIEWED",
        "USER_EVENT_LOGS_TABLE",
        "DELAYED_LEGACY_INAPPS",
        "INBOX_PENDING_DELETES",
        "INBOX_PENDING_READS",
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

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/db/Table;

.field public static final enum DELAYED_LEGACY_INAPPS:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum EVENTS:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum INBOX_MESSAGES:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum INBOX_PENDING_DELETES:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum INBOX_PENDING_READS:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum PROFILE_EVENTS:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum PUSH_NOTIFICATIONS:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum PUSH_NOTIFICATION_VIEWED:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum UNINSTALL_TS:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum USER_EVENT_LOGS_TABLE:Lcom/clevertap/android/sdk/db/Table;

.field public static final enum USER_PROFILES:Lcom/clevertap/android/sdk/db/Table;


# instance fields
.field private final tableName:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/db/Table;
    .locals 11

    sget-object v0, Lcom/clevertap/android/sdk/db/Table;->EVENTS:Lcom/clevertap/android/sdk/db/Table;

    sget-object v1, Lcom/clevertap/android/sdk/db/Table;->PROFILE_EVENTS:Lcom/clevertap/android/sdk/db/Table;

    sget-object v2, Lcom/clevertap/android/sdk/db/Table;->USER_PROFILES:Lcom/clevertap/android/sdk/db/Table;

    sget-object v3, Lcom/clevertap/android/sdk/db/Table;->INBOX_MESSAGES:Lcom/clevertap/android/sdk/db/Table;

    sget-object v4, Lcom/clevertap/android/sdk/db/Table;->PUSH_NOTIFICATIONS:Lcom/clevertap/android/sdk/db/Table;

    sget-object v5, Lcom/clevertap/android/sdk/db/Table;->UNINSTALL_TS:Lcom/clevertap/android/sdk/db/Table;

    sget-object v6, Lcom/clevertap/android/sdk/db/Table;->PUSH_NOTIFICATION_VIEWED:Lcom/clevertap/android/sdk/db/Table;

    sget-object v7, Lcom/clevertap/android/sdk/db/Table;->USER_EVENT_LOGS_TABLE:Lcom/clevertap/android/sdk/db/Table;

    sget-object v8, Lcom/clevertap/android/sdk/db/Table;->DELAYED_LEGACY_INAPPS:Lcom/clevertap/android/sdk/db/Table;

    sget-object v9, Lcom/clevertap/android/sdk/db/Table;->INBOX_PENDING_DELETES:Lcom/clevertap/android/sdk/db/Table;

    sget-object v10, Lcom/clevertap/android/sdk/db/Table;->INBOX_PENDING_READS:Lcom/clevertap/android/sdk/db/Table;

    filled-new-array/range {v0 .. v10}, [Lcom/clevertap/android/sdk/db/Table;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "events"

    .line 5
    .line 6
    const-string v3, "EVENTS"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->EVENTS:Lcom/clevertap/android/sdk/db/Table;

    .line 12
    .line 13
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "profileEvents"

    .line 17
    .line 18
    const-string v3, "PROFILE_EVENTS"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->PROFILE_EVENTS:Lcom/clevertap/android/sdk/db/Table;

    .line 24
    .line 25
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "userProfiles"

    .line 29
    .line 30
    const-string v3, "USER_PROFILES"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->USER_PROFILES:Lcom/clevertap/android/sdk/db/Table;

    .line 36
    .line 37
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "inboxMessages"

    .line 41
    .line 42
    const-string v3, "INBOX_MESSAGES"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->INBOX_MESSAGES:Lcom/clevertap/android/sdk/db/Table;

    .line 48
    .line 49
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const-string v2, "pushNotifications"

    .line 53
    .line 54
    const-string v3, "PUSH_NOTIFICATIONS"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->PUSH_NOTIFICATIONS:Lcom/clevertap/android/sdk/db/Table;

    .line 60
    .line 61
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 62
    .line 63
    const/4 v1, 0x5

    .line 64
    const-string v2, "uninstallTimestamp"

    .line 65
    .line 66
    const-string v3, "UNINSTALL_TS"

    .line 67
    .line 68
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->UNINSTALL_TS:Lcom/clevertap/android/sdk/db/Table;

    .line 72
    .line 73
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 74
    .line 75
    const/4 v1, 0x6

    .line 76
    const-string v2, "notificationViewed"

    .line 77
    .line 78
    const-string v3, "PUSH_NOTIFICATION_VIEWED"

    .line 79
    .line 80
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->PUSH_NOTIFICATION_VIEWED:Lcom/clevertap/android/sdk/db/Table;

    .line 84
    .line 85
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 86
    .line 87
    const/4 v1, 0x7

    .line 88
    const-string v2, "userEventLogs"

    .line 89
    .line 90
    const-string v3, "USER_EVENT_LOGS_TABLE"

    .line 91
    .line 92
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->USER_EVENT_LOGS_TABLE:Lcom/clevertap/android/sdk/db/Table;

    .line 96
    .line 97
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 98
    .line 99
    const/16 v1, 0x8

    .line 100
    .line 101
    const-string v2, "delayedLegacyInApps"

    .line 102
    .line 103
    const-string v3, "DELAYED_LEGACY_INAPPS"

    .line 104
    .line 105
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->DELAYED_LEGACY_INAPPS:Lcom/clevertap/android/sdk/db/Table;

    .line 109
    .line 110
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 111
    .line 112
    const/16 v1, 0x9

    .line 113
    .line 114
    const-string v2, "inbox_pending_deletes"

    .line 115
    .line 116
    const-string v3, "INBOX_PENDING_DELETES"

    .line 117
    .line 118
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->INBOX_PENDING_DELETES:Lcom/clevertap/android/sdk/db/Table;

    .line 122
    .line 123
    new-instance v0, Lcom/clevertap/android/sdk/db/Table;

    .line 124
    .line 125
    const/16 v1, 0xa

    .line 126
    .line 127
    const-string v2, "inbox_pending_reads"

    .line 128
    .line 129
    const-string v3, "INBOX_PENDING_READS"

    .line 130
    .line 131
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/db/Table;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->INBOX_PENDING_READS:Lcom/clevertap/android/sdk/db/Table;

    .line 135
    .line 136
    invoke-static {}, Lcom/clevertap/android/sdk/db/Table;->$values()[Lcom/clevertap/android/sdk/db/Table;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->$VALUES:[Lcom/clevertap/android/sdk/db/Table;

    .line 141
    .line 142
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    sput-object v0, Lcom/clevertap/android/sdk/db/Table;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 147
    .line 148
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/clevertap/android/sdk/db/Table;->tableName:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/clevertap/android/sdk/db/Table;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/db/Table;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/db/Table;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/db/Table;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/db/Table;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/db/Table;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/db/Table;->$VALUES:[Lcom/clevertap/android/sdk/db/Table;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/db/Table;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getTableName()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/db/Table;->tableName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
