.class public final synthetic Lqwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lywa;


# direct methods
.method public synthetic constructor <init>(Lywa;B)V
    .registers 3

    iput-byte p2, p0, Lqwa;->a:B

    iput-object p1, p0, Lqwa;->b:Lywa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lqwa;->a:B

    iget-object p0, p0, Lqwa;->b:Lywa;

    packed-switch v0, :pswitch_data_54

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p0

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    return-object p0

    :pswitch_10
    sget-object v0, Lywa;->g:[Lxtb;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    new-instance v0, Laz0;

    invoke-direct {v0, p0}, Laz0;-><init>(Landroid/content/Context;)V

    const v1, 0x7f140847

    invoke-virtual {v0, v1}, Laz0;->b(I)V

    const v1, 0x7f140844

    invoke-virtual {v0, v1}, Laz0;->a(I)V

    new-instance v1, Lsk;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lsk;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f140846

    invoke-virtual {v0, p0, v1}, Laz0;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    move-result-object p0

    const v0, 0x7f140845

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    move-result-object p0

    invoke-virtual {p0}, Laz0;->create()Lbz0;

    move-result-object p0

    return-object p0

    :pswitch_42
    sget-object v0, Lywa;->g:[Lxtb;

    invoke-virtual {p0}, Lywa;->f0()Llxa;

    move-result-object p0

    return-object p0

    :pswitch_49
    sget-object v0, Lywa;->g:[Lxtb;

    new-instance v0, Lhy7;

    invoke-direct {v0}, Lhy7;-><init>()V

    iput-object p0, v0, Lhy7;->a:Lywa;

    return-object v0

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_49
        :pswitch_42
        :pswitch_10
    .end packed-switch
.end method
