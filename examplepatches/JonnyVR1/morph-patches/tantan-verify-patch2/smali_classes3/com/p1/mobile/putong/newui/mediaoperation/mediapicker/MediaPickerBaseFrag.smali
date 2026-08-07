.class public abstract Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/rn20;


# instance fields
.field public A:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ll/jh0;

.field public C:Landroidx/recyclerview/widget/RecyclerView;

.field public D:Landroidx/recyclerview/widget/GridLayoutManager;

.field public E:Ll/ouf0;

.field public F:Ll/s0y;

.field public G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

.field public H:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

.field public z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public G1(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;I)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->Z4(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 13
    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 18
    .line 19
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v0, 0x1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->Z4(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 29
    .line 30
    .line 31
    goto/16 :goto_1

    .line 32
    .line 33
    :cond_1
    instance-of p1, p2, Lcom/p1/mobile/putong/data/Video;

    .line 34
    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedImageMedias:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-lez v1, :cond_2

    .line 46
    .line 47
    sget p0, Lcom/p1/mobile/putong/common/R$string;->H0:I

    .line 48
    .line 49
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxVideoSelectCount()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-ne v1, v2, :cond_5

    .line 66
    .line 67
    sget p0, Lcom/p1/mobile/putong/common/R$string;->H0:I

    .line 68
    .line 69
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    instance-of v1, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedVideoMedias:Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-lez v1, :cond_4

    .line 86
    .line 87
    sget p0, Lcom/p1/mobile/putong/common/R$string;->H0:I

    .line 88
    .line 89
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 100
    .line 101
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxImageSelectCount()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-ne v1, v2, :cond_5

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    sget p2, Lcom/p1/mobile/putong/common/R$string;->T:I

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxImageSelectCount()I

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 140
    .line 141
    iget-object v2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 142
    .line 143
    iget-object v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 144
    .line 145
    iget-object v3, v3, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 146
    .line 147
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 159
    .line 160
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->addSelectedMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 161
    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 164
    .line 165
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 166
    .line 167
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eq v1, v0, :cond_8

    .line 172
    .line 173
    if-eqz p1, :cond_6

    .line 174
    .line 175
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 176
    .line 177
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 178
    .line 179
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxVideoSelectCount()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-eq p1, v0, :cond_8

    .line 190
    .line 191
    :cond_6
    instance-of p1, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 192
    .line 193
    if-eqz p1, :cond_7

    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 204
    .line 205
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxImageSelectCount()I

    .line 206
    .line 207
    .line 208
    move-result p2

    .line 209
    if-ne p1, p2, :cond_7

    .line 210
    .line 211
    goto :goto_0

    .line 212
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 213
    .line 214
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 215
    .line 216
    .line 217
    goto :goto_1

    .line 218
    :cond_8
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 219
    .line 220
    invoke-virtual {p1}, Ll/jh0;->I()V

    .line 221
    .line 222
    .line 223
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->Q4()V

    .line 224
    .line 225
    .line 226
    return-void
.end method

.method public M4()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->F:Ll/s0y;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 8
    .line 9
    invoke-interface {v1, p0, v2, v0}, Ll/s0y;->d(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->O4()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public N4(Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->F:Ll/s0y;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/s0y;->b(Landroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O4()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 9
    .line 10
    const-string v2, "mediaPickerResult"

    .line 11
    .line 12
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, -0x1

    .line 20
    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public P4(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->addSelectedMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->M4()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->clearAllSelectedMedia()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Q4()V
    .locals 0

    .line 1
    return-void
.end method

.method public R4()Ll/jh0;
    .locals 5

    .line 1
    new-instance v0, Ll/jh0;

    .line 2
    .line 3
    new-instance v1, Ll/kh0;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->H:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

    .line 10
    .line 11
    invoke-direct {v1, p0, v2, v3, v4}, Ll/kh0;-><init>(Ll/rn20;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/jh0;-><init>(Ll/kh0;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public S4(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Ll/ryx;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract T4(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;
.end method

.method public abstract U4()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;
.end method

.method public abstract V4(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Ll/s0y;
.end method

.method public final W4()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/16 v0, 0x10

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public abstract X4()Landroidx/recyclerview/widget/RecyclerView;
.end method

.method public Y4()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x3

    .line 8
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->D:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setSmoothScrollbarEnabled(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->D:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->E:Ll/ouf0;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    new-instance v0, Ll/ouf0;

    .line 29
    .line 30
    const/high16 v1, 0x40000000    # 2.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-direct {v0, v1, v2}, Ll/ouf0;-><init>(II)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->E:Ll/ouf0;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public abstract Z4(Lcom/p1/mobile/putong/data/Media;Z)V
.end method

.method public a5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public b5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;)V
    .locals 6

    .line 1
    iget-object v4, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    if-eqz v4, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->F:Ll/s0y;

    .line 6
    .line 7
    iget-object v5, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 8
    .line 9
    move-object v1, p0

    .line 10
    move-object v2, p1

    .line 11
    move-object v3, p2

    .line 12
    invoke-interface/range {v0 .. v5}, Ll/s0y;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)Z

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;I)V
    .locals 4

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedImageMedias:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    :cond_0
    instance-of v1, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    if-eqz v1, :cond_8

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedVideoMedias:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_8

    .line 28
    .line 29
    :cond_1
    if-eqz v0, :cond_3

    .line 30
    .line 31
    move-object v1, p2

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 33
    .line 34
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 35
    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    iget v3, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 39
    .line 40
    if-lez v3, :cond_2

    .line 41
    .line 42
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 43
    .line 44
    if-gtz v2, :cond_3

    .line 45
    .line 46
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Lcom/p1/mobile/putong/data/Dimension;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 57
    .line 58
    :cond_3
    const/4 v1, 0x1

    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxVideoSelectCount()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eq v0, v1, :cond_5

    .line 68
    .line 69
    :cond_4
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 70
    .line 71
    if-eqz v0, :cond_6

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxImageSelectCount()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-ne v0, v1, :cond_6

    .line 80
    .line 81
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 82
    .line 83
    iget v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 84
    .line 85
    const/16 v1, 0xd

    .line 86
    .line 87
    if-eq v0, v1, :cond_6

    .line 88
    .line 89
    const/16 v1, 0xa

    .line 90
    .line 91
    if-eq v0, v1, :cond_6

    .line 92
    .line 93
    const/16 v1, 0xb

    .line 94
    .line 95
    if-eq v0, v1, :cond_6

    .line 96
    .line 97
    const/16 v1, 0xe

    .line 98
    .line 99
    if-eq v0, v1, :cond_6

    .line 100
    .line 101
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->P4(Lcom/p1/mobile/putong/data/Media;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 106
    .line 107
    iget-boolean v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->needClickItemPreview:Z

    .line 108
    .line 109
    if-eqz v0, :cond_7

    .line 110
    .line 111
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->b5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_7
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G1(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;I)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_8
    sget p0, Lcom/p1/mobile/putong/common/R$string;->S:I

    .line 120
    .line 121
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->R4()Ll/jh0;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->X4()Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->Y4()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->U4()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->W4()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 16
    .line 17
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->W4()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->V4(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Ll/s0y;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->F:Ll/s0y;

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->T4(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->H:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->S4(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Ll/ryx;

    .line 46
    .line 47
    .line 48
    return-void
.end method
