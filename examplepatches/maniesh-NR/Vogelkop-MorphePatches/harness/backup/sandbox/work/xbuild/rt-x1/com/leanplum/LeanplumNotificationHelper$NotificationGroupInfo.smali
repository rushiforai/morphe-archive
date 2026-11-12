.class Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/LeanplumNotificationHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NotificationGroupInfo"
.end annotation


# instance fields
.field final id:I

.field final key:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field final minNotificationsToGroup:I

.field final tag:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .registers 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->tag:Ljava/lang/String;

    iput p2, p0, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->id:I

    iput-object p3, p0, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->key:Ljava/lang/String;

    iput p4, p0, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->minNotificationsToGroup:I

    return-void
.end method
