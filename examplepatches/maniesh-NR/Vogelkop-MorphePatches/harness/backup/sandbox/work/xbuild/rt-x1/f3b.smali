.class public final synthetic Lf3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lg3b;


# direct methods
.method public synthetic constructor <init>(Lg3b;B)V
    .registers 3

    iput-byte p2, p0, Lf3b;->a:B

    iput-object p1, p0, Lf3b;->b:Lg3b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lf3b;->a:B

    const/4 v1, -0x1

    iget-object p0, p0, Lf3b;->b:Lg3b;

    packed-switch v0, :pswitch_data_2a

    invoke-virtual {p0}, Lryl;->g0()V

    iget-object p0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast p0, Lua7;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0, v0}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_19
    invoke-virtual {p0}, Lryl;->g0()V

    iget-object p0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast p0, Lua7;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0, v0}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
