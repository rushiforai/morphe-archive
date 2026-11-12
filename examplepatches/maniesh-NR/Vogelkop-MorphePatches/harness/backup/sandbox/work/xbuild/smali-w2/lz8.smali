.class public final synthetic Llz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lsz8;Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lcx9;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;ZLek2;)V
    .registers 10

    .line 23
    const/4 v0, 0x0

    iput-byte v0, p0, Llz8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llz8;->c:Ljava/lang/Object;

    iput-object p2, p0, Llz8;->d:Ljava/lang/Object;

    iput-object p3, p0, Llz8;->e:Ljava/lang/Object;

    iput-object p4, p0, Llz8;->f:Ljava/lang/Object;

    iput-object p5, p0, Llz8;->g:Ljava/lang/Object;

    iput-object p6, p0, Llz8;->h:Ljava/lang/Object;

    iput-boolean p7, p0, Llz8;->b:Z

    iput-object p8, p0, Llz8;->i:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lue5;Lg1b;Lutm;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Z)V
    .registers 10

    const/4 v0, 0x1

    iput-byte v0, p0, Llz8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Llz8;->c:Ljava/lang/Object;

    iput-object p7, p0, Llz8;->d:Ljava/lang/Object;

    iput-boolean p8, p0, Llz8;->b:Z

    iput-object p3, p0, Llz8;->e:Ljava/lang/Object;

    iput-object p4, p0, Llz8;->f:Ljava/lang/Object;

    iput-object p5, p0, Llz8;->g:Ljava/lang/Object;

    iput-object p6, p0, Llz8;->h:Ljava/lang/Object;

    iput-object p1, p0, Llz8;->i:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Llz8;->a:B

    iget-object v1, p0, Llz8;->i:Ljava/lang/Object;

    iget-object v2, p0, Llz8;->h:Ljava/lang/Object;

    iget-object v3, p0, Llz8;->g:Ljava/lang/Object;

    iget-object v4, p0, Llz8;->f:Ljava/lang/Object;

    iget-object v5, p0, Llz8;->e:Ljava/lang/Object;

    iget-object v6, p0, Llz8;->d:Ljava/lang/Object;

    iget-object v7, p0, Llz8;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_90

    move-object v9, v7

    check-cast v9, Lg1b;

    check-cast v6, Lkotlin/jvm/functions/Function1;

    check-cast v5, Lutm;

    move-object v10, v4

    check-cast v10, Lkotlin/jvm/functions/Function0;

    move-object v11, v3

    check-cast v11, Lkotlin/jvm/functions/Function0;

    move-object v12, v2

    check-cast v12, Lkotlin/jvm/functions/Function0;

    check-cast v1, Lue5;

    check-cast p1, Lh6c;

    new-instance v0, Lx6d;

    const/4 v2, 0x0

    invoke-direct {v0, v5, v2}, Lx6d;-><init>(Lutm;B)V

    new-instance v2, Lue5;

    const v3, 0x35da3e9b

    const/4 v4, 0x1

    invoke-direct {v2, v3, v0, v4}, Lue5;-><init>(ILjava/lang/Object;Z)V

    const-string v0, "balance-bar"

    const/4 v3, 0x2

    invoke-static {p1, v0, v2, v3}, Lh6c;->O(Lh6c;Ljava/lang/String;Lue5;I)V

    if-eqz v9, :cond_51

    new-instance v8, Ll5c;

    const/4 v13, 0x6

    invoke-direct/range {v8 .. v13}, Ll5c;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lue5;

    const v2, -0x453410ca

    invoke-direct {v0, v2, v8, v4}, Lue5;-><init>(ILjava/lang/Object;Z)V

    const-string v2, "nav-buttons"

    invoke-static {p1, v2, v0, v3}, Lh6c;->O(Lh6c;Ljava/lang/String;Lue5;I)V

    :cond_51
    invoke-interface {v6, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean p0, p0, Llz8;->b:Z

    if-eqz p0, :cond_6a

    new-instance p0, Luhf;

    invoke-direct {p0, v1, v3}, Luhf;-><init>(Lue5;B)V

    new-instance v0, Lue5;

    const v1, -0x55d91413

    invoke-direct {v0, v1, p0, v4}, Lue5;-><init>(ILjava/lang/Object;Z)V

    const-string p0, "legal-disclaimer"

    invoke-static {p1, p0, v0, v3}, Lh6c;->O(Lh6c;Ljava/lang/String;Lue5;I)V

    :cond_6a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6d
    move-object v0, v7

    check-cast v0, Lsz8;

    check-cast v6, Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    check-cast v5, Lcx9;

    check-cast v4, Ldx3;

    check-cast v3, Lorg/chromium/content_public/browser/RenderFrameHost;

    check-cast v2, Lorg/chromium/url/Origin;

    move-object v7, v1

    check-cast v7, Lek2;

    move-object v8, p1

    check-cast v8, [B

    iget-boolean p0, p0, Llz8;->b:Z

    move-object v1, v5

    move-object v5, v2

    move-object v2, v1

    move-object v1, v4

    move-object v4, v3

    move-object v3, v1

    move-object v1, v6

    move v6, p0

    invoke-virtual/range {v0 .. v8}, Lsz8;->g(Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lcx9;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;ZLek2;[B)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_6d
    .end packed-switch
.end method
