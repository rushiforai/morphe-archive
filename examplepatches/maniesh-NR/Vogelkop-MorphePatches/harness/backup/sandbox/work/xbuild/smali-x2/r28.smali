.class public final synthetic Lr28;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls28;


# direct methods
.method public synthetic constructor <init>(Ls28;B)V
    .registers 3

    iput-byte p2, p0, Lr28;->a:B

    iput-object p1, p0, Lr28;->b:Ls28;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lr28;->a:B

    iget-object p0, p0, Lr28;->b:Ls28;

    packed-switch v0, :pswitch_data_88

    invoke-virtual {p0}, Ls28;->e()V

    return-void

    :pswitch_b
    iget-object v0, p0, Ls28;->e:Ljava/lang/Object;

    check-cast v0, Lumi;

    iget-object v1, p0, Ls28;->h:Ljava/lang/Object;

    check-cast v1, Lt28;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/io/File;

    iget-object v1, v1, Lt28;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v3, ".prot.pending.tmp"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    iget-object v3, p0, Ls28;->b:Lb59;

    const/4 v4, 0x0

    const-string v5, "k2"

    if-eqz v1, :cond_6e

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    iget-object v3, p0, Ls28;->f:Ljava/lang/Object;

    check-cast v3, Lt1;

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_59

    const/4 v5, 0x0

    :try_start_3f
    invoke-static {v1, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    invoke-virtual {v3}, Lt1;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc36;

    invoke-virtual {v3, v1}, Lc36;->b([B)[B

    move-result-object v1

    if-eqz v1, :cond_59

    sget-object v3, Lo36;->a:[I

    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string v5, "AES"

    invoke-direct {v3, v1, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V
    :try_end_58
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3f .. :try_end_58} :catch_59

    move-object v4, v3

    :catch_59
    :cond_59
    if-eqz v4, :cond_5f

    invoke-virtual {p0, v2, v4}, Ls28;->c(Ljava/io/File;Ljavax/crypto/spec/SecretKeySpec;)V

    goto :goto_87

    :cond_5f
    new-instance v1, Luk6;

    const/16 v3, 0x17

    invoke-direct {v1, p0, v3}, Luk6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v2}, Lnml;->a(Ljava/lang/Object;)Loml;

    goto :goto_87

    :cond_6e
    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_87

    new-instance v1, Lr28;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lr28;-><init>(Ls28;B)V

    invoke-interface {v0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v4}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_87
    :goto_87
    return-void

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
