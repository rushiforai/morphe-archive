.class public Ll/taf$b;
.super Landroidx/recyclerview/widget/n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/taf;->l(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

.field public final synthetic b:Ll/taf;


# direct methods
.method public constructor <init>(Ll/taf;Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/taf$b;->b:Ll/taf;

    .line 2
    .line 3
    iput-object p3, p0, Ll/taf$b;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/n;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public calculateDtToFit(IIIII)I
    .locals 0

    .line 1
    sub-int/2addr p3, p1

    .line 2
    sget p1, Ll/qa00;->S:I

    .line 3
    .line 4
    add-int/2addr p3, p1

    .line 5
    sget p1, Ll/qa00;->E:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/taf$b;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->t:I

    .line 10
    .line 11
    mul-int/2addr p1, p0

    .line 12
    sub-int/2addr p3, p1

    .line 13
    return p3
.end method

.method public calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .locals 0

    .line 1
    iget p0, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    const/high16 p1, 0x42480000    # 50.0f

    .line 5
    .line 6
    div-float/2addr p1, p0

    .line 7
    return p1
.end method
