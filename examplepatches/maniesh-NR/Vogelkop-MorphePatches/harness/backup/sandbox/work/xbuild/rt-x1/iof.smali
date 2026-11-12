.class public final synthetic Liof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;B)V
    .registers 4

    iput-byte p3, p0, Liof;->a:B

    iput-object p1, p0, Liof;->b:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    iput-object p2, p0, Liof;->c:Lkotlin/jvm/functions/Function0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Liof;->a:B

    iget-object v1, p0, Liof;->c:Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Liof;->b:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    packed-switch v0, :pswitch_data_1c

    invoke-static {p0, v1, p1, p2}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->j(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;Lih5;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-static {p0, v1, p1, p2}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->g(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;Lih5;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
