.class public abstract Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;
.super Lcom/idv/identity/platform/IntlFaceBaseActivity;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;
    }
.end annotation


# instance fields
.field protected final c:I

.field protected final d:Ljava/lang/String;

.field private e:J

.field private final f:F

.field private final g:I

.field private final h:I

.field private final i:I

.field private final j:I

.field private final k:Ljava/lang/String;

.field private final l:Ljava/lang/String;

.field private final m:Ljava/lang/String;

.field private n:Z

.field private o:I

.field public p:Ljava/lang/String;

.field protected q:Lcom/idv/identity/platform/iOSLoadingView;

.field private r:Landroid/widget/Button;

.field public s:Landroid/widget/TextView;

.field public t:Landroid/widget/RelativeLayout;

.field public u:Landroid/widget/ImageView;

.field private v:Landroid/view/View;

.field protected w:Ll/n8c;

.field protected x:Z

.field public y:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->c:I

    .line 6
    .line 7
    const-string v1, "nfccard"

    .line 8
    .line 9
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->e:J

    .line 16
    .line 17
    const v1, 0x3f249249

    .line 18
    .line 19
    .line 20
    iput v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->f:F

    .line 21
    .line 22
    const/16 v1, 0x3e8

    .line 23
    .line 24
    iput v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->g:I

    .line 25
    .line 26
    const/16 v1, 0x3e9

    .line 27
    .line 28
    iput v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->h:I

    .line 29
    .line 30
    const/16 v1, 0x3ea

    .line 31
    .line 32
    iput v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->i:I

    .line 33
    .line 34
    const/16 v1, 0x3eb

    .line 35
    .line 36
    iput v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->j:I

    .line 37
    .line 38
    const-string v1, "401"

    .line 39
    .line 40
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->k:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "402"

    .line 43
    .line 44
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->l:Ljava/lang/String;

    .line 45
    .line 46
    const-string v1, "200"

    .line 47
    .line 48
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->m:Ljava/lang/String;

    .line 49
    .line 50
    iput-boolean v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->n:Z

    .line 51
    .line 52
    sget v0, Ll/hfm;->j:I

    .line 53
    .line 54
    iput v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->o:I

    .line 55
    .line 56
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/afm;->v()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->p:Ljava/lang/String;

    .line 65
    .line 66
    const/4 v0, 0x1

    .line 67
    iput-boolean v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->x:Z

    .line 68
    .line 69
    new-instance v0, Landroid/os/Handler;

    .line 70
    .line 71
    new-instance v1, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->y:Landroid/os/Handler;

    .line 80
    .line 81
    return-void
.end method

.method private F1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x3e9

    .line 6
    .line 7
    iput v1, v0, Landroid/os/Message;->what:I

    .line 8
    .line 9
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->y:Landroid/os/Handler;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private G1()V
    .locals 4

    .line 1
    sget v0, Ll/hfm;->m:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->y:Landroid/os/Handler;

    .line 4
    .line 5
    const/16 v1, 0x3eb

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/hfm;->n:I

    .line 10
    .line 11
    mul-int/lit8 v0, v0, 0x14

    .line 12
    .line 13
    int-to-long v2, v0

    .line 14
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget v2, Ll/hfm;->n:I

    .line 19
    .line 20
    mul-int/2addr v0, v2

    .line 21
    int-to-long v2, v0

    .line 22
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private K1()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->f0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    new-instance v8, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$e;

    .line 22
    .line 23
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$e;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 24
    .line 25
    .line 26
    const-string v4, ""

    .line 27
    .line 28
    const/4 v6, 0x0

    .line 29
    const-string v7, "ocr_over_time_code"

    .line 30
    .line 31
    move-object v2, p0

    .line 32
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->J1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic L0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->o:I

    .line 2
    .line 3
    return p0
.end method

