.class public final synthetic Lqi3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsi3;


# direct methods
.method public synthetic constructor <init>(Lsi3;B)V
    .registers 3

    iput-byte p2, p0, Lqi3;->a:B

    iput-object p1, p0, Lqi3;->b:Lsi3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lqi3;->a:B

    iget-object p0, p0, Lqi3;->b:Lsi3;

    packed-switch v0, :pswitch_data_f8

    new-instance v0, Lf9d;

    iget-object p0, p0, Lsi3;->h:Lwv1;

    invoke-direct {v0, p0}, Lf9d;-><init>(Lwv1;)V

    return-object v0

    :pswitch_f
    new-instance v0, Lus4;

    iget-object v1, p0, Lsi3;->k:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lekc;

    iget-object p0, p0, Lsi3;->g:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    new-instance v2, Llic;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-direct {v0, v1, p0, v2}, Lus4;-><init>(Lekc;Lcom/opera/android/settings/SettingsManager;Llic;)V

    return-object v0

    :pswitch_2a
    new-instance v3, Lcj3;

    sget-object v4, Lvml;->d:Lumi;

    iget-object v0, p0, Lsi3;->k:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lekc;

    new-instance v1, Lf32;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Lf32;-><init>(B)V

    invoke-static {v0, v1}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object v5

    iget-object v0, p0, Lsi3;->m:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ln9d;

    iget-object v6, v0, Ln9d;->d:Lh42;

    new-instance v7, Lvx;

    const/16 v0, 0xc

    invoke-direct {v7, p0, v0}, Lvx;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lsi3;->r:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v8, p0

    check-cast v8, Lf9d;

    invoke-direct/range {v3 .. v8}, Lcj3;-><init>(Ltcl;Lh42;Lh42;Lvx;Lf9d;)V

    return-object v3

    :pswitch_5f
    new-instance v0, Llj3;

    sget-object v1, Lvml;->d:Lumi;

    iget-object v2, p0, Lsi3;->e:Lii;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt9f;

    iget-object v3, p0, Lsi3;->f:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltm5;

    iget-object p0, p0, Lsi3;->d:Luu1;

    invoke-direct {v0, v1, v2, v3, p0}, Llj3;-><init>(Ltcl;Lt9f;Ltm5;Luu1;)V

    return-object v0

    :pswitch_79
    new-instance v0, Ln9d;

    sget-object v1, Lvml;->d:Lumi;

    iget-object v2, p0, Lsi3;->d:Luu1;

    iget-object v3, p0, Lsi3;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    iget-object p0, p0, Lsi3;->l:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpi3;

    iget-object p0, p0, Lpi3;->e:Loi3;

    invoke-direct {v0, v1, v2, v3, p0}, Ln9d;-><init>(Ltcl;Luu1;Landroid/content/res/AssetManager;Loi3;)V

    return-object v0

    :pswitch_97
    new-instance v0, Lpi3;

    sget-object v1, Lvml;->d:Lumi;

    iget-object v2, p0, Lsi3;->q:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lus4;

    iget-object v2, v2, Lus4;->d:Lwnm;

    iget-object p0, p0, Lsi3;->j:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmi3;

    sget-object v3, Lu55;->Ro:Lulp;

    invoke-direct {v0, v1, v3, v2, p0}, Lpi3;-><init>(Ltcl;Lu55;Lwnm;Lmi3;)V

    return-object v0

    :pswitch_b3
    iget-object p0, p0, Lsi3;->c:Lnv1;

    invoke-virtual {p0}, Lnv1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lno7;

    new-instance v0, Lpo7;

    invoke-direct {v0, p0}, Lpo7;-><init>(Lno7;)V

    return-object v0

    :pswitch_c1
    new-instance v0, Lri3;

    invoke-direct {v0, p0}, Lri3;-><init>(Lsi3;)V

    return-object v0

    :pswitch_c7
    new-instance v0, Lmj3;

    iget-object v1, p0, Lsi3;->l:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpi3;

    iget-object p0, p0, Lsi3;->i:Lwv1;

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/PushedContentHandler;

    invoke-direct {v0, v1, p0}, Lmj3;-><init>(Lpi3;Lcom/opera/android/PushedContentHandler;)V

    return-object v0

    :pswitch_df
    iget-object p0, p0, Lsi3;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-class v0, Lcom/opera/android/browser/blocklist/manifest/db/BlockListDatabase;

    const-string v1, "block_lists"

    invoke-static {p0, v0, v1}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p0

    invoke-virtual {p0}, Lu5i;->b()Ly5i;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/blocklist/manifest/db/BlockListDatabase;

    invoke-virtual {p0}, Lcom/opera/android/browser/blocklist/manifest/db/BlockListDatabase;->x()Lmi3;

    move-result-object p0

    return-object p0

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_df
        :pswitch_c7
        :pswitch_c1
        :pswitch_b3
        :pswitch_97
        :pswitch_79
        :pswitch_5f
        :pswitch_2a
        :pswitch_f
    .end packed-switch
.end method
