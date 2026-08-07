.class public Ll/ief;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public v:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/ief;->v:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic S(Ll/ief;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ief;->V(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic T(Ll/ief;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ief;->U(Landroid/view/View;)V

    return-void
.end method

.method private synthetic U(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ief;->v:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Wk:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final synthetic V(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ief;->v:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Wk:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6211\u7684\u8d26\u53f7"

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ief;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 5
    .line 6
    const-string v0, "\u63a2\u63a2ID"

    .line 7
    .line 8
    sget v1, Ll/dbc0;->zt:I

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ief;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 14
    .line 15
    sget p1, Ll/dbc0;->dt:I

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->setRightIconRes(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ief;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 11
    .line 12
    return-object v0
.end method

.method public z()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ll/t3m;->F1(Z)Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Ll/ief;->v:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Ll/ief;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ief;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 21
    .line 22
    new-instance v1, Ll/gef;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/gef;-><init>(Ll/ief;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ief;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 31
    .line 32
    new-instance v1, Ll/hef;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/hef;-><init>(Ll/ief;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
