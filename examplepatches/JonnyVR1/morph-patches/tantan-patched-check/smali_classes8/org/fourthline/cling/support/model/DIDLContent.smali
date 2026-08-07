.class public Lorg/fourthline/cling/support/model/DIDLContent;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DESC_WRAPPER_NAMESPACE_URI:Ljava/lang/String; = "urn:fourthline-org:cling:support:content-directory-desc-1-0"

.field public static final NAMESPACE_URI:Ljava/lang/String; = "urn:schemas-upnp-org:metadata-1-0/DIDL-Lite/"


# instance fields
.field protected containers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/container/Container;",
            ">;"
        }
    .end annotation
.end field

.field protected descMetadata:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/DescMeta;",
            ">;"
        }
    .end annotation
.end field

.field protected items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/item/Item;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/fourthline/cling/support/model/DIDLContent;->containers:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/fourthline/cling/support/model/DIDLContent;->items:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lorg/fourthline/cling/support/model/DIDLContent;->descMetadata:Ljava/util/List;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public addContainer(Lorg/fourthline/cling/support/model/container/Container;)Lorg/fourthline/cling/support/model/DIDLContent;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/DIDLContent;->getContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public addDescMetadata(Lorg/fourthline/cling/support/model/DescMeta;)Lorg/fourthline/cling/support/model/DIDLContent;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/DIDLContent;->getDescMetadata()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public addItem(Lorg/fourthline/cling/support/model/item/Item;)Lorg/fourthline/cling/support/model/DIDLContent;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/DIDLContent;->getItems()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public addObject(Ljava/lang/Object;)Lorg/fourthline/cling/support/model/DIDLContent;
    .locals 1

    .line 1
    instance-of v0, p1, Lorg/fourthline/cling/support/model/item/Item;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lorg/fourthline/cling/support/model/item/Item;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/model/DIDLContent;->addItem(Lorg/fourthline/cling/support/model/item/Item;)Lorg/fourthline/cling/support/model/DIDLContent;

    .line 8
    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    instance-of v0, p1, Lorg/fourthline/cling/support/model/container/Container;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast p1, Lorg/fourthline/cling/support/model/container/Container;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/model/DIDLContent;->addContainer(Lorg/fourthline/cling/support/model/container/Container;)Lorg/fourthline/cling/support/model/DIDLContent;

    .line 18
    .line 19
    .line 20
    :cond_1
    return-object p0
.end method

.method public getContainers()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/container/Container;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DIDLContent;->containers:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCount()J
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/model/DIDLContent;->items:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DIDLContent;->containers:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    add-int/2addr v0, p0

    .line 14
    int-to-long v0, v0

    .line 15
    return-wide v0
.end method

.method public getDescMetadata()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/DescMeta;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DIDLContent;->descMetadata:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFirstContainer()Lorg/fourthline/cling/support/model/container/Container;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/DIDLContent;->getContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lorg/fourthline/cling/support/model/container/Container;

    .line 11
    .line 12
    return-object p0
.end method

