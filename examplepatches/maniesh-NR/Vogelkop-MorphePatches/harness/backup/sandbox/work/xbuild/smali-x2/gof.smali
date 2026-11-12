.class public final synthetic Lgof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/leanplum/ActionContext;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/ActionContext;B)V
    .registers 3

    iput-byte p2, p0, Lgof;->a:B

    iput-object p1, p0, Lgof;->b:Lcom/leanplum/ActionContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lgof;->a:B

    iget-object p0, p0, Lgof;->b:Lcom/leanplum/ActionContext;

    packed-switch v0, :pswitch_data_16

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->b(Lcom/leanplum/ActionContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_c
    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->a(Lcom/leanplum/ActionContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_11
    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->g(Lcom/leanplum/ActionContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_11
        :pswitch_c
    .end packed-switch
.end method
