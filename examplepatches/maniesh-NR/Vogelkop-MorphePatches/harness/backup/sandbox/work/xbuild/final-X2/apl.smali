.class public final Lapl;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

.field public final c:Ly53;

.field public d:Lwol;

.field public final e:Lj7d;

.field public final f:Lg9l;

.field public g:Lekc;

.field public final h:Lkze;


# direct methods
.method public constructor <init>(Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;Ly53;)V
    .registers 4

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lapl;->b:Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    iput-object p2, p0, Lapl;->c:Ly53;

    new-instance p2, Lj7d;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lj7d;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lapl;->e:Lj7d;

    new-instance p2, Lg9l;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Lg9l;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lapl;->f:Lg9l;

    new-instance p2, Lz61;

    invoke-direct {p2, p1}, Lz61;-><init>(Landroid/view/View;)V

    iget-object p2, p2, Lz61;->b:Ljava/lang/Object;

    check-cast p2, Lkze;

    iput-object p2, p0, Lapl;->h:Lkze;

    new-instance p2, Lh4i;

    const/16 v0, 0x17

    invoke-direct {p2, p0, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 5

    iget-object v0, p0, Lapl;->d:Lwol;

    const/4 v1, 0x0

    if-eqz v0, :cond_1e

    iget-object v2, p0, Lapl;->c:Ly53;

    invoke-virtual {v2, v0}, Ly53;->S(Lwol;)Lp1f;

    move-result-object v0

    if-eqz v0, :cond_1c

    iget-object v2, p0, Lapl;->e:Lj7d;

    iget-object v3, v0, Lp1f;->a:Li7f;

    invoke-virtual {v3, v2}, Li7f;->c(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    iget-object v0, v0, Lp1f;->c:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_1c
    iput-object v1, p0, Lapl;->d:Lwol;

    :cond_1e
    iget-object v0, p0, Lapl;->g:Lekc;

    if-eqz v0, :cond_27

    iget-object v2, p0, Lapl;->f:Lg9l;

    invoke-virtual {v0, v2}, Lekc;->p(Lf7f;)V

    :cond_27
    iput-object v1, p0, Lapl;->g:Lekc;

    iget-object p0, p0, Lapl;->b:Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    iget-boolean v0, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->f:Z

    if-nez v0, :cond_30

    return-void

    :cond_30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->f:Z

    invoke-virtual {p0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b()V

    return-void
.end method
