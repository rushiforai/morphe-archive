.class public final synthetic Ld8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Le8k;


# direct methods
.method public synthetic constructor <init>(Le8k;B)V
    .registers 3

    iput-byte p2, p0, Ld8k;->a:B

    iput-object p1, p0, Ld8k;->b:Le8k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ld8k;->a:B

    iget-object p0, p0, Ld8k;->b:Le8k;

    packed-switch v0, :pswitch_data_20

    check-cast p1, Lt8k;

    iget-object p1, p0, Le8k;->f:Lkze;

    iget-object p0, p0, Le8k;->c:Lu8k;

    invoke-virtual {p0}, Lu8k;->b()Lt8k;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p1, p0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18
    check-cast p1, Lj7k;

    invoke-virtual {p0}, Le8k;->R()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
