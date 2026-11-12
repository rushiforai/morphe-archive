.class public final synthetic Lkf7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Llf7;

.field public final synthetic b:Lorm;

.field public final synthetic c:Ljc0;

.field public final synthetic d:Lre7;

.field public final synthetic e:Z

.field public final synthetic f:Lrf7;

.field public final synthetic g:Landroid/content/Context;

.field public final synthetic h:Lvwh;

.field public final synthetic i:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Llf7;Lorm;Ljc0;Lre7;ZLrf7;Landroid/content/Context;Lvwh;Lcom/opera/android/BrowserActivity;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkf7;->a:Llf7;

    iput-object p2, p0, Lkf7;->b:Lorm;

    iput-object p3, p0, Lkf7;->c:Ljc0;

    iput-object p4, p0, Lkf7;->d:Lre7;

    iput-boolean p5, p0, Lkf7;->e:Z

    iput-object p6, p0, Lkf7;->f:Lrf7;

    iput-object p7, p0, Lkf7;->g:Landroid/content/Context;

    iput-object p8, p0, Lkf7;->h:Lvwh;

    iput-object p9, p0, Lkf7;->i:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-object p1, p0, Lkf7;->a:Llf7;

    iget-boolean v0, p1, Llf7;->c:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p1, Llf7;->c:Z

    iget-object p1, p0, Lkf7;->d:Lre7;

    invoke-virtual {p1}, Lre7;->c()Lnc0;

    move-result-object v0

    iget-object v1, p0, Lkf7;->b:Lorm;

    check-cast v1, Lx5f;

    iget-object v2, p0, Lkf7;->c:Ljc0;

    invoke-virtual {v1, v2, v0}, Lx5f;->M(Ljc0;Lnc0;)V

    iget-boolean v0, p0, Lkf7;->e:Z

    if-eqz v0, :cond_28

    const/4 v0, 0x0

    iget-object v1, p0, Lkf7;->f:Lrf7;

    iget-object v2, p0, Lkf7;->g:Landroid/content/Context;

    iget-object p0, p0, Lkf7;->h:Lvwh;

    invoke-virtual {v1, p1, v2, p0, v0}, Lrf7;->p(Lre7;Landroid/content/Context;Lvwh;Z)V

    return-void

    :cond_28
    const/16 v0, 0x1003

    iget-object p0, p0, Lkf7;->i:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/BrowserActivity;->u1(Lre7;I)V

    return-void
.end method
