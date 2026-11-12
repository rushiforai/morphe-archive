.class public final Ld0n;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:Landroid/view/animation/PathInterpolator;


# instance fields
.field public final a:Le0n;

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Lcom/opera/android/widget/ThemeableLottieAnimationView;

.field public final e:Landroid/widget/TextView;

.field public final f:Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

.field public g:Z

.field public final h:Lpde;

.field public final i:Lnl2;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3e4ccccd    # 0.2f

    const v2, 0x3e0f5c29    # 0.14f

    const v3, 0x3c23d70a    # 0.01f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    sput-object v0, Ld0n;->j:Landroid/view/animation/PathInterpolator;

    return-void
.end method

.method public constructor <init>(Le0n;ILjava/lang/String;Lcom/opera/android/widget/ThemeableLottieAnimationView;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld0n;->a:Le0n;

    iput p2, p0, Ld0n;->b:I

    iput-object p3, p0, Ld0n;->c:Ljava/lang/String;

    iput-object p4, p0, Ld0n;->d:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iput-object p5, p0, Ld0n;->e:Landroid/widget/TextView;

    iput-object p6, p0, Ld0n;->f:Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    new-instance p1, Lpde;

    const/4 p2, 0x0

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Ld0n;->h:Lpde;

    new-instance p1, Lnl2;

    const/16 p2, 0x12

    invoke-direct {p1, p0, p2}, Lnl2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ld0n;->i:Lnl2;

    return-void
.end method


# virtual methods
.method public final a(F)V
    .registers 4

    iget-object v0, p0, Ld0n;->h:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    cmpg-float v1, p1, v1

    if-eqz v1, :cond_32

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v0, p0, Ld0n;->f:Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    invoke-virtual {v0, p1}, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;->r(F)V

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-eqz v0, :cond_27

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float p1, p1, v0

    if-nez p1, :cond_32

    :cond_27
    iget-object p0, p0, Ld0n;->e:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object p0

    if-eqz p0, :cond_32

    invoke-virtual {p0}, Landroid/view/animation/Animation;->cancel()V

    :cond_32
    return-void
.end method
