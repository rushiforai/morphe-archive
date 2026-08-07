.class Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;


# direct methods
.method private constructor <init>(Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;)V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
