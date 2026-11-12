.class public final synthetic Lstg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxtg;


# direct methods
.method public synthetic constructor <init>(Lxtg;B)V
    .registers 3

    iput-byte p2, p0, Lstg;->a:B

    iput-object p1, p0, Lstg;->b:Lxtg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lstg;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    iget-object p0, p0, Lstg;->b:Lxtg;

    check-cast p1, Lpkj;

    packed-switch v0, :pswitch_data_c6

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_1a

    if-eq p1, v3, :cond_1d

    if-eq p1, v2, :cond_1d

    invoke-static {}, Lh9o;->p()V

    goto :goto_1f

    :cond_1a
    invoke-virtual {p0}, Lxtg;->G0()V

    :cond_1d
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1f
    return-object v1

    :pswitch_20
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_34

    if-eq p1, v3, :cond_2e

    if-eq p1, v2, :cond_34

    invoke-static {}, Lh9o;->p()V

    goto :goto_36

    :cond_2e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxtg;->J0()V

    :cond_34
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_36
    return-object v1

    :pswitch_37
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_45

    if-eq p1, v3, :cond_48

    if-eq p1, v2, :cond_48

    invoke-static {}, Lh9o;->p()V

    goto :goto_4a

    :cond_45
    invoke-virtual {p0}, Lxtg;->G0()V

    :cond_48
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_4a
    return-object v1

    :pswitch_4b
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_59

    if-eq p1, v3, :cond_95

    if-eq p1, v2, :cond_95

    invoke-static {}, Lh9o;->p()V

    goto :goto_97

    :cond_59
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "com.android.vending"

    const-wide/16 v1, 0x0

    invoke-static {p1, v0, v1, v2}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p1

    if-eqz p1, :cond_95

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "https://play.google.com/store/apps/details?id="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    iget-object p1, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    :cond_95
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_97
    return-object v1

    :pswitch_98
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_ac

    if-eq p1, v3, :cond_a6

    if-eq p1, v2, :cond_ac

    invoke-static {}, Lh9o;->p()V

    goto :goto_ae

    :cond_a6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxtg;->J0()V

    :cond_ac
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_ae
    return-object v1

    :pswitch_af
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_c3

    if-eq p1, v3, :cond_bd

    if-eq p1, v2, :cond_c3

    invoke-static {}, Lh9o;->p()V

    goto :goto_c5

    :cond_bd
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxtg;->J0()V

    :cond_c3
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_c5
    return-object v1

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_af
        :pswitch_98
        :pswitch_4b
        :pswitch_37
        :pswitch_20
    .end packed-switch
.end method
