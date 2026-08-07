.class public Ll/kqk;
.super Landroid/app/Dialog;
.source "SourceFile"

# interfaces
.implements Ll/wdk;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kqk$d;
    }
.end annotation


# static fields
.field public static w:Z


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/EditText;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VRecyclerView;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lv/VImage;

.field public m:Lv/VText;

.field public n:Z

.field public o:Ljava/lang/String;

.field public p:Z

.field public q:Ll/l4g0;

.field public r:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public s:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ll/kqk$d;

.field public u:Lcom/p1/mobile/android/app/Act;

.field public v:Ll/cek;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Ll/kqk;->n:Z

    .line 6
    .line 7
    iput-boolean p2, p0, Ll/kqk;->p:Z

    .line 8
    .line 9
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p0, Ll/kqk;->r:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iput-object p2, p0, Ll/kqk;->s:Lrx/subjects/a;

    .line 20
    .line 21
    iput-object p1, p0, Ll/kqk;->u:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic b(Ll/kqk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kqk;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/dek;Ll/dek;)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dek;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "#"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/dek;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/dek;->g:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    iget-object v0, p1, Ll/dek;->g:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    :cond_1
    iget-object p0, p0, Ll/dek;->g:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_2
    const/4 p0, -0x1

    .line 46
    return p0

    .line 47
    :cond_3
    iget-object p0, p0, Ll/dek;->g:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p1, p1, Ll/dek;->g:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method