.method public getItems()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/item/Item;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DIDLContent;->items:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public replaceGenericContainerAndItems()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/DIDLContent;->getItems()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLContent;->replaceGenericItems(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLContent;->setItems(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/DIDLContent;->getContainers()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLContent;->replaceGenericContainers(Ljava/util/List;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLContent;->setContainers(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public replaceGenericContainers(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/container/Container;",
            ">;)",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/container/Container;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_c

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lorg/fourthline/cling/support/model/container/Container;

    .line 21
    .line 22
    invoke-virtual {v1}, Lorg/fourthline/cling/support/model/DIDLObject;->getClazz()Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget-object v3, Lorg/fourthline/cling/support/model/container/Album;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 31
    .line 32
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    new-instance v2, Lorg/fourthline/cling/support/model/container/Album;

    .line 43
    .line 44
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/Album;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 45
    .line 46
    .line 47
    goto/16 :goto_1

    .line 48
    .line 49
    :cond_0
    sget-object v3, Lorg/fourthline/cling/support/model/container/MusicAlbum;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 50
    .line 51
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_1

    .line 60
    .line 61
    new-instance v2, Lorg/fourthline/cling/support/model/container/MusicAlbum;

    .line 62
    .line 63
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/MusicAlbum;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 64
    .line 65
    .line 66
    goto/16 :goto_1

    .line 67
    .line 68
    :cond_1
    sget-object v3, Lorg/fourthline/cling/support/model/container/PhotoAlbum;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 69
    .line 70
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_2

    .line 79
    .line 80
    new-instance v2, Lorg/fourthline/cling/support/model/container/PhotoAlbum;

    .line 81
    .line 82
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/PhotoAlbum;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 83
    .line 84
    .line 85
    goto/16 :goto_1

    .line 86
    .line 87
    :cond_2
    sget-object v3, Lorg/fourthline/cling/support/model/container/GenreContainer;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 88
    .line 89
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-eqz v3, :cond_3

    .line 98
    .line 99
    new-instance v2, Lorg/fourthline/cling/support/model/container/GenreContainer;

    .line 100
    .line 101
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/GenreContainer;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 102
    .line 103
    .line 104
    goto/16 :goto_1

    .line 105
    .line 106
    :cond_3
    sget-object v3, Lorg/fourthline/cling/support/model/container/MusicGenre;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 107
    .line 108
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-eqz v3, :cond_4

    .line 117
    .line 118
    new-instance v2, Lorg/fourthline/cling/support/model/container/MusicGenre;

    .line 119
    .line 120
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/MusicGenre;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 121
    .line 122
    .line 123
    goto/16 :goto_1

    .line 124
    .line 125
    :cond_4
    sget-object v3, Lorg/fourthline/cling/support/model/container/MovieGenre;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 126
    .line 127
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-eqz v3, :cond_5

    .line 136
    .line 137
    new-instance v2, Lorg/fourthline/cling/support/model/container/MovieGenre;

    .line 138
    .line 139
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/MovieGenre;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 140
    .line 141
    .line 142
    goto/16 :goto_1

    .line 143
    .line 144
    :cond_5
    sget-object v3, Lorg/fourthline/cling/support/model/container/PlaylistContainer;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 145
    .line 146
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-eqz v3, :cond_6

    .line 155
    .line 156
    new-instance v2, Lorg/fourthline/cling/support/model/container/PlaylistContainer;

    .line 157
    .line 158
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/PlaylistContainer;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_6
    sget-object v3, Lorg/fourthline/cling/support/model/container/PersonContainer;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 163
    .line 164
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    if-eqz v3, :cond_7

    .line 173
    .line 174
    new-instance v2, Lorg/fourthline/cling/support/model/container/PersonContainer;

    .line 175
    .line 176
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/PersonContainer;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_7
    sget-object v3, Lorg/fourthline/cling/support/model/container/MusicArtist;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 181
    .line 182
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    if-eqz v3, :cond_8

    .line 191
    .line 192
    new-instance v2, Lorg/fourthline/cling/support/model/container/MusicArtist;

    .line 193
    .line 194
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/MusicArtist;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 195
    .line 196
    .line 197
    goto :goto_1

    .line 198
    :cond_8
    sget-object v3, Lorg/fourthline/cling/support/model/container/StorageSystem;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 199
    .line 200
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    if-eqz v3, :cond_9

    .line 209
    .line 210
    new-instance v2, Lorg/fourthline/cling/support/model/container/StorageSystem;

    .line 211
    .line 212
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/StorageSystem;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 213
    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_9
    sget-object v3, Lorg/fourthline/cling/support/model/container/StorageVolume;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 217
    .line 218
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    if-eqz v3, :cond_a

    .line 227
    .line 228
    new-instance v2, Lorg/fourthline/cling/support/model/container/StorageVolume;

    .line 229
    .line 230
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/StorageVolume;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 231
    .line 232
    .line 233
    goto :goto_1

    .line 234
    :cond_a
    sget-object v3, Lorg/fourthline/cling/support/model/container/StorageFolder;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 235
    .line 236
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    if-eqz v2, :cond_b

    .line 245
    .line 246
    new-instance v2, Lorg/fourthline/cling/support/model/container/StorageFolder;

    .line 247
    .line 248
    invoke-direct {v2, v1}, Lorg/fourthline/cling/support/model/container/StorageFolder;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    .line 249
    .line 250
    .line 251
    goto :goto_1

    .line 252
    :cond_b
    move-object v2, v1

    .line 253
    :goto_1
    invoke-virtual {v1}, Lorg/fourthline/cling/support/model/container/Container;->getItems()Ljava/util/List;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/support/model/DIDLContent;->replaceGenericItems(Ljava/util/List;)Ljava/util/List;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-virtual {v2, v1}, Lorg/fourthline/cling/support/model/container/Container;->setItems(Ljava/util/List;)V

    .line 262
    .line 263
    .line 264
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :cond_c
    return-object v0
.end method

.method public replaceGenericItems(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/item/Item;",
            ">;)",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/item/Item;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_c

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lorg/fourthline/cling/support/model/item/Item;

    .line 21
    .line 22
    invoke-virtual {v0}, Lorg/fourthline/cling/support/model/DIDLObject;->getClazz()Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget-object v2, Lorg/fourthline/cling/support/model/item/AudioItem;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 31
    .line 32
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    new-instance v1, Lorg/fourthline/cling/support/model/item/AudioItem;

    .line 43
    .line 44
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/AudioItem;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    sget-object v2, Lorg/fourthline/cling/support/model/item/MusicTrack;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 52
    .line 53
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    new-instance v1, Lorg/fourthline/cling/support/model/item/MusicTrack;

    .line 64
    .line 65
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/MusicTrack;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 66
    .line 67
    .line 68
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    sget-object v2, Lorg/fourthline/cling/support/model/item/AudioBook;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 73
    .line 74
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_2

    .line 83
    .line 84
    new-instance v1, Lorg/fourthline/cling/support/model/item/AudioBook;

    .line 85
    .line 86
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/AudioBook;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 87
    .line 88
    .line 89
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    sget-object v2, Lorg/fourthline/cling/support/model/item/AudioBroadcast;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 94
    .line 95
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_3

    .line 104
    .line 105
    new-instance v1, Lorg/fourthline/cling/support/model/item/AudioBroadcast;

    .line 106
    .line 107
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/AudioBroadcast;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 108
    .line 109
    .line 110
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    sget-object v2, Lorg/fourthline/cling/support/model/item/VideoItem;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 115
    .line 116
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_4

    .line 125
    .line 126
    new-instance v1, Lorg/fourthline/cling/support/model/item/VideoItem;

    .line 127
    .line 128
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/VideoItem;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 129
    .line 130
    .line 131
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_4
    sget-object v2, Lorg/fourthline/cling/support/model/item/Movie;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 136
    .line 137
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-eqz v2, :cond_5

    .line 146
    .line 147
    new-instance v1, Lorg/fourthline/cling/support/model/item/Movie;

    .line 148
    .line 149
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/Movie;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 150
    .line 151
    .line 152
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :cond_5
    sget-object v2, Lorg/fourthline/cling/support/model/item/VideoBroadcast;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 158
    .line 159
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-eqz v2, :cond_6

    .line 168
    .line 169
    new-instance v1, Lorg/fourthline/cling/support/model/item/VideoBroadcast;

    .line 170
    .line 171
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/VideoBroadcast;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 172
    .line 173
    .line 174
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_6
    sget-object v2, Lorg/fourthline/cling/support/model/item/MusicVideoClip;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 180
    .line 181
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-eqz v2, :cond_7

    .line 190
    .line 191
    new-instance v1, Lorg/fourthline/cling/support/model/item/MusicVideoClip;

    .line 192
    .line 193
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/MusicVideoClip;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 194
    .line 195
    .line 196
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_7
    sget-object v2, Lorg/fourthline/cling/support/model/item/ImageItem;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 202
    .line 203
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    if-eqz v2, :cond_8

    .line 212
    .line 213
    new-instance v1, Lorg/fourthline/cling/support/model/item/ImageItem;

    .line 214
    .line 215
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/ImageItem;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 216
    .line 217
    .line 218
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :cond_8
    sget-object v2, Lorg/fourthline/cling/support/model/item/Photo;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 224
    .line 225
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    if-eqz v2, :cond_9

    .line 234
    .line 235
    new-instance v1, Lorg/fourthline/cling/support/model/item/Photo;

    .line 236
    .line 237
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/Photo;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 238
    .line 239
    .line 240
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :cond_9
    sget-object v2, Lorg/fourthline/cling/support/model/item/PlaylistItem;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 246
    .line 247
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    if-eqz v2, :cond_a

    .line 256
    .line 257
    new-instance v1, Lorg/fourthline/cling/support/model/item/PlaylistItem;

    .line 258
    .line 259
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/PlaylistItem;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 260
    .line 261
    .line 262
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :cond_a
    sget-object v2, Lorg/fourthline/cling/support/model/item/TextItem;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 268
    .line 269
    invoke-virtual {v2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    if-eqz v1, :cond_b

    .line 278
    .line 279
    new-instance v1, Lorg/fourthline/cling/support/model/item/TextItem;

    .line 280
    .line 281
    invoke-direct {v1, v0}, Lorg/fourthline/cling/support/model/item/TextItem;-><init>(Lorg/fourthline/cling/support/model/item/Item;)V

    .line 282
    .line 283
    .line 284
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    goto/16 :goto_0

    .line 288
    .line 289
    :cond_b
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    goto/16 :goto_0

    .line 293
    .line 294
    :cond_c
    return-object p0
.end method

.method public setContainers(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/container/Container;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/DIDLContent;->containers:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setDescMetadata(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/DescMeta;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/DIDLContent;->descMetadata:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setItems(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/support/model/item/Item;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/DIDLContent;->items:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
