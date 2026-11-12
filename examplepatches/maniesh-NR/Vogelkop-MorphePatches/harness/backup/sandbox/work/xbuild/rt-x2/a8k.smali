.class public final synthetic La8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lb8k;


# direct methods
.method public synthetic constructor <init>(Lb8k;B)V
    .registers 3

    iput-byte p2, p0, La8k;->a:B

    iput-object p1, p0, La8k;->b:Lb8k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, La8k;->a:B

    iget-object p0, p0, La8k;->b:Lb8k;

    packed-switch v0, :pswitch_data_50

    check-cast p1, Lkl5;

    invoke-virtual {p0}, Lb8k;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    check-cast p1, Lyt8;

    invoke-virtual {p0}, Lb8k;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lb8k;->s:Z

    invoke-virtual {p0}, Lb8k;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    check-cast p1, Lt8k;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lb8k;->q:Z

    iget-boolean p1, p1, Lt8k;->b:Z

    iput-boolean p1, p0, Lb8k;->r:Z

    invoke-virtual {p0}, Lb8k;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_37
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lb8k;->p:Z

    invoke-virtual {p0}, Lb8k;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_45
    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lb8k;->o:Ljava/util/List;

    invoke-virtual {p0}, Lb8k;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_45
        :pswitch_37
        :pswitch_25
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
