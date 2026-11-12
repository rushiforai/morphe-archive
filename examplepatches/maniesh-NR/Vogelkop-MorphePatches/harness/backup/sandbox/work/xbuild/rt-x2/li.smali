.class public final synthetic Lli;
.super Lb6h;
.source "SourceFile"


# instance fields
.field public final synthetic b:B


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;B)V
    .registers 15

    iput-byte p2, p0, Lli;->b:B

    packed-switch p2, :pswitch_data_2c

    const-string v4, "getVpnManager()Lcom/opera/android/vpn/VpnManager;"

    const/4 v5, 0x0

    const-class v2, Lcom/opera/android/OperaApplication;

    const-string v3, "vpnManager"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_12
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getPremiumAvailability()Lcom/opera/android/premium/PremiumAvailability;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "premiumAvailability"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_1f
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getVpnManager()Lcom/opera/android/vpn/VpnManager;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "vpnManager"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x11
        :pswitch_1f
        :pswitch_12
    .end packed-switch
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 7

    .line 44
    iput-byte p6, p0, Lli;->b:B

    invoke-direct/range {p0 .. p5}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lli;->b:B

    packed-switch v0, :pswitch_data_146

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->G()Lmdh;

    move-result-object p0

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_17
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_22
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_2d
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->O()Lv3m;

    move-result-object p0

    return-object p0

    :pswitch_36
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_3f
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_4a
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_55
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_60
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_6b
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_76
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object p0

    return-object p0

    :pswitch_7f
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    return-object p0

    :pswitch_88
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    return-object p0

    :pswitch_91
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_9c
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_a7
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object p0

    return-object p0

    :pswitch_b0
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->G()Lmdh;

    move-result-object p0

    return-object p0

    :pswitch_b9
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lwo3;

    iget-object p0, p0, Lwo3;->E:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmv2;

    return-object p0

    :pswitch_c6
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lwo3;

    iget-object p0, p0, Lwo3;->D:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfg;

    return-object p0

    :pswitch_d3
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_de
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_e9
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->s:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La55;

    return-object p0

    :pswitch_f8
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_103
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_10e
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_119
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object p0

    return-object p0

    :pswitch_122
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_12d
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->p:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lech;

    return-object p0

    :pswitch_13c
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_146
    .packed-switch 0x0
        :pswitch_13c
        :pswitch_12d
        :pswitch_122
        :pswitch_119
        :pswitch_10e
        :pswitch_103
        :pswitch_f8
        :pswitch_e9
        :pswitch_de
        :pswitch_d3
        :pswitch_c6
        :pswitch_b9
        :pswitch_b0
        :pswitch_a7
        :pswitch_9c
        :pswitch_91
        :pswitch_88
        :pswitch_7f
        :pswitch_76
        :pswitch_6b
        :pswitch_60
        :pswitch_55
        :pswitch_4a
        :pswitch_3f
        :pswitch_36
        :pswitch_2d
        :pswitch_22
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method
