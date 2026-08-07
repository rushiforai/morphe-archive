.class public Ll/h0q;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkInviteSwitchItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Ll/x20;


# direct methods
.method public constructor <init>(ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/h0q;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/h0q;->b:Ll/x20;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkInviteSwitchItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/h0q;->b:Ll/x20;

    .line 5
    .line 6
    iget-boolean p0, p0, Ll/h0q;->a:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkInviteSwitchItemView;->c(Ll/x20;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/h0q;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->D3:I

    .line 2
    .line 3
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    sget p0, Ll/pv70;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkInviteSwitchItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h0q;->H(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkInviteSwitchItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
