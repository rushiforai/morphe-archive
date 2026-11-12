.class public final Lzoc;
.super Lzkc;
.source "SourceFile"


# instance fields
.field public final c:Lmlc;

.field public final d:Lokc;

.field public final e:Lulp;

.field public final f:Ljava/text/SimpleDateFormat;

.field public final g:Li16;

.field public final h:Ldpc;

.field public final i:Ligi;

.field public j:Lwmc;


# direct methods
.method public constructor <init>(Lmlc;Lokc;Lpkc;Lnoc;Lrlh;Lfwf;)V
    .registers 17

    iget-object v0, p1, Lmlc;->f:Landroid/view/View;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lzoc;->c:Lmlc;

    iput-object p2, p0, Lzoc;->d:Lokc;

    sget-object v0, Lu55;->Ro:Lulp;

    iput-object v0, p0, Lzoc;->e:Lulp;

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "HH:mm"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lzoc;->f:Ljava/text/SimpleDateFormat;

    new-instance v0, Li16;

    iget-object v1, p1, Lmlc;->j:Ljava/lang/Object;

    check-cast v1, Lmlc;

    new-instance v2, Lyoc;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lyoc;-><init>(Lzoc;B)V

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lzoc;->g:Li16;

    new-instance v0, Ldpc;

    iget-object v1, p1, Lmlc;->i:Landroid/view/View;

    check-cast v1, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;

    new-instance v2, Lci7;

    const/4 v8, 0x0

    const/16 v9, 0x17

    const/4 v3, 0x1

    const-class v5, Lokc;

    const-string v6, "onStarClicked"

    const-string v7, "onStarClicked(Lcom/opera/android/live_score/data/LiveScoreEvent;)V"

    move-object v4, p2

    invoke-direct/range {v2 .. v9}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v0, v1, v2}, Ldpc;-><init>(Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;Lkotlin/jvm/functions/Function1;)V

    iput-object v0, p0, Lzoc;->h:Ldpc;

    new-instance p2, Ligi;

    iget-object v0, p1, Lmlc;->h:Ljava/lang/Object;

    check-cast v0, Ly83;

    new-instance v1, Lyoc;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lyoc;-><init>(Lzoc;B)V

    invoke-direct {p2, v0, v1, p3, p4}, Ligi;-><init>(Ly83;Lkotlin/jvm/functions/Function0;Lpkc;Lnoc;)V

    iput-object p2, p0, Lzoc;->i:Ligi;

    iget-object p2, p1, Lmlc;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p3, Lsma;

    const/16 v0, 0x10

    invoke-direct {p3, p0, v0}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Lzt;

    const/16 v0, 0xb

    invoke-direct {p3, p0, v0}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p0, p1, Lmlc;->g:Landroid/view/View;

    check-cast p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    move-object/from16 p2, p6

    invoke-virtual {p0, p5, p2}, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->b(Lrlh;Lfwf;)V

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 2

    iget-object p0, p0, Lzoc;->i:Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Ly83;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Ligi;->r0(Ly83;Z)V

    return-void
.end method

.method public final V()V
    .registers 1

    iget-object p0, p0, Lzoc;->i:Ligi;

    invoke-virtual {p0}, Ligi;->a0()V

    return-void
.end method
