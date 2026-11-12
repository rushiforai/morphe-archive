.class Lcom/leanplum/PushProviders$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/PushProviders;->updateRegistrationIdsAndBackend()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/PushProviders;

.field final synthetic val$provider:Lcom/leanplum/IPushProvider;


# direct methods
.method public constructor <init>(Lcom/leanplum/PushProviders;Lcom/leanplum/IPushProvider;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/PushProviders$1;->this$0:Lcom/leanplum/PushProviders;

    iput-object p2, p0, Lcom/leanplum/PushProviders$1;->val$provider:Lcom/leanplum/IPushProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 1

    iget-object p0, p0, Lcom/leanplum/PushProviders$1;->val$provider:Lcom/leanplum/IPushProvider;

    invoke-interface {p0}, Lcom/leanplum/IPushProvider;->updateRegistrationId()V

    return-void
.end method
