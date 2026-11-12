.class public final Let7;
.super La7f;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Lcom/opera/hype/image/editor/EditImage;


# direct methods
.method public constructor <init>(Lbt7;Lcom/opera/hype/image/editor/EditImage;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Let7;->c:B

    iput-object p2, p0, Let7;->d:Lcom/opera/hype/image/editor/EditImage;

    .line 10
    invoke-direct {p0, p1}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/hype/image/editor/EditImage;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Let7;->c:B

    iput-object p1, p0, Let7;->d:Lcom/opera/hype/image/editor/EditImage;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Let7;->c:B

    const/4 v1, 0x1

    iget-object p0, p0, Let7;->d:Lcom/opera/hype/image/editor/EditImage;

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_b0

    check-cast p2, Lbt7;

    check-cast p1, Lbt7;

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_82

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    if-eqz p0, :cond_82

    iget-object p1, p0, Lbfl;->b:Lba3;

    iget-object p0, p0, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/TextBoxEditText;->t()Landroid/text/Editable;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object v0, p1, Lba3;->e:Laa3;

    sget-object v3, Lba3;->j:[Lxtb;

    aget-object v3, v3, v2

    invoke-virtual {v0, v3, p0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    instance-of p0, p1, Loel;

    if-eqz p0, :cond_82

    check-cast p1, Loel;

    iget p0, p2, Lbt7;->a:I

    iget-object v0, p1, Loel;->m:Lmel;

    sget-object v3, Loel;->t:[Lxtb;

    aget-object v2, v3, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-boolean p0, p2, Lbt7;->b:Z

    iget-object v0, p1, Loel;->n:Lmel;

    aget-object v1, v3, v1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget p0, p2, Lbt7;->c:I

    iget-object v0, p1, Loel;->o:Lmel;

    const/4 v1, 0x2

    aget-object v1, v3, v1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-object p0, p2, Lbt7;->d:Lnil;

    iget-object v0, p1, Loel;->p:Lmel;

    const/4 v1, 0x3

    aget-object v1, v3, v1

    invoke-virtual {v0, v1, p0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-boolean p0, p2, Lbt7;->e:Z

    iget-object v0, p1, Loel;->q:Lmel;

    const/4 v1, 0x4

    aget-object v1, v3, v1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget p0, p2, Lbt7;->f:I

    iget-object p1, p1, Loel;->r:Lmel;

    const/4 p2, 0x5

    aget-object p2, v3, p2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    :cond_82
    return-void

    :pswitch_83
    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->l:Lrdb;

    check-cast p2, Lht7;

    check-cast p1, Lht7;

    if-eq p1, p2, :cond_ae

    if-eqz p1, :cond_a2

    iget-object p1, p1, Lht7;->a:Lbfl;

    iget-object v0, p1, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    iget-object p1, p1, Lbfl;->b:Lba3;

    iget-object p1, p1, Lfya;->a:Leya;

    sget-object v3, Leya;->d:Leya;

    if-ne p1, v3, :cond_9b

    move p1, v1

    goto :goto_9c

    :cond_9b
    move p1, v2

    :goto_9c
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0, v2}, Lrdb;->a(Z)V

    :cond_a2
    if-eqz p2, :cond_ae

    iget-object p1, p2, Lht7;->a:Lbfl;

    iget-object p1, p1, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0, v1}, Lrdb;->a(Z)V

    :cond_ae
    return-void

    nop

    :pswitch_data_b0
    .packed-switch 0x0
        :pswitch_83
    .end packed-switch
.end method
