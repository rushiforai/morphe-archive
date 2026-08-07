.class public Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lcom/p1/mobile/putong/core/data/Message;

.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lv/VLinear_MaxWidth;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;Landroid/util/Pair;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->c(Landroid/util/Pair;[I)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->e:Lv/VImage;

    return-object p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->b:Landroid/widget/TextView;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    sget v0, Ll/qa00;->i:I

    .line 22
    .line 23
    int-to-float v1, v0

    .line 24
    int-to-float v0, v0

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-static {v1, v0, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/xlj;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {v1, v2}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 37
    .line 38
    .line 39
    sget v2, Ll/ibc0;->k5:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ll/xlj;->z(I)Ll/xlj;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1, v0}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/xlj;->a()Ll/wlj;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->d:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 61
    .line 62
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 63
    .line 64
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 71
    .line 72
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 73
    .line 74
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {v0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->d:Lv/VDraweeView;

    .line 83
    .line 84
    new-instance v1, Ll/u7q;

    .line 85
    .line 86
    invoke-direct {v1, p0, p1}, Ll/u7q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;Landroid/util/Pair;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final synthetic c(Landroid/util/Pair;[I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v0, p2, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aget p2, p2, v1

    .line 6
    .line 7
    const/16 v1, 0x320

    .line 8
    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    mul-int/lit16 p2, p2, 0x320

    .line 12
    .line 13
    div-int/2addr p2, v0

    .line 14
    move v0, v1

    .line 15
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "http://api.map.baidu.com/staticimage/v2?ak=islEGFAbydBfWxshdNB3jYeG&center="

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, ","

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 33
    .line 34
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p1, "&width="

    .line 38
    .line 39
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p1, "&height="

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p1, "&zoom=19&mcode=93:E8:C2:C3:D3:8A:72:EC:04:85:85:70:B3:3F:E5:FB:69:31:CC:1B;com.p1.mobile.putong"

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation$a;

    .line 63
    .line 64
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;)V

    .line 65
    .line 66
    .line 67
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->d:Lv/VDraweeView;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ll/am2;->g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    check-cast p2, Ll/lq70;

    .line 80
    .line 81
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p2, p1}, Ll/lq70;->N(Landroid/net/Uri;)Ll/lq70;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->d:Lv/VDraweeView;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 20
    .line 21
    invoke-interface {v0, v1, p0}, Ll/r97;->f1(Landroid/content/Context;Lcom/p1/mobile/putong/data/MessageLocation;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->E2:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->a:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 20
    .line 21
    .line 22
    sget v0, Ll/edc0;->t0:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/widget/TextView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->b:Landroid/widget/TextView;

    .line 31
    .line 32
    sget v0, Ll/edc0;->o1:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VDraweeView;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->d:Lv/VDraweeView;

    .line 41
    .line 42
    sget v0, Ll/edc0;->U1:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/VImage;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->e:Lv/VImage;

    .line 51
    .line 52
    sget v0, Ll/edc0;->B5:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lv/VLinear_MaxWidth;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->f:Lv/VLinear_MaxWidth;

    .line 61
    .line 62
    const v1, 0x43848000    # 265.0f

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {v0, v1}, Lv/VLinear_MaxWidth;->setMaxWidth(I)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->e:Lv/VImage;

    .line 93
    .line 94
    sget v0, Ll/ibc0;->i5:I

    .line 95
    .line 96
    invoke-static {p0, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 97
    .line 98
    .line 99
    :cond_0
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
