.class public Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;
.super Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;
.source "SourceFile"


# static fields
.field public static final DEFAULT_MAX_VALUE:I = 0x9

.field private static final DEFAULT_MIN_VALUE:I


# instance fields
.field private arrayList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private format:Ljava/lang/String;

.field private label:Ljava/lang/String;

.field private maxValue:I

.field private minValue:I

.field private position:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    const/16 v1, 0x9

    .line 23
    invoke-direct {p0, p1, v0, v1}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;-><init>(Landroid/content/Context;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, p2, p3, v0}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->label:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->arrayList:Ljava/util/ArrayList;

    .line 14
    .line 15
    iput p2, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->minValue:I

    .line 16
    .line 17
    iput p3, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->maxValue:I

    .line 18
    .line 19
    iput-object p4, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->format:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public getItem(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    if-ltz p1, :cond_5

    .line 2
    .line 3
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->getItemsCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_5

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    iget p2, p0, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->itemResourceId:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p3}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->getView(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    :cond_0
    iget p3, p0, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->itemTextResourceId:I

    .line 18
    .line 19
    invoke-virtual {p0, p2, p3}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->getTextView(Landroid/view/View;I)Landroid/widget/TextView;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->arrayList:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->arrayList:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_1
    if-eqz p3, :cond_4

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->getItemText(I)Ljava/lang/CharSequence;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    const-string v0, ""

    .line 45
    .line 46
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->label:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget v0, p0, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->itemResourceId:I

    .line 67
    .line 68
    const/4 v1, -0x1

    .line 69
    if-ne v0, v1, :cond_4

    .line 70
    .line 71
    iget v0, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->position:I

    .line 72
    .line 73
    if-ne p1, v0, :cond_3

    .line 74
    .line 75
    invoke-virtual {p0, p3}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->configureCurrentTextView(Landroid/widget/TextView;)V

    .line 76
    .line 77
    .line 78
    return-object p2

    .line 79
    :cond_3
    invoke-virtual {p0, p3}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->configureTextView(Landroid/widget/TextView;)V

    .line 80
    .line 81
    .line 82
    :cond_4
    return-object p2

    .line 83
    :cond_5
    const/4 p0, 0x0

    .line 84
    return-object p0
.end method

.method public getItemText(I)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->getItemsCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->minValue:I

    .line 10
    .line 11
    add-int/2addr v0, p1

    .line 12
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->format:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public getItemsCount()I
    .locals 1

    .line 1
    iget v0, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->maxValue:I

    .line 2
    .line 3
    iget p0, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->minValue:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    return v0
.end method

.method public getTestViews()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->arrayList:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->label:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->position:I

    .line 2
    .line 3
    return-void
.end method
