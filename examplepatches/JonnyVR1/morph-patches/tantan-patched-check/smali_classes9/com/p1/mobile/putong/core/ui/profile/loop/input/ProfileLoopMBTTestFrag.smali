.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMBTTestFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;
.source "SourceFile"


# instance fields
.field public I:Ll/gqa0;

.field public J:Ll/iqa0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public P4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gqa0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/gqa0;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMBTTestFrag;->I:Ll/gqa0;

    .line 10
    .line 11
    new-instance v0, Ll/iqa0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/iqa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMBTTestFrag;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMBTTestFrag;->J:Ll/iqa0;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMBTTestFrag;->I:Ll/gqa0;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMBTTestFrag;->I:Ll/gqa0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ar2;->Z()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMBTTestFrag;->I:Ll/gqa0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gqa0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMBTTestFrag;->J:Ll/iqa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/iqa0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
