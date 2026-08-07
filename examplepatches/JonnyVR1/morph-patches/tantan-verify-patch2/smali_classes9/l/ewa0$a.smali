.class public Ll/ewa0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ewa0;->w0(Ll/vg60;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ewa0;


# direct methods
.method public constructor <init>(Ll/ewa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ewa0$a;->a:Ll/ewa0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    instance-of p2, p1, Lv/VDraweeView;

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    check-cast p1, Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const/high16 v0, 0x42b20000    # 89.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 20
    .line 21
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 31
    .line 32
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 33
    .line 34
    .line 35
    const/high16 v0, 0x40c00000    # 6.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    int-to-float v0, v0

    .line 42
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/xlj;

    .line 46
    .line 47
    iget-object p0, p0, Ll/ewa0$a;->a:Ll/ewa0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-direct {v0, p0}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ll/xlj;->a()Ll/wlj;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0, p2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    return-void
.end method
