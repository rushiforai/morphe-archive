.class public Ll/bo60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:Ljava/lang/String;

.field public B:Landroid/content/DialogInterface$OnDismissListener;

.field public C:Z

.field public D:Z

.field public final E:Ljava/lang/Runnable;

.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VText;

.field public c:Lv/VLine;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VCheckBox;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VCheckBox;

.field public n:Landroid/widget/LinearLayout;

.field public o:Lv/VImage;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VCheckBox;

.field public s:Lv/VLine;

.field public t:Lv/VText;

.field public final u:Lcom/p1/mobile/android/app/Act;

.field public v:Ll/pej0;

.field public w:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public x:Lcom/p1/mobile/putong/data/PayMethod;

.field public y:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation
.end field

.field public final z:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const-string v0, "alipay"

    .line 51
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    move-result-object v0

    const-string v1, "wechat"

    .line 52
    invoke-static {v1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    move-result-object v1

    const-string v2, "jingdong"

    .line 53
    invoke-static {v2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/data/PayMethod;

    move-result-object v0

    .line 54
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Ll/bo60;->z:Ljava/util/List;

    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Ll/bo60;->C:Z

    .line 56
    iput-boolean v0, p0, Ll/bo60;->D:Z

    .line 57
    new-instance v0, Ll/bo60$a;

    invoke-direct {v0, p0}, Ll/bo60$a;-><init>(Ll/bo60;)V

    iput-object v0, p0, Ll/bo60;->E:Ljava/lang/Runnable;

    .line 58
    iput-object p1, p0, Ll/bo60;->u:Lcom/p1/mobile/android/app/Act;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "alipay"

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "wechat"

    .line 11
    .line 12
    invoke-static {v1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "jingdong"

    .line 17
    .line 18
    invoke-static {v2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/data/PayMethod;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/bo60;->z:Ljava/util/List;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Ll/bo60;->C:Z

    .line 34
    .line 35
    iput-boolean v0, p0, Ll/bo60;->D:Z

    .line 36
    .line 37
    new-instance v0, Ll/bo60$a;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/bo60$a;-><init>(Ll/bo60;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/bo60;->E:Ljava/lang/Runnable;

    .line 43
    .line 44
    iput-object p1, p0, Ll/bo60;->u:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    iput-object p2, p0, Ll/bo60;->w:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Ll/bo60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bo60;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/bo60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bo60;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/bo60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bo60;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/bo60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bo60;->j(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/bo60;)Ll/pej0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bo60;->v:Ll/pej0;

    return-object p0
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/co60;->a(Ll/bo60;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bo60;->v:Ll/pej0;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const v1, 0x1020002

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/fdc0;->y:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/FrameLayout;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/bo60;->a:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/bo60$b;

    .line 47
    .line 48
    invoke-direct {v2, p0, v0}, Ll/bo60$b;-><init>(Ll/bo60;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/bo60;->m:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/bo60;->m:Lv/VCheckBox;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Ll/bo60;->h:Lv/VCheckBox;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Ll/bo60;->h:Lv/VCheckBox;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {p1, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p1, p0, Ll/bo60;->r:Lv/VCheckBox;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Ll/bo60;->r:Lv/VCheckBox;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p1, p0, Ll/bo60;->y:Ll/y20;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    const-string v0, "alipay"

    .line 49
    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    iget-object p1, p0, Ll/bo60;->y:Ll/y20;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {p1, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0, p1}, Ll/bo60;->u(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/bo60;->E:Ljava/lang/Runnable;

    .line 69
    .line 70
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/bo60;->m:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/bo60;->m:Lv/VCheckBox;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Ll/bo60;->h:Lv/VCheckBox;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v0, 0x0

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Ll/bo60;->h:Lv/VCheckBox;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p1, p0, Ll/bo60;->r:Lv/VCheckBox;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Ll/bo60;->r:Lv/VCheckBox;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p1, p0, Ll/bo60;->y:Ll/y20;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    const-string v0, "wechat"

    .line 49
    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    iget-object p1, p0, Ll/bo60;->y:Ll/y20;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {p1, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0, p1}, Ll/bo60;->u(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/bo60;->E:Ljava/lang/Runnable;

    .line 69
    .line 70
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/bo60;->m:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/bo60;->m:Lv/VCheckBox;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Ll/bo60;->h:Lv/VCheckBox;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Ll/bo60;->h:Lv/VCheckBox;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object p1, p0, Ll/bo60;->r:Lv/VCheckBox;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    iget-object p1, p0, Ll/bo60;->r:Lv/VCheckBox;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p1, p0, Ll/bo60;->y:Ll/y20;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    const-string v0, "jingdong"

    .line 49
    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    iget-object p1, p0, Ll/bo60;->y:Ll/y20;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {p1, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0, p1}, Ll/bo60;->u(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/bo60;->E:Ljava/lang/Runnable;

    .line 69
    .line 70
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bo60;->v:Ll/pej0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Z)Ll/bo60;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-boolean p1, p0, Ll/bo60;->C:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final m()V
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->v3()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/bo60;->w:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    invoke-static {v0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Ll/bo60;->w:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 42
    .line 43
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Ll/bo60;->w:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 50
    .line 51
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p0, Ll/bo60;->w:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 58
    .line 59
    invoke-static {v0}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_0

    .line 64
    .line 65
    iget-boolean v0, p0, Ll/bo60;->D:Z

    .line 66
    .line 67
    if-nez v0, :cond_0

    .line 68
    .line 69
    iget-object v0, p0, Ll/bo60;->f:Lv/VText;

    .line 70
    .line 71
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->h:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    iget-object v0, p0, Ll/bo60;->f:Lv/VText;

    .line 78
    .line 79
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->R9:I

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 82
    .line 83
    .line 84
    :goto_0
    iget-object v0, p0, Ll/bo60;->k:Lv/VText;

    .line 85
    .line 86
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->X9:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/bo60;->f:Lv/VText;

    .line 92
    .line 93
    const/4 v1, 0x3

    .line 94
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    const/4 v3, 0x1

    .line 99
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/bo60;->k:Lv/VText;

    .line 103
    .line 104
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/bo60;->p:Lv/VText;

    .line 112
    .line 113
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/bo60;->A:Ljava/lang/String;

    .line 121
    .line 122
    const-string v1, "coin"

    .line 123
    .line 124
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    const/4 v2, 0x0

    .line 129
    if-eqz v0, :cond_1

    .line 130
    .line 131
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Oo()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_1

    .line 142
    .line 143
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->oc()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v1, p0, Ll/bo60;->g:Lv/VText;

    .line 154
    .line 155
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/bo60;->g:Lv/VText;

    .line 159
    .line 160
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ll/bo60;->l:Lv/VText;

    .line 164
    .line 165
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/bo60;->q:Lv/VText;

    .line 169
    .line 170
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_1
    iget-object v0, p0, Ll/bo60;->A:Ljava/lang/String;

    .line 175
    .line 176
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-nez v0, :cond_2

    .line 181
    .line 182
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 183
    .line 184
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_2

    .line 193
    .line 194
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 195
    .line 196
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->D6()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iget-object v1, p0, Ll/bo60;->g:Lv/VText;

    .line 205
    .line 206
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Ll/bo60;->g:Lv/VText;

    .line 210
    .line 211
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Ll/bo60;->l:Lv/VText;

    .line 215
    .line 216
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Ll/bo60;->q:Lv/VText;

    .line 220
    .line 221
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    goto :goto_1

    .line 225
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 226
    .line 227
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mi()Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-eqz v0, :cond_4

    .line 236
    .line 237
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 238
    .line 239
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->G8()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-nez v1, :cond_3

    .line 252
    .line 253
    iget-object v1, p0, Ll/bo60;->g:Lv/VText;

    .line 254
    .line 255
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Ll/bo60;->g:Lv/VText;

    .line 259
    .line 260
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 261
    .line 262
    .line 263
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 264
    .line 265
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->xb()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    if-nez v1, :cond_4

    .line 278
    .line 279
    iget-object v1, p0, Ll/bo60;->l:Lv/VText;

    .line 280
    .line 281
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Ll/bo60;->l:Lv/VText;

    .line 285
    .line 286
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 287
    .line 288
    .line 289
    :cond_4
    :goto_1
    move v0, v2

    .line 290
    :goto_2
    iget-object v1, p0, Ll/bo60;->z:Ljava/util/List;

    .line 291
    .line 292
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    const-string v4, "jingdong"

    .line 297
    .line 298
    const-string v5, "wechat"

    .line 299
    .line 300
    const-string v6, "alipay"

    .line 301
    .line 302
    if-ge v0, v1, :cond_8

    .line 303
    .line 304
    iget-object v1, p0, Ll/bo60;->z:Ljava/util/List;

    .line 305
    .line 306
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    check-cast v1, Lcom/p1/mobile/putong/data/PayMethod;

    .line 311
    .line 312
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v1

    .line 316
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 320
    .line 321
    .line 322
    move-result v7

    .line 323
    const/4 v8, -0x1

    .line 324
    sparse-switch v7, :sswitch_data_0

    .line 325
    .line 326
    .line 327
    goto :goto_3

    .line 328
    :sswitch_0
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    if-nez v1, :cond_5

    .line 333
    .line 334
    goto :goto_3

    .line 335
    :cond_5
    const/4 v8, 0x2

    .line 336
    goto :goto_3

    .line 337
    :sswitch_1
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    if-nez v1, :cond_6

    .line 342
    .line 343
    goto :goto_3

    .line 344
    :cond_6
    move v8, v3

    .line 345
    goto :goto_3

    .line 346
    :sswitch_2
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 347
    .line 348
    .line 349
    move-result v1

    .line 350
    if-nez v1, :cond_7

    .line 351
    .line 352
    goto :goto_3

    .line 353
    :cond_7
    move v8, v2

    .line 354
    :goto_3
    packed-switch v8, :pswitch_data_0

    .line 355
    .line 356
    .line 357
    goto :goto_4

    .line 358
    :pswitch_0
    iget-object v1, p0, Ll/bo60;->n:Landroid/widget/LinearLayout;

    .line 359
    .line 360
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 361
    .line 362
    .line 363
    goto :goto_4

    .line 364
    :pswitch_1
    iget-object v1, p0, Ll/bo60;->i:Landroid/widget/LinearLayout;

    .line 365
    .line 366
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 367
    .line 368
    .line 369
    goto :goto_4

    .line 370
    :pswitch_2
    iget-object v1, p0, Ll/bo60;->d:Landroid/widget/LinearLayout;

    .line 371
    .line 372
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 373
    .line 374
    .line 375
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 376
    .line 377
    goto :goto_2

    .line 378
    :cond_8
    iget-object v0, p0, Ll/bo60;->x:Lcom/p1/mobile/putong/data/PayMethod;

    .line 379
    .line 380
    invoke-static {v0, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 381
    .line 382
    .line 383
    move-result v0

    .line 384
    if-eqz v0, :cond_9

    .line 385
    .line 386
    iget-object v0, p0, Ll/bo60;->h:Lv/VCheckBox;

    .line 387
    .line 388
    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 389
    .line 390
    .line 391
    iget-object v0, p0, Ll/bo60;->m:Lv/VCheckBox;

    .line 392
    .line 393
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 394
    .line 395
    .line 396
    iget-object v0, p0, Ll/bo60;->r:Lv/VCheckBox;

    .line 397
    .line 398
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 399
    .line 400
    .line 401
    goto :goto_5

    .line 402
    :cond_9
    iget-object v0, p0, Ll/bo60;->x:Lcom/p1/mobile/putong/data/PayMethod;

    .line 403
    .line 404
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    if-eqz v0, :cond_a

    .line 409
    .line 410
    iget-object v0, p0, Ll/bo60;->h:Lv/VCheckBox;

    .line 411
    .line 412
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 413
    .line 414
    .line 415
    iget-object v0, p0, Ll/bo60;->m:Lv/VCheckBox;

    .line 416
    .line 417
    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 418
    .line 419
    .line 420
    iget-object v0, p0, Ll/bo60;->r:Lv/VCheckBox;

    .line 421
    .line 422
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 423
    .line 424
    .line 425
    goto :goto_5

    .line 426
    :cond_a
    iget-object v0, p0, Ll/bo60;->x:Lcom/p1/mobile/putong/data/PayMethod;

    .line 427
    .line 428
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 429
    .line 430
    .line 431
    move-result v0

    .line 432
    if-eqz v0, :cond_b

    .line 433
    .line 434
    iget-object v0, p0, Ll/bo60;->h:Lv/VCheckBox;

    .line 435
    .line 436
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 437
    .line 438
    .line 439
    iget-object v0, p0, Ll/bo60;->m:Lv/VCheckBox;

    .line 440
    .line 441
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 442
    .line 443
    .line 444
    iget-object v0, p0, Ll/bo60;->r:Lv/VCheckBox;

    .line 445
    .line 446
    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 447
    .line 448
    .line 449
    :cond_b
    :goto_5
    iget-object v0, p0, Ll/bo60;->d:Landroid/widget/LinearLayout;

    .line 450
    .line 451
    new-instance v1, Ll/xn60;

    .line 452
    .line 453
    invoke-direct {v1, p0}, Ll/xn60;-><init>(Ll/bo60;)V

    .line 454
    .line 455
    .line 456
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 457
    .line 458
    .line 459
    iget-object v0, p0, Ll/bo60;->i:Landroid/widget/LinearLayout;

    .line 460
    .line 461
    new-instance v1, Ll/yn60;

    .line 462
    .line 463
    invoke-direct {v1, p0}, Ll/yn60;-><init>(Ll/bo60;)V

    .line 464
    .line 465
    .line 466
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 467
    .line 468
    .line 469
    iget-object v0, p0, Ll/bo60;->n:Landroid/widget/LinearLayout;

    .line 470
    .line 471
    new-instance v1, Ll/zn60;

    .line 472
    .line 473
    invoke-direct {v1, p0}, Ll/zn60;-><init>(Ll/bo60;)V

    .line 474
    .line 475
    .line 476
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 477
    .line 478
    .line 479
    iget-object v0, p0, Ll/bo60;->n:Landroid/widget/LinearLayout;

    .line 480
    .line 481
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 482
    .line 483
    .line 484
    iget-object v0, p0, Ll/bo60;->q:Lv/VText;

    .line 485
    .line 486
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 487
    .line 488
    .line 489
    iget-object v0, p0, Ll/bo60;->t:Lv/VText;

    .line 490
    .line 491
    new-instance v1, Ll/ao60;

    .line 492
    .line 493
    invoke-direct {v1, p0}, Ll/ao60;-><init>(Ll/bo60;)V

    .line 494
    .line 495
    .line 496
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 497
    .line 498
    .line 499
    return-void

    .line 500
    nop

    .line 501
    :sswitch_data_0
    .sparse-switch
        -0x545695b6 -> :sswitch_2
        -0x2f3174da -> :sswitch_1
        0x773a8ebc -> :sswitch_0
    .end sparse-switch

    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public n(Z)Ll/bo60;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bo60;->D:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Ljava/lang/String;)Ll/bo60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bo60;->A:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Landroid/content/DialogInterface$OnDismissListener;)Ll/bo60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bo60;->B:Landroid/content/DialogInterface$OnDismissListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ll/y20;)Ll/bo60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;)",
            "Ll/bo60;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bo60;->y:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Lcom/p1/mobile/putong/data/PayMethod;)Ll/bo60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bo60;->x:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()V
    .locals 4

    .line 1
    new-instance v0, Ll/pej0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bo60;->u:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    sget v2, Ll/dgc0;->g:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/bo60;->v:Ll/pej0;

    .line 11
    .line 12
    iget-object v0, p0, Ll/bo60;->u:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/rec0;->w2:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/bo60;->f(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/bo60;->t:Lv/VText;

    .line 29
    .line 30
    const/4 v2, 0x3

    .line 31
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const/4 v3, 0x1

    .line 36
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/bo60;->v:Ll/pej0;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/bo60;->v:Ll/pej0;

    .line 45
    .line 46
    iget-object v1, p0, Ll/bo60;->B:Landroid/content/DialogInterface$OnDismissListener;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/bo60;->m()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/bo60;->v:Ll/pej0;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/bo60;->g()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public t(Ljava/util/List;)Ll/bo60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;)",
            "Ll/bo60;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bo60;->z:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/bo60;->z:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final u(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const-string v0, "jingdong"

    .line 13
    .line 14
    const-string v1, "wechat"

    .line 15
    .line 16
    const-string v2, "alipay"

    .line 17
    .line 18
    const/4 v3, -0x1

    .line 19
    sparse-switch p1, :sswitch_data_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :sswitch_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v3, 0x2

    .line 31
    goto :goto_0

    .line 32
    :sswitch_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v3, 0x1

    .line 40
    goto :goto_0

    .line 41
    :sswitch_2
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v3, 0x0

    .line 49
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 50
    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    goto :goto_1

    .line 54
    :pswitch_0
    move-object v0, v1

    .line 55
    goto :goto_1

    .line 56
    :pswitch_1
    move-object v0, v2

    .line 57
    :goto_1
    :pswitch_2
    const-string p0, "platform"

    .line 58
    .line 59
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {p0}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "e_purchase_platform_exchange"

    .line 68
    .line 69
    const-string v0, "p_purchase_intermediate_page"

    .line 70
    .line 71
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :sswitch_data_0
    .sparse-switch
        -0x545695b6 -> :sswitch_2
        -0x2f3174da -> :sswitch_1
        0x773a8ebc -> :sswitch_0
    .end sparse-switch

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
