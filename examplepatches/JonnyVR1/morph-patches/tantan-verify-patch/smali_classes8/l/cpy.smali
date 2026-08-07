.class public final Ll/cpy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cpy$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zoy;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000h\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u001e\u0018\u0000 R2\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u001fB\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\tJ\u0019\u0010\u000e\u001a\u00020\u00072\u0008\u0008\u0002\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ!\u0010\u0012\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u00102\u0008\u0008\u0002\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\tJ\u0019\u0010\u0017\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0016\u001a\u00020\u0015H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\tJ\u001f\u0010\u001f\u001a\u00020\u001e2\u0006\u0010\u001b\u001a\u00020\u001a2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001c\u00a2\u0006\u0004\u0008\u001f\u0010 J!\u0010!\u001a\u00020\u001e2\u0006\u0010\u001b\u001a\u00020\u001a2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001cH\u0016\u00a2\u0006\u0004\u0008!\u0010 J\u000f\u0010#\u001a\u00020\"H\u0016\u00a2\u0006\u0004\u0008#\u0010$J\u0019\u0010&\u001a\u00020\u00072\u0008\u0010%\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008&\u0010\'J\r\u0010(\u001a\u00020\u0007\u00a2\u0006\u0004\u0008(\u0010\tJ\u0015\u0010+\u001a\u00020\u00072\u0006\u0010*\u001a\u00020)\u00a2\u0006\u0004\u0008+\u0010,J\u0017\u0010.\u001a\u00020-2\u0008\u0008\u0002\u0010\u0016\u001a\u00020\u0015\u00a2\u0006\u0004\u0008.\u0010/J\u000f\u00100\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u00080\u0010\tJ\r\u00101\u001a\u00020\u0007\u00a2\u0006\u0004\u00081\u0010\tR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001f\u00102\u001a\u0004\u00083\u00104R\"\u0010;\u001a\u0002058\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008&\u00106\u001a\u0004\u00087\u00108\"\u0004\u00089\u0010:R\"\u0010>\u001a\u0002058\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0014\u00106\u001a\u0004\u0008<\u00108\"\u0004\u0008=\u0010:R\"\u0010A\u001a\u0002058\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008?\u00106\u001a\u0004\u0008?\u00108\"\u0004\u0008@\u0010:R\"\u0010G\u001a\u00020\u001e8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008B\u0010C\u001a\u0004\u0008B\u0010D\"\u0004\u0008E\u0010FR\"\u0010J\u001a\u0002058\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0017\u00106\u001a\u0004\u0008H\u00108\"\u0004\u0008I\u0010:R\u0018\u0010M\u001a\u0004\u0018\u00010)8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008K\u0010LR\u0018\u0010O\u001a\u0004\u0018\u00010)8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008N\u0010LR\u0018\u0010Q\u001a\u0004\u0018\u00010-8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008+\u0010P\u00a8\u0006S"
    }
    d2 = {
        "Ll/cpy;",
        "Ll/iam;",
        "Ll/zoy;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "",
        "q",
        "()V",
        "n",
        "p",
        "",
        "id",
        "l",
        "(I)V",
        "Lcom/p1/mobile/android/app/Frag;",
        "frag",
        "s",
        "(Lcom/p1/mobile/android/app/Frag;I)V",
        "c",
        "",
        "full",
        "f",
        "(Z)V",
        "k",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "a",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "inflateView",
        "Landroid/content/Context;",
        "C0",
        "()Landroid/content/Context;",
        "presenter",
        "b",
        "(Ll/zoy;)V",
        "r",
        "",
        "page",
        "i",
        "(Ljava/lang/String;)V",
        "Landroid/view/SurfaceView;",
        "v",
        "(Z)Landroid/view/SurfaceView;",
        "destroy",
        "j",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "Landroid/widget/FrameLayout;",
        "Landroid/widget/FrameLayout;",
        "get_memoji_act_root",
        "()Landroid/widget/FrameLayout;",
        "set_memoji_act_root",
        "(Landroid/widget/FrameLayout;)V",
        "_memoji_act_root",
        "get_memoji_buzz_root",
        "set_memoji_buzz_root",
        "_memoji_buzz_root",
        "d",
        "set_self_surface_root",
        "_self_surface_root",
        "e",
        "Landroid/view/View;",
        "()Landroid/view/View;",
        "set_self_surface_root_avatar_mask_bg",
        "(Landroid/view/View;)V",
        "_self_surface_root_avatar_mask_bg",
        "get_memoji_search_root",
        "set_memoji_search_root",
        "_memoji_search_root",
        "g",
        "Ljava/lang/String;",
        "pageType",
        "h",
        "modeType",
        "Landroid/view/SurfaceView;",
        "localSurface",
        "Companion",
        "buzz_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Ll/cpy$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/FrameLayout;

.field public g:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public h:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public i:Landroid/view/SurfaceView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/cpy$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/cpy$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/cpy;->Companion:Ll/cpy$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/cpy;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    iput-object p1, p0, Ll/cpy;->g:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Ll/cpy;->h:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic m(Ll/cpy;IILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    sget p1, Ll/bdc0;->d:I

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Ll/cpy;->l(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic u(Ll/cpy;Lcom/p1/mobile/android/app/Frag;IILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    sget p2, Ll/bdc0;->c:I

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/cpy;->s(Lcom/p1/mobile/android/app/Frag;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cpy;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
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
    invoke-static {p0, p1, p2}, Ll/dpy;->b(Ll/cpy;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public b(Ll/zoy;)V
    .locals 0
    .param p1    # Ll/zoy;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public final c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cpy;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "search_memoji"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/cpy;->q()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string v1, "call_end"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/cpy;->p()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0}, Ll/cpy;->n()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final d()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cpy;->d:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_self_surface_root"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cpy;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cpy;->e:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_self_surface_root_avatar_mask_bg"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final f(Z)V
    .locals 5

    .line 1
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "handlerSmall "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "MemojiBuzzViewModel"

    .line 18
    .line 19
    invoke-virtual {v0, v2, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    move v2, v1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget v2, Ll/qa00;->h:I

    .line 41
    .line 42
    invoke-static {}, Ll/bnl0;->F0()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    add-int/2addr v2, v3

    .line 47
    :goto_0
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    move v2, v1

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const/high16 v2, 0x41400000    # 12.0f

    .line 54
    .line 55
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 60
    .line 61
    .line 62
    const/4 v2, -0x1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    move v3, v2

    .line 66
    goto :goto_2

    .line 67
    :cond_2
    const/high16 v3, 0x42b40000    # 90.0f

    .line 68
    .line 69
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    :goto_2
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 74
    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    goto :goto_3

    .line 78
    :cond_3
    const/high16 v2, 0x430c0000    # 140.0f

    .line 79
    .line 80
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    :goto_3
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    if-eqz p1, :cond_4

    .line 91
    .line 92
    sget v3, Ll/d9c0;->n:I

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_4
    sget v3, Ll/d9c0;->o:I

    .line 96
    .line 97
    :goto_4
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    if-eqz p1, :cond_5

    .line 105
    .line 106
    goto :goto_5

    .line 107
    :cond_5
    sget v1, Ll/qa00;->d:I

    .line 108
    .line 109
    :goto_5
    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    new-instance v2, Ll/mmp;

    .line 117
    .line 118
    const/4 v3, 0x0

    .line 119
    if-eqz p1, :cond_6

    .line 120
    .line 121
    move v4, v3

    .line 122
    goto :goto_6

    .line 123
    :cond_6
    sget v4, Ll/qa00;->i:I

    .line 124
    .line 125
    int-to-float v4, v4

    .line 126
    :goto_6
    invoke-direct {v2, v4}, Ll/mmp;-><init>(F)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1, v2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ll/cpy;->i:Landroid/view/SurfaceView;

    .line 133
    .line 134
    if-eqz v1, :cond_8

    .line 135
    .line 136
    new-instance v2, Ll/mmp;

    .line 137
    .line 138
    if-eqz p1, :cond_7

    .line 139
    .line 140
    goto :goto_7

    .line 141
    :cond_7
    sget v3, Ll/qa00;->h:I

    .line 142
    .line 143
    int-to-float v3, v3

    .line 144
    :goto_7
    invoke-direct {v2, v3}, Ll/mmp;-><init>(F)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1, v2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 148
    .line 149
    .line 150
    :cond_8
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    const/4 v2, 0x1

    .line 155
    invoke-virtual {v1, v2}, Landroid/view/View;->setClipToOutline(Z)V

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Ll/cpy;->i:Landroid/view/SurfaceView;

    .line 159
    .line 160
    if-eqz v1, :cond_9

    .line 161
    .line 162
    invoke-virtual {v1, v2}, Landroid/view/View;->setClipToOutline(Z)V

    .line 163
    .line 164
    .line 165
    :cond_9
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0}, Ll/cpy;->e()Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cpy;->g:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iput-object p1, p0, Ll/cpy;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/cpy;->c()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zoy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cpy;->b(Ll/zoy;)V

    .line 4
    .line 5
    .line 6
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
    invoke-virtual {p0, p1, p2}, Ll/cpy;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cpy;->i:Landroid/view/SurfaceView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->n0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final k()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/cpy;->i:Landroid/view/SurfaceView;

    .line 10
    .line 11
    return-void
.end method

.method public final l(I)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/cpy;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "removeFragment "

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "MemojiBuzzViewModel"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroidx/fragment/app/k;->r(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 4

    .line 1
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    const-string v1, "MemojiBuzzViewModel"

    .line 4
    .line 5
    const-string v2, "renderVideoCall"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {p0, v0, v1, v2}, Ll/cpy;->m(Ll/cpy;IILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/memoji/call/MemojiBuzzCallFrag;

    .line 17
    .line 18
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/memoji/call/MemojiBuzzCallFrag;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    invoke-static {p0, v1, v0, v3, v2}, Ll/cpy;->u(Ll/cpy;Lcom/p1/mobile/android/app/Frag;IILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/cpy;->k()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x4

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/cpy;->a:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    sget v0, Ll/bdc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/cpy;->l(I)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzSearchFrag;->Companion:Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzSearchFrag$a;

    .line 7
    .line 8
    const-string v1, "memojiBuzz"

    .line 9
    .line 10
    iget-object v2, p0, Ll/cpy;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzSearchFrag$a;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/lovebuzz/common/BaseBuzzSearchFrag;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/bdc0;->d:I

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Ll/cpy;->s(Lcom/p1/mobile/android/app/Frag;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cpy;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "page_type"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/cpy;->g:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/cpy;->a:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "MODE_TYPE"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/cpy;->h:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/cpy;->c()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final s(Lcom/p1/mobile/android/app/Frag;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cpy;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2, p1}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final v(Z)Landroid/view/SurfaceView;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setLocalPreview "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "MemojiBuzzViewModel"

    .line 18
    .line 19
    invoke-virtual {v0, v2, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/cpy;->i:Landroid/view/SurfaceView;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    new-instance v0, Landroid/view/SurfaceView;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-direct {v0, v2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/cpy;->i:Landroid/view/SurfaceView;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    instance-of v2, v2, Landroid/view/ViewGroup;

    .line 54
    .line 55
    if-eqz v2, :cond_0

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    check-cast v2, Landroid/view/ViewGroup;

    .line 65
    .line 66
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/cpy;->d()Landroid/widget/FrameLayout;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 77
    .line 78
    const/4 v3, -0x1

    .line 79
    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 80
    .line 81
    .line 82
    const/4 v3, 0x0

    .line 83
    invoke-virtual {v1, v0, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    if-eqz v1, :cond_1

    .line 91
    .line 92
    new-instance v2, Ll/cpy$b;

    .line 93
    .line 94
    invoke-direct {v2, v0}, Ll/cpy$b;-><init>(Landroid/view/SurfaceView;)V

    .line 95
    .line 96
    .line 97
    invoke-interface {v1, v2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 98
    .line 99
    .line 100
    :cond_1
    invoke-virtual {p0, p1}, Ll/cpy;->f(Z)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Ll/cpy;->i:Landroid/view/SurfaceView;

    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    .line 107
    .line 108
    return-object p0
.end method
