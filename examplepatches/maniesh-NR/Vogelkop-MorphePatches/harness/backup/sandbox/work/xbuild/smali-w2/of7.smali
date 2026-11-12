.class public final synthetic Lof7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrf7;


# direct methods
.method public synthetic constructor <init>(Lrf7;B)V
    .registers 3

    iput-byte p2, p0, Lof7;->a:B

    iput-object p1, p0, Lof7;->b:Lrf7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 11

    iget-byte v0, p0, Lof7;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lof7;->b:Lrf7;

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_ae

    iget-object v0, p0, Lrf7;->g:Lnrl;

    invoke-virtual {v0}, Lnrl;->K()V

    new-instance v0, Ljava/util/ArrayList;

    iget-object p0, p0, Lrf7;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_1d
    if-ge v1, v3, :cond_32

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    check-cast v4, Lre7;

    invoke-virtual {v4}, Lre7;->g()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4}, Lre7;->r()V

    goto :goto_1d

    :cond_32
    sget-object p0, Lvml;->d:Lumi;

    new-instance v1, Lbw6;

    invoke-direct {v1, v0, v2}, Lbw6;-><init>(Ljava/util/ArrayList;B)V

    invoke-interface {p0, v1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :pswitch_42
    iput-boolean v1, p0, Lrf7;->k:Z

    iget-object v0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, -0x1

    move v5, v1

    move v6, v5

    move v7, v4

    :goto_4e
    if-ge v6, v3, :cond_6a

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v6, v6, 0x1

    check-cast v8, Lre7;

    invoke-virtual {v8}, Lre7;->j()Z

    move-result v9

    if-eqz v9, :cond_61

    add-int/lit8 v1, v1, 0x1

    goto :goto_68

    :cond_61
    invoke-virtual {v8}, Lre7;->n()Z

    move-result v8

    if-eqz v8, :cond_68

    move v7, v5

    :cond_68
    :goto_68
    add-int/2addr v5, v2

    goto :goto_4e

    :cond_6a
    if-ltz v7, :cond_ad

    iget-object p0, p0, Lrf7;->i:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string v3, "concurrent_downloads"

    invoke-virtual {p0, v3}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    if-gtz p0, :cond_80

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    :cond_80
    sub-int/2addr p0, v1

    if-lt p0, v2, :cond_ad

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lre7;

    invoke-virtual {v1}, Lre7;->u()V

    add-int/2addr p0, v4

    if-lez p0, :cond_ad

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    :cond_93
    :goto_93
    if-lez p0, :cond_ad

    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v1

    if-eqz v1, :cond_ad

    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lre7;

    invoke-virtual {v1}, Lre7;->n()Z

    move-result v2

    if-eqz v2, :cond_93

    invoke-virtual {v1}, Lre7;->u()V

    add-int/lit8 p0, p0, -0x1

    goto :goto_93

    :cond_ad
    return-void

    :pswitch_data_ae
    .packed-switch 0x0
        :pswitch_42
    .end packed-switch
.end method
