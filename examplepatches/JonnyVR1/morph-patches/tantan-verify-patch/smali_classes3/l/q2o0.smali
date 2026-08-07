.class public final Ll/q2o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/gqo0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\r\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0019\u0010\u0007\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\t\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\u0004J\r\u0010\n\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\n\u0010\u0004J%\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0004J\u0011\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015R$\u0010\u001d\u001a\u0004\u0018\u00010\u00168\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0017\u0010\u0018\u001a\u0004\u0008\u0019\u0010\u001a\"\u0004\u0008\u001b\u0010\u001cR$\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001e\u0010\u001f\u001a\u0004\u0008 \u0010!\"\u0004\u0008\"\u0010\u0008\u00a8\u0006#"
    }
    d2 = {
        "Ll/q2o0;",
        "Ll/iam;",
        "Ll/gqo0;",
        "<init>",
        "()V",
        "presenter",
        "",
        "c",
        "(Ll/gqo0;)V",
        "e",
        "d",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "inflateView",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "destroy",
        "Landroid/content/Context;",
        "C0",
        "()Landroid/content/Context;",
        "Ll/g4s;",
        "a",
        "Ll/g4s;",
        "getDialog",
        "()Ll/g4s;",
        "setDialog",
        "(Ll/g4s;)V",
        "dialog",
        "b",
        "Ll/gqo0;",
        "getPresenter",
        "()Ll/gqo0;",
        "setPresenter",
        "livingroom_intlGmsRelease"
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
.field public a:Ll/g4s;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public b:Ll/gqo0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


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

.method public static a(Ll/q2o0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q2o0;->a:Ll/g4s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/q2o0;->b:Ll/gqo0;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/gqo0;->k4()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public static b(Ll/q2o0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q2o0;->a:Ll/g4s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/q2o0;->b:Ll/gqo0;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/gqo0;->m4()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2o0;->b:Ll/gqo0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public c(Ll/gqo0;)V
    .locals 0
    .param p1    # Ll/gqo0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/q2o0;->b:Ll/gqo0;

    .line 2
    .line 3
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q2o0;->a:Ll/g4s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/q2o0;->a:Ll/g4s;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/q2o0;->a:Ll/g4s;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/q2o0;->b:Ll/gqo0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ll/gqo0;->l4()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Ll/q2o0;->b:Ll/gqo0;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Ll/g0v;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-direct {v0, v1}, Ll/g0v;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/g4s;

    .line 34
    .line 35
    iget-object v2, p0, Ll/q2o0;->b:Ll/gqo0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/h0v;->b()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-direct {v1, v2, v3}, Ll/g4s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Ll/q2o0;->a:Ll/g4s;

    .line 45
    .line 46
    iget-object v2, p0, Ll/q2o0;->b:Ll/gqo0;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Ll/g0v;->f(Ll/g4s;Ll/gqo0;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    new-instance v3, Ll/z1o0;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    invoke-direct {v3, v0}, Ll/z1o0;-><init>(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ll/g4s;

    .line 71
    .line 72
    iget-object v1, p0, Ll/q2o0;->b:Ll/gqo0;

    .line 73
    .line 74
    invoke-virtual {v3}, Ll/z1o0;->d()Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-direct {v0, v1, v2}, Ll/g4s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Ll/q2o0;->a:Ll/g4s;

    .line 82
    .line 83
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Jh:I

    .line 84
    .line 85
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Kh:I

    .line 93
    .line 94
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    .line 100
    .line 101
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ub:I

    .line 102
    .line 103
    sget v7, Lcom/p1/mobile/putong/live/livingroom/R$string;->v:I

    .line 104
    .line 105
    new-instance v8, Ll/o2o0;

    .line 106
    .line 107
    invoke-direct {v8, p0}, Ll/o2o0;-><init>(Ll/q2o0;)V

    .line 108
    .line 109
    .line 110
    new-instance v9, Ll/p2o0;

    .line 111
    .line 112
    invoke-direct {v9, p0}, Ll/p2o0;-><init>(Ll/q2o0;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual/range {v3 .. v9}, Ll/z1o0;->j(Ljava/lang/String;Ljava/lang/String;IILl/x20;Ll/x20;)V

    .line 116
    .line 117
    .line 118
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/q2o0;->a:Ll/g4s;

    .line 119
    .line 120
    if-eqz p0, :cond_2

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 123
    .line 124
    .line 125
    :cond_2
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gqo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q2o0;->c(Ll/gqo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
