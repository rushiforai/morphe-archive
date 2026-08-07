.class public Ll/w0r;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w0r$h;,
        Ll/w0r$j;,
        Ll/w0r$l;,
        Ll/w0r$g;,
        Ll/w0r$i;,
        Ll/w0r$k;,
        Ll/w0r$f;
    }
.end annotation


# instance fields
.field public e:Ll/w0r$h;

.field public f:Ll/w0r$j;

.field public g:Ll/w0r$l;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/ListAdapter;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/ListAdapter;",
            ">;"
        }
    .end annotation
.end field

.field public j:Landroidx/recyclerview/widget/RecyclerView;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation
.end field

.field public l:Landroid/widget/EditText;

.field public m:Lcom/p1/mobile/android/app/Act;

.field public n:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ll/x20;

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public t:Landroid/widget/FrameLayout;

.field public u:Ll/w0r$k;

.field public v:Z

.field public w:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;",
            "Landroid/widget/EditText;",
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ll/x20;",
            "Z)V"
        }
    .end annotation

    .line 77
    invoke-direct {p0}, Ll/lb2;-><init>()V

    const/4 v0, 0x0

    .line 78
    iput-boolean v0, p0, Ll/w0r;->q:Z

    .line 79
    iput-boolean v0, p0, Ll/w0r;->r:Z

    .line 80
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Ll/w0r;->s:Ljava/util/Set;

    .line 81
    iput-boolean v0, p0, Ll/w0r;->v:Z

    const/4 v1, 0x0

    .line 82
    iput-object v1, p0, Ll/w0r;->w:Ljava/lang/Runnable;

    .line 83
    iput-object p1, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 84
    iput-object p3, p0, Ll/w0r;->n:Ll/y20;

    .line 85
    new-instance p1, Ll/w0r$h;

    invoke-direct {p1, p0, p2, p5}, Ll/w0r$h;-><init>(Ll/w0r;Ll/y20;Ljava/util/ArrayList;)V

    iput-object p1, p0, Ll/w0r;->e:Ll/w0r$h;

    .line 86
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ll/w0r;->h:Ljava/util/List;

    .line 87
    invoke-virtual {p0, p2, p6}, Ll/w0r;->M(Ll/y20;Ljava/util/List;)V

    .line 88
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ll/w0r;->k:Ljava/util/List;

    .line 89
    iput-object p4, p0, Ll/w0r;->l:Landroid/widget/EditText;

    .line 90
    iput-object p7, p0, Ll/w0r;->o:Ll/x20;

    .line 91
    iput-boolean p8, p0, Ll/w0r;->q:Z

    .line 92
    iput-boolean v0, p0, Ll/w0r;->p:Z

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;ZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;",
            "Landroid/widget/EditText;",
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ll/x20;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/w0r;->q:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/w0r;->r:Z

    .line 8
    .line 9
    new-instance v1, Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/w0r;->s:Ljava/util/Set;

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/w0r;->v:Z

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Ll/w0r;->w:Ljava/lang/Runnable;

    .line 20
    .line 21
    iput-object p1, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    iput-object p3, p0, Ll/w0r;->n:Ll/y20;

    .line 24
    .line 25
    new-instance p3, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p3, p0, Ll/w0r;->h:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p0, p2, p6}, Ll/w0r;->M(Ll/y20;Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    new-instance p3, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p3, p0, Ll/w0r;->k:Ljava/util/List;

    .line 41
    .line 42
    iput-object p4, p0, Ll/w0r;->l:Landroid/widget/EditText;

    .line 43
    .line 44
    iput-object p7, p0, Ll/w0r;->o:Ll/x20;

    .line 45
    .line 46
    iput-boolean p8, p0, Ll/w0r;->q:Z

    .line 47
    .line 48
    iput-boolean v0, p0, Ll/w0r;->p:Z

    .line 49
    .line 50
    iput-boolean p9, p0, Ll/w0r;->r:Z

    .line 51
    .line 52
    if-eqz p9, :cond_0

    .line 53
    .line 54
    new-instance p3, Ll/w0r$j;

    .line 55
    .line 56
    invoke-direct {p3, p0, p2, p5}, Ll/w0r$j;-><init>(Ll/w0r;Ll/y20;Ljava/util/ArrayList;)V

    .line 57
    .line 58
    .line 59
    iput-object p3, p0, Ll/w0r;->f:Ll/w0r$j;

    .line 60
    .line 61
    new-instance p2, Ll/w0r$l;

    .line 62
    .line 63
    invoke-direct {p2, p0, p1}, Ll/w0r$l;-><init>(Ll/w0r;Lcom/p1/mobile/android/app/Act;)V

    .line 64
    .line 65
    .line 66
    iput-object p2, p0, Ll/w0r;->g:Ll/w0r$l;

    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    new-instance p1, Ll/w0r$h;

    .line 70
    .line 71
    invoke-direct {p1, p0, p2, p5}, Ll/w0r$h;-><init>(Ll/w0r;Ll/y20;Ljava/util/ArrayList;)V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Ll/w0r;->e:Ll/w0r$h;

    .line 75
    .line 76
    return-void
.end method

.method public static bridge synthetic A(Ll/w0r;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/w0r;->v:Z

    return p0
.end method

.method public static bridge synthetic C(Ll/w0r;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/w0r;->v:Z

    return-void
.end method

.method public static bridge synthetic D(Ll/w0r;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w0r;->K()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic E(Ll/w0r;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w0r;->P()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic F(Ll/w0r;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w0r;->T()V

    return-void
.end method

.method public static bridge synthetic G(Ll/w0r;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w0r;->U()V

    return-void
.end method

.method public static bridge synthetic H(Ll/w0r;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r;->b0(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-void
.end method

.method public static bridge synthetic I(Ll/w0r;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r;->d0(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-void
.end method

.method public static synthetic q(Ll/w0r;Ll/y20;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w0r;->Q(Ll/y20;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic r()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic s(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/oze$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, v1, v1}, Ll/oze$a;-><init>(Ljava/lang/String;II)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic t(Ll/w0r;Landroid/view/View;Landroid/view/View;Landroid/view/View;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/w0r;->R(Landroid/view/View;Landroid/view/View;Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/data/Sticker;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->h6:I

    .line 65
    .line 66
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 67
    .line 68
    .line 69
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 70
    .line 71
    new-instance p1, Ll/u0r;

    .line 72
    .line 73
    invoke-direct {p1}, Ll/u0r;-><init>()V

    .line 74
    .line 75
    .line 76
    const-wide/16 v0, 0x32

    .line 77
    .line 78
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static synthetic v()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic w(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 8
    .line 9
    const v0, 0x9d87

    .line 10
    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->g6:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 26
    .line 27
    new-instance v0, Ll/v0r;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/v0r;-><init>()V

    .line 30
    .line 31
    .line 32
    const-wide/16 v1, 0x32

    .line 33
    .line 34
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic x(Ll/w0r;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w0r;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic z(Ll/w0r;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r;->w:Ljava/lang/Runnable;

    return-object p0
.end method


# virtual methods
.method public J(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 59
    .line 60
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    const/16 v1, 0x12c

    .line 93
    .line 94
    if-lt v0, v1, :cond_0

    .line 95
    .line 96
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 97
    .line 98
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_0
    iget-object p0, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 109
    .line 110
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/z$c;->O(Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    new-instance v0, Ll/s0r;

    .line 119
    .line 120
    invoke-direct {v0, p1}, Ll/s0r;-><init>(Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 121
    .line 122
    .line 123
    new-instance p1, Ll/t0r;

    .line 124
    .line 125
    invoke-direct {p1}, Ll/t0r;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public final K()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w0r;->l:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/w0r;->l:Landroid/widget/EditText;

    .line 16
    .line 17
    new-instance v0, Landroid/view/KeyEvent;

    .line 18
    .line 19
    const/16 v1, 0x43

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-direct {v0, v2, v1}, Landroid/view/KeyEvent;-><init>(II)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 26
    .line 27
    .line 28
    return v2
.end method

.method public final L(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x41200000    # 10.0f

    .line 8
    .line 9
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    neg-int p0, p0

    .line 14
    invoke-static {p1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    invoke-static {p1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final M(Ll/y20;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/w0r;->i:Ljava/util/List;

    .line 7
    .line 8
    new-instance v0, Ll/q0r;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Ll/q0r;-><init>(Ll/w0r;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public N(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/PopupWindow;
    .locals 6

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/qec0;->u3:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Ll/edc0;->y1:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VImage;

    .line 19
    .line 20
    sget v2, Ll/edc0;->A4:I

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lv/VText;

    .line 27
    .line 28
    sget v3, Ll/edc0;->M0:I

    .line 29
    .line 30
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lv/VText;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    const/4 v5, 0x1

    .line 41
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1, v1, v2}, Ll/w0r;->e0(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 45
    .line 46
    .line 47
    new-instance p0, Landroid/widget/PopupWindow;

    .line 48
    .line 49
    const/4 v1, -0x2

    .line 50
    invoke-direct {p0, p1, v1, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 51
    .line 52
    .line 53
    invoke-static {p3}, Ll/eu0;->b(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    invoke-static {p3}, Ll/eu0;->b(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    const/4 p1, 0x0

    .line 66
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    new-instance p1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string p2, "["

    .line 72
    .line 73
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p2, "]"

    .line 80
    .line 81
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 93
    .line 94
    .line 95
    :goto_0
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    return-object p0
.end method

.method public O(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/PopupWindow;
    .locals 4

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/qec0;->w3:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Ll/edc0;->y1:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VImage;

    .line 19
    .line 20
    sget v2, Ll/edc0;->A4:I

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lv/VText;

    .line 27
    .line 28
    sget v3, Ll/edc0;->M0:I

    .line 29
    .line 30
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lv/VText;

    .line 35
    .line 36
    invoke-virtual {p0, p1, v1, v2}, Ll/w0r;->d0(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Landroid/widget/PopupWindow;

    .line 40
    .line 41
    const/4 v1, -0x2

    .line 42
    invoke-direct {p0, p1, v1, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 43
    .line 44
    .line 45
    invoke-static {p3}, Ll/eu0;->b(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    invoke-static {p3}, Ll/eu0;->b(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    const/4 p1, 0x1

    .line 55
    invoke-static {v3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string p2, "["

    .line 65
    .line 66
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p2, "]"

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 86
    .line 87
    .line 88
    :goto_0
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    return-object p0
.end method

.method public final P()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/w0r;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic Q(Ll/y20;Ljava/util/List;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/r0r;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/r0r;-><init>(Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p2, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Ll/w0r;->i:Ljava/util/List;

    .line 15
    .line 16
    new-instance v1, Ll/w0r$h;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1, v0}, Ll/w0r$h;-><init>(Ll/w0r;Ll/y20;Ljava/util/ArrayList;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic R(Landroid/view/View;Landroid/view/View;Landroid/view/View;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/w0r;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-boolean p1, p0, Ll/w0r;->r:Z

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, p1}, Ll/w0r;->X(Z)V

    .line 29
    .line 30
    .line 31
    const/high16 p0, 0x41200000    # 10.0f

    .line 32
    .line 33
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    neg-int p0, p0

    .line 38
    invoke-static {p3, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0, p3, p2}, Ll/w0r;->L(Landroid/view/View;Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/w0r;->o:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/w0r;->o:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final T()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w0r;->w:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/w0r$e;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/w0r$e;-><init>(Ll/w0r;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/w0r;->w:Ljava/lang/Runnable;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iget-object p0, p0, Ll/w0r;->w:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-long v1, v1

    .line 21
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final U()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0r;->w:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/w0r;->w:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/w0r;->w:Ljava/lang/Runnable;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public V(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/w0r;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/w0r;->f:Ll/w0r$j;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-boolean v0, p0, Ll/w0r;->p:Z

    .line 11
    .line 12
    const-string v1, "custom_stickers"

    .line 13
    .line 14
    if-nez v0, :cond_4

    .line 15
    .line 16
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/w0r;->k:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/w0r;->h:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/w0r;->k:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Ll/w0r;->k:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ll/pf60;

    .line 54
    .line 55
    iget-object v2, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 56
    .line 57
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    iget-object v2, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_2

    .line 74
    .line 75
    new-instance v2, Ll/w0r$g;

    .line 76
    .line 77
    iget-object v3, p0, Ll/w0r;->n:Ll/y20;

    .line 78
    .line 79
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v0, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 82
    .line 83
    iget-object v4, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    invoke-direct {v2, p0, v3, v0, v4}, Ll/w0r$g;-><init>(Ll/w0r;Ll/y20;Lcom/p1/mobile/putong/core/data/StickerPackage;Lcom/p1/mobile/android/app/Act;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/w0r;->h:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    iget-object v2, p0, Ll/w0r;->h:Ljava/util/List;

    .line 95
    .line 96
    new-instance v3, Ll/w0r$i;

    .line 97
    .line 98
    iget-object v4, p0, Ll/w0r;->n:Ll/y20;

    .line 99
    .line 100
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v0, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 103
    .line 104
    invoke-direct {v3, p0, v4, v0}, Ll/w0r$i;-><init>(Ll/w0r;Ll/y20;Lcom/p1/mobile/putong/core/data/StickerPackage;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 112
    .line 113
    .line 114
    const/4 p1, 0x1

    .line 115
    iput-boolean p1, p0, Ll/w0r;->p:Z

    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_5

    .line 123
    .line 124
    iget-object v0, p0, Ll/w0r;->h:Ljava/util/List;

    .line 125
    .line 126
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_5

    .line 131
    .line 132
    const/4 v0, 0x0

    .line 133
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    check-cast p1, Ll/pf60;

    .line 138
    .line 139
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 140
    .line 141
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-eqz v2, :cond_5

    .line 146
    .line 147
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 148
    .line 149
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 150
    .line 151
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_5

    .line 158
    .line 159
    iget-object v1, p0, Ll/w0r;->h:Ljava/util/List;

    .line 160
    .line 161
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    instance-of v1, v1, Ll/w0r$g;

    .line 166
    .line 167
    if-eqz v1, :cond_5

    .line 168
    .line 169
    iget-object p0, p0, Ll/w0r;->h:Ljava/util/List;

    .line 170
    .line 171
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    check-cast p0, Ll/w0r$g;

    .line 176
    .line 177
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 178
    .line 179
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 180
    .line 181
    invoke-virtual {p0, p1}, Ll/w0r$g;->K(Lcom/p1/mobile/putong/core/data/StickerPackage;)V

    .line 182
    .line 183
    .line 184
    :cond_5
    return-void
.end method

.method public W()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/w0r;->p:Z

    .line 3
    .line 4
    return-void
.end method

.method public final X(Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 p1, 0x43290000    # 169.0f

    .line 6
    .line 7
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v2, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-static {v2}, Ll/bnl0;->z0(Landroid/content/Context;)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    div-int/lit8 v2, v2, 0x7

    .line 18
    .line 19
    mul-int/lit8 v2, v2, 0x3

    .line 20
    .line 21
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object p0, p0, Ll/w0r;->t:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    new-array v1, v1, [Landroid/view/View;

    .line 28
    .line 29
    aput-object p0, v1, v0

    .line 30
    .line 31
    invoke-static {p1, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const/high16 p1, 0x42900000    # 72.0f

    .line 36
    .line 37
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget-object v2, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    invoke-static {v2}, Ll/bnl0;->z0(Landroid/content/Context;)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    div-int/lit8 v2, v2, 0x7

    .line 48
    .line 49
    mul-int/lit8 v2, v2, 0x2

    .line 50
    .line 51
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget-object p0, p0, Ll/w0r;->t:Landroid/widget/FrameLayout;

    .line 56
    .line 57
    new-array v1, v1, [Landroid/view/View;

    .line 58
    .line 59
    aput-object p0, v1, v0

    .line 60
    .line 61
    invoke-static {p1, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public Y()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/w0r;->s:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    instance-of v1, v0, Landroid/widget/GridView;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    check-cast v0, Landroid/widget/GridView;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/widget/GridView;->smoothScrollToPosition(I)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    return-void
.end method

.method public final Z(Landroid/view/View;Landroid/view/View;Landroid/view/View;I)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->t1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/w0r;->q:Z

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    move v0, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v0, v1

    .line 24
    :goto_0
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ll/r97;->t1()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-boolean v0, p0, Ll/w0r;->q:Z

    .line 42
    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    move v0, v2

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    move v0, v1

    .line 48
    :goto_1
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-boolean v0, p0, Ll/w0r;->r:Z

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0}, Ll/r97;->t1()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    iget-boolean v0, p0, Ll/w0r;->q:Z

    .line 70
    .line 71
    if-nez v0, :cond_2

    .line 72
    .line 73
    move v0, v2

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    move v0, v1

    .line 76
    :goto_2
    iget-object v3, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    iget-object v4, p0, Ll/w0r;->t:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    sget v5, Ll/ibc0;->Q2:I

    .line 81
    .line 82
    invoke-static {v3, v4, v5}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ll/w0r;->X(Z)V

    .line 86
    .line 87
    .line 88
    const/high16 v0, 0x41200000    # 10.0f

    .line 89
    .line 90
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    neg-int v0, v0

    .line 95
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 96
    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_3
    invoke-virtual {p0, p1, p3}, Ll/w0r;->L(Landroid/view/View;Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    :goto_3
    iget-object v0, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {v3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-interface {v3}, Ll/r97;->Z1()Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v3, Ll/n0r;

    .line 125
    .line 126
    invoke-direct {v3, p0, p2, p3, p1}, Ll/n0r;-><init>(Ll/w0r;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {v0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    new-instance p2, Ll/o0r;

    .line 137
    .line 138
    invoke-direct {p2, p0}, Ll/o0r;-><init>(Ll/w0r;)V

    .line 139
    .line 140
    .line 141
    invoke-static {p3, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 142
    .line 143
    .line 144
    iget-object p2, p0, Ll/w0r;->l:Landroid/widget/EditText;

    .line 145
    .line 146
    invoke-virtual {p2}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    if-nez p2, :cond_4

    .line 151
    .line 152
    const/4 p2, 0x0

    .line 153
    goto :goto_4

    .line 154
    :cond_4
    iget-object p2, p0, Ll/w0r;->l:Landroid/widget/EditText;

    .line 155
    .line 156
    invoke-virtual {p2}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    :goto_4
    if-eqz p2, :cond_5

    .line 165
    .line 166
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-nez v0, :cond_5

    .line 175
    .line 176
    move v0, v2

    .line 177
    goto :goto_5

    .line 178
    :cond_5
    move v0, v1

    .line 179
    :goto_5
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 180
    .line 181
    .line 182
    if-eqz p2, :cond_6

    .line 183
    .line 184
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    if-nez p2, :cond_6

    .line 193
    .line 194
    move v1, v2

    .line 195
    :cond_6
    invoke-virtual {p3, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 196
    .line 197
    .line 198
    new-instance p2, Ll/w0r$k;

    .line 199
    .line 200
    invoke-direct {p2, p1, p3, p4}, Ll/w0r$k;-><init>(Landroid/view/View;Landroid/view/View;I)V

    .line 201
    .line 202
    .line 203
    iput-object p2, p0, Ll/w0r;->u:Ll/w0r$k;

    .line 204
    .line 205
    iget-object p3, p0, Ll/w0r;->l:Landroid/widget/EditText;

    .line 206
    .line 207
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 208
    .line 209
    .line 210
    new-instance p2, Ll/p0r;

    .line 211
    .line 212
    invoke-direct {p2}, Ll/p0r;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 216
    .line 217
    .line 218
    new-instance p2, Ll/w0r$d;

    .line 219
    .line 220
    invoke-direct {p2, p0}, Ll/w0r$d;-><init>(Ll/w0r;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 224
    .line 225
    .line 226
    return-void
.end method

.method public final a0(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final b0(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string p1, "#212121"

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public c0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0r;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/w0r;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final d0(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w0r;->P()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget p0, Ll/ibc0;->n2:I

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const-string p1, "#ccffffff"

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    sget p0, Ll/ibc0;->q4:I

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    const-string p1, "#212121"

    .line 51
    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    :cond_2
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_3

    .line 66
    .line 67
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    :cond_3
    return-void
.end method

.method public final e0(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string p1, "#212121"

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public f0(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V
    .locals 10

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    new-array v1, v0, [I

    .line 11
    .line 12
    invoke-virtual {p2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v2, v3, v3}, Landroid/view/View;->measure(II)V

    .line 21
    .line 22
    .line 23
    aget v3, v1, v3

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    div-int/2addr v4, v0

    .line 30
    add-int/2addr v4, v3

    .line 31
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    div-int/2addr v5, v0

    .line 36
    sub-int/2addr v4, v5

    .line 37
    const/4 v5, 0x1

    .line 38
    aget v6, v1, v5

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    sub-int/2addr v6, v7

    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    add-int/2addr v7, v4

    .line 50
    invoke-static {}, Ll/bnl0;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    sget v9, Ll/qa00;->a:I

    .line 55
    .line 56
    sub-int/2addr v8, v9

    .line 57
    if-le v7, v8, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/bnl0;->y0()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    sub-int/2addr v4, v9

    .line 64
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    sub-int/2addr v4, v7

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    if-ge v4, v9, :cond_1

    .line 71
    .line 72
    move v4, v9

    .line 73
    :cond_1
    :goto_0
    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 74
    .line 75
    .line 76
    sget v1, Ll/edc0;->i:I

    .line 77
    .line 78
    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Landroid/widget/FrameLayout;

    .line 83
    .line 84
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    div-int/2addr v2, v0

    .line 89
    add-int/2addr v3, v2

    .line 90
    sget v0, Ll/qa00;->g:I

    .line 91
    .line 92
    add-int/2addr v0, v4

    .line 93
    sub-int/2addr v3, v0

    .line 94
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 99
    .line 100
    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 101
    .line 102
    const/16 v0, 0x33

    .line 103
    .line 104
    invoke-virtual {p1, p2, v0, v4, v6}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v5}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v5}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-interface {p2, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 121
    .line 122
    .line 123
    new-instance p2, Ll/w0r$b;

    .line 124
    .line 125
    invoke-direct {p2, p0, p3}, Ll/w0r$b;-><init>(Ll/w0r;Landroid/view/View;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, p2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public g0(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    new-array v1, v0, [I

    .line 11
    .line 12
    invoke-virtual {p2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v2, v3, v3}, Landroid/view/View;->measure(II)V

    .line 21
    .line 22
    .line 23
    aget v3, v1, v3

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    div-int/2addr v4, v0

    .line 30
    add-int/2addr v3, v4

    .line 31
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    div-int/2addr v4, v0

    .line 36
    sub-int/2addr v3, v4

    .line 37
    const/4 v0, 0x1

    .line 38
    aget v1, v1, v0

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    sub-int/2addr v1, v4

    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    add-int/2addr v4, v3

    .line 50
    invoke-static {}, Ll/bnl0;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    sget v6, Ll/qa00;->a:I

    .line 55
    .line 56
    sub-int/2addr v5, v6

    .line 57
    if-le v4, v5, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/bnl0;->y0()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    sub-int/2addr v3, v6

    .line 64
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    sub-int/2addr v3, v2

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    if-ge v3, v6, :cond_1

    .line 71
    .line 72
    move v3, v6

    .line 73
    :cond_1
    :goto_0
    const/16 v2, 0x33

    .line 74
    .line 75
    invoke-virtual {p1, p2, v2, v3, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-interface {p2, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 92
    .line 93
    .line 94
    new-instance p2, Ll/w0r$c;

    .line 95
    .line 96
    invoke-direct {p2, p0, p3}, Ll/w0r$c;-><init>(Ll/w0r;Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, p2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public getCount()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/w0r;->r:Z

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object p0, p0, Ll/w0r;->k:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    add-int/2addr p0, v1

    .line 14
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/w0r;->u:Ll/w0r$k;

    .line 4
    .line 5
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/w0r;->u:Ll/w0r$k;

    .line 12
    .line 13
    iget v0, p2, Ll/w0r$k;->c:I

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/w0r;->l:Landroid/widget/EditText;

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    .line 23
    .line 24
    check-cast p3, Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p1, p3}, Landroidx/viewpager/widget/ViewPager;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, -0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x2

    .line 5
    if-eqz p2, :cond_4

    .line 6
    .line 7
    const/4 v4, 0x1

    .line 8
    if-eq p2, v4, :cond_4

    .line 9
    .line 10
    if-ne p2, v3, :cond_0

    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :cond_0
    iget-boolean v5, p0, Ll/w0r;->r:Z

    .line 15
    .line 16
    const/4 v6, 0x4

    .line 17
    if-eqz v5, :cond_1

    .line 18
    .line 19
    if-ne p2, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget v2, Ll/qec0;->X1:I

    .line 30
    .line 31
    invoke-virtual {p2, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    sget v0, Ll/edc0;->W0:I

    .line 36
    .line 37
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lv/VRecyclerView;

    .line 42
    .line 43
    new-instance v2, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 44
    .line 45
    iget-object v3, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-direct {v2, v3, v6}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Ll/w0r;->g:Ll/w0r$l;

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 56
    .line 57
    .line 58
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 59
    .line 60
    invoke-direct {v2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 61
    .line 62
    .line 63
    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    .line 64
    .line 65
    invoke-virtual {p1, p2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/w0r;->s:Ljava/util/Set;

    .line 69
    .line 70
    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    return-object p2

    .line 74
    :cond_1
    new-instance v0, Landroid/widget/GridView;

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-direct {v0, v1}, Landroid/widget/GridView;-><init>(Landroid/content/Context;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v3}, Landroid/view/View;->setOverScrollMode(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/view/View;->setScrollBarSize(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v6}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ll/bnl0;->y0()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    div-int/2addr v1, v6

    .line 97
    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setColumnWidth(I)V

    .line 98
    .line 99
    .line 100
    iget-boolean v1, p0, Ll/w0r;->r:Z

    .line 101
    .line 102
    if-eqz v1, :cond_2

    .line 103
    .line 104
    if-ne p2, v4, :cond_2

    .line 105
    .line 106
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 107
    .line 108
    .line 109
    const/high16 v1, 0x41200000    # 10.0f

    .line 110
    .line 111
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-static {v0, v1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 116
    .line 117
    .line 118
    const/high16 v1, 0x40000000    # 2.0f

    .line 119
    .line 120
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    invoke-static {v0, v2}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 132
    .line 133
    .line 134
    :cond_2
    iget-object v1, p0, Ll/w0r;->h:Ljava/util/List;

    .line 135
    .line 136
    add-int/lit8 p2, p2, -0x3

    .line 137
    .line 138
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    check-cast p2, Landroid/widget/ListAdapter;

    .line 143
    .line 144
    invoke-virtual {v0, p2}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 145
    .line 146
    .line 147
    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    iget-boolean p1, p0, Ll/w0r;->r:Z

    .line 153
    .line 154
    if-eqz p1, :cond_3

    .line 155
    .line 156
    invoke-virtual {v0, v4}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p0, Ll/w0r;->s:Ljava/util/Set;

    .line 160
    .line 161
    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    :cond_3
    return-object v0

    .line 165
    :cond_4
    :goto_0
    iget-boolean v4, p0, Ll/w0r;->r:Z

    .line 166
    .line 167
    if-eqz v4, :cond_5

    .line 168
    .line 169
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-static {v4}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    sget v5, Ll/qec0;->W1:I

    .line 178
    .line 179
    invoke-virtual {v4, v5, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    goto :goto_1

    .line 184
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    invoke-static {v4}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    sget v5, Ll/qec0;->r2:I

    .line 193
    .line 194
    invoke-virtual {v4, v5, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    :goto_1
    iget-boolean v4, p0, Ll/w0r;->r:Z

    .line 199
    .line 200
    const/4 v5, 0x7

    .line 201
    const/high16 v6, 0x42700000    # 60.0f

    .line 202
    .line 203
    if-eqz v4, :cond_6

    .line 204
    .line 205
    sget v4, Ll/edc0;->J0:I

    .line 206
    .line 207
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    .line 212
    .line 213
    iput-object v4, p0, Ll/w0r;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 214
    .line 215
    new-instance v4, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 216
    .line 217
    iget-object v7, p0, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 218
    .line 219
    invoke-direct {v4, v7, v5}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 220
    .line 221
    .line 222
    iget-object v7, p0, Ll/w0r;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 223
    .line 224
    invoke-virtual {v7, v4}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 225
    .line 226
    .line 227
    new-instance v7, Ll/w0r$a;

    .line 228
    .line 229
    invoke-direct {v7, p0, v5}, Ll/w0r$a;-><init>(Ll/w0r;I)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v4, v7}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 233
    .line 234
    .line 235
    iget-object v4, p0, Ll/w0r;->f:Ll/w0r$j;

    .line 236
    .line 237
    iget-object v7, p0, Ll/w0r;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 238
    .line 239
    invoke-virtual {v4, v7}, Ll/w0r$j;->A(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 240
    .line 241
    .line 242
    iget-object v4, p0, Ll/w0r;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 243
    .line 244
    iget-object v7, p0, Ll/w0r;->f:Ll/w0r$j;

    .line 245
    .line 246
    invoke-virtual {v4, v7}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 247
    .line 248
    .line 249
    iget-object v4, p0, Ll/w0r;->s:Ljava/util/Set;

    .line 250
    .line 251
    iget-object v7, p0, Ll/w0r;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 252
    .line 253
    invoke-interface {v4, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    goto :goto_3

    .line 257
    :cond_6
    sget v4, Ll/edc0;->a:I

    .line 258
    .line 259
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object v4

    .line 263
    check-cast v4, Landroid/widget/GridView;

    .line 264
    .line 265
    invoke-virtual {v4, v3}, Landroid/view/View;->setOverScrollMode(I)V

    .line 266
    .line 267
    .line 268
    if-nez p2, :cond_7

    .line 269
    .line 270
    const/high16 v7, 0x41000000    # 8.0f

    .line 271
    .line 272
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 273
    .line 274
    .line 275
    move-result v7

    .line 276
    invoke-virtual {p0, v4, v7}, Ll/w0r;->a0(Landroid/view/View;I)V

    .line 277
    .line 278
    .line 279
    goto :goto_2

    .line 280
    :cond_7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 281
    .line 282
    .line 283
    move-result v5

    .line 284
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 285
    .line 286
    .line 287
    move-result v7

    .line 288
    div-int/2addr v5, v7

    .line 289
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 290
    .line 291
    .line 292
    move-result v7

    .line 293
    invoke-virtual {v4, v7}, Landroid/widget/GridView;->setColumnWidth(I)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p0, v4, v2}, Ll/w0r;->a0(Landroid/view/View;I)V

    .line 297
    .line 298
    .line 299
    :goto_2
    invoke-virtual {v4, v5}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 300
    .line 301
    .line 302
    if-nez p2, :cond_8

    .line 303
    .line 304
    iget-object v7, p0, Ll/w0r;->e:Ll/w0r$h;

    .line 305
    .line 306
    invoke-virtual {v4, v7}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 307
    .line 308
    .line 309
    goto :goto_3

    .line 310
    :cond_8
    iget-object v7, p0, Ll/w0r;->i:Ljava/util/List;

    .line 311
    .line 312
    invoke-interface {v7, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v7

    .line 316
    check-cast v7, Landroid/widget/ListAdapter;

    .line 317
    .line 318
    invoke-virtual {v4, v7}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 319
    .line 320
    .line 321
    :goto_3
    new-instance v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 322
    .line 323
    invoke-direct {v4, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 324
    .line 325
    .line 326
    invoke-static {}, Ll/bnl0;->y0()I

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 331
    .line 332
    .line 333
    move-result v6

    .line 334
    mul-int/2addr v5, v6

    .line 335
    sub-int/2addr v1, v5

    .line 336
    div-int/2addr v1, v3

    .line 337
    invoke-virtual {v4, v1, v2, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 338
    .line 339
    .line 340
    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    .line 341
    .line 342
    invoke-virtual {p1, v0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 343
    .line 344
    .line 345
    sget p1, Ll/edc0;->L0:I

    .line 346
    .line 347
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    sget v1, Ll/edc0;->K0:I

    .line 352
    .line 353
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    sget v2, Ll/edc0;->I0:I

    .line 358
    .line 359
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 360
    .line 361
    .line 362
    move-result-object v2

    .line 363
    check-cast v2, Landroid/widget/ImageView;

    .line 364
    .line 365
    sget v3, Ll/edc0;->H0:I

    .line 366
    .line 367
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 368
    .line 369
    .line 370
    move-result-object v3

    .line 371
    check-cast v3, Landroid/widget/FrameLayout;

    .line 372
    .line 373
    iput-object v3, p0, Ll/w0r;->t:Landroid/widget/FrameLayout;

    .line 374
    .line 375
    invoke-virtual {p0}, Ll/w0r;->P()Z

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    if-eqz v3, :cond_9

    .line 380
    .line 381
    sget v3, Ll/ibc0;->m2:I

    .line 382
    .line 383
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 384
    .line 385
    .line 386
    sget v3, Ll/ibc0;->V3:I

    .line 387
    .line 388
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 389
    .line 390
    .line 391
    goto :goto_8

    .line 392
    :cond_9
    iget-boolean v3, p0, Ll/w0r;->r:Z

    .line 393
    .line 394
    if-eqz v3, :cond_c

    .line 395
    .line 396
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 397
    .line 398
    .line 399
    move-result-object v3

    .line 400
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 401
    .line 402
    .line 403
    move-result-object v3

    .line 404
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 405
    .line 406
    .line 407
    move-result v3

    .line 408
    if-eqz v3, :cond_a

    .line 409
    .line 410
    sget v3, Ll/ibc0;->l2:I

    .line 411
    .line 412
    goto :goto_4

    .line 413
    :cond_a
    sget v3, Ll/ibc0;->k2:I

    .line 414
    .line 415
    :goto_4
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 416
    .line 417
    .line 418
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 419
    .line 420
    .line 421
    move-result-object v3

    .line 422
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 423
    .line 424
    .line 425
    move-result-object v3

    .line 426
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 427
    .line 428
    .line 429
    move-result v3

    .line 430
    if-eqz v3, :cond_b

    .line 431
    .line 432
    sget v3, Ll/ibc0;->U3:I

    .line 433
    .line 434
    goto :goto_5

    .line 435
    :cond_b
    sget v3, Ll/ibc0;->H3:I

    .line 436
    .line 437
    :goto_5
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 438
    .line 439
    .line 440
    goto :goto_8

    .line 441
    :cond_c
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 442
    .line 443
    .line 444
    move-result-object v3

    .line 445
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 446
    .line 447
    .line 448
    move-result-object v3

    .line 449
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 450
    .line 451
    .line 452
    move-result v3

    .line 453
    if-eqz v3, :cond_d

    .line 454
    .line 455
    sget v3, Ll/ibc0;->l2:I

    .line 456
    .line 457
    goto :goto_6

    .line 458
    :cond_d
    sget v3, Ll/ibc0;->k2:I

    .line 459
    .line 460
    :goto_6
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 461
    .line 462
    .line 463
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 464
    .line 465
    .line 466
    move-result-object v3

    .line 467
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 468
    .line 469
    .line 470
    move-result-object v3

    .line 471
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 472
    .line 473
    .line 474
    move-result v3

    .line 475
    if-eqz v3, :cond_e

    .line 476
    .line 477
    sget v3, Ll/ibc0;->U3:I

    .line 478
    .line 479
    goto :goto_7

    .line 480
    :cond_e
    sget v3, Ll/ibc0;->T3:I

    .line 481
    .line 482
    :goto_7
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 483
    .line 484
    .line 485
    :goto_8
    invoke-virtual {p0, v2, p1, v1, p2}, Ll/w0r;->Z(Landroid/view/View;Landroid/view/View;Landroid/view/View;I)V

    .line 486
    .line 487
    .line 488
    return-object v0
.end method
