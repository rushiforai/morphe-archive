.class public Lcom/leanplum/models/MessageArchiveData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public deliveryDateTime:Ljava/util/Date;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public messageBody:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public messageID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public recipientUserID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/models/MessageArchiveData;->messageID:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/models/MessageArchiveData;->messageBody:Ljava/lang/String;

    iput-object p3, p0, Lcom/leanplum/models/MessageArchiveData;->recipientUserID:Ljava/lang/String;

    iput-object p4, p0, Lcom/leanplum/models/MessageArchiveData;->deliveryDateTime:Ljava/util/Date;

    return-void
.end method
