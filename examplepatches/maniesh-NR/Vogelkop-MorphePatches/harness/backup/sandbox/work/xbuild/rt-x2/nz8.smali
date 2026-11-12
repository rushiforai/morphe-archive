.class public final synthetic Lnz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsz8;

.field public final synthetic c:Lek2;

.field public final synthetic d:Ldx3;

.field public final synthetic e:Lorg/chromium/url/Origin;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Luik;


# direct methods
.method public synthetic constructor <init>(Lsz8;Lek2;Lb9h;Ldx3;Lorg/chromium/url/Origin;Lcx9;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lnz8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnz8;->b:Lsz8;

    iput-object p2, p0, Lnz8;->c:Lek2;

    iput-object p3, p0, Lnz8;->f:Ljava/lang/Object;

    iput-object p4, p0, Lnz8;->d:Ldx3;

    iput-object p5, p0, Lnz8;->e:Lorg/chromium/url/Origin;

    iput-object p6, p0, Lnz8;->g:Luik;

    return-void
.end method

.method public synthetic constructor <init>(Lsz8;Lek2;Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lx8h;Ldx3;Lorg/chromium/url/Origin;)V
    .registers 8

    .line 19
    const/4 v0, 0x0

    iput-byte v0, p0, Lnz8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnz8;->b:Lsz8;

    iput-object p2, p0, Lnz8;->c:Lek2;

    iput-object p3, p0, Lnz8;->f:Ljava/lang/Object;

    iput-object p4, p0, Lnz8;->g:Luik;

    iput-object p5, p0, Lnz8;->d:Ldx3;

    iput-object p6, p0, Lnz8;->e:Lorg/chromium/url/Origin;

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 21

    move-object/from16 v0, p0

    iget-byte v1, v0, Lnz8;->a:B

    const/16 v2, 0x20

    iget-object v3, v0, Lnz8;->g:Luik;

    iget-object v4, v0, Lnz8;->f:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_b6

    move-object v6, v4

    check-cast v6, Lb9h;

    check-cast v3, Lcx9;

    move-object/from16 v1, p1

    check-cast v1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;

    iget v4, v1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;->b:I

    iget-object v11, v0, Lnz8;->c:Lek2;

    if-eqz v4, :cond_20

    invoke-virtual {v11, v4}, Lek2;->s(I)V

    goto :goto_59

    :cond_20
    iget-boolean v1, v1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;->a:Z

    iget v10, v3, Lcx9;->b:I

    iget-object v3, v0, Lnz8;->d:Ldx3;

    invoke-virtual {v3}, Ldx3;->R()Ltz8;

    move-result-object v4

    invoke-virtual {v4}, Ltz8;->R()Landroid/credentials/CredentialManager;

    move-result-object v4

    if-nez v4, :cond_34

    invoke-virtual {v11, v2}, Lek2;->s(I)V

    goto :goto_59

    :cond_34
    iget-object v2, v0, Lnz8;->e:Lorg/chromium/url/Origin;

    invoke-static {v2}, Lsz8;->f(Lorg/chromium/url/Origin;)Ljava/lang/String;

    move-result-object v14

    iget-object v15, v6, Lb9h;->b:[B

    iget-object v5, v6, Lb9h;->d:Ljava/lang/String;

    iget-object v12, v0, Lnz8;->b:Lsz8;

    const/4 v13, 0x1

    move/from16 v16, v1

    move-object/from16 v18, v2

    move-object/from16 v17, v5

    invoke-virtual/range {v12 .. v18}, Lsz8;->a(ILjava/lang/String;[BZLjava/lang/String;Lorg/chromium/url/Origin;)[B

    move-result-object v9

    new-instance v5, La16;

    invoke-direct {v5, v3, v4}, La16;-><init>(Ldx3;Landroid/credentials/CredentialManager;)V

    invoke-static/range {v18 .. v18}, Lsz8;->f(Lorg/chromium/url/Origin;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v12, Lsz8;->e:[B

    invoke-virtual/range {v5 .. v11}, La16;->b(Lb9h;Ljava/lang/String;[B[BILek2;)V

    :goto_59
    return-void

    :pswitch_5a
    check-cast v4, Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    check-cast v3, Lx8h;

    move-object/from16 v1, p1

    check-cast v1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;

    iget v5, v1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;->b:I

    iget-object v10, v0, Lnz8;->c:Lek2;

    if-eqz v5, :cond_6c

    invoke-virtual {v10, v5}, Lek2;->s(I)V

    goto :goto_b5

    :cond_6c
    iget-boolean v15, v1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;->a:Z

    iget-boolean v1, v3, Lx8h;->q:Z

    iget-object v5, v0, Lnz8;->e:Lorg/chromium/url/Origin;

    invoke-static {v5}, Lsz8;->f(Lorg/chromium/url/Origin;)Ljava/lang/String;

    move-result-object v13

    iget-object v14, v3, Lx8h;->d:[B

    iget-object v6, v3, Lx8h;->b:Lc9h;

    iget-object v6, v6, Lc9h;->b:Ljava/lang/String;

    iget-object v7, v0, Lnz8;->b:Lsz8;

    const/4 v12, 0x0

    move-object/from16 v17, v5

    move-object/from16 v16, v6

    move-object v11, v7

    invoke-virtual/range {v11 .. v17}, Lsz8;->a(ILjava/lang/String;[BZLjava/lang/String;Lorg/chromium/url/Origin;)[B

    move-result-object v5

    move-object/from16 v6, v17

    :try_start_8a
    invoke-static {v6, v5, v3}, Lsz8;->c(Lorg/chromium/url/Origin;[BLx8h;)Lcom/google/android/gms/fido/fido2/api/common/BrowserPublicKeyCredentialCreationOptions;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;->getRegisterPendingIntent(Lcom/google/android/gms/fido/fido2/api/common/BrowserPublicKeyCredentialCreationOptions;)Lcom/google/android/gms/tasks/Task;

    move-result-object v2
    :try_end_92
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8a .. :try_end_92} :catch_b2

    sget-object v3, Lmdb;->b:Ljava/util/Random;

    invoke-virtual {v3}, Ljava/util/Random;->nextInt()I

    move-result v3

    const v4, 0xffff

    and-int v9, v3, v4

    new-instance v6, Lqz8;

    iget-object v8, v0, Lnz8;->d:Ldx3;

    move v11, v1

    invoke-direct/range {v6 .. v11}, Lqz8;-><init>(Lsz8;Ldx3;ILek2;Z)V

    invoke-virtual {v2, v6}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    new-instance v0, Lbk2;

    const/4 v1, 0x5

    invoke-direct {v0, v10, v1}, Lbk2;-><init>(Lek2;B)V

    invoke-virtual {v2, v0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    goto :goto_b5

    :catch_b2
    invoke-virtual {v10, v2}, Lek2;->s(I)V

    :goto_b5
    return-void

    :pswitch_data_b6
    .packed-switch 0x0
        :pswitch_5a
    .end packed-switch
.end method
