.class public final synthetic Lki;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lki;->a:B

    iput-object p1, p0, Lki;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 13

    iget-byte v0, p0, Lki;->a:B

    iget-object p0, p0, Lki;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_ac

    check-cast p0, Lvk1;

    return-object p0

    :pswitch_a
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lmrk;

    const-string v5, "getPayload()Lcom/opera/android/WebSearchPayload;"

    const/4 v6, 0x0

    const/4 v1, 0x0

    const-class v3, Lmrk;

    const-string v4, "getPayload"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_1b
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Lx7j;

    const-string v6, "settingsSearchRepository()Lcom/opera/android/settings/settings_search/SettingsSearchRepository;"

    const/4 v7, 0x0

    const/4 v2, 0x0

    const-class v4, Lx7j;

    const-string v5, "settingsSearchRepository"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_2c
    new-instance v2, Lnr9;

    move-object v4, p0

    check-cast v4, Landroid/content/Context;

    const-string v7, "getFilesDir()Ljava/io/File;"

    const/4 v8, 0x0

    const/4 v3, 0x0

    const-class v5, Landroid/content/Context;

    const-string v6, "getFilesDir"

    invoke-direct/range {v2 .. v8}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    :pswitch_3d
    check-cast p0, Lpw3;

    return-object p0

    :pswitch_40
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lfx3;

    const-string v5, "get()Ljava/lang/Object;"

    const/4 v6, 0x0

    const/4 v1, 0x0

    const-class v3, Lcom/opera/android/Lazy;

    const-string v4, "get"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_51
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Lxnh;

    const-string v6, "data()Ljava/lang/Object;"

    const/4 v7, 0x0

    const/4 v2, 0x0

    const-class v4, Lxnh;

    const-string v5, "data"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_62
    new-instance v2, Lnr9;

    move-object v4, p0

    check-cast v4, Lu59;

    const-string v7, "getValues()Lcom/opera/android/storage/FirstInstallValuesGetter$Values;"

    const/4 v8, 0x0

    const/4 v3, 0x0

    const-class v5, Lu59;

    const-string v6, "getValues"

    invoke-direct/range {v2 .. v8}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    :pswitch_73
    new-instance v3, Lnr9;

    move-object v5, p0

    check-cast v5, Lqim;

    const-string v8, "getSheetQueue()Lcom/opera/android/ui/SheetQueue;"

    const/4 v9, 0x0

    const/4 v4, 0x0

    const-class v6, Lqim;

    const-string v7, "getSheetQueue"

    invoke-direct/range {v3 .. v9}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v3

    :pswitch_84
    new-instance v4, Lnr9;

    move-object v6, p0

    check-cast v6, Lii;

    const-string v9, "get()Ljava/lang/Object;"

    const/4 v10, 0x0

    const/4 v5, 0x0

    const-class v7, Lcom/opera/android/Lazy;

    const-string v8, "get"

    invoke-direct/range {v4 .. v10}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v4

    :pswitch_95
    new-instance v5, Lnr9;

    move-object v7, p0

    check-cast v7, Lzv3;

    const-string v10, "get()Ljava/lang/Object;"

    const/4 v11, 0x0

    const/4 v6, 0x0

    const-class v8, Lcom/opera/android/Lazy;

    const-string v9, "get"

    invoke-direct/range {v5 .. v11}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v5

    :pswitch_a6
    check-cast p0, Lli;

    return-object p0

    :pswitch_a9
    check-cast p0, Lli;

    return-object p0

    :pswitch_data_ac
    .packed-switch 0x0
        :pswitch_a9
        :pswitch_a6
        :pswitch_95
        :pswitch_84
        :pswitch_73
        :pswitch_62
        :pswitch_51
        :pswitch_40
        :pswitch_3d
        :pswitch_2c
        :pswitch_1b
        :pswitch_a
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Lki;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_132

    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_1c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1c
    return v1

    :pswitch_1d
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_33

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_33

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_33
    return v1

    :pswitch_34
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_4a

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_4a

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_4a
    return v1

    :pswitch_4b
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_61

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_61

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_61
    return v1

    :pswitch_62
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_78

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_78

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_78
    return v1

    :pswitch_79
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_8f

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_8f

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_8f
    return v1

    :pswitch_90
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_a6

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_a6

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_a6
    return v1

    :pswitch_a7
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_bd

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_bd

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_bd
    return v1

    :pswitch_be
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_d4

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_d4

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_d4
    return v1

    :pswitch_d5
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_eb

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_eb

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_eb
    return v1

    :pswitch_ec
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_102

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_102

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_102
    return v1

    :pswitch_103
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_119

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_119

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_119
    return v1

    :pswitch_11a
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_130

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_130

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_130
    return v1

    nop

    :pswitch_data_132
    .packed-switch 0x0
        :pswitch_11a
        :pswitch_103
        :pswitch_ec
        :pswitch_d5
        :pswitch_be
        :pswitch_a7
        :pswitch_90
        :pswitch_79
        :pswitch_62
        :pswitch_4b
        :pswitch_34
        :pswitch_1d
    .end packed-switch
