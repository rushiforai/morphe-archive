.class public final Lcom/google/firebase/messaging/Constants;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/messaging/Constants$ScionAnalytics;,
        Lcom/google/firebase/messaging/Constants$FirelogAnalytics;,
        Lcom/google/firebase/messaging/Constants$AnalyticsKeys;,
        Lcom/google/firebase/messaging/Constants$MessageNotificationKeys;,
        Lcom/google/firebase/messaging/Constants$MessagePayloadKeys;,
        Lcom/google/firebase/messaging/Constants$MessageTypes;
    }
.end annotation


# static fields
.field public static final FCM_WAKE_LOCK:Ljava/lang/String; = "wake:com.google.firebase.messaging"

.field public static final IPC_BUNDLE_KEY_SEND_ERROR:Ljava/lang/String; = "error"

.field public static final TAG:Ljava/lang/String; = "FirebaseMessaging"

.field public static final WAKE_LOCK_ACQUIRE_TIMEOUT_MILLIS:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/32 v0, 0x2bf20

    .line 2
    .line 3
    .line 4
    sput-wide v0, Lcom/google/firebase/messaging/Constants;->WAKE_LOCK_ACQUIRE_TIMEOUT_MILLIS:J

    .line 5
    .line 6
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
