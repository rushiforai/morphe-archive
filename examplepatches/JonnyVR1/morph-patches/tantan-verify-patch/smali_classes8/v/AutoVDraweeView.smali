.class public Lv/AutoVDraweeView;
.super Lv/VDraweeView;
.source "SourceFile"


# instance fields
.field public o:Landroid/net/Uri;

.field public p:Ljava/lang/Object;

.field public q:I

.field public r:I

.field public s:Ljava/lang/String;

.field public t:J

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Ll/fm80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    .line 11
    iput p1, p0, Lv/AutoVDraweeView;->q:I

    .line 12
    iput p1, p0, Lv/AutoVDraweeView;->r:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 14
    iput p1, p0, Lv/AutoVDraweeView;->q:I

    .line 15
    iput p1, p0, Lv/AutoVDraweeView;->r:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 17
    iput p1, p0, Lv/AutoVDraweeView;->q:I

    .line 18
    iput p1, p0, Lv/AutoVDraweeView;->r:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2, p3, p4}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, -0x1

    .line 20
    iput p1, p0, Lv/AutoVDraweeView;->q:I

    .line 21
    iput p1, p0, Lv/AutoVDraweeView;->r:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/wlj;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lv/VDraweeView;-><init>(Landroid/content/Context;Ll/wlj;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lv/AutoVDraweeView;->q:I

    .line 6
    .line 7
    iput p1, p0, Lv/AutoVDraweeView;->r:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public o(Landroid/net/Uri;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/AutoVDraweeView;->o:Landroid/net/Uri;

    .line 2
    .line 3
    iput-object p2, p0, Lv/AutoVDraweeView;->p:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lv/AutoVDraweeView;->z:Ll/fm80;

    .line 7
    .line 8
    iget p1, p0, Lv/AutoVDraweeView;->q:I

    .line 9
    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    iget p2, p0, Lv/AutoVDraweeView;->r:I

    .line 13
    .line 14
    if-lez p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Lv/AutoVDraweeView;->w(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lv/VDraweeView;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget p3, p0, Lv/AutoVDraweeView;->q:I

    .line 5
    .line 6
    if-ne p1, p3, :cond_0

    .line 7
    .line 8
    iget p3, p0, Lv/AutoVDraweeView;->r:I

    .line 9
    .line 10
    if-eq p2, p3, :cond_1

    .line 11
    .line 12
    :cond_0
    iput p1, p0, Lv/AutoVDraweeView;->q:I

    .line 13
    .line 14
    iput p2, p0, Lv/AutoVDraweeView;->r:I

    .line 15
    .line 16
    if-lez p1, :cond_1

    .line 17
    .line 18
    if-lez p2, :cond_1

    .line 19
    .line 20
    iget-object p3, p0, Lv/AutoVDraweeView;->o:Landroid/net/Uri;

    .line 21
    .line 22
    if-eqz p3, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2}, Lv/AutoVDraweeView;->w(II)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lv/AutoVDraweeView;->q:I

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lv/AutoVDraweeView;->r:I

    .line 17
    .line 18
    iget-object v0, p0, Lv/AutoVDraweeView;->o:Landroid/net/Uri;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget v0, p0, Lv/AutoVDraweeView;->q:I

    .line 23
    .line 24
    if-lez v0, :cond_0

    .line 25
    .line 26
    if-lez p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, v0, p1}, Lv/AutoVDraweeView;->w(II)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public setImageUrl(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lv/AutoVDraweeView;->y(Ljava/lang/String;Ll/fm80;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 3
    .line 4
    .line 5
    iput-object v0, p0, Lv/AutoVDraweeView;->o:Landroid/net/Uri;

    .line 6
    .line 7
    iput-object v0, p0, Lv/AutoVDraweeView;->s:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, p0, Lv/AutoVDraweeView;->q:I

    .line 11
    .line 12
    iput v1, p0, Lv/AutoVDraweeView;->r:I

    .line 13
    .line 14
    iput-object v0, p0, Lv/AutoVDraweeView;->z:Ll/fm80;

    .line 15
    .line 16
    return-void
.end method

.method public final v(Landroid/net/Uri;Ll/pf60;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "format"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object p1

    .line 14
    :cond_0
    iget-boolean v0, p0, Lv/AutoVDraweeView;->w:Z

    .line 15
    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    const-string v0, ".png"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    iget-boolean p0, p0, Lv/AutoVDraweeView;->u:Z

    .line 27
    .line 28
    const-string v0, ""

    .line 29
    .line 30
    const-string v1, ".webp"

    .line 31
    .line 32
    const-string v2, ".jpg"

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_2

    .line 41
    .line 42
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_2

    .line 67
    .line 68
    new-instance p0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    :cond_2
    :goto_0
    iget-object p0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast p0, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_3

    .line 96
    .line 97
    return-object p1

    .line 98
    :cond_3
    iget-object p0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast p0, Ljava/lang/Boolean;

    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-eqz p0, :cond_4

    .line 107
    .line 108
    new-instance p0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string p1, "?format="

    .line 117
    .line 118
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object p1, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string p1, "x"

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    iget-object p1, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 132
    .line 133
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0

    .line 141
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string p1, "?format=max_"

    .line 150
    .line 151
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-object p1, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 155
    .line 156
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string p1, "xX"

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    return-object p0
.end method

.method public final w(II)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/q3d0;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Ll/q3d0;-><init>(II)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1, v0}, Ll/wim;->a(Landroid/view/View;Ll/q3d0;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lv/AutoVDraweeView;->o:Landroid/net/Uri;

    .line 15
    .line 16
    invoke-virtual {p0, v2, v1}, Lv/AutoVDraweeView;->v(Landroid/net/Uri;Ll/pf60;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    iget-boolean v2, p0, Lv/AutoVDraweeView;->y:Z

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    iget-object v2, p0, Lv/AutoVDraweeView;->s:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v4, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iput-object v4, p0, Lv/AutoVDraweeView;->s:Ljava/lang/String;

    .line 34
    .line 35
    iget-wide v2, p0, Lv/AutoVDraweeView;->t:J

    .line 36
    .line 37
    const-wide/16 v5, 0x1

    .line 38
    .line 39
    add-long/2addr v2, v5

    .line 40
    iput-wide v2, p0, Lv/AutoVDraweeView;->t:J

    .line 41
    .line 42
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, Ljava/lang/Integer;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/16 v2, 0xb4

    .line 51
    .line 52
    if-gt v1, v2, :cond_1

    .line 53
    .line 54
    sget-object v1, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->SMALL:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    sget-object v1, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->DEFAULT:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 58
    .line 59
    :goto_0
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->y(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2, v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->B(Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v1, p0, Lv/AutoVDraweeView;->z:Ll/fm80;

    .line 76
    .line 77
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lv/AutoVDraweeView;->z:Ll/fm80;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    iget-boolean v1, p0, Lv/AutoVDraweeView;->v:Z

    .line 90
    .line 91
    if-nez v1, :cond_3

    .line 92
    .line 93
    invoke-static {}, Ll/phm;->b()Ll/qhm;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Ll/qhm;->p(Landroid/graphics/Bitmap$Config;)Ll/qhm;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Ll/qhm;->a()Ll/phm;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->G(Ll/phm;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 108
    .line 109
    .line 110
    :cond_3
    :goto_1
    const-string v3, "autoVDraweeView"

    .line 111
    .line 112
    const/4 v6, 0x0

    .line 113
    move-object v5, p0

    .line 114
    move v7, p1

    .line 115
    move v8, p2

    .line 116
    invoke-static/range {v3 .. v8}, Ll/tkm;->b(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Ll/fn2;II)Ll/fn2;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {}, Ll/f9j;->g()Ll/lq70;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget-object p2, v5, Lv/AutoVDraweeView;->p:Ljava/lang/Object;

    .line 125
    .line 126
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->A(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    check-cast p1, Ll/lq70;

    .line 131
    .line 132
    invoke-virtual {v5}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->E(Ll/lde;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Ll/lq70;

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    check-cast p1, Ll/lq70;

    .line 151
    .line 152
    new-instance p2, Ll/am2$b;

    .line 153
    .line 154
    invoke-direct {p2, p0}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    check-cast p0, Ll/lq70;

    .line 162
    .line 163
    iget-boolean p1, v5, Lv/AutoVDraweeView;->x:Z

    .line 164
    .line 165
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->z(Z)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    check-cast p0, Ll/lq70;

    .line 170
    .line 171
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {v5, p0}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public x(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lv/AutoVDraweeView;->o:Landroid/net/Uri;

    .line 6
    .line 7
    and-int/lit8 p1, p2, 0x4

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    move p1, v1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move p1, v0

    .line 16
    :goto_0
    iput-boolean p1, p0, Lv/AutoVDraweeView;->u:Z

    .line 17
    .line 18
    and-int/lit8 p1, p2, 0x1

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    move p1, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    move p1, v0

    .line 25
    :goto_1
    iput-boolean p1, p0, Lv/AutoVDraweeView;->v:Z

    .line 26
    .line 27
    and-int/lit8 p1, p2, 0x2

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    move p1, v1

    .line 32
    goto :goto_2

    .line 33
    :cond_2
    move p1, v0

    .line 34
    :goto_2
    iput-boolean p1, p0, Lv/AutoVDraweeView;->w:Z

    .line 35
    .line 36
    and-int/lit8 p1, p2, 0x8

    .line 37
    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    move p1, v1

    .line 41
    goto :goto_3

    .line 42
    :cond_3
    move p1, v0

    .line 43
    :goto_3
    iput-boolean p1, p0, Lv/AutoVDraweeView;->x:Z

    .line 44
    .line 45
    and-int/lit8 p1, p2, 0x10

    .line 46
    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    move v0, v1

    .line 50
    :cond_4
    iput-boolean v0, p0, Lv/AutoVDraweeView;->y:Z

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Lv/AutoVDraweeView;->z:Ll/fm80;

    .line 54
    .line 55
    iget p1, p0, Lv/AutoVDraweeView;->q:I

    .line 56
    .line 57
    if-lez p1, :cond_5

    .line 58
    .line 59
    iget p2, p0, Lv/AutoVDraweeView;->r:I

    .line 60
    .line 61
    if-lez p2, :cond_5

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Lv/AutoVDraweeView;->w(II)V

    .line 64
    .line 65
    .line 66
    :cond_5
    return-void
.end method

.method public y(Ljava/lang/String;Ll/fm80;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lv/AutoVDraweeView;->o:Landroid/net/Uri;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lv/AutoVDraweeView;->u:Z

    .line 9
    .line 10
    iput-boolean p1, p0, Lv/AutoVDraweeView;->v:Z

    .line 11
    .line 12
    iput-boolean p1, p0, Lv/AutoVDraweeView;->w:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Lv/AutoVDraweeView;->x:Z

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lv/AutoVDraweeView;->y:Z

    .line 18
    .line 19
    iput-object p2, p0, Lv/AutoVDraweeView;->z:Ll/fm80;

    .line 20
    .line 21
    iget p1, p0, Lv/AutoVDraweeView;->q:I

    .line 22
    .line 23
    if-lez p1, :cond_0

    .line 24
    .line 25
    iget p2, p0, Lv/AutoVDraweeView;->r:I

    .line 26
    .line 27
    if-lez p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Lv/AutoVDraweeView;->w(II)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
