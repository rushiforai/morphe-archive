.class public final Lhoc;
.super Lzkc;
.source "SourceFile"


# instance fields
.field public final c:Ly83;

.field public final d:Lokc;

.field public final e:Li16;

.field public final f:Ldpc;

.field public final g:Ligi;

.field public h:Lqmc;


# direct methods
.method public constructor <init>(Ly83;Lokc;Lpkc;Lnoc;Lrlh;Lfwf;)V
    .registers 17

    iget-object v0, p1, Ly83;->g:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lhoc;->c:Ly83;

    iput-object p2, p0, Lhoc;->d:Lokc;

    new-instance v0, Li16;

    iget-object v1, p1, Ly83;->h:Ljava/lang/Object;

    check-cast v1, Lmlc;

    new-instance v2, Lgoc;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lgoc;-><init>(Lhoc;B)V

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lhoc;->e:Li16;

    new-instance v0, Ldpc;

    iget-object v1, p1, Ly83;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;

    new-instance v2, Lci7;

    const/4 v8, 0x0

    const/16 v9, 0x12

    const/4 v3, 0x1

    const-class v5, Lokc;

    const-string v6, "onStarClicked"

    const-string v7, "onStarClicked(Lcom/opera/android/live_score/data/LiveScoreEvent;)V"

    move-object v4, p2

    invoke-direct/range {v2 .. v9}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v0, v1, v2}, Ldpc;-><init>(Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;Lkotlin/jvm/functions/Function1;)V

    iput-object v0, p0, Lhoc;->f:Ldpc;

    new-instance p2, Ligi;

    iget-object v0, p1, Ly83;->e:Ljava/lang/Object;

    check-cast v0, Ly83;

    new-instance v1, Lgoc;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lgoc;-><init>(Lhoc;B)V

    invoke-direct {p2, v0, v1, p3, p4}, Ligi;-><init>(Ly83;Lkotlin/jvm/functions/Function0;Lpkc;Lnoc;)V

    iput-object p2, p0, Lhoc;->g:Ligi;

    iget-object p2, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p3, Lsma;

    const/16 v0, 0xe

    invoke-direct {p3, p0, v0}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Lzt;

    const/16 v0, 0xa

    invoke-direct {p3, p0, v0}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p0, p1, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    move-object/from16 p2, p6

    invoke-virtual {p0, p5, p2}, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->b(Lrlh;Lfwf;)V

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 2

    iget-object p0, p0, Lhoc;->g:Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Ly83;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Ligi;->r0(Ly83;Z)V

    return-void
.end method

.method public final V()V
    .registers 1

    iget-object p0, p0, Lhoc;->g:Ligi;

    invoke-virtual {p0}, Ligi;->a0()V

    return-void
.end method
