.class public final synthetic Ljof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;B)V
    .registers 4

    iput-byte p3, p0, Ljof;->a:B

    iput-object p1, p0, Ljof;->b:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    iput-object p2, p0, Ljof;->c:Lkotlin/jvm/functions/Function0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ljof;->a:B

    iget-object v1, p0, Ljof;->c:Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Ljof;->b:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    packed-switch v0, :pswitch_data_18

    invoke-static {p0, v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->k(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_e
    invoke-static {p0, v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->h(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_13
    invoke-static {p0, v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->p(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_13
        :pswitch_e
    .end packed-switch
.end method
