.class public Ll/ujp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/akp0;",
        ">;",
        "Landroid/text/TextWatcher;"
    }
.end annotation


# static fields
.field public static n:I = 0xf


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VLinear;

.field public f:Landroid/widget/ImageView;

.field public g:Lv/VText;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/VEditText;

.field public k:Landroid/widget/TextView;

.field public l:Ll/akp0;

.field public m:Ll/c0s;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private B()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ujp0;->b:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/qjp0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/qjp0;-><init>(Ll/ujp0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ujp0;->f:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v1, Ll/rjp0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/rjp0;-><init>(Ll/ujp0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ujp0;->h:Landroid/widget/TextView;

    .line 22
    .line 23
    new-instance v1, Ll/sjp0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/sjp0;-><init>(Ll/ujp0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ujp0;->s()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic a(Ll/ujp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ujp0;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ujp0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ujp0;->l()V

    return-void
.end method

.method public static synthetic c(Ll/ujp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ujp0;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/ujp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ujp0;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/ujp0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ujp0;->u()V

    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ujp0;->m:Ll/c0s;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/ujp0;->l:Ll/akp0;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/ujp0;->l:Ll/akp0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/ujp0;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Ll/ujp0;->m:Ll/c0s;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method private m(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string v0, "\n|\r"

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method private q()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ujp0;->m:Ll/c0s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/c0s;

    .line 6
    .line 7
    iget-object v1, p0, Ll/ujp0;->l:Ll/akp0;

    .line 8
    .line 9
    sget v2, Ll/jgc0;->g:I

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ujp0;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {p0, v3, v4}, Ll/ujp0;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-direct {v0, v1, v2, v3}, Ll/c0s;-><init>(Ll/xzs;ILandroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/ujp0;->m:Ll/c0s;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/ujp0;->B()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ujp0;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ujp0;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ujp0;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A(Ll/moo0;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/ujp0;->n(Ll/moo0;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

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
    iget-object v0, p0, Ll/ujp0;->j:Lv/VEditText;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ujp0;->j:Lv/VEditText;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Ll/ujp0;->j:Lv/VEditText;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ujp0;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/pjp0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/pjp0;-><init>(Ll/ujp0;)V

    .line 37
    .line 38
    .line 39
    const-wide/16 v1, 0xc8

    .line 40
    .line 41
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final C()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ujp0;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ll/ujp0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string p0, "\u8bf7\u586b\u5199\u7fa4\u540d\u79f0"

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Ll/ujp0;->l:Ll/akp0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ujp0;->p()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/akp0;->O3(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ujp0;->l:Ll/akp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ujp0;->l:Ll/akp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ujp0;->p()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    :cond_0
    invoke-virtual {p0, v0}, Ll/ujp0;->j(Z)V

    .line 16
    .line 17
    .line 18
    sget v0, Ll/ujp0;->n:I

    .line 19
    .line 20
    iget-object p0, p0, Ll/ujp0;->k:Landroid/widget/TextView;

    .line 21
    .line 22
    if-lt p1, v0, :cond_1

    .line 23
    .line 24
    const-string p1, "15/15"

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p1, "/15"

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {p0, v0}, Ll/ujp0;->j(Z)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/ujp0;->k:Landroid/widget/TextView;

    .line 55
    .line 56
    const-string p1, "0/15"

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ujp0;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bkp0;->b(Ll/ujp0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/akp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ujp0;->l:Ll/akp0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/akp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ujp0;->i(Ll/akp0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final j(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ujp0;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/n9c0;->p0:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ujp0;->h:Landroid/widget/TextView;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget p1, Ll/n9c0;->j1:I

    .line 22
    .line 23
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/ujp0;->h:Landroid/widget/TextView;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 2
    .line 3
    sget v0, Ll/ujp0;->n:I

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final n(Ll/moo0;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/moo0;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "title"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/moo0;->a()Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p1}, Ll/moo0;->b()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "notice"

    .line 27
    .line 28
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/moo0;->a()Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const-string p0, ""

    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    sget v0, Ll/ujp0;->n:I

    .line 50
    .line 51
    if-le p1, v0, :cond_2

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    :cond_2
    return-object p0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ujp0;->j:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Ll/ujp0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final s()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ujp0;->j:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/qcr;

    .line 4
    .line 5
    sget v2, Ll/ujp0;->n:I

    .line 6
    .line 7
    mul-int/lit8 v2, v2, 0x2

    .line 8
    .line 9
    new-instance v3, Ll/tjp0;

    .line 10
    .line 11
    invoke-direct {v3, p0}, Ll/tjp0;-><init>(Ll/ujp0;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v1, v2, v3}, Ll/qcr;-><init>(ILl/x20;)V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    aput-object v1, v2, v3

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ujp0;->j:Lv/VEditText;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ujp0;->l:Ll/akp0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/ujp0;->j:Lv/VEditText;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public y()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ujp0;->m:Ll/c0s;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z(Ll/moo0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ujp0;->q()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ujp0;->m:Ll/c0s;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ujp0;->A(Ll/moo0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
