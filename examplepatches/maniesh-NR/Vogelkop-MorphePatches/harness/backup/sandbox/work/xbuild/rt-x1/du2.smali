.class public final synthetic Ldu2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Leu2;


# direct methods
.method public synthetic constructor <init>(Leu2;B)V
    .registers 3

    iput-byte p2, p0, Ldu2;->a:B

    iput-object p1, p0, Ldu2;->b:Leu2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Ldu2;->a:B

    iget-object p0, p0, Ldu2;->b:Leu2;

    packed-switch v0, :pswitch_data_4a

    check-cast p1, Lpkj;

    sget-object v0, Lpkj;->a:Lpkj;

    if-ne p1, v0, :cond_2f

    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.settings.LOCK_SCREEN_SETTINGS"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v0, 0x10000

    invoke-static {v0, p1}, Lqvf;->b(ILandroid/content/Intent;)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-nez v0, :cond_23

    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.settings.SETTINGS"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :cond_23
    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    :try_start_28
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_2f
    .catch Landroid/content/ActivityNotFoundException; {:try_start_28 .. :try_end_2f} :catch_2f

    :catch_2f
    :cond_2f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_32
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0}, Leu2;->H0()Lhu2;

    move-result-object p0

    iget-object v0, p0, Lhu2;->e:Lx5g;

    new-instance v1, Ltt2;

    const/4 v2, 0x1

    invoke-direct {v1, p1, p0, v2}, Ltt2;-><init>(ILjava/lang/Object;B)V

    invoke-static {v0, v1}, Lx5g;->b(Lx5g;Lcom/opera/api/Callback;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
