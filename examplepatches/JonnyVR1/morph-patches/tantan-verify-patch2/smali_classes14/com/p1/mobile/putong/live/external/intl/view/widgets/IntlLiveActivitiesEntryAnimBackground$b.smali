.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public e:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field


# direct methods
.method public constructor <init>(IIIII)V
    .locals 0
    .param p4    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p5    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->a:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->b:I

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->c:I

    .line 9
    .line 10
    iput p4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->d:I

    .line 11
    .line 12
    iput p5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->e:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(II)Landroid/graphics/Shader;
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 2
    .line 3
    int-to-float v1, p1

    .line 4
    add-int/2addr p1, p2

    .line 5
    int-to-float v3, p1

    .line 6
    iget v5, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->d:I

    .line 7
    .line 8
    iget v6, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->e:I

    .line 9
    .line 10
    sget-object v7, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Rectangle{width="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", height="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x7d

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
