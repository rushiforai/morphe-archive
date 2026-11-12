.class public Lcom/leanplum/internal/Constants$Defaults;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Defaults"
.end annotation


# static fields
.field public static final APP_ID:Ljava/lang/String; = "__app_id"

.field public static final ATTRIBUTES_KEY:Ljava/lang/String; = "__leanplum_attributes"

.field public static final COUNT_KEY:Ljava/lang/String; = "__leanplum_unsynced"

.field public static final DEFAULT_NOTIFICATION_CHANNEL_KEY:Ljava/lang/String; = "__leanplum_default_notification_channels"

.field public static final INBOX_KEY:Ljava/lang/String; = "__leanplum_newsfeed"

.field public static final ITEM_KEY:Ljava/lang/String; = "__leanplum_unsynced_%d"

.field public static final LEANPLUM:Ljava/lang/String; = "__leanplum__"

.field public static final LEANPLUM_PUSH:Ljava/lang/String; = "__leanplum_push__"

.field public static final LOCAL_NOTIFICATION_KEY:Ljava/lang/String; = "__leanplum_local_message_%s"

.field public static final MESSAGES_KEY:Ljava/lang/String; = "__leanplum_messages"

.field public static final MESSAGE_IMPRESSION_OCCURRENCES_KEY:Ljava/lang/String; = "__leanplum_message_occurrences_%s"

.field public static final MESSAGE_MUTED_KEY:Ljava/lang/String; = "__leanplum_message_muted_%s"

.field public static final MESSAGE_TRIGGER_OCCURRENCES_KEY:Ljava/lang/String; = "__leanplum_message_trigger_occurrences_%s"

.field public static final MESSAGING_PREF_NAME:Ljava/lang/String; = "__leanplum_messaging__"

.field public static final NOTIFICATION_CHANNELS_KEY:Ljava/lang/String; = "__leanplum_notification_channels"

.field public static final NOTIFICATION_GROUPS_KEY:Ljava/lang/String; = "__leanplum_notification_groups"

.field public static final PROPERTY_FCM_TOKEN_ID:Ljava/lang/String; = "registration_id"

.field public static final PROPERTY_MIPUSH_TOKEN_ID:Ljava/lang/String; = "mipush_registration_id"

.field public static final PROPERTY_SENDER_IDS:Ljava/lang/String; = "sender_ids"

.field public static final REGIONS_KEY:Ljava/lang/String; = "regions"

.field public static final TOKEN_KEY:Ljava/lang/String; = "__leanplum_token"

.field public static final UUID_KEY:Ljava/lang/String; = "__leanplum_uuid"

.field public static final VARIABLES_JSON_KEY:Ljava/lang/String; = "__leanplum_variables_json"

.field public static final VARIABLES_KEY:Ljava/lang/String; = "__leanplum_variables"

.field public static final VARIABLES_SIGN_KEY:Ljava/lang/String; = "__leanplum_variables_signature"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
