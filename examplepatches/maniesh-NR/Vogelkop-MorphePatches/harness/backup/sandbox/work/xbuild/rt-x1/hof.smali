.class public final synthetic Lhof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;

.field public final synthetic c:Lwf5;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;B)V
    .registers 4

    iput-byte p3, p0, Lhof;->a:B

    iput-object p1, p0, Lhof;->b:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;

    iput-object p2, p0, Lhof;->c:Lwf5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lhof;->a:B

    iget-object v1, p0, Lhof;->c:Lwf5;

    iget-object p0, p0, Lhof;->b:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;

    packed-switch v0, :pswitch_data_1e

    invoke-static {p0, v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->f(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_e
    invoke-static {p0, v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->e(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_13
    invoke-static {p0, v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->a(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_18
    invoke-static {p0, v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->d(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_18
        :pswitch_13
        :pswitch_e
    .end packed-switch
.end method
