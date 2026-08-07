.class public Ll/ukl$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uhl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ukl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ukl;


# direct methods
.method public constructor <init>(Ll/ukl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ukl$a;->a:Ll/ukl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C()Lcom/p1/mobile/android/app/Frag;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ukl$a;->a:Ll/ukl;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ukl;->a:Ll/lll;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public D()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ukl$a;->a:Ll/ukl;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ukl;->a:Ll/lll;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public E(Ljava/lang/String;Z)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/ukl$a;->a:Ll/ukl;

    .line 2
    .line 3
    const/16 v1, 0x1004

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, v0, Ll/ukl;->a:Ll/lll;

    .line 8
    .line 9
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-static {v1}, Ll/px50;->c(I)Ll/px50$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/16 v0, 0x50

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/16 v0, 0x18

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ll/px50$a;->s(I)Ll/px50$a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_GRAY_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {}, Ll/bnl0;->y0()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object p0, p0, Ll/ukl$a;->a:Ll/ukl;

    .line 50
    .line 51
    invoke-static {p0}, Ll/ukl;->b(Ll/ukl;)Ll/evl;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Ll/evl;->getContentHeight()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {p1, v0, p0}, Ll/px50$a;->A(II)Ll/px50$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/px50$a;->q()Ll/px50;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p2, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    iget-object p0, v0, Ll/ukl;->a:Ll/lll;

    .line 72
    .line 73
    invoke-static {v0}, Ll/ukl;->c(Ll/ukl;)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    invoke-virtual {p0, p1, p2, v1}, Ll/i6t;->v3(Ljava/lang/String;II)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ukl$a;->a:Ll/ukl;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ukl;->a:Ll/lll;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/lll;->R3(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public G()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ukl$a;->a:Ll/ukl;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ukl;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