.method private L1(Z)Z
    .locals 4

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.idv.identity.face.IdentityFaceApi"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "start"

    .line 12
    .line 13
    const-class v2, Landroid/content/Context;

    .line 14
    .line 15
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 16
    .line 17
    filled-new-array {v2, v3}, [Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-virtual {v0, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    return p0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 54
    .line 55
    const-string v1, "exception"

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v2, "status"

    .line 62
    .line 63
    const-string v3, "catchException"

    .line 64
    .line 65
    filled-new-array {v2, v3, v1, p0}, [Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string v1, "startFace"

    .line 70
    .line 71
    invoke-virtual {p1, v0, v1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    return p0
.end method

.method private M1()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/rcc0;->p:I

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Landroid/view/ViewGroup;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-direct {p0, v1, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->Y0(Landroid/view/ViewGroup;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/afm;->i0()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Landroid/view/View;

    .line 45
    .line 46
    sget-object v2, Ll/ffm;->g:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    sget-boolean v2, Ll/hfm;->e:Z

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    return-void
.end method

.method public static synthetic N0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->o:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->o:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic O0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->K1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->F1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->u1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->n:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic T0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->l1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)Landroid/widget/Button;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->r:Landroid/widget/Button;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->G1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Y0(Landroid/view/ViewGroup;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v2, v1, Landroid/widget/EditText;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    instance-of v2, v1, Landroid/widget/TextView;

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    invoke-direct {p0, v1, p2}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->Y0(Landroid/view/ViewGroup;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    return-void
.end method

.method private d1(F)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    mul-float/2addr p1, p0

    .line 12
    const/high16 p0, 0x3f000000    # 0.5f

    .line 13
    .line 14
    add-float/2addr p1, p0

    .line 15
    float-to-int p0, p1

    .line 16
    return p0
.end method

.method private k1(Ljava/lang/String;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->e:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "ms"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 30
    .line 31
    const-string v4, "OCR_RESULT_EXIT"

    .line 32
    .line 33
    const-string v5, "OCR_RESULT"

    .line 34
    .line 35
    move-object v7, p1

    .line 36
    invoke-virtual/range {v2 .. v7}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->finish()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private l1()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$a;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private u1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->y:Landroid/os/Handler;

    .line 2
    .line 3
    const/16 v1, 0x3e8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p1}, Ll/afm;->e(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->k1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public B1()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->L1(Z)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const-string v1, "success"

    .line 7
    .line 8
    const-string v2, "status"

    .line 9
    .line 10
    const-string v3, "onClickStartFaceView"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 19
    .line 20
    filled-new-array {v2, v1}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v4, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 33
    .line 34
    const-string v5, "error"

    .line 35
    .line 36
    filled-new-array {v2, v5}, [Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v4, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-direct {p0, v1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->k1(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public C1()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "success"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->k1(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 21
    .line 22
    const-string v2, "status"

    .line 23
    .line 24
    filled-new-array {v2, v0}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v2, "onClickStartVerifyView"

    .line 29
    .line 30
    invoke-virtual {p0, v1, v2, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public E1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/idv/identity/base/R$string;->J0:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s:Landroid/widget/TextView;

    .line 17
    .line 18
    sget-object v1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 19
    .line 20
    sget v2, Ll/y9c0;->b:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTipColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 30
    .line 31
    sget-object v1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 32
    .line 33
    sget v2, Ll/y9c0;->f:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTipBGColor(I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->u:Landroid/widget/ImageView;

    .line 43
    .line 44
    const/16 v1, 0x8

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 50
    .line 51
    const/16 v0, 0x10

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->setGravity(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public abstract H1()V
.end method

.method public I1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->r:Landroid/widget/Button;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget-object v1, Ll/hfm;->f:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    sget-object p0, Ll/hfm;->f:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->h1(Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public J1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;)V
    .locals 3

    .line 1
    const-string v0, "OCR_RESULT"

    .line 2
    .line 3
    invoke-static {p5, v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertAppear(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->n:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->h1(Z)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->n:Z

    .line 17
    .line 18
    sget v2, Ll/rcc0;->b:I

    .line 19
    .line 20
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 25
    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    invoke-virtual {v2, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setTitleText(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, p2}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setMessageText(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    if-eqz p4, :cond_1

    .line 35
    .line 36
    invoke-virtual {v2, p4}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCancelText(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {v2, v0}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 44
    .line 45
    .line 46
    :goto_0
    invoke-virtual {v2, p3}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setConfirmText(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    invoke-static {p5}, Ll/azb;->t(Ljava/lang/String;)Ll/azb$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {v2, p1}, Ll/azb;->a(Lcom/idv/identity/platform/IdentityAlertOverlay;Ll/azb$a;)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$l;

    .line 60
    .line 61
    invoke-direct {p1, p0, p5, p6}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$l;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Ljava/lang/String;Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCommAlertOverlayListener(Lcom/idv/identity/platform/IdentityAlertOverlay$d;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_1
    return-void
.end method

.method public O1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object v1, Ll/ffm;->d:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_4

    .line 26
    .line 27
    sget-object v1, Ll/ffm;->g:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    sget-object v1, Ll/ffm;->e:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->B1()V

    .line 45
    .line 46
    .line 47
    :cond_3
    :goto_0
    return-void

    .line 48
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->C1()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public W0()V
    .locals 9

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "exitVerifyBtn"

    .line 8
    .line 9
    const-string v3, "OCR_RESULT"

    .line 10
    .line 11
    const-string v4, "PAGER_BEHAVIOR"

    .line 12
    .line 13
    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/idv/identity/base/R$string;->T:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Lcom/idv/identity/base/R$string;->N:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    new-instance v8, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$k;

    .line 47
    .line 48
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$k;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 49
    .line 50
    .line 51
    const-string v4, ""

    .line 52
    .line 53
    const-string v7, "ORC_RES_PAGE_EXIT_CODE"

    .line 54
    .line 55
    move-object v2, p0

    .line 56
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->J1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public X0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->q1(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s:Landroid/widget/TextView;

    .line 11
    .line 12
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 13
    .line 14
    sget v1, Ll/y9c0;->d:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTipTitleColor(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 24
    .line 25
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 26
    .line 27
    sget v1, Ll/y9c0;->h:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultErrorTipBGColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->u:Landroid/widget/ImageView;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->setGravity(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public abstract a1()V
.end method

.method public abstract f1()V
.end method

.method public h1(Z)V
    .locals 2

    .line 1
    sget v0, Ll/rcc0;->C0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/Button;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 17
    .line 18
    sget v0, Ll/y9c0;->j:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultConfirmBtnEnabledTitleColor(I)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "background:"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "TAG"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/o6r0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    instance-of v0, p1, Landroid/graphics/drawable/GradientDrawable;

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    .line 59
    .line 60
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 61
    .line 62
    sget v1, Ll/y8c0;->b:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultConfirmBtnEnabledBGColor(I)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 76
    .line 77
    sget v0, Ll/y9c0;->j:I

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultConfirmBtnDisabledTitleColor(I)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    instance-of v0, p1, Landroid/graphics/drawable/GradientDrawable;

    .line 91
    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    .line 95
    .line 96
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 97
    .line 98
    sget v1, Ll/y8c0;->i:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultConfirmBtnDisabledBGColor(I)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 108
    .line 109
    .line 110
    :cond_1
    return-void
.end method

.method public abstract j1()V
.end method

.method public m1()V
    .locals 5

    .line 1
    sget v0, Ll/rcc0;->O0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/idv/identity/platform/iOSLoadingView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->q:Lcom/idv/identity/platform/iOSLoadingView;

    .line 10
    .line 11
    sget v0, Ll/rcc0;->C0:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/Button;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->r:Landroid/widget/Button;

    .line 20
    .line 21
    sget v0, Ll/rcc0;->f1:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/TextView;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s:Landroid/widget/TextView;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    sget-object v1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 34
    .line 35
    sget v2, Ll/y9c0;->b:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTipColor(I)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    sget v0, Ll/rcc0;->b1:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 53
    .line 54
    sget v0, Ll/rcc0;->S0:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroid/widget/ImageView;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->u:Landroid/widget/ImageView;

    .line 63
    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    invoke-static {}, Ll/azb;->i()Landroid/graphics/Bitmap;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->u:Landroid/widget/ImageView;

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    sget v0, Ll/rcc0;->j1:I

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->v:Landroid/view/View;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->n1()V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 97
    .line 98
    new-instance v2, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$g;

    .line 99
    .line 100
    invoke-direct {v2, p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$g;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    const-wide/16 v3, 0xc8

    .line 104
    .line 105
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 106
    .line 107
    .line 108
    sget v0, Ll/rcc0;->d1:I

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Landroid/widget/TextView;

    .line 115
    .line 116
    if-eqz v0, :cond_2

    .line 117
    .line 118
    sget-object v1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 119
    .line 120
    sget v2, Ll/y9c0;->b:I

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTitleColor(I)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 127
    .line 128
    .line 129
    :cond_2
    sget v0, Ll/rcc0;->R0:I

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Landroid/widget/ImageView;

    .line 136
    .line 137
    invoke-static {}, Ll/azb;->m()Landroid/graphics/Bitmap;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    if-eqz v1, :cond_3

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    const/4 v0, 0x1

    .line 147
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->h1(Z)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public n1()V
    .locals 8

    .line 1
    sget-object v0, Ll/hfm;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/hfm;->c:Ljava/lang/String;

    .line 10
    .line 11
    :goto_0
    move-object v1, v0

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Lcom/idv/identity/base/R$string;->V:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :goto_1
    sget v0, Ll/rcc0;->n:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/ImageView;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const/high16 v3, 0x43480000    # 200.0f

    .line 42
    .line 43
    invoke-direct {p0, v3}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->d1(F)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 48
    .line 49
    const/4 v3, -0x1

    .line 50
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Ll/afm;->Y()Landroid/graphics/Bitmap;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2}, Ll/afm;->U()Landroid/graphics/Bitmap;

    .line 68
    .line 69
    .line 70
    if-eqz v7, :cond_3

    .line 71
    .line 72
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    sget v4, Ll/vac0;->c:I

    .line 85
    .line 86
    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    float-to-int v4, p0

    .line 91
    const/4 v5, -0x1

    .line 92
    const/16 v6, 0xcc

    .line 93
    .line 94
    invoke-static/range {v1 .. v6}, Ll/cc00;->b(Ljava/lang/String;IIIII)Landroid/graphics/Bitmap;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    if-eqz p0, :cond_3

    .line 99
    .line 100
    invoke-static {v7, p0}, Ll/cc00;->c(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const/16 v2, 0xa

    .line 105
    .line 106
    if-eqz v1, :cond_1

    .line 107
    .line 108
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    invoke-static {v1, v3, v4, v2}, Ll/cc00;->a(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    goto :goto_2

    .line 121
    :cond_1
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    invoke-static {v7, v1, v3, v2}, Ll/cc00;->a(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    :goto_2
    if-eqz v1, :cond_2

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 136
    .line 137
    .line 138
    :cond_2
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-nez v0, :cond_3

    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 145
    .line 146
    .line 147
    :cond_3
    return-void
.end method

.method public o1()V
    .locals 5

    .line 1
    sget v0, Ll/rcc0;->C:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/rcc0;->i1:I

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Ll/rcc0;->b1:I

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object v3, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 24
    .line 25
    sget v4, Ll/y9c0;->f:I

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTipBGColor(I)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 32
    .line 33
    .line 34
    new-instance v3, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$i;

    .line 35
    .line 36
    invoke-direct {v3, p0, v1, v2}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$i;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Landroid/view/View;Landroid/widget/RelativeLayout;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    if-eqz v0, :cond_1

    .line 43
    .line 44
    new-instance v1, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$j;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$j;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->I1()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onBackPressed()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->T:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/idv/identity/base/R$string;->N:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    new-instance v8, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$h;

    .line 32
    .line 33
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$h;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 34
    .line 35
    .line 36
    const-string v4, ""

    .line 37
    .line 38
    const-string v7, "ORC_RES_PAGE_EXIT_CODE"

    .line 39
    .line 40
    move-object v2, p0

    .line 41
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->J1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->H1()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iput-wide v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->e:J

    .line 12
    .line 13
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 18
    .line 19
    const-string v1, "OCR_RESULT_ENTER"

    .line 20
    .line 21
    const-string v2, "OCR_RESULT"

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "sdkMaxTimeout"

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    const-wide/16 v1, 0x0

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 45
    .line 46
    .line 47
    :cond_0
    const-string v0, "isEnabled"

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iput-boolean p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->x:Z

    .line 61
    .line 62
    :cond_1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->m1()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->o1()V

    .line 66
    .line 67
    .line 68
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->G1()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->p1()V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->M1()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public onDestroy()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->y:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->e:J

    .line 20
    .line 21
    sub-long/2addr v1, v3

    .line 22
    long-to-double v1, v1

    .line 23
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    div-double/2addr v1, v3

    .line 29
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, "s"

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 50
    .line 51
    const-string v2, "timeCost"

    .line 52
    .line 53
    filled-new-array {v2, p0}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v2, "destroyIDCardResultActivity"

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public abstract p1()V
.end method

.method public q1(I)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget v2, Lcom/idv/identity/base/R$string;->F0:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public r1(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s1(Ljava/util/Map;Z[B)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s1(Ljava/util/Map;Z[B)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z[B)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$m;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$m;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    new-instance v2, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 14
    .line 15
    invoke-direct {v2, p0, v0, v1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;J)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, p2, p3, v2}, Ll/qk20;->g(Ljava/util/Map;Z[BLl/kfm;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public t1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public v1(Landroid/os/Message;)V
    .locals 1

    .line 1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Ll/afm;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->k1(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public w1()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->X:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->P:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget v1, Lcom/idv/identity/base/R$string;->O:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    new-instance v8, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$b;

    .line 42
    .line 43
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$b;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 44
    .line 45
    .line 46
    const-string v7, "ORC_RES_PAGE_NET_ERROR_CODE"

    .line 47
    .line 48
    move-object v2, p0

    .line 49
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->J1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public y1()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->J:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->C0:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    new-instance v8, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$d;

    .line 32
    .line 33
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$d;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 34
    .line 35
    .line 36
    const/4 v6, 0x0

    .line 37
    const-string v7, "ocr_out_time_code"

    .line 38
    .line 39
    move-object v2, p0

    .line 40
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->J1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public z1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    new-instance v8, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$c;

    .line 12
    .line 13
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$c;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 14
    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    const-string v7, "ORC_RES_PAGE_INFO_EMPTY_CODE"

    .line 18
    .line 19
    move-object v2, p0

    .line 20
    move-object v3, p1

    .line 21
    move-object v4, p2

    .line 22
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->J1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
