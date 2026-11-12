.class public final Ldpc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;

.field public final b:Lkotlin/jvm/functions/Function1;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->f:I

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;Lkotlin/jvm/functions/Function1;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldpc;->a:Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;

    iput-object p2, p0, Ldpc;->b:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final a(Lzmc;ZZ)V
    .registers 7

    sget v0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->f:I

    invoke-interface {p1}, Lzmc;->a()Llmc;

    move-result-object v0

    iget-object v0, v0, Llmc;->f:Lsmc;

    invoke-interface {p1}, Lzmc;->a()Llmc;

    move-result-object v1

    iget-object v1, v1, Llmc;->g:Lomc;

    const/4 v2, 0x1

    if-eqz p3, :cond_38

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    if-eqz p3, :cond_35

    if-eq p3, v2, :cond_23

    const/4 v0, 0x2

    if-ne p3, v0, :cond_1f

    sget-object p3, Lnlc;->c:Lnlc;

    goto :goto_49

    :cond_1f
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_23
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    if-eqz p3, :cond_32

    if-ne p3, v2, :cond_2e

    sget-object p3, Lnlc;->b:Lnlc;

    goto :goto_49

    :cond_2e
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_32
    sget-object p3, Lnlc;->a:Lnlc;

    goto :goto_49

    :cond_35
    sget-object p3, Lnlc;->a:Lnlc;

    goto :goto_49

    :cond_38
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    if-eqz p3, :cond_47

    if-ne p3, v2, :cond_43

    sget-object p3, Lnlc;->b:Lnlc;

    goto :goto_49

    :cond_43
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_47
    sget-object p3, Lnlc;->a:Lnlc;

    :goto_49
    sget-object v0, Lnlc;->c:Lnlc;

    const/4 v1, 0x0

    if-eq p3, v0, :cond_4f

    move v2, v1

    :cond_4f
    if-eqz p2, :cond_53

    move p2, v1

    goto :goto_55

    :cond_53
    const/16 p2, 0x8

    :goto_55
    iget-object v0, p0, Ldpc;->a:Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;

    invoke-virtual {v0, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, p3, v1}, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->a(Lnlc;Z)V

    const/4 p2, 0x0

    if-eqz v2, :cond_62

    move-object p3, p2

    goto :goto_68

    :cond_62
    new-instance p3, Ljkc;

    const/4 v1, 0x7

    invoke-direct {p3, p0, p1, v1}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    :goto_68
    if-eqz p3, :cond_71

    new-instance p2, Lsma;

    const/16 p0, 0x11

    invoke-direct {p2, p3, p0}, Lsma;-><init>(Ljava/lang/Object;B)V

    :cond_71
    invoke-virtual {v0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
