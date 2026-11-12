.class public final Lklj;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:Lrxh;

.field public final synthetic d:S

.field public final synthetic e:Lmlj;


# direct methods
.method public constructor <init>(Lrxh;ILmlj;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lklj;->c:Lrxh;

    iput-short p2, p0, Lklj;->d:S

    iput-object p3, p0, Lklj;->e:Lmlj;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 4

    iget-object v0, p0, Lklj;->e:Lmlj;

    iget-object v0, v0, Lmlj;->b:Landroid/view/View;

    iget-object v1, p0, Lklj;->c:Lrxh;

    iget-short p0, p0, Lklj;->d:S

    invoke-static {p1, v1, p0, v0}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object p0

    return-object p0
.end method

.method public final f(I)V
    .registers 3

    iget-object p1, p0, Lklj;->e:Lmlj;

    iget-object v0, p1, Lmlj;->c:Lo93;

    if-ne v0, p0, :cond_9

    const/4 p0, 0x0

    iput-object p0, p1, Lmlj;->c:Lo93;

    :cond_9
    return-void
.end method