.method public static synthetic d(Ll/kqk;Landroid/util/Pair;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kqk;->v(Landroid/util/Pair;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/kqk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kqk;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/kqk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kqk;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/kqk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kqk;->x(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ll/kqk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kqk;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k(Ll/kqk;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kqk;->w(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic l(Ll/kqk;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kqk;->n:Z

    return p0
.end method

.method public static bridge synthetic m(Ll/kqk;)Ll/kqk$d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kqk;->t:Ll/kqk$d;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/kqk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kqk;->s()V

    return-void
.end method

.method public static bridge synthetic o(Ll/kqk;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kqk;->D(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/kqk;->w:Z

    return-void
.end method

.method public static r()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/kqk;->w:Z

    .line 2
    .line 3
    return v0
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/kqk;->d:Landroid/widget/EditText;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/kqk;->f:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/kqk;->c:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/kqk;->d:Landroid/widget/EditText;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/kqk;->s()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kqk;->s()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kqk;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public C(Ll/kqk$d;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kqk;->t:Ll/kqk$d;

    .line 2
    .line 3
    iput-object p2, p0, Ll/kqk;->o:Ljava/lang/String;

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput-boolean p1, p0, Ll/kqk;->p:Z

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/e;->Q8(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    iput-boolean p1, p0, Ll/kqk;->n:Z

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    sput-boolean p0, Ll/kqk;->w:Z

    .line 34
    .line 35
    return-void
.end method

.method public final D(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/kqk;->r:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/CharSequence;

    .line 12
    .line 13
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Ll/kqk;->r:Lrx/subjects/a;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public a(Ll/dek;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/kqk;->n:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kqk;->dismiss()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/kqk;->t:Ll/kqk$d;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/kqk;->t:Ll/kqk$d;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/kqk$d;->a(Ll/dek;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public dismiss()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    sput-boolean p0, Ll/kqk;->w:Z

    .line 6
    .line 7
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/kqk;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/cek;

    .line 17
    .line 18
    iget-object v0, p0, Ll/kqk;->u:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-direct {p1, v0, p0}, Ll/cek;-><init>(Landroid/content/Context;Ll/wdk;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/kqk;->v:Ll/cek;

    .line 24
    .line 25
    iget-object p1, p0, Ll/kqk;->j:Lv/VRecyclerView;

    .line 26
    .line 27
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 28
    .line 29
    iget-object v1, p0, Ll/kqk;->u:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x1

    .line 33
    invoke-direct {v0, v1, v3, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/kqk;->j:Lv/VRecyclerView;

    .line 40
    .line 41
    iget-object v0, p0, Ll/kqk;->v:Ll/cek;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/kqk;->h:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const/16 v0, 0x50

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/Window;->setGravity(I)V

    .line 62
    .line 63
    .line 64
    sget v0, Ll/cgc0;->f:I

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/4 v1, -0x1

    .line 74
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 75
    .line 76
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/kqk;->u()V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/kqk;->d:Landroid/widget/EditText;

    .line 85
    .line 86
    new-instance v0, Ll/kqk$a;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/kqk$a;-><init>(Ll/kqk;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/kqk;->g:Lv/VImage;

    .line 95
    .line 96
    new-instance v0, Ll/zpk;

    .line 97
    .line 98
    invoke-direct {v0, p0}, Ll/zpk;-><init>(Ll/kqk;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/kqk;->i:Lv/VImage;

    .line 105
    .line 106
    new-instance v0, Ll/bqk;

    .line 107
    .line 108
    invoke-direct {v0, p0}, Ll/bqk;-><init>(Ll/kqk;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/kqk;->e:Landroid/widget/TextView;

    .line 115
    .line 116
    new-instance v0, Ll/cqk;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Ll/cqk;-><init>(Ll/kqk;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/kqk;->a:Landroid/widget/FrameLayout;

    .line 125
    .line 126
    new-instance v0, Ll/dqk;

    .line 127
    .line 128
    invoke-direct {v0, p0}, Ll/dqk;-><init>(Ll/kqk;)V

    .line 129
    .line 130
    .line 131
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Ll/kqk;->b:Landroid/widget/FrameLayout;

    .line 135
    .line 136
    new-instance v0, Ll/eqk;

    .line 137
    .line 138
    invoke-direct {v0}, Ll/eqk;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Ll/kqk;->j:Lv/VRecyclerView;

    .line 145
    .line 146
    new-instance v0, Ll/kqk$b;

    .line 147
    .line 148
    invoke-direct {v0, p0}, Ll/kqk$b;-><init>(Ll/kqk;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 152
    .line 153
    .line 154
    new-instance p1, Ll/kqk$c;

    .line 155
    .line 156
    invoke-direct {p1, p0}, Ll/kqk$c;-><init>(Ll/kqk;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 160
    .line 161
    .line 162
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 163
    .line 164
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    const-string v0, "p_at_popup"

    .line 169
    .line 170
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Ll/kqk;->q:Ll/l4g0;

    .line 175
    .line 176
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 177
    .line 178
    .line 179
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 182
    .line 183
    iget-object v0, p0, Ll/kqk;->o:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_0

    .line 194
    .line 195
    iget-object p0, p0, Ll/kqk;->h:Lv/VText;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    .line 201
    .line 202
    :cond_0
    return-void
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lqk;->b(Ll/kqk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final s()V
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/kqk;->t()Landroid/view/inputmethod/InputMethodManager;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/kqk;->t()Landroid/view/inputmethod/InputMethodManager;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :catch_0
    move-exception p0

    .line 61
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final t()Landroid/view/inputmethod/InputMethodManager;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "input_method"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 12
    .line 13
    return-object p0
.end method

.method public final u()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/kqk;->u:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Ll/kqk;->r:Lrx/subjects/a;

    .line 4
    .line 5
    iget-object v2, p0, Ll/kqk;->s:Lrx/subjects/a;

    .line 6
    .line 7
    new-instance v3, Ll/fqk;

    .line 8
    .line 9
    invoke-direct {v3}, Ll/fqk;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v1, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/gqk;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/gqk;-><init>(Ll/kqk;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/hqk;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/hqk;-><init>(Ll/kqk;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/iqk;

    .line 51
    .line 52
    invoke-direct {v2}, Ll/iqk;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/kqk;->u:Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/e;->S8()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/jqk;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/jqk;-><init>(Ll/kqk;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/kqk;->r:Lrx/subjects/a;

    .line 89
    .line 90
    const-string v1, ""

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/kqk;->s:Lrx/subjects/a;

    .line 96
    .line 97
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final synthetic v(Landroid/util/Pair;)Ljava/util/List;
    .locals 8

    .line 1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 14
    .line 15
    iget-object v2, p0, Ll/kqk;->o:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/putong/core/api/e;->d9(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 25
    .line 26
    iget-object v1, p0, Ll/kqk;->o:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/api/e;->V8(Ljava/lang/String;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/4 v4, 0x0

    .line 50
    if-eqz v3, :cond_4

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 57
    .line 58
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    new-instance v5, Ll/dek;

    .line 76
    .line 77
    invoke-direct {v5}, Ll/dek;-><init>()V

    .line 78
    .line 79
    .line 80
    iget-object v6, v3, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 81
    .line 82
    iput-object v6, v5, Ll/dek;->c:Ljava/lang/String;

    .line 83
    .line 84
    iput v4, v5, Ll/dek;->e:I

    .line 85
    .line 86
    iget-object v6, v3, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v6, v5, Ll/dek;->g:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    iput-object v6, v5, Ll/dek;->b:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v6, v3, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 97
    .line 98
    iput-object v6, v5, Ll/dek;->a:Ljava/lang/String;

    .line 99
    .line 100
    iget-boolean v6, p0, Ll/kqk;->p:Z

    .line 101
    .line 102
    iput-boolean v6, v5, Ll/dek;->d:Z

    .line 103
    .line 104
    iput-object v3, v5, Ll/dek;->h:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 105
    .line 106
    iget-object v3, v5, Ll/dek;->g:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    if-nez v3, :cond_2

    .line 113
    .line 114
    iget-object v3, v5, Ll/dek;->g:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    goto :goto_2

    .line 121
    :cond_2
    const/16 v3, 0x23

    .line 122
    .line 123
    :goto_2
    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-nez v3, :cond_3

    .line 128
    .line 129
    if-eqz v0, :cond_3

    .line 130
    .line 131
    new-instance v3, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v4, "#"

    .line 134
    .line 135
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object v4, v5, Ll/dek;->g:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    iput-object v3, v5, Ll/dek;->g:Ljava/lang/String;

    .line 148
    .line 149
    :cond_3
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_4
    new-instance p0, Ll/aqk;

    .line 154
    .line 155
    invoke-direct {p0}, Ll/aqk;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-static {v1, p0}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 159
    .line 160
    .line 161
    new-instance p0, Ljava/util/ArrayList;

    .line 162
    .line 163
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 164
    .line 165
    .line 166
    const/4 p1, 0x0

    .line 167
    move v3, v4

    .line 168
    :goto_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    const/4 v6, 0x1

    .line 173
    if-ge v3, v5, :cond_7

    .line 174
    .line 175
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    check-cast v5, Ll/dek;

    .line 180
    .line 181
    if-eqz v0, :cond_6

    .line 182
    .line 183
    if-eqz p1, :cond_5

    .line 184
    .line 185
    iget-object p1, p1, Ll/dek;->g:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {p1, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iget-object v7, v5, Ll/dek;->g:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v7, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    invoke-static {p1, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-nez p1, :cond_6

    .line 202
    .line 203
    :cond_5
    new-instance p1, Ll/dek;

    .line 204
    .line 205
    invoke-direct {p1}, Ll/dek;-><init>()V

    .line 206
    .line 207
    .line 208
    iput v6, p1, Ll/dek;->e:I

    .line 209
    .line 210
    iget-object v7, v5, Ll/dek;->g:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {v7, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v6

    .line 216
    iput-object v6, p1, Ll/dek;->f:Ljava/lang/String;

    .line 217
    .line 218
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    :cond_6
    invoke-interface {p0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    add-int/lit8 v3, v3, 0x1

    .line 225
    .line 226
    move-object p1, v5

    .line 227
    goto :goto_3

    .line 228
    :cond_7
    if-eqz v0, :cond_9

    .line 229
    .line 230
    new-instance p1, Ll/dek;

    .line 231
    .line 232
    invoke-direct {p1}, Ll/dek;-><init>()V

    .line 233
    .line 234
    .line 235
    const/4 v0, 0x2

    .line 236
    iput v0, p1, Ll/dek;->e:I

    .line 237
    .line 238
    const-string v0, "0"

    .line 239
    .line 240
    iput-object v0, p1, Ll/dek;->a:Ljava/lang/String;

    .line 241
    .line 242
    sub-int/2addr v2, v6

    .line 243
    if-nez v2, :cond_8

    .line 244
    .line 245
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 246
    .line 247
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->J2:I

    .line 248
    .line 249
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    iput-object v0, p1, Ll/dek;->f:Ljava/lang/String;

    .line 254
    .line 255
    goto :goto_4

    .line 256
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 257
    .line 258
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 259
    .line 260
    .line 261
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 262
    .line 263
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->J2:I

    .line 264
    .line 265
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string v1, "\uff08"

    .line 273
    .line 274
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    const-string v1, "\uff09"

    .line 281
    .line 282
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    iput-object v0, p1, Ll/dek;->f:Ljava/lang/String;

    .line 290
    .line 291
    :goto_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 292
    .line 293
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->J2:I

    .line 294
    .line 295
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    iput-object v0, p1, Ll/dek;->b:Ljava/lang/String;

    .line 300
    .line 301
    invoke-interface {p0, v4, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 302
    .line 303
    .line 304
    :cond_9
    return-object p0
.end method

.method public final synthetic w(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kqk;->r:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/kqk;->k:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object p0, p0, Ll/kqk;->v:Ll/cek;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/cek;->G(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic x(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kqk;->s:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kqk;->s()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kqk;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/kqk;->f:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/kqk;->c:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/kqk;->d:Landroid/widget/EditText;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/kqk;->u:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    iget-object p0, p0, Ll/kqk;->d:Landroid/widget/EditText;

    .line 21
    .line 22
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method
