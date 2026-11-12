.class public final synthetic Lfs2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lbf9;Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;Lumi;Lj4c;Lt1;)V
    .registers 8

    const/4 p4, 0x2

    iput-byte p4, p0, Lfs2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfs2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lfs2;->c:Ljava/lang/Object;

    iput-object p3, p0, Lfs2;->d:Ljava/lang/Object;

    iput-object p5, p0, Lfs2;->e:Ljava/lang/Object;

    iput-object p6, p0, Lfs2;->f:Ljava/lang/Object;

    iput-object p7, p0, Lfs2;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 8

    .line 19
    iput-byte p7, p0, Lfs2;->a:B

    iput-object p1, p0, Lfs2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lfs2;->c:Ljava/lang/Object;

    iput-object p3, p0, Lfs2;->d:Ljava/lang/Object;

    iput-object p4, p0, Lfs2;->e:Ljava/lang/Object;

    iput-object p5, p0, Lfs2;->f:Ljava/lang/Object;

    iput-object p6, p0, Lfs2;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 15

    iget-byte v0, p0, Lfs2;->a:B

    iget-object v1, p0, Lfs2;->g:Ljava/lang/Object;

    iget-object v2, p0, Lfs2;->f:Ljava/lang/Object;

    iget-object v3, p0, Lfs2;->e:Ljava/lang/Object;

    iget-object v4, p0, Lfs2;->d:Ljava/lang/Object;

    iget-object v5, p0, Lfs2;->c:Ljava/lang/Object;

    iget-object p0, p0, Lfs2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6a

    move-object v7, p0

    check-cast v7, Lbf9;

    move-object v8, v5

    check-cast v8, Ldb;

    move-object v9, v4

    check-cast v9, Lzwk;

    move-object v10, v3

    check-cast v10, Lumi;

    move-object v11, v2

    check-cast v11, Lj4c;

    move-object v12, v1

    check-cast v12, Lt1;

    new-instance v6, Lmyk;

    invoke-direct/range {v6 .. v12}, Lmyk;-><init>(Lbf9;Ldb;Lzwk;Lumi;Lj4c;Lt1;)V

    invoke-virtual {v7, v6}, Lbf9;->a(Lvwl;)V

    return-void

    :pswitch_2c
    move-object v0, p0

    check-cast v0, Lwjh;

    check-cast v5, Lzd4;

    check-cast v4, Lzd4;

    check-cast v3, Lntk;

    check-cast v2, Lntk;

    check-cast v1, Ljava/util/Map$Entry;

    move-object v13, v5

    move-object v5, v1

    move-object v1, v13

    move-object v13, v4

    move-object v4, v2

    move-object v2, v13

    invoke-virtual/range {v0 .. v5}, Lwjh;->g(Lzd4;Lzd4;Lntk;Lntk;Ljava/util/Map$Entry;)V

    return-void

    :pswitch_43
    move-object v7, p0

    check-cast v7, Lorm;

    move-object v8, v5

    check-cast v8, Lwh2;

    move-object v9, v4

    check-cast v9, Lcom/opera/android/autofill/AutofillManager;

    move-object v10, v3

    check-cast v10, Lgw;

    move-object v11, v2

    check-cast v11, Lcom/opera/android/autofill/CreditCard;

    check-cast v1, Lva2;

    new-instance v6, Lgs2;

    invoke-direct/range {v6 .. v11}, Lgs2;-><init>(Lorm;Lwh2;Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/CreditCard;)V

    iget-object p0, v1, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lot2;

    const/16 v0, 0x1003

    invoke-static {v6, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    iget-object p0, p0, Lot2;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_43
        :pswitch_2c
    .end packed-switch
.end method
