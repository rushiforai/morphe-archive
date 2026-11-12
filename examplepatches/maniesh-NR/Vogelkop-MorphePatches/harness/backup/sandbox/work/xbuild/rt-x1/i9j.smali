.class public final synthetic Li9j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkbd;


# direct methods
.method public synthetic constructor <init>(Lkbd;B)V
    .registers 3

    iput-byte p2, p0, Li9j;->a:B

    iput-object p1, p0, Li9j;->b:Lkbd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Li9j;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Li9j;->b:Lkbd;

    packed-switch v0, :pswitch_data_16

    const/4 v0, 0x1

    invoke-static {p0, v1, p1, v0}, Lkbd;->v(Lkbd;Ljava/lang/Object;Ljava/lang/Object;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    const/4 v0, 0x2

    invoke-static {p0, p1, v1, v0}, Lkbd;->v(Lkbd;Ljava/lang/Object;Ljava/lang/Object;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
