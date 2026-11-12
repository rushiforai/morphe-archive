.class public final Lllj;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:Lrxh;

.field public final synthetic d:S

.field public final synthetic e:Lmlj;

.field public final synthetic f:Lrxh;

.field public final synthetic g:Lkotlin/jvm/functions/Function0;


# direct methods
.method public constructor <init>(Lrxh;ILmlj;Lrxh;Lkotlin/jvm/functions/Function0;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lllj;->c:Lrxh;

    iput-short p2, p0, Lllj;->d:S

    iput-object p3, p0, Lllj;->e:Lmlj;

    iput-object p4, p0, Lllj;->f:Lrxh;

    iput-object p5, p0, Lllj;->g:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 5

    iget-object v0, p0, Lllj;->e:Lmlj;

    iget-object v0, v0, Lmlj;->b:Landroid/view/View;

    iget-object v1, p0, Lllj;->c:Lrxh;

    iget-short v2, p0, Lllj;->d:S

    invoke-static {p1, v1, v2, v0}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object v0

    iget-object v1, p0, Lllj;->f:Lrxh;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {v1, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    new-instance v1, Lxt;

    const/4 v2, 0x1

    iget-object p0, p0, Lllj;->g:Lkotlin/jvm/functions/Function0;

    invoke-direct {v1, p0, v2}, Lxt;-><init>(Lkotlin/jvm/functions/Function0;B)V

    invoke-virtual {v0, p1, v1}, Lgtj;->g(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public final f(I)V
    .registers 3

    iget-object p1, p0, Lllj;->e:Lmlj;

    iget-object v0, p1, Lmlj;->c:Lo93;

    if-ne v0, p0, :cond_9

    const/4 p0, 0x0

    iput-object p0, p1, Lmlj;->c:Lo93;

    :cond_9
    return-void
.end method
