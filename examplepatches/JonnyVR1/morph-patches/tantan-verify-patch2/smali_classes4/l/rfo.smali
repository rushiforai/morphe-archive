.class public final Ll/rfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rfo$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lfo;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000h\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001#B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u001f\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000c\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0012\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J!\u0010\u0014\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0010J\u000f\u0010\u0015\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\tJ\u000f\u0010\u0017\u001a\u00020\u0016H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0007H\u0000\u00a2\u0006\u0004\u0008\u0019\u0010\tJ\u0015\u0010\u001c\u001a\u00020\u00072\u0006\u0010\u001b\u001a\u00020\u001a\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0015\u0010\u001f\u001a\u00020\u00072\u0006\u0010\u001e\u001a\u00020\u001a\u00a2\u0006\u0004\u0008\u001f\u0010\u001dJ\r\u0010 \u001a\u00020\u0007\u00a2\u0006\u0004\u0008 \u0010\tJ\r\u0010!\u001a\u00020\u0007\u00a2\u0006\u0004\u0008!\u0010\tJ\u0015\u0010\"\u001a\u00020\u00072\u0006\u0010\u001b\u001a\u00020\u001a\u00a2\u0006\u0004\u0008\"\u0010\u001dR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008#\u0010$\u001a\u0004\u0008%\u0010&R\"\u0010.\u001a\u00020\'8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008(\u0010)\u001a\u0004\u0008*\u0010+\"\u0004\u0008,\u0010-R\"\u00105\u001a\u00020/8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u000f\u00100\u001a\u0004\u00081\u00102\"\u0004\u00083\u00104R\u0016\u0010\u0011\u001a\u00020\u00028\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0012\u00106R\u001f\u0010;\u001a\u000607R\u00020\u00008FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u00088\u00109\u001a\u0004\u00088\u0010:R$\u0010B\u001a\u0004\u0018\u00010<8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008=\u0010>\u001a\u0004\u0008=\u0010?\"\u0004\u0008@\u0010AR$\u0010J\u001a\u0004\u0018\u00010C8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008D\u0010E\u001a\u0004\u0008F\u0010G\"\u0004\u0008H\u0010I\u00a8\u0006K"
    }
    d2 = {
        "Ll/rfo;",
        "Ll/iam;",
        "Ll/lfo;",
        "Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;",
        "frag",
        "<init>",
        "(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;)V",
        "",
        "l",
        "()V",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "c",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "presenter",
        "d",
        "(Ll/lfo;)V",
        "inflateView",
        "destroy",
        "Landroid/content/Context;",
        "C0",
        "()Landroid/content/Context;",
        "m",
        "",
        "count",
        "n",
        "(I)V",
        "pos",
        "q",
        "D1",
        "x1",
        "u",
        "a",
        "Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;",
        "getFrag",
        "()Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;",
        "Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;",
        "b",
        "Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;",
        "j",
        "()Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;",
        "set_tab_bar",
        "(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;)V",
        "_tab_bar",
        "Landroidx/viewpager2/widget/ViewPager2;",
        "Landroidx/viewpager2/widget/ViewPager2;",
        "k",
        "()Landroidx/viewpager2/widget/ViewPager2;",
        "set_viewpager",
        "(Landroidx/viewpager2/widget/ViewPager2;)V",
        "_viewpager",
        "Ll/lfo;",
        "Ll/rfo$a;",
        "e",
        "Lkotlin/Lazy;",
        "()Ll/rfo$a;",
        "adapter",
        "Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;",
        "f",
        "Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;",
        "()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;",
        "p",
        "(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;)V",
        "meetFrag",
        "Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;",
        "g",
        "Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;",
        "i",
        "()Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;",
        "s",
        "(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;)V",
        "visitorFrag",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;

.field public c:Landroidx/viewpager2/widget/ViewPager2;

.field public d:Ll/lfo;

.field public final e:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;
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
    iput-object p1, p0, Ll/rfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;

    .line 8
    .line 9
    new-instance p1, Ll/pfo;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/pfo;-><init>(Ll/rfo;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/rfo;->e:Lkotlin/Lazy;

    .line 19
    .line 20
    return-void
.end method

.method public static a(Ll/rfo;)Ll/rfo$a;
    .locals 2

    .line 1
    new-instance v0, Ll/rfo$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/rfo$a;-><init>(Ll/rfo;Landroidx/fragment/app/Fragment;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static b(Ll/rfo;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    const/4 p2, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ne v0, p2, :cond_1

    .line 10
    .line 11
    const-string v0, "e_intl_meet_tab_visitor"

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const-string v0, "e_intl_meet_tab_see"

    .line 15
    .line 16
    :goto_1
    const-string v1, "p_intl_meet_view"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/rfo;->k()Landroidx/viewpager2/widget/ViewPager2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eq v1, v0, :cond_a

    .line 37
    .line 38
    :goto_2
    invoke-virtual {p0}, Ll/rfo;->k()Landroidx/viewpager2/widget/ViewPager2;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {v0, v1, v2}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v1, 0x0

    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    iget-object p1, p0, Ll/rfo;->f:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 61
    .line 62
    if-eqz p1, :cond_4

    .line 63
    .line 64
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_3
    move-object p1, v1

    .line 72
    :goto_3
    if-eqz p1, :cond_4

    .line 73
    .line 74
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->onHiddenChanged(Z)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-object p0, p0, Ll/rfo;->g:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;

    .line 78
    .line 79
    if-eqz p0, :cond_a

    .line 80
    .line 81
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_5

    .line 86
    .line 87
    move-object v1, p0

    .line 88
    :cond_5
    if-eqz v1, :cond_a

    .line 89
    .line 90
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;->onHiddenChanged(Z)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-ne p1, p2, :cond_a

    .line 99
    .line 100
    iget-object p1, p0, Ll/rfo;->f:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 101
    .line 102
    if-eqz p1, :cond_8

    .line 103
    .line 104
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_7

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_7
    move-object p1, v1

    .line 112
    :goto_4
    if-eqz p1, :cond_8

    .line 113
    .line 114
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->onHiddenChanged(Z)V

    .line 115
    .line 116
    .line 117
    :cond_8
    iget-object p0, p0, Ll/rfo;->g:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;

    .line 118
    .line 119
    if-eqz p0, :cond_a

    .line 120
    .line 121
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_9

    .line 126
    .line 127
    move-object v1, p0

    .line 128
    :cond_9
    if-eqz v1, :cond_a

    .line 129
    .line 130
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;->onHiddenChanged(Z)V

    .line 131
    .line 132
    .line 133
    :cond_a
    return-void
.end method

.method private final l()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/rfo;->j()Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/rfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Ll/vnb;->n1(Lcom/p1/mobile/android/app/Act;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sget v2, Ll/qa00;->h:I

    .line 16
    .line 17
    add-int/2addr v1, v2

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/rfo;->j()Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/rfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;

    .line 26
    .line 27
    new-instance v2, Ll/qfo;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/qfo;-><init>(Ll/rfo;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->w(Lcom/p1/mobile/android/app/Frag;Ll/z20;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/rfo;->j()Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->c:Lv/VLinear;

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public final D1()V
    .locals 0

    .line 1
    return-void
.end method

.method public final c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
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
    invoke-static {p0, p1, p2}, Ll/sfo;->b(Ll/rfo;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public d(Ll/lfo;)V
    .locals 0
    .param p1    # Ll/lfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rfo;->d:Ll/lfo;

    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e()Ll/rfo$a;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rfo;->e:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/rfo$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public final f()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rfo;->f:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rfo;->g:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rfo;->d(Ll/lfo;)V

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
    invoke-virtual {p0, p1, p2}, Ll/rfo;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final j()Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rfo;->b:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_tab_bar"

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

.method public final k()Landroidx/viewpager2/widget/ViewPager2;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rfo;->c:Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_viewpager"

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

.method public final m()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/rfo;->k()Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/rfo;->e()Ll/rfo$a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/rfo;->k()Landroidx/viewpager2/widget/ViewPager2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Ll/rfo;->l()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final n(I)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/rfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->v0:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x1

    .line 20
    const-string v1, " "

    .line 21
    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/rfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->w0:I

    .line 31
    .line 32
    new-instance v3, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v0, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object v0, p0, Ll/rfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFrag;

    .line 60
    .line 61
    const/16 v2, 0x64

    .line 62
    .line 63
    if-ge p1, v2, :cond_2

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->x0:I

    .line 70
    .line 71
    new-instance v3, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {v0, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->x0:I

    .line 103
    .line 104
    const-string v1, "99+ "

    .line 105
    .line 106
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 115
    .line 116
    .line 117
    :goto_0
    invoke-virtual {p0}, Ll/rfo;->j()Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->C(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/rfo;->f:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 2
    .line 3
    return-void
.end method

.method public final q(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/rfo;->k()Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/rfo;->k()Landroidx/viewpager2/widget/ViewPager2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, p1, v1}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz p1, :cond_5

    .line 23
    .line 24
    if-eq p1, v0, :cond_1

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_1
    iget-object p1, p0, Ll/rfo;->f:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 28
    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    move-object p1, v2

    .line 39
    :goto_0
    if-eqz p1, :cond_3

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->onHiddenChanged(Z)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p0, Ll/rfo;->g:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;

    .line 45
    .line 46
    if-eqz p0, :cond_9

    .line 47
    .line 48
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_4

    .line 53
    .line 54
    move-object v2, p0

    .line 55
    :cond_4
    if-eqz v2, :cond_9

    .line 56
    .line 57
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;->onHiddenChanged(Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_5
    iget-object p1, p0, Ll/rfo;->f:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 62
    .line 63
    if-eqz p1, :cond_7

    .line 64
    .line 65
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_6

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_6
    move-object p1, v2

    .line 73
    :goto_1
    if-eqz p1, :cond_7

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->onHiddenChanged(Z)V

    .line 76
    .line 77
    .line 78
    :cond_7
    iget-object p0, p0, Ll/rfo;->g:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;

    .line 79
    .line 80
    if-eqz p0, :cond_9

    .line 81
    .line 82
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_8

    .line 87
    .line 88
    move-object v2, p0

    .line 89
    :cond_8
    if-eqz v2, :cond_9

    .line 90
    .line 91
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;->onHiddenChanged(Z)V

    .line 92
    .line 93
    .line 94
    :cond_9
    :goto_2
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/rfo;->g:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;

    .line 2
    .line 3
    return-void
.end method

.method public final u(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rfo;->j()Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/frag/IntlMeetFragTabBar;->setNewVisitorCount(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final x1()V
    .locals 0

    .line 1
    return-void
.end method
