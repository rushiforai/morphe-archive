.class public abstract Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;
.super Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Ll/ukw;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;,
        Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;
    }
.end annotation


# static fields
.field public static Y:I


# instance fields
.field private A:Landroid/view/View;

.field private B:Landroidx/appcompat/widget/Toolbar;

.field private C:Landroid/widget/TextView;

.field private D:Ljava/lang/Object;

.field private E:Ll/amw;

.field protected F:Z

.field protected G:Ljava/lang/String;

.field protected H:Ljava/lang/String;

.field protected I:Ljava/lang/String;

.field private J:Ll/njw;

.field private K:Z

.field private L:Z

.field private M:Z

.field private N:Landroid/content/res/Configuration;

.field private O:Lcom/hellogroup/mk/business/debug/DebugTips;

.field P:Z

.field private Q:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

.field private R:I

.field private S:I

.field private T:Ljava/lang/String;

.field protected U:Landroid/view/MenuItem$OnMenuItemClickListener;

.field private V:Ll/skw;

.field protected W:Ljava/lang/String;

.field private X:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

.field private final e:J

.field public f:I

.field public g:I

.field public h:Lcom/hellogroup/mk/business/widget/MKResizeListenerLayout;

.field private i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

.field protected j:Lcom/hellogroup/mk/business/base/ui/MKWebView;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field protected k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field protected l:Ll/tkw;

.field private m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/rkw;",
            ">;"
        }
    .end annotation
.end field

.field protected n:Landroid/widget/TextView;

.field protected o:Landroid/widget/ImageView;

.field private p:Landroid/view/MenuItem;

.field private q:Landroid/view/MenuItem;

.field private r:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;

.field private s:Landroid/view/View;

.field private t:Landroid/view/View;

.field private u:Landroid/view/View;

.field private v:I

.field private w:Ll/wam;

.field public x:Ljava/lang/String;

.field private y:Lio/reactivex/disposables/Disposable;

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ll/lpj0;->g()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Y:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x3a98

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->e:J

    .line 7
    .line 8
    const v0, 0x43848000    # 265.0f

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/lpj0;->f()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    mul-float/2addr v1, v0

    .line 16
    float-to-int v0, v1

    .line 17
    iput v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->f:I

    .line 18
    .line 19
    invoke-static {}, Ll/lpj0;->h()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->g:I

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->m:Ljava/util/ArrayList;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->v:I

    .line 30
    .line 31
    const/4 v2, 0x5

    .line 32
    iput v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->z:I

    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v3, "MomoMKWebActivity#"

    .line 37
    .line 38
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iput-object v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->D:Ljava/lang/Object;

    .line 53
    .line 54
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->K:Z

    .line 55
    .line 56
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->L:Z

    .line 57
    .line 58
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->M:Z

    .line 59
    .line 60
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->P:Z

    .line 61
    .line 62
    new-instance v1, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Q:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 68
    .line 69
    const/16 v1, -0x194

    .line 70
    .line 71
    iput v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->S:I

    .line 72
    .line 73
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->T:Ljava/lang/String;

    .line 74
    .line 75
    new-instance v1, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$d;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$d;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 78
    .line 79
    .line 80
    iput-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->U:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 81
    .line 82
    new-instance v1, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$e;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$e;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 85
    .line 86
    .line 87
    iput-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->V:Ll/skw;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->W:Ljava/lang/String;

    .line 90
    .line 91
    new-instance v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 92
    .line 93
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 97
    .line 98
    return-void
.end method

