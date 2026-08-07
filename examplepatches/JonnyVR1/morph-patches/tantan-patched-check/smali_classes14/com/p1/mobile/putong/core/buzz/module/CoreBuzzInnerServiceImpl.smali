.class public Lcom/p1/mobile/putong/core/buzz/module/CoreBuzzInnerServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreBuzzInnerService"
    path = "/buzz_service/service"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Ljava/lang/String;Ll/x0m;)Lkotlin/Unit;
    .locals 1

    .line 1
    sget-object v0, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Ll/sbw;->e(Ljava/lang/String;Ll/x0m;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public static synthetic H()Lkotlin/Unit;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method


# virtual methods
.method public Bs()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/c69;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Da(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->F(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Dj(Lv/VText;Ljava/lang/Double;)V
    .locals 2

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0, p1, v0, v1}, Ll/p6w;->H(Lv/VText;D)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Fg()V
    .locals 0

    .line 1
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nbw;->y0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I7()V
    .locals 0

    .line 1
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nbw;->m0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Jp(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/p6w;->A(Ljava/lang/String;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Ls(ILcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/data/Gender;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/BreakIce;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/p6w;->G(ILcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Nk()Lcom/p1/mobile/putong/core/data/LoveBuzzData;
    .locals 0

    .line 1
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/haw;->v0()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public Pe(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->m(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Pj(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->r(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Uq(J)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/k8w;->g(J)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Wh()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "textBuzz"

    .line 2
    .line 3
    return-object p0
.end method

.method public Wl(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    sget-object p0, Ll/d8w;->INSTANCE:Ll/d8w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d8w;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Wr(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->D(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public X7(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->p(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Yg()Z
    .locals 0

    .line 1
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/haw;->t0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public Zf(Ll/ner;Ljava/lang/String;Ljava/lang/String;ZZLl/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZ",
            "Ll/a30<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p6}, Ll/p6w;->L(Ll/ner;Ljava/lang/String;Ljava/lang/String;ZZLl/a30;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Zm(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->n(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Zq()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "memojiBuzz"

    .line 2
    .line 3
    return-object p0
.end method

.method public a8(Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    sget-object p0, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/sbw;->p(Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e6(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLl/x0m;)V
    .locals 8

    .line 1
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nbw;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0, p1}, Ll/nbw;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    new-instance v6, Ll/za7;

    .line 17
    .line 18
    invoke-direct {v6}, Ll/za7;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v7, Ll/ab7;

    .line 22
    .line 23
    invoke-direct {v7, p1, p4}, Ll/ab7;-><init>(Ljava/lang/String;Ll/x0m;)V

    .line 24
    .line 25
    .line 26
    move-object v2, p1

    .line 27
    move-object v3, p2

    .line 28
    move v4, p3

    .line 29
    invoke-virtual/range {v1 .. v7}, Ll/haw;->l0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    sget-object p0, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 36
    .line 37
    invoke-virtual {p0, v2, p4}, Ll/sbw;->e(Ljava/lang/String;Ll/x0m;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public fq(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->l(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public gh(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/p6w;->B(Ljava/lang/String;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public io(ILjava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/f8w;->INSTANCE:Ll/f8w;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/f8w;->c(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Ll/haw;->R0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public la(J)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/p6w;->t(Ljava/lang/Long;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public lo(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->v(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public mf(Landroid/content/Context;Lv/VText;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/p6w;->I(Landroid/content/Context;Lv/VText;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public nl(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->s(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public nt(Lcom/p1/mobile/putong/data/User;Landroid/widget/TextView;)V
    .locals 1

    .line 1
    sget-object p0, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 2
    .line 3
    const/high16 v0, 0x41900000    # 18.0f

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, v0, v0}, Ll/sbw;->o(Lcom/p1/mobile/putong/data/User;Landroid/widget/TextView;FF)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public of()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->Q()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public ra()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "videoBuzz"

    .line 2
    .line 3
    return-object p0
.end method

.method public sc(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->u(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public tj()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceBuzz"

    .line 2
    .line 3
    return-object p0
.end method

.method public v6(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->q(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public vg(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/p6w;->E(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public w9(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nbw;->l(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public wo()V
    .locals 0

    .line 1
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nbw;->z0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x3()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/c69;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public xk()Z
    .locals 0

    .line 1
    sget-object p0, Ll/f8w;->INSTANCE:Ll/f8w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f8w;->g()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public xp(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V
    .locals 0

    .line 1
    sget-object p0, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/sbw;->f(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public zo(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6w;->o(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
