.class public final synthetic Liz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:Lsz8;

.field public final synthetic b:Lek2;

.field public final synthetic c:Lx8h;

.field public final synthetic d:Ldx3;

.field public final synthetic e:Lorg/chromium/url/Origin;


# direct methods
.method public synthetic constructor <init>(Lsz8;Lek2;Lx8h;Ldx3;Lorg/chromium/url/Origin;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liz8;->a:Lsz8;

    iput-object p2, p0, Liz8;->b:Lek2;

    iput-object p3, p0, Liz8;->c:Lx8h;

    iput-object p4, p0, Liz8;->d:Ldx3;

    iput-object p5, p0, Liz8;->e:Lorg/chromium/url/Origin;

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;

    iget v2, v1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;->b:I

    iget-object v9, v0, Liz8;->b:Lek2;

    if-eqz v2, :cond_10

    invoke-virtual {v9, v2}, Lek2;->s(I)V

    return-void

    :cond_10
    iget-boolean v14, v1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;->a:Z

    iget-object v4, v0, Liz8;->c:Lx8h;

    iget-boolean v8, v4, Lx8h;->q:Z

    iget-object v1, v0, Liz8;->d:Ldx3;

    invoke-virtual {v1}, Ldx3;->R()Ltz8;

    move-result-object v2

    invoke-virtual {v2}, Ltz8;->R()Landroid/credentials/CredentialManager;

    move-result-object v2

    if-nez v2, :cond_28

    const/16 v0, 0x20

    invoke-virtual {v9, v0}, Lek2;->s(I)V

    return-void

    :cond_28
    iget-object v3, v0, Liz8;->e:Lorg/chromium/url/Origin;

    invoke-static {v3}, Lsz8;->f(Lorg/chromium/url/Origin;)Ljava/lang/String;

    move-result-object v12

    iget-object v13, v4, Lx8h;->d:[B

    iget-object v5, v4, Lx8h;->b:Lc9h;

    iget-object v15, v5, Lc9h;->b:Ljava/lang/String;

    iget-object v10, v0, Liz8;->a:Lsz8;

    const/4 v11, 0x0

    move-object/from16 v16, v3

    invoke-virtual/range {v10 .. v16}, Lsz8;->a(ILjava/lang/String;[BZLjava/lang/String;Lorg/chromium/url/Origin;)[B

    move-result-object v7

    new-instance v3, La16;

    invoke-direct {v3, v1, v2}, La16;-><init>(Ldx3;Landroid/credentials/CredentialManager;)V

    invoke-static/range {v16 .. v16}, Lsz8;->f(Lorg/chromium/url/Origin;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v10, Lsz8;->e:[B

    invoke-virtual/range {v3 .. v9}, La16;->c(Lx8h;Ljava/lang/String;[B[BZLek2;)V

    return-void
.end method
