.class public final synthetic Lg2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lni;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lbuj;Ltn;Landroid/net/Uri;)V
    .registers 4

    const/4 p3, 0x3

    iput-byte p3, p0, Lg2b;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg2b;->b:Ljava/lang/Object;

    iput-object p2, p0, Lg2b;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lg2b;->a:B

    iput-object p1, p0, Lg2b;->b:Ljava/lang/Object;

    iput-object p2, p0, Lg2b;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    iget-byte v2, v0, Lg2b;->a:B

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    iget-object v7, v0, Lg2b;->c:Ljava/lang/Object;

    iget-object v0, v0, Lg2b;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_da

    check-cast v0, Lbuj;

    check-cast v7, Ltn;

    if-nez v1, :cond_1e

    const v1, 0x7f141148

    invoke-virtual {v0, v1}, Lbuj;->a(I)V

    goto :goto_56

    :cond_1e
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v7, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lbuj;

    iget-object v1, v0, Lbuj;->a:Lcom/opera/android/BrowserActivity;

    iget-object v11, v0, Lbuj;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {v1}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_37

    invoke-static {}, Li0l;->g()Z

    move-result v1

    if-nez v1, :cond_37

    move v14, v6

    goto :goto_38

    :cond_37
    move v14, v5

    :goto_38
    new-instance v8, Ljuj;

    iget-object v1, v7, Ltn;->b:Ljava/lang/Object;

    move-object v9, v1

    check-cast v9, Landroid/net/Uri;

    iget-object v1, v7, Ltn;->c:Ljava/lang/Object;

    move-object v10, v1

    check-cast v10, Landroid/net/Uri;

    iget-object v12, v0, Lbuj;->b:Lumi;

    iget-boolean v13, v7, Ltn;->a:Z

    iget-object v15, v0, Lbuj;->e:Lx5f;

    invoke-direct/range {v8 .. v15}, Ljuj;-><init>(Landroid/net/Uri;Landroid/net/Uri;Ldx3;Lumi;ZZLx5f;)V

    const/16 v0, 0x1003

    invoke-static {v8, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    invoke-virtual {v0, v11}, Lzhj;->c(Landroid/content/Context;)V

    :goto_56
    return-void

    :pswitch_57
    check-cast v0, Lcom/opera/android/BrowserActivity;

    check-cast v7, Ly0a;

    invoke-static {v0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_67

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Ly0a;->run(Ljava/lang/Object;)V

    goto :goto_6c

    :cond_67
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Ly0a;->run(Ljava/lang/Object;)V

    :goto_6c
    return-void

    :pswitch_6d
    check-cast v0, Lf3b;

    check-cast v7, Lh3b;

    if-eqz v1, :cond_9d

    if-eqz p2, :cond_9d

    invoke-virtual {v0}, Lf3b;->invoke()Ljava/lang/Object;

    if-ne v1, v4, :cond_7e

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    :cond_7e
    new-instance v0, Li3j;

    iget-object v1, v7, Lh3b;->d:Lysj;

    iget-object v2, v7, Lh3b;->c:Lz77;

    iget-object v4, v7, Lh3b;->e:Lorm;

    iget-object v5, v7, Lh3b;->f:Lskm;

    invoke-direct {v0, v1, v2, v4, v5}, Li3j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz v3, :cond_9a

    new-instance v1, Lcom/opera/android/autofill/PasswordImporter;

    invoke-direct {v1, v0}, Lcom/opera/android/autofill/PasswordImporter;-><init>(Lm4g;)V

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/opera/android/autofill/PasswordImporter;->a(Ljava/lang/String;)V

    goto :goto_9d

    :cond_9a
    invoke-virtual {v0, v6}, Li3j;->a(I)V

    :cond_9d
    :goto_9d
    return-void

    :pswitch_9e
    check-cast v0, Ld2b;

    check-cast v7, Lh2b;

    if-ne v1, v4, :cond_d9

    if-eqz p2, :cond_d9

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_d9

    invoke-virtual {v0}, Ld2b;->invoke()Ljava/lang/Object;

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getFlags()I

    move-result v0

    and-int/2addr v0, v5

    if-eq v0, v5, :cond_bc

    const-string v0, ""

    invoke-virtual {v7, v0}, Lh2b;->f(Ljava/lang/String;)V

    goto :goto_d9

    :cond_bc
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v0, v5}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    sget-object v2, Lvml;->d:Lumi;

    new-instance v4, Lgl6;

    const/16 v5, 0x17

    invoke-direct {v4, v7, v1, v0, v5}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v2, v4}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v3}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_d9
    :goto_d9
    return-void

    :pswitch_data_da
    .packed-switch 0x0
        :pswitch_9e
        :pswitch_6d
        :pswitch_57
    .end packed-switch
.end method
