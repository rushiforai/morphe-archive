.class public final Lznc;
.super Lzkc;
.source "SourceFile"


# instance fields
.field public final c:Ly83;

.field public final d:Lokc;

.field public final e:Lulp;

.field public final f:Li16;

.field public final g:Ligi;

.field public h:Lnmc;


# direct methods
.method public constructor <init>(Ly83;Lokc;Lpkc;Lnoc;Lrlh;Lfwf;)V
    .registers 10

    iget-object v0, p1, Ly83;->g:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lznc;->c:Ly83;

    iput-object p2, p0, Lznc;->d:Lokc;

    sget-object p2, Lu55;->Ro:Lulp;

    iput-object p2, p0, Lznc;->e:Lulp;

    new-instance p2, Li16;

    iget-object v0, p1, Ly83;->h:Ljava/lang/Object;

    check-cast v0, Lmlc;

    new-instance v1, Lync;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lync;-><init>(Lznc;B)V

    const/4 v2, 0x2

    invoke-direct {p2, v0, v1, v2}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lznc;->f:Li16;

    new-instance p2, Ligi;

    iget-object v0, p1, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Ly83;

    new-instance v1, Lync;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lync;-><init>(Lznc;B)V

    invoke-direct {p2, v0, v1, p3, p4}, Ligi;-><init>(Ly83;Lkotlin/jvm/functions/Function0;Lpkc;Lnoc;)V

    iput-object p2, p0, Lznc;->g:Ligi;

    iget-object p2, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p3, Lsma;

    const/16 p4, 0xc

    invoke-direct {p3, p0, p4}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Lzt;

    const/16 p4, 0x8

    invoke-direct {p3, p0, p4}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p0, p1, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    invoke-virtual {p0, p5, p6}, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->b(Lrlh;Lfwf;)V

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 2

    iget-object p0, p0, Lznc;->g:Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Ly83;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Ligi;->r0(Ly83;Z)V

    return-void
.end method

.method public final V()V
    .registers 1

    iget-object p0, p0, Lznc;->g:Ligi;

    invoke-virtual {p0}, Ligi;->a0()V

    return-void
.end method
