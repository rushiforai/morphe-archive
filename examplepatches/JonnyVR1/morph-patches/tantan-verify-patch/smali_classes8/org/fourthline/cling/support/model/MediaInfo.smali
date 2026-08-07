.class public Lorg/fourthline/cling/support/model/MediaInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private currentURI:Ljava/lang/String;

.field private currentURIMetaData:Ljava/lang/String;

.field private mediaDuration:Ljava/lang/String;

.field private nextURI:Ljava/lang/String;

.field private nextURIMetaData:Ljava/lang/String;

.field private numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

.field private playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

.field private recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

.field private writeStatus:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 151
    const-string v0, ""

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 152
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 153
    const-string v0, "NOT_IMPLEMENTED"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURI:Ljava/lang/String;

    .line 154
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURIMetaData:Ljava/lang/String;

    .line 155
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 156
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 157
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NONE:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 158
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 159
    sget-object v0, Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->writeStatus:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    const-string v0, ""

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 162
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 163
    const-string v0, "NOT_IMPLEMENTED"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURI:Ljava/lang/String;

    .line 164
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURIMetaData:Ljava/lang/String;

    .line 165
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 166
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 167
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NONE:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 168
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 169
    sget-object v0, Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->writeStatus:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    .line 170
    iput-object p1, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 171
    iput-object p2, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/StorageMedium;)V
    .locals 3

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    const-string v0, ""

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 206
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 207
    const-string v0, "NOT_IMPLEMENTED"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURI:Ljava/lang/String;

    .line 208
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURIMetaData:Ljava/lang/String;

    .line 209
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 210
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 211
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NONE:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 212
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 213
    sget-object v0, Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->writeStatus:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    .line 214
    iput-object p1, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 215
    iput-object p2, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 216
    iput-object p3, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURI:Ljava/lang/String;

    .line 217
    iput-object p4, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURIMetaData:Ljava/lang/String;

    .line 218
    iput-object p5, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 219
    iput-object p6, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 220
    iput-object p7, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/StorageMedium;Lorg/fourthline/cling/support/model/StorageMedium;Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;)V
    .locals 3

    .line 221
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 222
    const-string v0, ""

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 223
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 224
    const-string v0, "NOT_IMPLEMENTED"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURI:Ljava/lang/String;

    .line 225
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURIMetaData:Ljava/lang/String;

    .line 226
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 227
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 228
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NONE:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 229
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 230
    sget-object v0, Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;->WRITABLE:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    .line 231
    iput-object p1, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 232
    iput-object p2, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 233
    iput-object p3, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURI:Ljava/lang/String;

    .line 234
    iput-object p4, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURIMetaData:Ljava/lang/String;

    .line 235
    iput-object p5, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 236
    iput-object p6, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 237
    iput-object p7, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 238
    iput-object p8, p0, Lorg/fourthline/cling/support/model/MediaInfo;->recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 239
    iput-object p9, p0, Lorg/fourthline/cling/support/model/MediaInfo;->writeStatus:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/StorageMedium;)V
    .locals 3

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    const-string v0, ""

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 174
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 175
    const-string v0, "NOT_IMPLEMENTED"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURI:Ljava/lang/String;

    .line 176
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURIMetaData:Ljava/lang/String;

    .line 177
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 178
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 179
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NONE:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 180
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 181
    sget-object v0, Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->writeStatus:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    .line 182
    iput-object p1, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 183
    iput-object p2, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 184
    iput-object p3, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 185
    iput-object p4, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 186
    iput-object p5, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/StorageMedium;Lorg/fourthline/cling/support/model/StorageMedium;Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;)V
    .locals 3

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 188
    const-string v0, ""

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 189
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 190
    const-string v0, "NOT_IMPLEMENTED"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURI:Ljava/lang/String;

    .line 191
    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURIMetaData:Ljava/lang/String;

    .line 192
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 193
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 194
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NONE:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 195
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/StorageMedium;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 196
    sget-object v0, Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;->WRITABLE:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    .line 197
    iput-object p1, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 198
    iput-object p2, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 199
    iput-object p3, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 200
    iput-object p4, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 201
    iput-object p5, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 202
    iput-object p6, p0, Lorg/fourthline/cling/support/model/MediaInfo;->recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 203
    iput-object p7, p0, Lorg/fourthline/cling/support/model/MediaInfo;->writeStatus:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/fourthline/cling/model/action/ActionArgumentValue;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "CurrentURI"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    move-object v2, v0

    .line 14
    check-cast v2, Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "CurrentURIMetaData"

    .line 17
    .line 18
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 23
    .line 24
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    move-object v3, v0

    .line 29
    check-cast v3, Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "NextURI"

    .line 32
    .line 33
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 38
    .line 39
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    move-object v4, v0

    .line 44
    check-cast v4, Ljava/lang/String;

    .line 45
    .line 46
    const-string v0, "NextURIMetaData"

    .line 47
    .line 48
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 53
    .line 54
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    move-object v5, v0

    .line 59
    check-cast v5, Ljava/lang/String;

    .line 60
    .line 61
    const-string v0, "NrTracks"

    .line 62
    .line 63
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 68
    .line 69
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    move-object v6, v0

    .line 74
    check-cast v6, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 75
    .line 76
    const-string v0, "MediaDuration"

    .line 77
    .line 78
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 83
    .line 84
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    move-object v7, v0

    .line 89
    check-cast v7, Ljava/lang/String;

    .line 90
    .line 91
    const-string v0, "PlayMedium"

    .line 92
    .line 93
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 98
    .line 99
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v0}, Lorg/fourthline/cling/support/model/StorageMedium;->valueOrVendorSpecificOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/StorageMedium;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    const-string v0, "RecordMedium"

    .line 110
    .line 111
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 116
    .line 117
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v0}, Lorg/fourthline/cling/support/model/StorageMedium;->valueOrVendorSpecificOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/StorageMedium;

    .line 124
    .line 125
    .line 126
    move-result-object v9

    .line 127
    const-string v0, "WriteStatus"

    .line 128
    .line 129
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    check-cast p1, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 134
    .line 135
    invoke-virtual {p1}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    check-cast p1, Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {p1}, Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;->valueOrUnknownOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    .line 142
    .line 143
    .line 144
    move-result-object v10

    .line 145
    move-object v1, p0

    .line 146
    invoke-direct/range {v1 .. v10}, Lorg/fourthline/cling/support/model/MediaInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/StorageMedium;Lorg/fourthline/cling/support/model/StorageMedium;Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method


# virtual methods
.method public getCurrentURI()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURI:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentURIMetaData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->currentURIMetaData:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaDuration()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->mediaDuration:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNextURI()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURI:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNextURIMetaData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->nextURIMetaData:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNumberOfTracks()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->numberOfTracks:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlayMedium()Lorg/fourthline/cling/support/model/StorageMedium;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->playMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecordMedium()Lorg/fourthline/cling/support/model/StorageMedium;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->recordMedium:Lorg/fourthline/cling/support/model/StorageMedium;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWriteStatus()Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/MediaInfo;->writeStatus:Lorg/fourthline/cling/support/model/RecordMediumWriteStatus;

    .line 2
    .line 3
    return-object p0
.end method
