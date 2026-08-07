.class public Ll/sjk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/sjk$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ijk;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VImage;

.field public C:Lv/VLinear;

.field public D:Lv/VText;

.field public E:Lv/VLinear;

.field public F:Lv/VFrame;

.field public G:Lv/VEditText;

.field public H:Lv/VButton;

.field public I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

.field public J:Ll/ijk;

.field public K:Z

.field public L:Landroid/view/Menu;

.field public M:Z

.field public N:Z

.field public O:Ljava/lang/String;

.field public P:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;",
            ">;"
        }
    .end annotation
.end field

.field public Q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupTag;",
            ">;"
        }
    .end annotation
.end field

.field public R:Z

.field public a:Lv/VScroll;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Lv/VLinear;

.field public i:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

.field public l:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

.field public m:Lv/VText;

.field public n:Lv/VLinear;

.field public o:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

.field public p:Lv/VText;

.field public q:Lv/VLinear;

.field public r:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

.field public s:Lv/VText;

.field public t:Lv/VLinear;

.field public u:Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;

.field public v:Lv/VLinear;

.field public w:Lv/VRelative;

.field public x:Lv/VText;

.field public y:Lv/VImage;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/sjk;->M:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/sjk;->N:Z

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    iput-object v1, p0, Ll/sjk;->O:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ll/sjk;->P:Ljava/util/List;

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/sjk;->Q:Ljava/util/List;

    .line 27
    .line 28
    iput-boolean v0, p0, Ll/sjk;->R:Z

    .line 29
    .line 30
    iput-object p1, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 31
    .line 32
    return-void
.end method

