.class public final synthetic Ljt7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwt7;


# direct methods
.method public synthetic constructor <init>(Lwt7;B)V
    .registers 3

    iput-byte p2, p0, Ljt7;->a:B

    iput-object p1, p0, Ljt7;->b:Lwt7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ljt7;->a:B

    iget-object p0, p0, Ljt7;->b:Lwt7;

    packed-switch v0, :pswitch_data_48

    check-cast p1, Lt0a;

    invoke-virtual {p0}, Lwt7;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    check-cast p1, Ll0a;

    invoke-virtual {p0}, Lwt7;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    check-cast p1, Lhbn;

    invoke-virtual {p0}, Lwt7;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1f
    check-cast p1, Leri;

    invoke-virtual {p0}, Lwt7;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0}, Lwt7;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2f
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lwt7;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_37
    check-cast p1, Lf55;

    invoke-virtual {p0}, Lwt7;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3f
    check-cast p1, Luv7;

    invoke-virtual {p0}, Lwt7;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_3f
        :pswitch_37
        :pswitch_2f
        :pswitch_27
        :pswitch_1f
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