.end method

.method public final get()Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lki;->a:B

    iget-object p0, p0, Lki;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_a2

    check-cast p0, Lvk1;

    invoke-virtual {p0}, Lvk1;->invoke()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_e
    check-cast p0, Lmrk;

    iget-object p0, p0, Lmrk;->o:Lm0a;

    iget-object p0, p0, Lm0a;->e:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll0a;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0

    :pswitch_1f
    check-cast p0, Lx7j;

    new-instance v0, La21;

    iget-object v1, p0, Lx7j;->b:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Landroid/app/Activity;

    new-instance v2, Lw6j;

    iget-object v1, p0, Lx7j;->f:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Lz7j;

    iget-object v1, p0, Lx7j;->e:Lesk;

    check-cast v1, Lmw3;

    invoke-virtual {v1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lwub;

    iget-object v1, p0, Lx7j;->c:Ljava/lang/Object;

    check-cast v1, Lmw3;

    invoke-virtual {v1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lrii;

    iget-object p0, p0, Lx7j;->d:Lesk;

    move-object v7, p0

    check-cast v7, Llw3;

    invoke-direct/range {v2 .. v7}, Lw6j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v2}, [Lw6j;

    move-result-object p0

    invoke-direct {v0, v3, p0}, La21;-><init>(Landroid/content/Context;[Lw6j;)V

    return-object v0

    :pswitch_55
    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    return-object p0

    :pswitch_5c
    check-cast p0, Lpw3;

    invoke-virtual {p0}, Lpw3;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_63
    check-cast p0, Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    return-object p0

    :pswitch_6c
    check-cast p0, Lxnh;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    return-object p0

    :pswitch_75
    check-cast p0, Lu59;

    invoke-virtual {p0}, Lu59;->H()Lt59;

    move-result-object p0

    return-object p0

    :pswitch_7c
    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->d:Lnej;

    return-object p0

    :pswitch_81
    check-cast p0, Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly22;

    return-object p0

    :pswitch_8a
    check-cast p0, Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcg2;

    return-object p0

    :pswitch_93
    check-cast p0, Lli;

    invoke-virtual {p0}, Lli;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_9a
    check-cast p0, Lli;

    invoke-virtual {p0}, Lli;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_a2
    .packed-switch 0x0
        :pswitch_9a
        :pswitch_93
        :pswitch_8a
        :pswitch_81
        :pswitch_7c
        :pswitch_75
        :pswitch_6c
        :pswitch_63
        :pswitch_5c
        :pswitch_55
        :pswitch_1f
        :pswitch_e
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lki;->a:B

    packed-switch v0, :pswitch_data_7a

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_17
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_20
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_29
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_32
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_3b
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_44
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_4d
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_56
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_5f
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_68
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_71
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_71
        :pswitch_68
        :pswitch_5f
        :pswitch_56
        :pswitch_4d
        :pswitch_44
        :pswitch_3b
        :pswitch_32
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method
