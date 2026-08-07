.class public Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;
.super Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;
.implements Ll/y20;
.implements Ll/mol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;",
        "Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;",
        "Ll/y20<",
        "Ll/uyh0;",
        ">;",
        "Ll/mol;"
    }
.end annotation


# static fields
.field public static B:I = 0x1

.field public static C:I


# instance fields
.field public A:Ll/du;

.field public l:I

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:I

.field public t:Ljava/lang/String;

.field public u:Lcom/p1/mobile/putong/data/Gender;

.field public v:Ljava/lang/String;

.field public w:Z

.field public x:I

.field public y:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ll/xt;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->x:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->y:Ljava/util/ArrayList;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->k2(Ljava/lang/String;)V

    return-void
.end method

.method public static b2(Landroid/content/Context;IZZZ)Landroid/content/Intent;
    .locals 8

    .line 1
    sget v6, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->C:I

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    const/4 v5, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move v1, p1

    .line 7
    move v2, p2

    .line 8
    move v3, p3

    .line 9
    move v4, p4

    .line 10
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->d2(Landroid/content/Context;IZZZLjava/lang/String;IZ)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static c2(Landroid/content/Context;IZZZLjava/lang/String;)Landroid/content/Intent;
    .locals 8

    .line 1
    sget v6, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->C:I

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move v1, p1

    .line 6
    move v2, p2

    .line 7
    move v3, p3

    .line 8
    move v4, p4

    .line 9
    move-object v5, p5

    .line 10
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->d2(Landroid/content/Context;IZZZLjava/lang/String;IZ)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static d2(Landroid/content/Context;IZZZLjava/lang/String;IZ)Landroid/content/Intent;
    .locals 10

    .line 1
    const/4 v8, 0x0

    .line 2
    const/4 v9, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move/from16 v6, p6

    .line 10
    .line 11
    move/from16 v7, p7

    .line 12
    .line 13
    invoke-static/range {v0 .. v9}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->e2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static e2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;)Landroid/content/Intent;
    .locals 11

    .line 1
    const-string v10, ""

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object/from16 v5, p5

    .line 9
    .line 10
    move/from16 v6, p6

    .line 11
    .line 12
    move/from16 v7, p7

    .line 13
    .line 14
    move/from16 v8, p8

    .line 15
    .line 16
    move-object/from16 v9, p9

    .line 17
    .line 18
    invoke-static/range {v0 .. v10}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->g2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static g2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;)Landroid/content/Intent;
    .locals 12

    .line 1
    invoke-static {}, Ll/h9n;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v11

    .line 5
    move-object v0, p0

    .line 6
    move v1, p1

    .line 7
    move v2, p2

    .line 8
    move v3, p3

    .line 9
    move/from16 v4, p4

    .line 10
    .line 11
    move-object/from16 v5, p5

    .line 12
    .line 13
    move/from16 v6, p6

    .line 14
    .line 15
    move/from16 v7, p7

    .line 16
    .line 17
    move/from16 v8, p8

    .line 18
    .line 19
    move-object/from16 v9, p9

    .line 20
    .line 21
    move-object/from16 v10, p10

    .line 22
    .line 23
    invoke-static/range {v0 .. v11}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->h2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static h2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    if-nez p4, :cond_1

    .line 5
    .line 6
    :cond_0
    if-eqz p3, :cond_2

    .line 7
    .line 8
    sget v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 9
    .line 10
    if-eq p6, v0, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0

    .line 18
    :cond_2
    :goto_0
    new-instance v0, Landroid/content/Intent;

    .line 19
    .line 20
    const-class v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 21
    .line 22
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 23
    .line 24
    .line 25
    const-string p0, "imageCount"

    .line 26
    .line 27
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string p0, "hasCamera"

    .line 31
    .line 32
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    const-string p0, "hasVideo"

    .line 36
    .line 37
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    const-string p0, "cropIfSingle"

    .line 41
    .line 42
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    const-string p0, "videoDefault"

    .line 46
    .line 47
    invoke-virtual {v0, p0, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    const-string p0, "from"

    .line 51
    .line 52
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    const-string p0, "source"

    .line 56
    .line 57
    invoke-virtual {v0, p0, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    const-string p0, "isFloatLayerExp"

    .line 61
    .line 62
    invoke-virtual {v0, p0, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    const-string p0, "gender"

    .line 66
    .line 67
    invoke-virtual {v0, p0, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    const-string p0, "title"

    .line 71
    .line 72
    invoke-virtual {v0, p0, p10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    const-string p0, "cropNewProfilePicture"

    .line 76
    .line 77
    invoke-virtual {v0, p0, p11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    return-object v0
.end method


# virtual methods
.method public b(Ll/ewi;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->z:Ll/xt;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xt;->D0(Ll/ewi;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uyh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->i2(Ll/uyh0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public cropImage(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/16 v0, 0x6000

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->cropImage(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public ensureMediaPickerHandler()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->mediaPickerHandler:Lcom/p1/mobile/putong/app/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/app/PutongAct;->defaultMediaPickerHandlerFactory:Ll/qzx;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Ll/qzx;->a(Lcom/p1/mobile/putong/app/PutongAct;)Lcom/p1/mobile/putong/app/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->mediaPickerHandler:Lcom/p1/mobile/putong/app/a;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/data/Media;Z)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public i2(Ll/uyh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->e:Ll/uyh0;

    .line 2
    .line 3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->A:Ll/du;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/du;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xt;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/xt;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->z:Ll/xt;

    .line 10
    .line 11
    new-instance v0, Ll/du;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/du;-><init>(Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->A:Ll/du;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->z:Ll/xt;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->z:Ll/xt;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->i:Ll/qcj;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/xt;->A0(Ll/qcj;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->z:Ll/xt;

    .line 31
    .line 32
    sget-object v1, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->j:Ll/qcj;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/xt;->C0(Ll/qcj;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->z:Ll/xt;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->y:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ll/xt;->V0(Ljava/util/ArrayList;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->z:Ll/xt;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xt;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->l:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, v0, :cond_2

    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->o:Z

    .line 7
    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    instance-of p1, p2, Lcom/p1/mobile/putong/data/Video;

    .line 11
    .line 12
    if-nez p1, :cond_2

    .line 13
    .line 14
    iget p1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->s:I

    .line 15
    .line 16
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 17
    .line 18
    if-ne p1, v1, :cond_0

    .line 19
    .line 20
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v0, Ll/xs;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/xs;-><init>(Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2, v0}, Ll/am2;->i(Ljava/lang/String;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-static {}, Ll/h9n;->c()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->t:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "from_sign_up"

    .line 42
    .line 43
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-interface {p1, p0, p2, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->openLoginUiOptCropAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->cropImage(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
.end method

.method public k()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->y:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic k2(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/account/R$string;->U:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->cropImage(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    const/16 v0, 0x125

    .line 2
    .line 3
    if-ne p1, v0, :cond_2

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    if-ne p2, p1, :cond_1

    .line 7
    .line 8
    const-string p1, "select_image_path"

    .line 9
    .line 10
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_1

    .line 19
    .line 20
    invoke-static {p1}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/ecj;->I()Ljava/io/File;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    sget-object p3, Ljava/io/File;->separator:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, "signuptemp"

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    new-instance v0, Ljava/io/File;

    .line 51
    .line 52
    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-nez v1, :cond_0

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 62
    .line 63
    .line 64
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p2, "temp.png"

    .line 76
    .line 77
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    new-instance p3, Ljava/io/File;

    .line 85
    .line 86
    invoke-direct {p3, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const/4 v0, 0x0

    .line 90
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    .line 91
    .line 92
    invoke-direct {v1, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 93
    .line 94
    .line 95
    :try_start_1
    sget-object p3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 96
    .line 97
    const/16 v0, 0x64

    .line 98
    .line 99
    invoke-virtual {p1, p3, v0, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 100
    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p3, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 107
    .line 108
    iget-boolean p0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->q:Z

    .line 109
    .line 110
    invoke-interface {p1, p3, p2, p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->openLoginUiOptCropAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    .line 112
    .line 113
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :catchall_0
    move-exception p0

    .line 118
    move-object v0, v1

    .line 119
    goto :goto_0

    .line 120
    :catch_0
    move-object v0, v1

    .line 121
    goto :goto_1

    .line 122
    :catchall_1
    move-exception p0

    .line 123
    :goto_0
    invoke-static {v0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 124
    .line 125
    .line 126
    throw p0

    .line 127
    :catch_1
    :goto_1
    invoke-static {v0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 128
    .line 129
    .line 130
    :cond_1
    :goto_2
    return-void

    .line 131
    :cond_2
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .line 1
    const-string v0, "force_select_image"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->t:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpType()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "signup_source"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpData()Lcom/p1/mobile/putong/data/SignUpData;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "phone_num"

    .line 46
    .line 47
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "e_picture_albums_back_button"

    .line 56
    .line 57
    const-string v2, "p_picture_selection_view"

    .line 58
    .line 59
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onCropImageResult(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "preprocessed"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 13
    .line 14
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Ll/kl40;->c()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const-string p1, "image/webp"

    .line 27
    .line 28
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p1, "image/jpeg"

    .line 32
    .line 33
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 34
    .line 35
    :goto_0
    new-instance p1, Landroid/content/Intent;

    .line 36
    .line 37
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 38
    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->h:Ljava/lang/String;

    .line 41
    .line 42
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    const-string v0, "from"

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->t:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    const/4 v0, -0x1

    .line 61
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onStartLifecycle()V
    .locals 3

    .line 1
    const-string v0, "p_picture_selection_view"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .line 17
    .line 18
    :try_start_0
    const-string v1, "signup_source"

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpType()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    :goto_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_picture_selection_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "imageCount"

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->l:I

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "hasCamera"

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->m:Z

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "hasVideo"

    .line 34
    .line 35
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->n:Z

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "cropIfSingle"

    .line 46
    .line 47
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->o:Z

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v2, "videoDefault"

    .line 58
    .line 59
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->p:Z

    .line 64
    .line 65
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-string v2, "from"

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->t:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v2, "source"

    .line 82
    .line 83
    sget v5, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->C:I

    .line 84
    .line 85
    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    iput v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->s:I

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const-string v2, "isFloatLayerExp"

    .line 96
    .line 97
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->w:Z

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const-string v2, "gender"

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Lcom/p1/mobile/putong/data/Gender;

    .line 114
    .line 115
    iput-object v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->u:Lcom/p1/mobile/putong/data/Gender;

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const-string v2, "title"

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Ljava/lang/String;

    .line 128
    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->v:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    const-string v2, "cropNewProfilePicture"

    .line 136
    .line 137
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->q:Z

    .line 142
    .line 143
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    const-string v2, "useInnerCamera"

    .line 148
    .line 149
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->r:Z

    .line 154
    .line 155
    iget v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->s:I

    .line 156
    .line 157
    sget v2, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 158
    .line 159
    if-eq v1, v2, :cond_0

    .line 160
    .line 161
    invoke-super/range {p0 .. p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 162
    .line 163
    .line 164
    :cond_0
    iget v5, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->l:I

    .line 165
    .line 166
    if-lez v5, :cond_1

    .line 167
    .line 168
    iget-object v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->c:Ll/uyh0;

    .line 169
    .line 170
    :goto_0
    move-object v15, v1

    .line 171
    goto :goto_1

    .line 172
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->d:Ll/uyh0;

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :goto_1
    iput-object v15, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->e:Ll/uyh0;

    .line 176
    .line 177
    iget-object v4, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->z:Ll/xt;

    .line 178
    .line 179
    iget-boolean v6, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->m:Z

    .line 180
    .line 181
    iget-boolean v7, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->n:Z

    .line 182
    .line 183
    iget-boolean v8, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->o:Z

    .line 184
    .line 185
    iget-boolean v9, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->p:Z

    .line 186
    .line 187
    iget v10, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->s:I

    .line 188
    .line 189
    iget-object v11, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->t:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v12, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->u:Lcom/p1/mobile/putong/data/Gender;

    .line 192
    .line 193
    iget-object v13, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->v:Ljava/lang/String;

    .line 194
    .line 195
    iget-boolean v14, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->w:Z

    .line 196
    .line 197
    iget v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->x:I

    .line 198
    .line 199
    iget-boolean v2, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->r:Z

    .line 200
    .line 201
    move/from16 v16, v1

    .line 202
    .line 203
    move/from16 v17, v2

    .line 204
    .line 205
    invoke-virtual/range {v4 .. v17}, Ll/xt;->E0(IZZZZILjava/lang/String;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;ZLl/uyh0;IZ)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    const-string v2, "show_simple_avatar"

    .line 213
    .line 214
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    const-string v3, "tips_message"

    .line 223
    .line 224
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    iget-object v3, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->z:Ll/xt;

    .line 229
    .line 230
    invoke-virtual {v3, v2}, Ll/xt;->W0(Ljava/lang/String;)Ll/xt;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-virtual {v2, v1}, Ll/xt;->X0(Z)Ll/xt;

    .line 235
    .line 236
    .line 237
    iget-object v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->A:Ll/du;

    .line 238
    .line 239
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->c:Ll/uyh0;

    .line 240
    .line 241
    iget-object v3, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->d:Ll/uyh0;

    .line 242
    .line 243
    iget-object v4, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->e:Ll/uyh0;

    .line 244
    .line 245
    invoke-virtual {v1, v2, v3, v4}, Ll/du;->O(Ll/uyh0;Ll/uyh0;Ll/uyh0;)V

    .line 246
    .line 247
    .line 248
    iget-object v1, v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->A:Ll/du;

    .line 249
    .line 250
    invoke-virtual {v1, v0}, Ll/du;->L(Ll/y20;)V

    .line 251
    .line 252
    .line 253
    iget-object v1, v0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 254
    .line 255
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->pageId()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    invoke-virtual {v1, v0}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    return-void
.end method

.method public shouldShowGradientActionBar()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->a()Ll/bo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/bo;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->t:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "from_sign_up"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->shouldShowGradientActionBar()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->a()Ll/bo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/bo;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->t:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "from_sign_up"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->shouldShowGradientStatusBar()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method
