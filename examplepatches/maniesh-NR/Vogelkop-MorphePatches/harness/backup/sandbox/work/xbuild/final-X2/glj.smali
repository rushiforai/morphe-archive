.class public final Lglj;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Lgsj;


# direct methods
.method public constructor <init>(II)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lglj;->c:B

    .line 25
    new-instance v0, Lrxh;

    invoke-direct {v0, p1}, Lrxh;-><init>(I)V

    .line 26
    invoke-direct {p0, v0, p2}, Lglj;-><init>(Lpxh;I)V

    return-void
.end method

.method public constructor <init>(Lpxh;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lglj;->c:B

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lgsj;

    const/4 v1, 0x0

    const/16 v2, 0x1c

    const/16 v3, 0x9c4

    invoke-direct {v0, p1, v3, v1, v2}, Lgsj;-><init>(Lpxh;ILbsj;I)V

    iput-object v0, p0, Lglj;->d:Lgsj;

    return-void
.end method

.method public constructor <init>(Lpxh;I)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lglj;->c:B

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lgsj;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lgsj;-><init>(Lpxh;ILbsj;)V

    iput-object v0, p0, Lglj;->d:Lgsj;

    return-void
.end method

.method public constructor <init>(Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lglj;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lgsj;

    new-instance v1, Lbsj;

    invoke-direct {v1, p3, p4}, Lbsj;-><init>(Lrxh;Lkotlin/jvm/functions/Function0;)V

    const/16 p3, 0x18

    invoke-direct {v0, p1, p2, v1, p3}, Lgsj;-><init>(Lpxh;ILbsj;I)V

    iput-object v0, p0, Lglj;->d:Lgsj;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 5

    invoke-virtual {p0}, Lglj;->g()Lgsj;

    move-result-object p0

    iget-object v0, p0, Lgsj;->a:Lpxh;

    iget-short v1, p0, Lgsj;->b:S

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object v0

    iget-object p0, p0, Lgsj;->c:Lbsj;

    if-eqz p0, :cond_25

    iget-object v1, p0, Lbsj;->a:Lrxh;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {v1, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    new-instance v1, Lh4i;

    const/16 v2, 0xa

    invoke-direct {v1, p0, v2}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, v1}, Lgtj;->g(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V

    :cond_25
    return-object v0
.end method

.method public final g()Lgsj;
    .registers 2

    iget-byte v0, p0, Lglj;->c:B

    iget-object p0, p0, Lglj;->d:Lgsj;

    return-object p0
.end method
