.class public final Llf7;
.super Lo93;
.source "SourceFile"


# instance fields
.field public c:Z

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:I

.field public final synthetic f:Lorm;

.field public final synthetic g:Ljc0;

.field public final synthetic h:Lre7;

.field public final synthetic i:Z

.field public final synthetic j:Lrf7;

.field public final synthetic k:Landroid/content/Context;

.field public final synthetic l:Lvwh;

.field public final synthetic m:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILorm;Ljc0;Lre7;ZLrf7;Landroid/content/Context;Lvwh;Lcom/opera/android/BrowserActivity;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llf7;->d:Ljava/lang/String;

    iput p2, p0, Llf7;->e:I

    iput-object p3, p0, Llf7;->f:Lorm;

    iput-object p4, p0, Llf7;->g:Ljc0;

    iput-object p5, p0, Llf7;->h:Lre7;

    iput-boolean p6, p0, Llf7;->i:Z

    iput-object p7, p0, Llf7;->j:Lrf7;

    iput-object p8, p0, Llf7;->k:Landroid/content/Context;

    iput-object p9, p0, Llf7;->l:Lvwh;

    iput-object p10, p0, Llf7;->m:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 12

    iget-object v0, p0, Llf7;->d:Ljava/lang/String;

    const/16 v1, 0x1388

    invoke-static {p1, v0, v1}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p1

    new-instance v0, Lkf7;

    iget-object v2, p0, Llf7;->f:Lorm;

    iget-object v3, p0, Llf7;->g:Ljc0;

    iget-object v4, p0, Llf7;->h:Lre7;

    iget-boolean v5, p0, Llf7;->i:Z

    iget-object v6, p0, Llf7;->j:Lrf7;

    iget-object v7, p0, Llf7;->k:Landroid/content/Context;

    iget-object v8, p0, Llf7;->l:Lvwh;

    iget-object v9, p0, Llf7;->m:Lcom/opera/android/BrowserActivity;

    move-object v1, p0

    invoke-direct/range {v0 .. v9}, Lkf7;-><init>(Llf7;Lorm;Ljc0;Lre7;ZLrf7;Landroid/content/Context;Lvwh;Lcom/opera/android/BrowserActivity;)V

    iget p0, v1, Llf7;->e:I

    invoke-virtual {p1, p0, v0}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public final f(I)V
    .registers 3

    iget-boolean p1, p0, Llf7;->c:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x1

    iput-boolean p1, p0, Llf7;->c:Z

    iget-object p1, p0, Llf7;->h:Lre7;

    invoke-virtual {p1}, Lre7;->c()Lnc0;

    move-result-object p1

    iget-object p0, p0, Llf7;->f:Lorm;

    check-cast p0, Lx5f;

    sget-object v0, Ljc0;->b:Ljc0;

    invoke-virtual {p0, v0, p1}, Lx5f;->M(Ljc0;Lnc0;)V

    return-void
.end method