.method private A2()V
    .locals 3

    .line 1
    sget v0, Ll/pcc0;->m:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Ll/w9c0;->a:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    filled-new-array {v1}, [I

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setColorSchemeColors([I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 29
    .line 30
    const/high16 v1, 0x42800000    # 64.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/lpj0;->c(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-virtual {v0, v2, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->n(ZI)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 41
    .line 42
    new-instance v1, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setOnRefreshListener(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;)V

    .line 48
    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->y2(Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private B1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "_clsL"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "1"

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->F:Z

    .line 24
    .line 25
    const-string v0, "_loading"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->G:Ljava/lang/String;

    .line 32
    .line 33
    const-string v0, "_bg_color"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->H:Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "_navbar"

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->I:Ljava/lang/String;

    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method private C1(Landroid/net/Uri;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/16 p5, 0x200

    .line 2
    .line 3
    invoke-static {p5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p5

    .line 7
    invoke-virtual {p5, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-eqz p3, :cond_2

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->q2(Landroid/net/Uri;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/q4g0;->f(Landroid/view/Window;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/c2j0;->f()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/lv0;->a()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    invoke-static {p3}, Ll/q4g0;->c(Landroid/content/Context;)I

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    invoke-direct {p0, p1, p3}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s2(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 43
    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    invoke-direct {p0, p1, p3}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s2(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    :cond_0
    const-string p1, "1"

    .line 50
    .line 51
    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->S0(Z)V

    .line 56
    .line 57
    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-static {p0, p1}, Ll/ajw;->g(Landroid/app/Activity;Ll/ajw$b;)Ll/ajw;

    .line 62
    .line 63
    .line 64
    :cond_1
    const/4 p0, 0x1

    .line 65
    return p0

    .line 66
    :cond_2
    const/4 p0, 0x0

    .line 67
    return p0
.end method

.method private static E1(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x6

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v0, "#"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_1
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method private F1(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 p0, 0x190

    .line 2
    .line 3
    const/16 v0, 0x1f4

    .line 4
    .line 5
    if-lt p1, p0, :cond_0

    .line 6
    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    const-string p0, "PAGE NOT FOUND"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    if-lt p1, v0, :cond_1

    .line 13
    .line 14
    const/16 p0, 0x258

    .line 15
    .line 16
    if-ge p1, p0, :cond_1

    .line 17
    .line 18
    const-string p0, "Internal Server Error"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p0, "Oops! \u51fa\u9519\u4e86"

    .line 22
    .line 23
    return-object p0
.end method

.method private J1(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/i8g0;->c(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "param_start_url"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_0
    invoke-static {p1}, Ll/i8g0;->c(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public static K2(Ljava/lang/Class;Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;",
            ">;",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0, v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->L2(Ljava/lang/Class;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private L1(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->J1(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public static L2(Ljava/lang/Class;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;",
            ">;",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "param_start_url"

    .line 7
    .line 8
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    invoke-static {p3}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "PARAM_PRE_FETCHE"

    .line 18
    .line 19
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {p4}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    const-string p0, "PARAMS_FOR_URL"

    .line 29
    .line 30
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    :cond_1
    instance-of p0, p1, Landroid/app/Activity;

    .line 34
    .line 35
    if-nez p0, :cond_2

    .line 36
    .line 37
    const/high16 p0, 0x10000000

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    :cond_2
    invoke-static {v0, p2}, Ll/zqw;->k(Landroid/content/Intent;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private M2(Landroid/content/res/Configuration;)V
    .locals 9

    .line 1
    const-string v0, "MKActivity"

    .line 2
    .line 3
    const-string v1, "Configuration="

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v1, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 15
    .line 16
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/lpj0;->g()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {}, Ll/lpj0;->h()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-lez v4, :cond_2

    .line 35
    .line 36
    iget-object v5, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 37
    .line 38
    if-eqz v5, :cond_2

    .line 39
    .line 40
    iget-boolean v6, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->L:Z

    .line 41
    .line 42
    if-nez v6, :cond_0

    .line 43
    .line 44
    invoke-virtual {v5}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e1()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 51
    .line 52
    iget-object v7, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->h:Lcom/hellogroup/mk/business/widget/MKResizeListenerLayout;

    .line 53
    .line 54
    const/4 v8, 0x1

    .line 55
    invoke-virtual {v5, v7, v4, v1, v8}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s1(Landroid/view/ViewGroup;IIZ)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    new-instance v4, Ll/cp2;

    .line 63
    .line 64
    invoke-direct {v4, p0, p1}, Ll/cp2;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Landroid/content/res/Configuration;)V

    .line 65
    .line 66
    .line 67
    const-wide/16 v7, 0x12c

    .line 68
    .line 69
    invoke-virtual {v1, v4, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    .line 71
    .line 72
    :cond_1
    if-nez v6, :cond_2

    .line 73
    .line 74
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 75
    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    const/4 v1, 0x2

    .line 79
    const-wide/16 v4, 0x3e8

    .line 80
    .line 81
    invoke-virtual {p1, v1, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :goto_1
    :try_start_1
    const-string v1, ""

    .line 86
    .line 87
    invoke-static {v0, v1, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_2
    iput-object v3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->N:Landroid/content/res/Configuration;

    .line 91
    .line 92
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->M:Z

    .line 93
    .line 94
    return-void

    .line 95
    :catchall_1
    move-exception p1

    .line 96
    iput-object v3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->N:Landroid/content/res/Configuration;

    .line 97
    .line 98
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->M:Z

    .line 99
    .line 100
    throw p1
.end method

.method private O1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/pcc0;->h:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewStub;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 18
    .line 19
    sget v1, Ll/pcc0;->d:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->t:Landroid/view/View;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 28
    .line 29
    sget v1, Ll/pcc0;->e:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->u:Landroid/view/View;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 38
    .line 39
    sget v1, Ll/pcc0;->u:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/widget/TextView;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->C:Landroid/widget/TextView;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 50
    .line 51
    sget v1, Ll/pcc0;->c:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->A:Landroid/view/View;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 60
    .line 61
    sget v1, Ll/pcc0;->s:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->B:Landroidx/appcompat/widget/Toolbar;

    .line 70
    .line 71
    new-instance v1, Ll/ap2;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/ap2;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void
.end method

.method private S1(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->T1(Ljava/lang/String;Ljava/lang/String;Ll/zlw;)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method private T1(Ljava/lang/String;Ljava/lang/String;Ll/zlw;)Z
    .locals 8

    .line 1
    const-string v0, "MKActivity"

    .line 2
    .line 3
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->x:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    :try_start_0
    invoke-static {}, Ll/cn80;->g()Ll/cn80;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v3, p1}, Ll/cn80;->h(Ljava/lang/String;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iput-object v3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    if-nez v3, :cond_1

    .line 23
    .line 24
    sget-object v3, Ll/mjw;->INSTANCE:Ll/mjw;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    invoke-virtual {v3, p0, p1, v5}, Ll/mjw;->s(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Intent;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    iput-object v3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto/16 :goto_3

    .line 41
    .line 42
    :cond_0
    new-instance v3, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-static {v5, p1}, Ll/brw;->a(Landroid/content/Intent;Ljava/lang/String;)Ll/brw;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-direct {v3, p0, v5}, Lcom/hellogroup/mk/business/base/ui/MKWebView;-><init>(Landroid/content/Context;Ll/brw;)V

    .line 53
    .line 54
    .line 55
    iput-object v3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 56
    .line 57
    :goto_0
    move v3, v2

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move v3, v4

    .line 60
    :goto_1
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 61
    .line 62
    const/16 v6, 0x1c

    .line 63
    .line 64
    const/4 v7, 0x0

    .line 65
    if-lt v5, v6, :cond_2

    .line 66
    .line 67
    iget-object v5, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 68
    .line 69
    const/4 v6, 0x2

    .line 70
    invoke-virtual {v5, v6, v7}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    if-eqz p3, :cond_3

    .line 74
    .line 75
    iget-object v5, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 76
    .line 77
    invoke-virtual {p3}, Ll/zlw;->a()Ll/nlw;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    invoke-virtual {v5, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0(Ll/nlw;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .line 83
    .line 84
    :cond_3
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 85
    .line 86
    invoke-static {}, Ll/cn80;->f()Landroid/view/ViewGroup$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 94
    .line 95
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->h:Lcom/hellogroup/mk/business/widget/MKResizeListenerLayout;

    .line 96
    .line 97
    iget v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->g:I

    .line 98
    .line 99
    sget v5, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Y:I

    .line 100
    .line 101
    invoke-virtual {p3, v1, v2, v5}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r1(Landroid/view/ViewGroup;II)V

    .line 102
    .line 103
    .line 104
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 105
    .line 106
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    if-nez p3, :cond_4

    .line 111
    .line 112
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 113
    .line 114
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 115
    .line 116
    invoke-virtual {p3, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->addView(Landroid/view/View;)V

    .line 117
    .line 118
    .line 119
    :cond_4
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 120
    .line 121
    invoke-virtual {p3, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 122
    .line 123
    .line 124
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 125
    .line 126
    if-nez p3, :cond_5

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->H1()Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 129
    .line 130
    .line 131
    move-result-object p3

    .line 132
    iput-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 133
    .line 134
    if-nez p3, :cond_5

    .line 135
    .line 136
    new-instance p3, Ll/zkw;

    .line 137
    .line 138
    invoke-direct {p3, p1}, Ll/zkw;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iput-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 142
    .line 143
    :cond_5
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 144
    .line 145
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 146
    .line 147
    invoke-virtual {p3, p0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 148
    .line 149
    .line 150
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 151
    .line 152
    invoke-static {p1}, Ll/sjw;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {p3, v1, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->s(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->r:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;

    .line 160
    .line 161
    if-nez p3, :cond_6

    .line 162
    .line 163
    new-instance p3, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;

    .line 164
    .line 165
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 166
    .line 167
    invoke-direct {p3, p0, v1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Ll/nxl;)V

    .line 168
    .line 169
    .line 170
    iput-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->r:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;

    .line 171
    .line 172
    :cond_6
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 173
    .line 174
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->r:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;

    .line 175
    .line 176
    invoke-virtual {p3, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 177
    .line 178
    .line 179
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 180
    .line 181
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Q:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 182
    .line 183
    invoke-virtual {p3, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setOnLoadUrlListener(Lcom/hellogroup/mk/business/base/ui/MKWebView$f;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->P1()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->l2(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w:Ll/wam;

    .line 193
    .line 194
    if-nez p3, :cond_7

    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->M1()Ll/wam;

    .line 197
    .line 198
    .line 199
    move-result-object p3

    .line 200
    iput-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w:Ll/wam;

    .line 201
    .line 202
    :cond_7
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w:Ll/wam;

    .line 203
    .line 204
    if-eqz p3, :cond_8

    .line 205
    .line 206
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 207
    .line 208
    invoke-virtual {v1, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setWebChooseFile(Ll/wam;)V

    .line 209
    .line 210
    .line 211
    :cond_8
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->L1(Ljava/lang/String;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    if-nez v3, :cond_9

    .line 215
    .line 216
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 217
    .line 218
    invoke-virtual {p3, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_9
    const-string p3, "\u9884\u52a0\u8f7d\uff0c\u9700\u8981\u624b\u52a8\u89e6\u53d1 onPageStarted:%s"

    .line 223
    .line 224
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    invoke-static {p3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p3

    .line 232
    invoke-static {v0, p3}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->r:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;

    .line 236
    .line 237
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 238
    .line 239
    invoke-virtual {p3, v0, p1, v7}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$i;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 240
    .line 241
    .line 242
    :goto_2
    invoke-static {p1}, Ll/kx2;->a(Ljava/lang/String;)Z

    .line 243
    .line 244
    .line 245
    move-result p3

    .line 246
    if-eqz p3, :cond_a

    .line 247
    .line 248
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 249
    .line 250
    const-string v0, "forbidLeftSlide"

    .line 251
    .line 252
    invoke-virtual {p3, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    :cond_a
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 256
    .line 257
    invoke-static {p3, p2}, Ll/cn80;->k(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->U1(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    return v4

    .line 264
    :goto_3
    invoke-static {v0, v1, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 265
    .line 266
    .line 267
    iget-object p2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 268
    .line 269
    if-eqz p2, :cond_b

    .line 270
    .line 271
    invoke-virtual {p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 272
    .line 273
    .line 274
    move-result p2

    .line 275
    if-nez p2, :cond_b

    .line 276
    .line 277
    iget-object p2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 278
    .line 279
    invoke-virtual {p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    invoke-static {p2}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 284
    .line 285
    .line 286
    move-result-object p2

    .line 287
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    invoke-virtual {p2, p1}, Ll/xkw;->P(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    :cond_b
    sget p1, Lcom/hellogroup/mk/business/R$string;->b:I

    .line 295
    .line 296
    invoke-static {p1}, Ll/t1j0;->l(I)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 300
    .line 301
    .line 302
    return v2
.end method

.method private U1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/sjw;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->O:Lcom/hellogroup/mk/business/debug/DebugTips;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ll/lpj0;->h()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {}, Ll/lpj0;->g()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {p0, p1, v0, v1}, Lcom/hellogroup/mk/business/debug/DebugTips;->g(Landroid/content/Context;Ljava/lang/String;II)Lcom/hellogroup/mk/business/debug/DebugTips;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->O:Lcom/hellogroup/mk/business/debug/DebugTips;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/hellogroup/mk/business/debug/DebugTips;->b(Landroid/app/Activity;)Landroid/view/ViewGroup;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->O:Lcom/hellogroup/mk/business/debug/DebugTips;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-static {p1}, Ll/a6k0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Lcom/hellogroup/mk/business/debug/DebugTips;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic V0(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->W:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-virtual {v0, p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setEnabled(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic W0(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "loadUrlEnd + url --> "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "MKActivity"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    const-string v1, "native"

    .line 25
    .line 26
    invoke-virtual {p0, v0, v0, v1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->D2(ZZLjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 v7, 0x0

    .line 30
    const/4 v8, 0x1

    .line 31
    const/4 v3, 0x0

    .line 32
    const/4 v5, 0x0

    .line 33
    const-string v6, "native"

    .line 34
    .line 35
    move-object v2, p0

    .line 36
    move-object v4, p1

    .line 37
    invoke-virtual/range {v2 .. v8}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->F2(ZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    invoke-direct {v2}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n2()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic X0(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->a2(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y0(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Y1()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/ej2;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "M353"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static synthetic a1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Ll/zlw;Ljava/lang/String;)Lkotlin/Unit;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iput-object p2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->x:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    const-string v1, "PARAM_PRE_FETCHE"

    .line 20
    .line 21
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    const-string v1, "PARAMS_FOR_URL"

    .line 25
    .line 26
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move-object p2, v0

    .line 32
    :goto_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->x:Ljava/lang/String;

    .line 33
    .line 34
    invoke-direct {p0, v1, p2, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->T1(Ljava/lang/String;Ljava/lang/String;Ll/zlw;)Z

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method private c2(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->P:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->D:Ljava/lang/Object;

    .line 6
    .line 7
    new-instance v1, Ll/yo2;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/yo2;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/x310;->c(Ljava/lang/Object;Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic d1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->D:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method private d2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private e2()V
    .locals 2

    .line 1
    const-string v0, "MKActivity"

    .line 2
    .line 3
    const-string v1, "\u5237\u65b0\u8d85\u65f6"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->i()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setRefreshing(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic f1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->c2(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->T:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->T:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, p0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->E2()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic h1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public static i2(Ljava/lang/String;)I
    .locals 7

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, -0x194

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    const-string v0, ","

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_3

    .line 17
    .line 18
    array-length v0, p0

    .line 19
    const/4 v2, 0x4

    .line 20
    const/4 v3, 0x3

    .line 21
    if-eq v0, v3, :cond_1

    .line 22
    .line 23
    array-length v0, p0

    .line 24
    if-eq v0, v2, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    aget-object v0, p0, v0

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/16 v1, 0xff

    .line 39
    .line 40
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v4, 0x1

    .line 45
    aget-object v4, p0, v4

    .line 46
    .line 47
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    const/4 v5, 0x2

    .line 60
    aget-object v5, p0, v5

    .line 61
    .line 62
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    array-length v6, p0

    .line 75
    if-ne v6, v2, :cond_2

    .line 76
    .line 77
    aget-object p0, p0, v3

    .line 78
    .line 79
    invoke-static {p0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    const/high16 v1, 0x3f800000    # 1.0f

    .line 88
    .line 89
    invoke-static {p0, v1}, Ljava/lang/Math;->min(FF)F

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    const/high16 v1, 0x437f0000    # 255.0f

    .line 94
    .line 95
    mul-float/2addr p0, v1

    .line 96
    float-to-int v1, p0

    .line 97
    :cond_2
    invoke-static {v1, v0, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    return p0

    .line 102
    :cond_3
    :goto_0
    return v1
.end method

.method public static synthetic j1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->e2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k2(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    const-string p0, "https://www.immomo.com/checkurl/?url="

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/16 p0, 0x25

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object p0, p1

    .line 27
    :goto_0
    const-string v0, "https://passport.immomo.com/authorize?redirect_uri="

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const/16 p0, 0x33

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    :cond_1
    return-object p0

    .line 46
    :cond_2
    return-object p1
.end method

.method public static synthetic l1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->d2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->F1(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private n2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->y:Lio/reactivex/disposables/Disposable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->y:Lio/reactivex/disposables/Disposable;

    .line 12
    .line 13
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->y:Lio/reactivex/disposables/Disposable;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic o1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->y:Lio/reactivex/disposables/Disposable;

    .line 2
    .line 3
    return-object p1
.end method

.method private o2()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static synthetic p1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic q1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Ll/amw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->E:Ll/amw;

    .line 2
    .line 3
    return-object p0
.end method

.method private q2(Landroid/net/Uri;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    :try_start_0
    const-string v0, "1"

    .line 4
    .line 5
    const-string v1, "_safe_keyboard"

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    :goto_0
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->h:Lcom/hellogroup/mk/business/widget/MKResizeListenerLayout;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setFitsSystemWindows(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    const-string p1, "MKActivity"

    .line 28
    .line 29
    const-string v0, ""

    .line 30
    .line 31
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public static synthetic r1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->g2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Landroid/view/MenuItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->q:Landroid/view/MenuItem;

    .line 2
    .line 3
    return-object p0
.end method

.method private s2(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr v0, p2

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p1, p0, v0, p2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic t1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Landroid/view/MenuItem;)Landroid/view/MenuItem;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->q:Landroid/view/MenuItem;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic u1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Ll/c2j0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static v1(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "_ui_web_panel"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "1"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method private v2(III)V
    .locals 4

    .line 1
    const/16 v0, -0x194

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/xac0;->b:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 20
    .line 21
    invoke-virtual {v1, p1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 22
    .line 23
    .line 24
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 25
    .line 26
    invoke-virtual {v3, v1}, Ll/c2j0;->m(Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v3, Ll/xac0;->d:I

    .line 34
    .line 35
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1, p1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o:Landroid/widget/ImageView;

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    if-eq p2, v0, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n:Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    :cond_1
    if-eq p3, v0, :cond_2

    .line 59
    .line 60
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p:Landroid/view/MenuItem;

    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object p2, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 65
    .line 66
    invoke-virtual {p2, p1, p3}, Ll/c2j0;->k(Landroid/view/MenuItem;I)V

    .line 67
    .line 68
    .line 69
    iput p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->S:I

    .line 70
    .line 71
    :cond_2
    return-void
.end method


# virtual methods
.method public B2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/c2j0;->p()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/c2j0;->h()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public C2(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget v3, Ll/w9c0;->g:I

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->B:Landroidx/appcompat/widget/Toolbar;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eq v0, v1, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->B:Landroidx/appcompat/widget/Toolbar;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->u:Landroid/view/View;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eq v0, v1, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->u:Landroid/view/View;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->t:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->t:Landroid/view/View;

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    :cond_3
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->U0()Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget v0, Ll/c8c0;->a:I

    .line 82
    .line 83
    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->A:Landroid/view/View;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eq p1, v1, :cond_5

    .line 98
    .line 99
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 102
    .line 103
    .line 104
    :cond_5
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->A:Landroid/view/View;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 107
    .line 108
    .line 109
    :cond_6
    return-void
.end method

.method public D2(ZZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-boolean p2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->F:Z

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->C2(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string p2, "showLoadingPage&&&"

    .line 15
    .line 16
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p1}, Ll/xkw;->U(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public E2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p:Landroid/view/MenuItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->l:Ll/tkw;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    new-instance v0, Ll/tkw;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/tkw;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    sget v1, Ll/xac0;->f:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/tkw;->i(I)Ll/tkw;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/tkw;->d()Ll/tkw;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->l:Ll/tkw;

    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->l:Ll/tkw;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->V:Ll/skw;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/tkw;->g(Ll/skw;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->l:Ll/tkw;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->m:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/tkw;->h(Ljava/util/ArrayList;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->d:Landroidx/appcompat/widget/Toolbar;

    .line 42
    .line 43
    sget v1, Ll/pcc0;->t:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->d:Landroidx/appcompat/widget/Toolbar;

    .line 52
    .line 53
    :cond_2
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->l:Ll/tkw;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/tkw;->j(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public F2(ZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p5}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->I2(ZLjava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    if-eqz p6, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p1, p4, p3}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->z1(ZLjava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method public abstract G1()I
.end method

.method public H1()Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;
    .locals 1

    .line 1
    new-instance v0, Ll/zkw;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->x:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/zkw;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public H2(ZZLjava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    const/4 v2, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v3, p2

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move v6, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->F2(ZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I1()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Y1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-static {}, Ll/lpj0;->i()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-gtz v0, :cond_1

    .line 14
    .line 15
    invoke-static {p0}, Ll/q4g0;->b(Landroid/content/Context;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_1
    return v0
.end method

.method public I2(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p2, :cond_6

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    if-eqz p1, :cond_5

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 p2, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/w9c0;->h:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->B:Landroidx/appcompat/widget/Toolbar;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->B:Landroidx/appcompat/widget/Toolbar;

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->t:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eq p1, v0, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->t:Landroid/view/View;

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->A:Landroid/view/View;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->u:Landroid/view/View;

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->u:Landroid/view/View;

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    :cond_3
    invoke-static {p3}, Ll/i8g0;->c(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_4

    .line 85
    .line 86
    const-string p3, "Oops! \u51fa\u9519\u4e86"

    .line 87
    .line 88
    :cond_4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->C:Landroid/widget/TextView;

    .line 89
    .line 90
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_5
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->A:Landroid/view/View;

    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eq p1, v0, :cond_6

    .line 106
    .line 107
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s:Landroid/view/View;

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    :cond_6
    return-void
.end method

.method public K1(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p2}, Ll/i8g0;->c(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->J1(Ljava/lang/String;)Landroid/net/Uri;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    return-object v1
.end method

.method public M1()Ll/wam;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public N0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->U0()Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$b;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$b;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/c2j0;->c(Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;Landroid/view/View$OnClickListener;)Ll/c2j0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/c2j0;->g()Landroidx/appcompat/widget/Toolbar;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->d:Landroidx/appcompat/widget/Toolbar;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->P0()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->d:Landroidx/appcompat/widget/Toolbar;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Ll/c2j0;->l(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->R1()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public N2()V
    .locals 1

    .line 1
    invoke-static {}, Ll/bjw;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->M:Z

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->N:Landroid/content/res/Configuration;

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->M2(Landroid/content/res/Configuration;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public P0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public P1()V
    .locals 3

    .line 1
    sget-object v0, Ll/kjw;->INSTANCE:Ll/kjw;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1, v2}, Ll/kjw;->a(Landroid/content/Context;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Q0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->U0()Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/lpj0;->j(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->onBackPressed()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Q2()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public R1()V
    .locals 2

    .line 1
    sget v0, Ll/pcc0;->v:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/ImageView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o:Landroid/widget/ImageView;

    .line 10
    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o:Landroid/widget/ImageView;

    .line 17
    .line 18
    new-instance v1, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$c;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$c;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/pcc0;->w:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/widget/TextView;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n:Landroid/widget/TextView;

    .line 35
    .line 36
    return-void
.end method

.method public V1()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->O1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v1, "param_start_url"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "PARAMS_FOR_URL"

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string v1, ""

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    :goto_0
    invoke-direct {p0, v1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->B1(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sget v2, Ll/pcc0;->k:I

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/hellogroup/mk/business/widget/MKResizeListenerLayout;

    .line 36
    .line 37
    iput-object v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->h:Lcom/hellogroup/mk/business/widget/MKResizeListenerLayout;

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->A2()V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/yfi;->p()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    iput v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->z:I

    .line 47
    .line 48
    invoke-direct {p0, v1, v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->S1(Ljava/lang/String;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->r2()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public X1(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public Z1()V
    .locals 0

    .line 1
    return-void
.end method

.method public a2(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    return-void
.end method

.method public attachBaseContext(Landroid/content/Context;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/content/res/Configuration;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->attachBaseContext(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->attachBaseContext(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    :try_start_0
    new-instance v0, Landroid/content/res/Configuration;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {v0, p1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/ContextThemeWrapper;->applyOverrideConfiguration(Landroid/content/res/Configuration;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catch_0
    move-exception p0

    .line 49
    const-string p1, "MKActivity"

    .line 50
    .line 51
    const-string v0, ""

    .line 52
    .line 53
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public b2(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public getAssets()Landroid/content/res/AssetManager;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public h2(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l2(Ljava/lang/String;)V
    .locals 11

    .line 1
    const-string v1, "MKActivity"

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k2(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v7

    .line 7
    :try_start_0
    invoke-virtual {p0, v7}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X1(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "_resize"

    .line 19
    .line 20
    const/4 v9, 0x0

    .line 21
    invoke-virtual {v3, v0, v9}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v2, 0x10

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    move-object p0, v0

    .line 39
    goto/16 :goto_3

    .line 40
    .line 41
    :cond_0
    :goto_0
    invoke-static {p1}, Ll/glw;->j(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    sget-object p1, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->a()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    const-string p0, "\u975e immomo.com\u57df\u540d\u4e0d\u80fd\u4f7f\u7528 ui_mode"

    .line 56
    .line 57
    invoke-static {v1, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 62
    .line 63
    const/16 v0, 0x1d

    .line 64
    .line 65
    if-lt p1, v0, :cond_2

    .line 66
    .line 67
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/c2j0;->f()Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p1, v9}, Ll/xo2;->a(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    :cond_2
    const-string p1, "_ui"

    .line 77
    .line 78
    invoke-virtual {v3, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    const-string p1, "_ui_mode"

    .line 83
    .line 84
    invoke-virtual {v3, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const-string v0, "_ui_theme"

    .line 89
    .line 90
    invoke-virtual {v3, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v8

    .line 94
    const-string v0, "_ac_mode"

    .line 95
    .line 96
    invoke-virtual {v3, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v2, "_show_scrollbar"

    .line 101
    .line 102
    invoke-virtual {v3, v2, v9}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    iget-object v6, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 107
    .line 108
    invoke-virtual {v6, v2}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 109
    .line 110
    .line 111
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    const/4 v10, -0x1

    .line 116
    if-nez v2, :cond_5

    .line 117
    .line 118
    const-string v2, "1"

    .line 119
    .line 120
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_3

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_3
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 128
    .line 129
    if-eqz v0, :cond_4

    .line 130
    .line 131
    invoke-virtual {v0, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 132
    .line 133
    .line 134
    :cond_4
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 135
    .line 136
    invoke-virtual {v0, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->h:Lcom/hellogroup/mk/business/widget/MKResizeListenerLayout;

    .line 140
    .line 141
    if-eqz v0, :cond_7

    .line 142
    .line 143
    invoke-virtual {v0, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 144
    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 148
    .line 149
    invoke-virtual {v0, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->H:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->E1(Ljava/lang/String;)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    if-eqz v0, :cond_7

    .line 159
    .line 160
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 161
    .line 162
    if-eqz v2, :cond_6

    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 165
    .line 166
    .line 167
    move-result v6

    .line 168
    invoke-virtual {v2, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 169
    .line 170
    .line 171
    :cond_6
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->h:Lcom/hellogroup/mk/business/widget/MKResizeListenerLayout;

    .line 172
    .line 173
    if-eqz v2, :cond_7

    .line 174
    .line 175
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 180
    .line 181
    .line 182
    :cond_7
    :goto_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_8

    .line 187
    .line 188
    const-string p1, "0"

    .line 189
    .line 190
    :cond_8
    move-object v2, p0

    .line 191
    move-object v6, p1

    .line 192
    invoke-direct/range {v2 .. v8}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->C1(Landroid/net/Uri;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 193
    .line 194
    .line 195
    move-result p0

    .line 196
    move-object p1, v6

    .line 197
    const-string v0, "_ui_bg"

    .line 198
    .line 199
    invoke-virtual {v3, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->E1(Ljava/lang/String;)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    if-nez v0, :cond_9

    .line 208
    .line 209
    return-void

    .line 210
    :cond_9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    iput p1, v2, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->v:I

    .line 219
    .line 220
    const/4 v3, 0x1

    .line 221
    if-ne p1, v3, :cond_b

    .line 222
    .line 223
    if-nez p0, :cond_a

    .line 224
    .line 225
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    invoke-virtual {v2, p0, v9}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->R0(IZ)V

    .line 230
    .line 231
    .line 232
    :cond_a
    iget-object p0, v2, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 233
    .line 234
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    invoke-virtual {p0, p1}, Ll/c2j0;->j(I)V

    .line 239
    .line 240
    .line 241
    iget-object p0, v2, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 242
    .line 243
    sget p1, Ll/xac0;->b:I

    .line 244
    .line 245
    invoke-virtual {p0, p1}, Ll/c2j0;->l(I)V

    .line 246
    .line 247
    .line 248
    iget-object p0, v2, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n:Landroid/widget/TextView;

    .line 249
    .line 250
    invoke-virtual {p0, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 251
    .line 252
    .line 253
    iget-object p0, v2, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 254
    .line 255
    invoke-virtual {p0, v9}, Ll/c2j0;->q(Z)V

    .line 256
    .line 257
    .line 258
    iget-object p0, v2, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o:Landroid/widget/ImageView;

    .line 259
    .line 260
    sget p1, Ll/xac0;->d:I

    .line 261
    .line 262
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :cond_b
    if-nez p0, :cond_c

    .line 267
    .line 268
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 269
    .line 270
    .line 271
    move-result p0

    .line 272
    invoke-virtual {v2, p0, v3}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->R0(IZ)V

    .line 273
    .line 274
    .line 275
    :cond_c
    iget-object p0, v2, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 276
    .line 277
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    invoke-virtual {p0, p1}, Ll/c2j0;->j(I)V

    .line 282
    .line 283
    .line 284
    iget-object p0, v2, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n:Landroid/widget/TextView;

    .line 285
    .line 286
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    sget v0, Ll/w9c0;->f:I

    .line 291
    .line 292
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 297
    .line 298
    .line 299
    iget-object p0, v2, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o:Landroid/widget/ImageView;

    .line 300
    .line 301
    sget p1, Ll/xac0;->c:I

    .line 302
    .line 303
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :goto_3
    const-string p1, ""

    .line 308
    .line 309
    invoke-static {v1, p1, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 310
    .line 311
    .line 312
    return-void
.end method

.method public m2()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->K:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->K:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->J:Ll/njw;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Ll/njw;->f(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->E(IILandroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w:Ll/wam;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-interface {v0, p1, p2, p3}, Ll/wam;->a(IILandroid/content/Intent;)Z

    .line 13
    .line 14
    .line 15
    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onBack()V
    .locals 0

    return-void
.end method

.method public onBackPressed()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->U0()Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->U0()Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/lpj0;->j(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->a1()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->canGoBack()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o:Landroid/widget/ImageView;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    new-instance v1, Landroid/view/animation/ScaleAnimation;

    .line 49
    .line 50
    const/4 v8, 0x1

    .line 51
    const/high16 v9, 0x3f000000    # 0.5f

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    const/high16 v3, 0x3f800000    # 1.0f

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    const/high16 v5, 0x3f800000    # 1.0f

    .line 58
    .line 59
    const/4 v6, 0x1

    .line 60
    const/high16 v7, 0x3f000000    # 0.5f

    .line 61
    .line 62
    invoke-direct/range {v1 .. v9}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 63
    .line 64
    .line 65
    const-wide/16 v2, 0x12c

    .line 66
    .line 67
    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o:Landroid/widget/ImageView;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o:Landroid/widget/ImageView;

    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_0
    return-void

    .line 82
    :cond_3
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/glw;->h()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->N:Landroid/content/res/Configuration;

    .line 11
    .line 12
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    const-wide/16 v1, 0x1f4

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q1(Z)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    const-string v0, "document_draw_whole"

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->K1(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "true"

    .line 12
    .line 13
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-static {}, Landroid/webkit/WebView;->enableSlowWholeDocumentDraw()V

    .line 20
    .line 21
    .line 22
    :cond_0
    new-instance p1, Ll/amw;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/amw;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->E:Ll/amw;

    .line 28
    .line 29
    new-instance p1, Ll/njw;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/njw;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->J:Ll/njw;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->G1()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->setContentView(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->V1()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->m2()V

    .line 47
    .line 48
    .line 49
    sget-object p1, Ll/bjw;->Companion:Ll/bjw$a;

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Ll/bjw$a;->c(Ll/ukw;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n2()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/bjw;->Companion:Ll/bjw$a;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/bjw$a;->d(Ll/ukw;)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o2()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->J:Ll/njw;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/njw;->g(Landroid/app/Activity;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/cn80;->g()Ll/cn80;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ll/cn80;->c(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/cn80;->g()Ll/cn80;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->x:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ll/cn80;->j(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Q:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iput-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Q:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->d()V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w:Ll/wam;

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    invoke-interface {v0}, Ll/wam;->g()V

    .line 61
    .line 62
    .line 63
    :cond_3
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->E:Ll/amw;

    .line 64
    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Ll/amw;->a(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 70
    .line 71
    .line 72
    :cond_4
    iput-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w:Ll/wam;

    .line 73
    .line 74
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->D:Ljava/lang/Object;

    .line 75
    .line 76
    invoke-static {v0}, Ll/x310;->a(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onFront()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->M:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->N:Landroid/content/res/Configuration;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->M2(Landroid/content/res/Configuration;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onPause()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->L:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->E:Ll/amw;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/amw;->b()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->u()V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w:Ll/wam;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, p1, p2, p3}, Ll/wam;->e(I[Ljava/lang/String;[I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->G(I[Ljava/lang/String;[I)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->L:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o2()V

    .line 5
    .line 6
    .line 7
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w1()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->k:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->v()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public p2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p:Landroid/view/MenuItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p:Landroid/view/MenuItem;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p:Landroid/view/MenuItem;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public r2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->I1()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 16
    .line 17
    iput v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->R:I

    .line 18
    .line 19
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 20
    .line 21
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public setTitle(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->B:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n:Landroid/widget/TextView;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    invoke-super {p0, p1}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->setTitle(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->B:Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_0

    .line 29
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 32
    :cond_1
    invoke-super {p0, p1}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public u2(Ll/ave0;)V
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/ave0;->b()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p1}, Ll/ave0;->c()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i2(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p1}, Ll/ave0;->d()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v2}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i2(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {p1}, Ll/ave0;->a()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-static {v3}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i2(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p1}, Ll/ave0;->e()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i2(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v4, 0x1

    .line 41
    const/16 v5, -0x194

    .line 42
    .line 43
    if-ne v0, v4, :cond_4

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    if-eq v1, v5, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0, v1, v4}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->R0(IZ)V

    .line 49
    .line 50
    .line 51
    iget-object v6, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 52
    .line 53
    invoke-virtual {v6, v1}, Ll/c2j0;->j(I)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 57
    .line 58
    invoke-virtual {v1, v4}, Ll/c2j0;->q(Z)V

    .line 59
    .line 60
    .line 61
    const/4 v1, -0x1

    .line 62
    if-ne v2, v5, :cond_2

    .line 63
    .line 64
    move v2, v1

    .line 65
    :cond_2
    if-ne v3, v5, :cond_3

    .line 66
    .line 67
    move v3, v1

    .line 68
    :cond_3
    if-ne p1, v5, :cond_8

    .line 69
    .line 70
    :goto_0
    move p1, v1

    .line 71
    goto :goto_1

    .line 72
    :cond_4
    if-nez v0, :cond_8

    .line 73
    .line 74
    if-ne v1, v5, :cond_5

    .line 75
    .line 76
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    sget v6, Ll/w9c0;->e:I

    .line 81
    .line 82
    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    :cond_5
    invoke-virtual {p0, v1, v4}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->R0(IZ)V

    .line 87
    .line 88
    .line 89
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 90
    .line 91
    invoke-virtual {v4, v1}, Ll/c2j0;->j(I)V

    .line 92
    .line 93
    .line 94
    if-ne v2, v5, :cond_6

    .line 95
    .line 96
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    sget v2, Ll/w9c0;->f:I

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    :cond_6
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    sget v4, Ll/w9c0;->c:I

    .line 111
    .line 112
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-ne v3, v5, :cond_7

    .line 117
    .line 118
    move v3, v1

    .line 119
    :cond_7
    if-ne p1, v5, :cond_8

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_8
    :goto_1
    iput v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->v:I

    .line 123
    .line 124
    invoke-direct {p0, v3, v2, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->v2(III)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public w1()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->E:Ll/amw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->i:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->x:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v4, Ll/zo2;

    .line 12
    .line 13
    invoke-direct {v4, p0}, Ll/zo2;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/amw;->d(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/view/ViewGroup;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public w2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y1()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$f;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public y2(Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/bp2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/bp2;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z1(ZLjava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    const-string v1, "showWhiteScreenPage"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const-string v1, "hideWhiteScreenPage"

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, "&&&"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz p3, :cond_3

    .line 34
    .line 35
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 36
    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v0}, Ll/xkw;->V(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0, v0}, Ll/xkw;->u(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    if-eqz p1, :cond_5

    .line 64
    .line 65
    const-string p1, "overTime"

    .line 66
    .line 67
    invoke-static {p2, p1}, Ll/i8g0;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 72
    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0, v0}, Ll/xkw;->W(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, v0}, Ll/xkw;->G(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_5
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0, v0}, Ll/xkw;->u(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public z2(Ll/zue0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->y1()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p2()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/zue0;->e()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->m:Ljava/util/ArrayList;

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-virtual {p1}, Ll/zue0;->c()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->m:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/zue0;->d()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1}, Ll/zue0;->b()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_6

    .line 39
    .line 40
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->T:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p:Landroid/view/MenuItem;

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    if-nez p1, :cond_5

    .line 53
    .line 54
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 55
    .line 56
    sget v2, Ll/pcc0;->t:I

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    iget-object v4, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->U:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 60
    .line 61
    invoke-virtual {p1, v2, v0, v3, v4}, Ll/c2j0;->a(ILjava/lang/CharSequence;ILandroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p:Landroid/view/MenuItem;

    .line 66
    .line 67
    iget v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->S:I

    .line 68
    .line 69
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->c:Ll/c2j0;

    .line 70
    .line 71
    const/16 v3, -0x194

    .line 72
    .line 73
    if-eq v0, v3, :cond_3

    .line 74
    .line 75
    invoke-virtual {v2, p1, v0}, Ll/c2j0;->k(Landroid/view/MenuItem;I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    iget p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->v:I

    .line 80
    .line 81
    if-ne p0, v1, :cond_4

    .line 82
    .line 83
    const/4 p0, -0x1

    .line 84
    goto :goto_0

    .line 85
    :cond_4
    const p0, -0x69696a

    .line 86
    .line 87
    .line 88
    :goto_0
    invoke-virtual {v2, p1, p0}, Ll/c2j0;->k(Landroid/view/MenuItem;I)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_5
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p:Landroid/view/MenuItem;

    .line 96
    .line 97
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p:Landroid/view/MenuItem;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->U:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 103
    .line 104
    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_6
    :goto_1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->w2()V

    .line 109
    .line 110
    .line 111
    return-void
.end method
