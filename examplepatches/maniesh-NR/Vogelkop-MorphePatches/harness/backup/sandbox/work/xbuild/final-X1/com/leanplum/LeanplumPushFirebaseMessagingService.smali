.class public Lcom/leanplum/LeanplumPushFirebaseMessagingService;
.super Lcom/google/firebase/messaging/FirebaseMessagingService;
.source "SourceFile"


# instance fields
.field private final handler:Lcom/leanplum/LeanplumFirebaseServiceHandler;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lcom/google/firebase/messaging/FirebaseMessagingService;-><init>()V

    new-instance v0, Lcom/leanplum/LeanplumFirebaseServiceHandler;

    invoke-direct {v0}, Lcom/leanplum/LeanplumFirebaseServiceHandler;-><init>()V

    iput-object v0, p0, Lcom/leanplum/LeanplumPushFirebaseMessagingService;->handler:Lcom/leanplum/LeanplumFirebaseServiceHandler;

    return-void
.end method


# virtual methods
.method public onCreate()V
    .registers 2

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    iget-object v0, p0, Lcom/leanplum/LeanplumPushFirebaseMessagingService;->handler:Lcom/leanplum/LeanplumFirebaseServiceHandler;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/leanplum/LeanplumFirebaseServiceHandler;->onCreate(Landroid/content/Context;)V

    return-void
.end method

.method public onMessageReceived(Lrth;)V
    .registers 3
    .param p1    # Lrth;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/leanplum/LeanplumPushFirebaseMessagingService;->handler:Lcom/leanplum/LeanplumFirebaseServiceHandler;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lcom/leanplum/LeanplumFirebaseServiceHandler;->onMessageReceived(Lrth;Landroid/content/Context;)V

    return-void
.end method

.method public onNewToken(Ljava/lang/String;)V
    .registers 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/leanplum/LeanplumPushFirebaseMessagingService;->handler:Lcom/leanplum/LeanplumFirebaseServiceHandler;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lcom/leanplum/LeanplumFirebaseServiceHandler;->onNewToken(Ljava/lang/String;Landroid/content/Context;)V

    return-void
.end method
