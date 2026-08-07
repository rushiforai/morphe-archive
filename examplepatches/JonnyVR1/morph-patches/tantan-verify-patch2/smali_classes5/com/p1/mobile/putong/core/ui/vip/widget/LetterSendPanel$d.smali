.class public Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/z20<",
        "Ljava/lang/Throwable;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isIllegalContent(Ljava/lang/Throwable;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/g;->Of(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L7:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Th:I

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->n(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p1, p0}, Ll/bfx;->f(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    sget p2, Ll/kec0;->bc:I

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 64
    .line 65
    sget v0, Ll/adc0;->E6:I

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    .line 74
    .line 75
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->n(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->q(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 84
    .line 85
    .line 86
    new-instance p2, Ll/dyf0$a;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    invoke-direct {p2, p0, p1}, Ll/dyf0$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2}, Ll/dyf0$a;->m()Ll/dyf0;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SPOT_PUSH_BUBBLE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 106
    .line 107
    .line 108
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;->a(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