.method public static bridge synthetic A(Ll/sjk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->k:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic B(Ll/sjk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->n:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic C(Ll/sjk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->q:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic E(Ll/sjk;Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->u:Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;

    return-void
.end method

.method public static bridge synthetic F(Ll/sjk;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->z:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic G(Ll/sjk;Lv/VRelative;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->w:Lv/VRelative;

    return-void
.end method

.method public static bridge synthetic H(Ll/sjk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->E:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic I(Ll/sjk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->v:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic J(Ll/sjk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->C:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic K(Ll/sjk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->g:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic L(Ll/sjk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->t:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic M(Ll/sjk;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->B:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic N(Ll/sjk;Lv/VScroll;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->a:Lv/VScroll;

    return-void
.end method

.method public static bridge synthetic O(Ll/sjk;Lcom/p1/mobile/putong/core/ui/view/SeekArc;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->i:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

    return-void
.end method

.method public static bridge synthetic P(Ll/sjk;Lcom/p1/mobile/putong/core/ui/view/SeekArc;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->l:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

    return-void
.end method

.method public static bridge synthetic Q(Ll/sjk;Lcom/p1/mobile/putong/core/ui/view/SeekArc;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->o:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

    return-void
.end method

.method public static bridge synthetic R(Ll/sjk;Lcom/p1/mobile/putong/core/ui/view/SeekArc;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->r:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

    return-void
.end method

.method public static bridge synthetic S(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->A:Lv/VText;

    return-void
.end method

.method public static bridge synthetic T(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->x:Lv/VText;

    return-void
.end method

.method public static bridge synthetic U(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->D:Lv/VText;

    return-void
.end method

.method public static bridge synthetic V(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->j:Lv/VText;

    return-void
.end method

.method public static bridge synthetic W(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->m:Lv/VText;

    return-void
.end method

.method public static bridge synthetic X(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->p:Lv/VText;

    return-void
.end method

.method public static bridge synthetic Y(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->s:Lv/VText;

    return-void
.end method

.method public static bridge synthetic Z(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->f:Lv/VText;

    return-void
.end method

.method public static synthetic a(Ll/sjk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sjk;->j0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic a0(Ll/sjk;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/sjk;->N:Z

    return-void
.end method

.method public static synthetic b(Ll/sjk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sjk;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/sjk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sjk;->e0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/sjk;Lv/VScroll;IIII)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/sjk;->h0(Lv/VScroll;IIII)V

    return-void
.end method

.method public static synthetic e(Ll/sjk;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/sjk;->m0(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method private synthetic e0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sjk;->J:Ll/ijk;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ijk;->s0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Ll/sjk;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sjk;->k0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method private synthetic f0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/sjk;->G:Lv/VEditText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 10
    .line 11
    iget-object v0, p0, Ll/sjk;->G:Lv/VEditText;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Ll/sjk;->J:Ll/ijk;

    .line 17
    .line 18
    iget-object p0, p0, Ll/sjk;->G:Lv/VEditText;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Ll/ijk;->l0(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic i(Ll/sjk;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sjk;->l0(Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    return-object p0
.end method

.method private synthetic i0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/sjk;->J:Ll/ijk;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ijk;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/sjk;->J:Ll/ijk;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ijk;->m0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "groupchat_id"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "e_apply_add_group_reason"

    .line 24
    .line 25
    invoke-static {v0, p1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic j(Ll/sjk;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sjk;->g0(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic k(Ll/sjk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sjk;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic l(Ll/sjk;)Lv/VEditText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sjk;->G:Lv/VEditText;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/sjk;)Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/sjk;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sjk;->N:Z

    return p0
.end method

.method public static bridge synthetic p(Ll/sjk;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->y:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic q(Ll/sjk;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->H:Lv/VButton;

    return-void
.end method

.method public static bridge synthetic s(Ll/sjk;Lv/VEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->G:Lv/VEditText;

    return-void
.end method

.method public static bridge synthetic u(Ll/sjk;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->F:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic v(Ll/sjk;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->b:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic w(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->d:Lv/VText;

    return-void
.end method

.method public static bridge synthetic x(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->e:Lv/VText;

    return-void
.end method

.method public static bridge synthetic y(Ll/sjk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->c:Lv/VText;

    return-void
.end method

.method public static bridge synthetic z(Ll/sjk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->h:Lv/VLinear;

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/sjk$c;->a(Ll/sjk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c0(Ll/ijk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk;->J:Ll/ijk;

    .line 2
    .line 3
    return-void
.end method

.method public final d0(Ljava/util/List;IZ)Landroid/text/SpannableStringBuilder;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupTag;",
            ">;IZ)",
            "Landroid/text/SpannableStringBuilder;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_3

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;

    .line 22
    .line 23
    if-eqz p3, :cond_2

    .line 24
    .line 25
    const-string v4, "1"

    .line 26
    .line 27
    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->textColor:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-nez v4, :cond_0

    .line 37
    .line 38
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->textColor:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    :goto_1
    move v8, v4

    .line 45
    goto :goto_2

    .line 46
    :cond_0
    const v4, -0x8a8a8b

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :goto_2
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->backgroundColor:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-nez v4, :cond_1

    .line 57
    .line 58
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->backgroundColor:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    move v10, v4

    .line 65
    move-object/from16 v4, p0

    .line 66
    .line 67
    goto :goto_3

    .line 68
    :cond_1
    move-object/from16 v4, p0

    .line 69
    .line 70
    iget-object v5, v4, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 71
    .line 72
    sget v6, Ll/g9c0;->a0:I

    .line 73
    .line 74
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    move v10, v5

    .line 79
    :goto_3
    new-instance v5, Ll/zu4;

    .line 80
    .line 81
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 82
    .line 83
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->name:Ljava/lang/String;

    .line 84
    .line 85
    sget v13, Ll/qa00;->k:I

    .line 86
    .line 87
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 88
    .line 89
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    sget v9, Ll/eac0;->a:I

    .line 94
    .line 95
    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    int-to-float v3, v3

    .line 100
    const/16 v19, 0x1

    .line 101
    .line 102
    const/16 v9, 0xd

    .line 103
    .line 104
    const/16 v12, 0xa

    .line 105
    .line 106
    const/4 v14, 0x0

    .line 107
    const/high16 v15, 0x41200000    # 10.0f

    .line 108
    .line 109
    const/high16 v16, 0x40a00000    # 5.0f

    .line 110
    .line 111
    const v17, -0x19191a

    .line 112
    .line 113
    .line 114
    move/from16 v11, p2

    .line 115
    .line 116
    move/from16 v18, v3

    .line 117
    .line 118
    invoke-direct/range {v5 .. v19}, Ll/zu4;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIIFFFIFZ)V

    .line 119
    .line 120
    .line 121
    add-int/lit8 v3, v2, 0x1

    .line 122
    .line 123
    const/16 v6, 0x21

    .line 124
    .line 125
    invoke-virtual {v0, v5, v2, v3, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 126
    .line 127
    .line 128
    move v2, v3

    .line 129
    goto :goto_0

    .line 130
    :cond_2
    move-object/from16 v4, p0

    .line 131
    .line 132
    const-string v3, " "

    .line 133
    .line 134
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_3
    return-object v0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic g0(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sjk;->O:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/sjk;->O:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->I5:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public final synthetic h0(Lv/VScroll;IIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sjk;->a:Lv/VScroll;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/high16 p2, 0x42200000    # 40.0f

    .line 8
    .line 9
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    iget-boolean p3, p0, Ll/sjk;->K:Z

    .line 14
    .line 15
    if-lt p1, p2, :cond_0

    .line 16
    .line 17
    if-nez p3, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 20
    .line 21
    iget-object p2, p0, Ll/sjk;->c:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Ll/sjk;->K:Z

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    if-eqz p3, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 37
    .line 38
    const-string p2, ""

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    iput-boolean p1, p0, Ll/sjk;->K:Z

    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ijk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sjk;->c0(Ll/ijk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sjk;->b0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sjk;->r0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mgk;->d(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/sjk;->J:Ll/ijk;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ijk;->s0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic l0(Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sjk;->Q:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-virtual {p0, v0, p1, p2}, Ll/sjk;->d0(Ljava/util/List;IZ)Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic m0(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sjk;->J:Ll/ijk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ijk;->m0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jek;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p2, ""

    .line 14
    .line 15
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public n0(Landroid/view/Menu;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/sjk;->R:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/sjk;->L:Landroid/view/Menu;

    .line 7
    .line 8
    iget-object v0, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->O:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-interface {p1, v1, v1, v1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 23
    .line 24
    .line 25
    sget v0, Ll/qec0;->c1:I

    .line 26
    .line 27
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    .line 28
    .line 29
    .line 30
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/jjk;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/jjk;-><init>(Ll/sjk;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Ll/sjk;->v:Lv/VLinear;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iput-boolean v2, p0, Ll/sjk;->R:Z

    .line 21
    .line 22
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Ll/sjk;->z:Lv/VDraweeView;

    .line 29
    .line 30
    sget v0, Ll/ibc0;->I0:I

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object v0, p0, Ll/sjk;->z:Lv/VDraweeView;

    .line 38
    .line 39
    invoke-static {p2}, Ll/jek;->k(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 54
    .line 55
    iget-object v0, p0, Ll/sjk;->z:Lv/VDraweeView;

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v1}, Ll/r97;->T0()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 74
    .line 75
    iget-object v0, p0, Ll/sjk;->z:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 86
    .line 87
    .line 88
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iget-object v0, p0, Ll/sjk;->A:Lv/VText;

    .line 93
    .line 94
    if-eqz p1, :cond_2

    .line 95
    .line 96
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Ll/sjk;->w:Lv/VRelative;

    .line 102
    .line 103
    new-instance v0, Ll/kjk;

    .line 104
    .line 105
    invoke-direct {v0, p0, p2}, Ll/kjk;-><init>(Ll/sjk;Lcom/p1/mobile/putong/data/User;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {p1}, Ll/jek;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 122
    .line 123
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 124
    .line 125
    iget-object v0, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 126
    .line 127
    iget-object p0, p0, Ll/sjk;->B:Lv/VImage;

    .line 128
    .line 129
    invoke-interface {p1, v0, p2, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_3
    iget-object p1, p0, Ll/sjk;->v:Lv/VLinear;

    .line 134
    .line 135
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iput-boolean v1, p0, Ll/sjk;->R:Z

    .line 139
    .line 140
    iget-object p1, p0, Ll/sjk;->L:Landroid/view/Menu;

    .line 141
    .line 142
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-eqz p1, :cond_4

    .line 147
    .line 148
    iget-object p0, p0, Ll/sjk;->L:Landroid/view/Menu;

    .line 149
    .line 150
    invoke-interface {p0, v2, v2}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 151
    .line 152
    .line 153
    :cond_4
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/p1/mobile/putong/core/data/GroupApply;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object v2, p0, Ll/sjk;->b:Lv/VDraweeView;

    .line 13
    .line 14
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    iget-object v2, p0, Ll/sjk;->b:Lv/VDraweeView;

    .line 33
    .line 34
    sget v3, Ll/ibc0;->I0:I

    .line 35
    .line 36
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object v0, p0, Ll/sjk;->c:Lv/VText;

    .line 40
    .line 41
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/sjk;->e:Lv/VText;

    .line 47
    .line 48
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 49
    .line 50
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const-string v3, "ID: %1$s"

    .line 55
    .line 56
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/sjk;->f:Lv/VText;

    .line 64
    .line 65
    iget-object v2, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 66
    .line 67
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->R:I

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 74
    .line 75
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget v4, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 80
    .line 81
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    filled-new-array {v2, v3, v4}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    const-string v3, "%1$s %2$s/%3$s"

    .line 90
    .line 91
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 99
    .line 100
    iput-object v0, p0, Ll/sjk;->O:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->name:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    const/4 v2, 0x1

    .line 111
    if-nez v0, :cond_1

    .line 112
    .line 113
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 114
    .line 115
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->hidden:Z

    .line 116
    .line 117
    if-nez v0, :cond_1

    .line 118
    .line 119
    iget-object v0, p0, Ll/sjk;->d:Lv/VText;

    .line 120
    .line 121
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/sjk;->d:Lv/VText;

    .line 125
    .line 126
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 127
    .line 128
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->name:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_1
    iget-object v0, p0, Ll/sjk;->d:Lv/VText;

    .line 135
    .line 136
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 140
    .line 141
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->backgroundColor:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_2

    .line 148
    .line 149
    iget-object v0, p0, Ll/sjk;->d:Lv/VText;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 152
    .line 153
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->backgroundColor:Ljava/lang/String;

    .line 154
    .line 155
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    const/high16 v4, 0x40800000    # 4.0f

    .line 160
    .line 161
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    int-to-float v4, v4

    .line 166
    invoke-static {v3, v4}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 171
    .line 172
    .line 173
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 174
    .line 175
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->textColor:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-nez v0, :cond_3

    .line 182
    .line 183
    iget-object v0, p0, Ll/sjk;->d:Lv/VText;

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 186
    .line 187
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->textColor:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    .line 195
    .line 196
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 197
    .line 198
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-nez v0, :cond_4

    .line 203
    .line 204
    iget-object v0, p0, Ll/sjk;->P:Ljava/util/List;

    .line 205
    .line 206
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Ll/sjk;->P:Ljava/util/List;

    .line 210
    .line 211
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 212
    .line 213
    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 214
    .line 215
    .line 216
    :cond_4
    iget-object v0, p0, Ll/sjk;->f:Lv/VText;

    .line 217
    .line 218
    iget-object v3, p0, Ll/sjk;->P:Ljava/util/List;

    .line 219
    .line 220
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    xor-int/2addr v3, v2

    .line 225
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ll/sjk;->g:Lv/VLinear;

    .line 229
    .line 230
    iget-object v3, p0, Ll/sjk;->P:Ljava/util/List;

    .line 231
    .line 232
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    xor-int/2addr v3, v2

    .line 237
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Ll/sjk;->P:Ljava/util/List;

    .line 241
    .line 242
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-nez v0, :cond_c

    .line 247
    .line 248
    iget-object v0, p0, Ll/sjk;->h:Lv/VLinear;

    .line 249
    .line 250
    iget-object v3, p0, Ll/sjk;->P:Ljava/util/List;

    .line 251
    .line 252
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    if-lt v3, v2, :cond_5

    .line 257
    .line 258
    move v3, v2

    .line 259
    goto :goto_2

    .line 260
    :cond_5
    move v3, v1

    .line 261
    :goto_2
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Ll/sjk;->k:Lv/VLinear;

    .line 265
    .line 266
    iget-object v3, p0, Ll/sjk;->P:Ljava/util/List;

    .line 267
    .line 268
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    const/4 v4, 0x2

    .line 273
    if-lt v3, v4, :cond_6

    .line 274
    .line 275
    move v3, v2

    .line 276
    goto :goto_3

    .line 277
    :cond_6
    move v3, v1

    .line 278
    :goto_3
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 279
    .line 280
    .line 281
    iget-object v0, p0, Ll/sjk;->n:Lv/VLinear;

    .line 282
    .line 283
    iget-object v3, p0, Ll/sjk;->P:Ljava/util/List;

    .line 284
    .line 285
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 286
    .line 287
    .line 288
    move-result v3

    .line 289
    const/4 v5, 0x3

    .line 290
    if-lt v3, v5, :cond_7

    .line 291
    .line 292
    move v3, v2

    .line 293
    goto :goto_4

    .line 294
    :cond_7
    move v3, v1

    .line 295
    :goto_4
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 296
    .line 297
    .line 298
    iget-object v0, p0, Ll/sjk;->q:Lv/VLinear;

    .line 299
    .line 300
    iget-object v3, p0, Ll/sjk;->P:Ljava/util/List;

    .line 301
    .line 302
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 303
    .line 304
    .line 305
    move-result v3

    .line 306
    const/4 v6, 0x4

    .line 307
    if-lt v3, v6, :cond_8

    .line 308
    .line 309
    move v3, v2

    .line 310
    goto :goto_5

    .line 311
    :cond_8
    move v3, v1

    .line 312
    :goto_5
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Ll/sjk;->P:Ljava/util/List;

    .line 316
    .line 317
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-lt v0, v2, :cond_9

    .line 322
    .line 323
    iget-object v0, p0, Ll/sjk;->i:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

    .line 324
    .line 325
    iget-object v3, p0, Ll/sjk;->j:Lv/VText;

    .line 326
    .line 327
    iget-object v7, p0, Ll/sjk;->P:Ljava/util/List;

    .line 328
    .line 329
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    move-result-object v7

    .line 333
    check-cast v7, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;

    .line 334
    .line 335
    invoke-virtual {p0, v0, v3, v7}, Ll/sjk;->q0(Lcom/p1/mobile/putong/core/ui/view/SeekArc;Lv/VText;Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;)V

    .line 336
    .line 337
    .line 338
    :cond_9
    iget-object v0, p0, Ll/sjk;->P:Ljava/util/List;

    .line 339
    .line 340
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    if-lt v0, v4, :cond_a

    .line 345
    .line 346
    iget-object v0, p0, Ll/sjk;->l:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

    .line 347
    .line 348
    iget-object v3, p0, Ll/sjk;->m:Lv/VText;

    .line 349
    .line 350
    iget-object v7, p0, Ll/sjk;->P:Ljava/util/List;

    .line 351
    .line 352
    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object v7

    .line 356
    check-cast v7, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;

    .line 357
    .line 358
    invoke-virtual {p0, v0, v3, v7}, Ll/sjk;->q0(Lcom/p1/mobile/putong/core/ui/view/SeekArc;Lv/VText;Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;)V

    .line 359
    .line 360
    .line 361
    :cond_a
    iget-object v0, p0, Ll/sjk;->P:Ljava/util/List;

    .line 362
    .line 363
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 364
    .line 365
    .line 366
    move-result v0

    .line 367
    if-lt v0, v5, :cond_b

    .line 368
    .line 369
    iget-object v0, p0, Ll/sjk;->o:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

    .line 370
    .line 371
    iget-object v3, p0, Ll/sjk;->p:Lv/VText;

    .line 372
    .line 373
    iget-object v7, p0, Ll/sjk;->P:Ljava/util/List;

    .line 374
    .line 375
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object v4

    .line 379
    check-cast v4, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;

    .line 380
    .line 381
    invoke-virtual {p0, v0, v3, v4}, Ll/sjk;->q0(Lcom/p1/mobile/putong/core/ui/view/SeekArc;Lv/VText;Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;)V

    .line 382
    .line 383
    .line 384
    :cond_b
    iget-object v0, p0, Ll/sjk;->P:Ljava/util/List;

    .line 385
    .line 386
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 387
    .line 388
    .line 389
    move-result v0

    .line 390
    if-lt v0, v6, :cond_c

    .line 391
    .line 392
    iget-object v0, p0, Ll/sjk;->r:Lcom/p1/mobile/putong/core/ui/view/SeekArc;

    .line 393
    .line 394
    iget-object v3, p0, Ll/sjk;->s:Lv/VText;

    .line 395
    .line 396
    iget-object v4, p0, Ll/sjk;->P:Ljava/util/List;

    .line 397
    .line 398
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 399
    .line 400
    .line 401
    move-result-object v4

    .line 402
    check-cast v4, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;

    .line 403
    .line 404
    invoke-virtual {p0, v0, v3, v4}, Ll/sjk;->q0(Lcom/p1/mobile/putong/core/ui/view/SeekArc;Lv/VText;Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;)V

    .line 405
    .line 406
    .line 407
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 408
    .line 409
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 410
    .line 411
    .line 412
    move-result v0

    .line 413
    if-nez v0, :cond_d

    .line 414
    .line 415
    iget-object v0, p0, Ll/sjk;->Q:Ljava/util/List;

    .line 416
    .line 417
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 418
    .line 419
    .line 420
    iget-object v0, p0, Ll/sjk;->Q:Ljava/util/List;

    .line 421
    .line 422
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 423
    .line 424
    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 425
    .line 426
    .line 427
    :cond_d
    iget-object v0, p0, Ll/sjk;->Q:Ljava/util/List;

    .line 428
    .line 429
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    iget-object v3, p0, Ll/sjk;->t:Lv/VLinear;

    .line 434
    .line 435
    if-eqz v0, :cond_e

    .line 436
    .line 437
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 438
    .line 439
    .line 440
    goto :goto_6

    .line 441
    :cond_e
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 442
    .line 443
    .line 444
    iget-object v0, p0, Ll/sjk;->u:Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;

    .line 445
    .line 446
    new-instance v3, Ll/ljk;

    .line 447
    .line 448
    invoke-direct {v3, p0}, Ll/ljk;-><init>(Ll/sjk;)V

    .line 449
    .line 450
    .line 451
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;->setTags(Ll/rcj;)V

    .line 452
    .line 453
    .line 454
    :goto_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 455
    .line 456
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    iget-object v3, p0, Ll/sjk;->C:Lv/VLinear;

    .line 461
    .line 462
    if-eqz v0, :cond_f

    .line 463
    .line 464
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 465
    .line 466
    .line 467
    goto :goto_7

    .line 468
    :cond_f
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 469
    .line 470
    .line 471
    iget-object v0, p0, Ll/sjk;->D:Lv/VText;

    .line 472
    .line 473
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 474
    .line 475
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 476
    .line 477
    .line 478
    :goto_7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 479
    .line 480
    .line 481
    move-result v0

    .line 482
    const-string v3, "noApplyRequired"

    .line 483
    .line 484
    if-eqz v0, :cond_11

    .line 485
    .line 486
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 487
    .line 488
    const-string v0, "exited"

    .line 489
    .line 490
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 491
    .line 492
    .line 493
    move-result p2

    .line 494
    if-nez p2, :cond_11

    .line 495
    .line 496
    iget-object p2, p0, Ll/sjk;->F:Lv/VFrame;

    .line 497
    .line 498
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 499
    .line 500
    .line 501
    iget-boolean p2, p0, Ll/sjk;->M:Z

    .line 502
    .line 503
    if-eqz p2, :cond_10

    .line 504
    .line 505
    iget-object p2, p0, Ll/sjk;->J:Ll/ijk;

    .line 506
    .line 507
    invoke-virtual {p2}, Ll/ijk;->pageId()Ljava/lang/String;

    .line 508
    .line 509
    .line 510
    move-result-object p2

    .line 511
    iget-object p3, p0, Ll/sjk;->J:Ll/ijk;

    .line 512
    .line 513
    invoke-virtual {p3}, Ll/ijk;->m0()Ljava/lang/String;

    .line 514
    .line 515
    .line 516
    move-result-object p3

    .line 517
    const-string v0, "groupchat_id"

    .line 518
    .line 519
    invoke-static {v0, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 520
    .line 521
    .line 522
    move-result-object p3

    .line 523
    const-string v0, "is_anonymou_group"

    .line 524
    .line 525
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 526
    .line 527
    .line 528
    move-result v4

    .line 529
    invoke-static {v0, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 530
    .line 531
    .line 532
    move-result-object v0

    .line 533
    filled-new-array {p3, v0}, [Ll/sfj0$a;

    .line 534
    .line 535
    .line 536
    move-result-object p3

    .line 537
    const-string v0, "e_enter_groupchat"

    .line 538
    .line 539
    invoke-static {v0, p2, p3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 540
    .line 541
    .line 542
    iput-boolean v1, p0, Ll/sjk;->M:Z

    .line 543
    .line 544
    :cond_10
    iget-object p2, p0, Ll/sjk;->H:Lv/VButton;

    .line 545
    .line 546
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->E:I

    .line 547
    .line 548
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 549
    .line 550
    .line 551
    iget-object p2, p0, Ll/sjk;->H:Lv/VButton;

    .line 552
    .line 553
    invoke-virtual {p2, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 554
    .line 555
    .line 556
    goto :goto_9

    .line 557
    :cond_11
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 558
    .line 559
    .line 560
    move-result p2

    .line 561
    if-eqz p2, :cond_12

    .line 562
    .line 563
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 564
    .line 565
    const-string p3, "default"

    .line 566
    .line 567
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 568
    .line 569
    .line 570
    move-result p2

    .line 571
    if-eqz p2, :cond_12

    .line 572
    .line 573
    iget-object p2, p0, Ll/sjk;->F:Lv/VFrame;

    .line 574
    .line 575
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 576
    .line 577
    .line 578
    iget-object p2, p0, Ll/sjk;->H:Lv/VButton;

    .line 579
    .line 580
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->y:I

    .line 581
    .line 582
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 583
    .line 584
    .line 585
    iget-object p2, p0, Ll/sjk;->H:Lv/VButton;

    .line 586
    .line 587
    invoke-virtual {p2, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 588
    .line 589
    .line 590
    goto :goto_9

    .line 591
    :cond_12
    iget-object p2, p0, Ll/sjk;->F:Lv/VFrame;

    .line 592
    .line 593
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 594
    .line 595
    .line 596
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 597
    .line 598
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 599
    .line 600
    .line 601
    move-result p2

    .line 602
    iget-object p3, p0, Ll/sjk;->H:Lv/VButton;

    .line 603
    .line 604
    if-eqz p2, :cond_13

    .line 605
    .line 606
    const-string p2, "\u52a0\u5165"

    .line 607
    .line 608
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 609
    .line 610
    .line 611
    goto :goto_8

    .line 612
    :cond_13
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->z:I

    .line 613
    .line 614
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(I)V

    .line 615
    .line 616
    .line 617
    :goto_8
    iget-object p2, p0, Ll/sjk;->H:Lv/VButton;

    .line 618
    .line 619
    invoke-virtual {p2, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 620
    .line 621
    .line 622
    :goto_9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 623
    .line 624
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 625
    .line 626
    .line 627
    move-result p1

    .line 628
    if-eqz p1, :cond_14

    .line 629
    .line 630
    iget-object p0, p0, Ll/sjk;->F:Lv/VFrame;

    .line 631
    .line 632
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 633
    .line 634
    .line 635
    :cond_14
    return-void
.end method

.method public final q0(Lcom/p1/mobile/putong/core/ui/view/SeekArc;Lv/VText;Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;)V
    .locals 4

    .line 1
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->backgroundColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->backgroundColor:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->setProgressColor(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->textColor:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->textColor:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-wide v0, p3, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->percentage:D

    .line 36
    .line 37
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 38
    .line 39
    mul-double/2addr v0, v2

    .line 40
    double-to-int p0, v0

    .line 41
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->setProgress(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->description:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/sjk;->w:Lv/VRelative;

    .line 9
    .line 10
    new-instance v1, Ll/mjk;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/mjk;-><init>(Ll/sjk;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/sjk;->H:Lv/VButton;

    .line 19
    .line 20
    new-instance v1, Ll/njk;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/njk;-><init>(Ll/sjk;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/sjk;->e:Lv/VText;

    .line 29
    .line 30
    new-instance v1, Ll/ojk;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/ojk;-><init>(Ll/sjk;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 39
    .line 40
    new-instance v1, Landroid/view/View;

    .line 41
    .line 42
    iget-object v2, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 43
    .line 44
    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Ll/sjk;->a:Lv/VScroll;

    .line 48
    .line 49
    new-instance v3, Ll/sjk$a;

    .line 50
    .line 51
    invoke-direct {v3, p0}, Ll/sjk$a;-><init>(Ll/sjk;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/sjk;->a:Lv/VScroll;

    .line 58
    .line 59
    new-instance v1, Ll/sjk$b;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/sjk$b;-><init>(Ll/sjk;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/sjk;->a:Lv/VScroll;

    .line 68
    .line 69
    new-instance v1, Ll/pjk;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/pjk;-><init>(Ll/sjk;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lv/VScroll;->d(Lv/VScroll$a;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/sjk;->G:Lv/VEditText;

    .line 78
    .line 79
    new-instance v1, Ll/qjk;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/qjk;-><init>(Ll/sjk;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final r0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/sjk;->I:Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->O:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/rjk;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/rjk;-><init>(Ll/sjk;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
