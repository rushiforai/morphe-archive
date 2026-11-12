.class public final Lzwa;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Laxa;


# direct methods
.method public synthetic constructor <init>(Laxa;B)V
    .registers 3

    iput-byte p2, p0, Lzwa;->i:B

    iput-object p1, p0, Lzwa;->j:Laxa;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lzwa;->i:B

    iget-object p0, p0, Lzwa;->j:Laxa;

    packed-switch v0, :pswitch_data_1a

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-virtual {p0}, Lxd5;->getDefaultViewModelCreationExtras()Lg06;

    move-result-object p0

    return-object p0

    :pswitch_10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-virtual {p0}, Lxd5;->getViewModelStore()Lv7n;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
