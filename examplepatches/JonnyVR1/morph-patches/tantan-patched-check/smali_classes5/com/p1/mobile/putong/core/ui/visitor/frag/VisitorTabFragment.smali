.class public final Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0014\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\u000f\u0010\u0006\u001a\u00020\u0004H\u0014\u00a2\u0006\u0004\u0008\u0006\u0010\u0003J!\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0008\u001a\u00020\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0019\u0010\u0010\u001a\u00020\u00042\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0014\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0014\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015R\u001b\u0010\u001b\u001a\u00020\u00168BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0017\u0010\u0018\u001a\u0004\u0008\u0019\u0010\u001aR\u001b\u0010 \u001a\u00020\u001c8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001d\u0010\u0018\u001a\u0004\u0008\u001e\u0010\u001f\u00a8\u0006!"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;",
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "<init>",
        "()V",
        "",
        "d4",
        "f4",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "container",
        "Landroid/view/View;",
        "inflateView",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "Landroid/os/Bundle;",
        "sis",
        "g4",
        "(Landroid/os/Bundle;)V",
        "",
        "hidden",
        "onHiddenChanged",
        "(Z)V",
        "Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;",
        "z",
        "Lkotlin/Lazy;",
        "O4",
        "()Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;",
        "presenter",
        "Ll/sgm0;",
        "A",
        "P4",
        "()Ll/sgm0;",
        "viewModel",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final A:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final z:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lfm0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/lfm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->z:Lkotlin/Lazy;

    .line 14
    .line 15
    new-instance v0, Ll/mfm0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/mfm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->A:Lkotlin/Lazy;

    .line 25
    .line 26
    return-void
.end method

.method public static M4(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;)Ll/sgm0;
    .locals 1

    .line 1
    new-instance v0, Ll/sgm0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sgm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static N4(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;)Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private final O4()Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->z:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final P4()Ll/sgm0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->A:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/sgm0;

    .line 8
    .line 9
    return-object p0
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->O4()Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->P4()Ll/sgm0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->P4()Ll/sgm0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->O4()Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Ll/sgm0;->n(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->O4()Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->a0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->P4()Ll/sgm0;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/sgm0;->r()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->O4()Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->P0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->P4()Ll/sgm0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1, p2}, Ll/sgm0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabFragment;->P4()Ll/sgm0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Ll/sgm0;->y(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
