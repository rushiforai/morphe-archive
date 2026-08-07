.class Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;-><init>(Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler$b;->INSTANCE:Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler$b;->INSTANCE:Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;

    .line 2
    .line 3
    return-object v0
.end method
