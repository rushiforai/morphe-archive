.class public final synthetic Llw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lekj;
.implements Ln5o;
.implements Lp9g;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/api/Callback;B)V
    .registers 3

    iput-byte p2, p0, Llw0;->a:B

    iput-object p1, p0, Llw0;->b:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 2

    iget-object p0, p0, Llw0;->b:Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Llw0;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Llw0;->b:Lcom/opera/api/Callback;

    packed-switch v0, :pswitch_data_2c

    :pswitch_8
    check-cast p1, Lilh;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v1

    :pswitch_e
    check-cast p1, Ljava/util/List;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v1

    :pswitch_14
    check-cast p1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->f(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_1b
    check-cast p1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->d(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_22
    check-cast p1, Lc84;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v1

    :pswitch_28
    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v1

    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_28
        :pswitch_22
        :pswitch_8
        :pswitch_1b
        :pswitch_14
        :pswitch_e
    .end packed-switch
.end method

.method public final k([I[Ljava/lang/String;)V
    .registers 4

    array-length p2, p1

    const/4 v0, 0x0

    if-lez p2, :cond_9

    aget p1, p1, v0

    if-nez p1, :cond_9

    const/4 v0, 0x1

    :cond_9
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object p0, p0, Llw0;->b:Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method
