.class public final synthetic Lslg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltlg;


# direct methods
.method public synthetic constructor <init>(Ltlg;B)V
    .registers 3

    iput-byte p2, p0, Lslg;->a:B

    iput-object p1, p0, Lslg;->b:Ltlg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lslg;->a:B

    iget-object p0, p0, Lslg;->b:Ltlg;

    packed-switch v0, :pswitch_data_38

    check-cast p1, Lt8k;

    iget-object p1, p0, Ltlg;->i:Lkze;

    iget-object p0, p0, Ltlg;->f:Lu8k;

    invoke-virtual {p0}, Lu8k;->b()Lt8k;

    sget-object p0, Lpzj;->b:Lpzj;

    invoke-static {p1, p0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ltlg;->R()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_20
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0}, Ltlg;->R()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_28
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ltlg;->S()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_30
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0}, Ltlg;->S()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_30
        :pswitch_28
        :pswitch_20
        :pswitch_18
    .end packed-switch
.end method
