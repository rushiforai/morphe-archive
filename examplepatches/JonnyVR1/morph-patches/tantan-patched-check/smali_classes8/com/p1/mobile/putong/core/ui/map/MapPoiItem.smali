.class public Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VText;

.field public j:I

.field public k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->j:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->j:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->j:I

    return-void
.end method

.method public static synthetic P(Ll/z20;Ll/bf3;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cxw;->a(Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Lcom/baidu/mapapi/search/core/PoiInfo;IIZ)V
    .locals 5

    .line 1
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->k:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->d:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, -0x1

    .line 12
    if-ne p3, v1, :cond_1

    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->g:Lv/VText;

    .line 15
    .line 16
    iget-object v2, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v3, "("

    .line 23
    .line 24
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v3, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 28
    .line 29
    iget-wide v3, v3, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 30
    .line 31
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v3, ", "

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-object p1, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 40
    .line 41
    iget-wide v3, p1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 42
    .line 43
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p1, ")"

    .line 47
    .line 48
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-object p1, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 57
    .line 58
    :goto_0
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->d:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    sget v2, Ll/c9c0;->x1:I

    .line 72
    .line 73
    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->f:Lv/VText;

    .line 81
    .line 82
    const-string p2, ""

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->d:Lv/VText;

    .line 89
    .line 90
    const v3, -0xaeaeaf

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->f:Lv/VText;

    .line 97
    .line 98
    invoke-static {p2, v0}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->g:Lv/VText;

    .line 106
    .line 107
    new-instance v2, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v3, " - "

    .line 110
    .line 111
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->h:Lv/VImage;

    .line 127
    .line 128
    if-eqz p4, :cond_2

    .line 129
    .line 130
    move p2, v0

    .line 131
    goto :goto_2

    .line 132
    :cond_2
    const/4 p2, 0x4

    .line 133
    :goto_2
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->i:Lv/VText;

    .line 137
    .line 138
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    rem-int/lit8 p3, p3, 0x2

    .line 142
    .line 143
    if-nez p3, :cond_3

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_3
    const v1, -0x40405

    .line 147
    .line 148
    .line 149
    :goto_3
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->j:I

    .line 150
    .line 151
    return-void
.end method

.method public S(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Ll/bf3;Ll/z20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
            "Ll/bf3;",
            "Ll/z20<",
            "Ll/bf3;",
            "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->d:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->key:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->e:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->city:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    xor-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->city:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->g:Lv/VText;

    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object v2, p1, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->city:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v2, p1, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->district:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    new-instance v0, Ll/bxw;

    .line 54
    .line 55
    invoke-direct {v0, p3, p2, p1}, Ll/bxw;-><init>(Ll/z20;Ll/bf3;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->j:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
