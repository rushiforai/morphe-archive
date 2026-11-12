.class public final synthetic Lw4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:La5l;


# direct methods
.method public synthetic constructor <init>(La5l;B)V
    .registers 3

    iput-byte p2, p0, Lw4l;->a:B

    iput-object p1, p0, Lw4l;->b:La5l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lw4l;->a:B

    iget-object p0, p0, Lw4l;->b:La5l;

    packed-switch v0, :pswitch_data_30

    sget-object v0, La5l;->l:Lgpk;

    sget-object v0, Lava;->a:Lcva;

    new-instance v1, Lw4l;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lw4l;-><init>(La5l;B)V

    invoke-virtual {v0, v1}, Lcva;->a(Ljava/lang/Runnable;)V

    return-void

    :pswitch_15
    iget-object v0, p0, La5l;->a:Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Ln6k;

    const/16 v2, 0x15

    invoke-direct {v0, p0, v2}, Ln6k;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    iget-object p0, p0, La5l;->g:Lqie;

    invoke-virtual {v0, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
