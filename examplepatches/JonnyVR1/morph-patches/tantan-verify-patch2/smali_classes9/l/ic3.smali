.class public abstract Ll/ic3;
.super Ll/d3q;
.source "SourceFile"

# interfaces
.implements Ll/ztf0;
.implements Ll/mqk;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ll/d3q<",
        "TV;>;",
        "Ll/ztf0;",
        "Ll/mqk;"
    }
.end annotation


# instance fields
.field public a:Ll/qct;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qct<",
            "Ll/oo2;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

.field public c:Z

.field public d:I

.field public e:Ljava/lang/String;

.field public final f:Ljava/lang/CharSequence;

.field public g:I

.field public h:I

.field public i:Ljava/lang/String;

.field public j:Z

.field public k:I


# direct methods
.method public constructor <init>(ILjava/lang/CharSequence;IILjava/lang/String;)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/ic3;->c:Z

    .line 6
    .line 7
    iput p1, p0, Ll/ic3;->d:I

    .line 8
    .line 9
    iput-object p2, p0, Ll/ic3;->f:Ljava/lang/CharSequence;

    .line 10
    .line 11
    iput p3, p0, Ll/ic3;->g:I

    .line 12
    .line 13
    iput p4, p0, Ll/ic3;->h:I

    .line 14
    .line 15
    iput-object p5, p0, Ll/ic3;->i:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/CharSequence;IILjava/lang/String;)V
    .locals 1

    .line 18
    invoke-direct {p0}, Ll/d3q;-><init>()V

    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Ll/ic3;->c:Z

    .line 20
    iput-object p1, p0, Ll/ic3;->e:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Ll/ic3;->f:Ljava/lang/CharSequence;

    .line 22
    iput p3, p0, Ll/ic3;->g:I

    .line 23
    iput p4, p0, Ll/ic3;->h:I

    .line 24
    iput-object p5, p0, Ll/ic3;->i:Ljava/lang/String;

    return-void
.end method

.method public static synthetic H(Ll/ic3;Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ic3;->J(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Landroid/view/View$OnClickListener;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/hc3;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/hc3;-><init>(Ll/ic3;Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/d3q;->onItemClick:Landroid/view/View$OnClickListener;

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public I()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ic3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic J(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ic3;->a:Ll/qct;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->markButtonClicked()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Ll/ic3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ic3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    return-void
.end method

.method public L(Ll/qct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ic3;->a:Ll/qct;

    .line 2
    .line 3
    return-void
.end method

.method public N(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ic3;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public X1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ic3;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getOrder()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ic3;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public isFirst()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ic3;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public r1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ic3;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Ll/ic3;->c:Z

    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ic3;->j:Z

    .line 2
    .line 3
    return-void
.end method
