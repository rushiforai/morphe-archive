.class public final synthetic Lcom/leanplum/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/leanplum/LeanplumCloudMessagingProvider;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/LeanplumCloudMessagingProvider;B)V
    .registers 3

    iput-byte p2, p0, Lcom/leanplum/b;->a:B

    iput-object p1, p0, Lcom/leanplum/b;->b:Lcom/leanplum/LeanplumCloudMessagingProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 3

    iget-byte v0, p0, Lcom/leanplum/b;->a:B

    iget-object p0, p0, Lcom/leanplum/b;->b:Lcom/leanplum/LeanplumCloudMessagingProvider;

    packed-switch v0, :pswitch_data_10

    invoke-static {p0, p1}, Lcom/leanplum/Present;->a(Lcom/leanplum/LeanplumCloudMessagingProvider;Lcom/google/android/gms/tasks/Task;)V

    return-void

    :pswitch_b
    invoke-static {p0, p1}, Lcom/leanplum/Legacy;->a(Lcom/leanplum/LeanplumCloudMessagingProvider;Lcom/google/android/gms/tasks/Task;)V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
