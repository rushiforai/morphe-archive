.class public final Ljy4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Ljy4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/view/View;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte p0, p0, Ljy4;->a:B

    const/4 v0, 0x1

    packed-switch p0, :pswitch_data_86

    move-object p0, p1

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B:Ldmf;

    invoke-virtual {p0}, Lbpd;->D()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "clipboard"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    const-string v2, "token"

    invoke-static {v2, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Copied to clipboard"

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :pswitch_32
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v0, p1}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    if-eqz p1, :cond_4b

    new-instance v2, Lqxh;

    invoke-direct {v2, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_4c

    :cond_4b
    move-object v2, v1

    :goto_4c
    new-instance p1, Lgkj;

    const/4 v3, 0x0

    invoke-direct {p1, v3, v3}, Lnz0;-><init>(ZZ)V

    iput-object v1, p1, Lgkj;->a:Ljava/lang/String;

    iput-object v1, p1, Lgkj;->b:Ljava/lang/String;

    iput-object v1, p1, Lgkj;->c:Ljava/lang/String;

    const-string v4, "Install Referrer"

    iput-object v4, p1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v1, p1, Lgkj;->e:Lekj;

    iput-object v1, p1, Lgkj;->f:Lfkj;

    iput-object v1, p1, Lgkj;->g:Lqp2;

    iput-object v1, p1, Lgkj;->h:Ldkj;

    iput-object v1, p1, Lgkj;->i:Ldkj;

    iput-object v1, p1, Lgkj;->j:Lql;

    iput v3, p1, Lgkj;->k:I

    iput v3, p1, Lgkj;->l:I

    iput v3, p1, Lgkj;->m:I

    iput-boolean v0, p1, Lgkj;->n:Z

    iput-object v2, p1, Lgkj;->o:Lpxh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :pswitch_7a
    return-void

    :pswitch_7b
    const p0, 0x7f0a0202

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    return-void

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_7b
        :pswitch_7a
        :pswitch_32
    .end packed-switch
.end method
