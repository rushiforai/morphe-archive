.class public Lio/agora/base/internal/video/HdrMetadata;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private luma_bit_depth:I

.field private max_content_light_level:I

.field private max_frame_average_light_level:I

.field private profile:I


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lio/agora/base/internal/video/HdrMetadata;->max_content_light_level:I

    .line 6
    .line 7
    iput v0, p0, Lio/agora/base/internal/video/HdrMetadata;->max_frame_average_light_level:I

    .line 8
    .line 9
    iput p1, p0, Lio/agora/base/internal/video/HdrMetadata;->profile:I

    .line 10
    .line 11
    iput p2, p0, Lio/agora/base/internal/video/HdrMetadata;->luma_bit_depth:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getLuma_bit_depth()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/HdrMetadata;->luma_bit_depth:I

    .line 2
    .line 3
    return p0
.end method

.method public getMax_content_light_level()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/HdrMetadata;->max_content_light_level:I

    .line 2
    .line 3
    return p0
.end method

.method public getMax_frame_average_light_level()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/HdrMetadata;->max_frame_average_light_level:I

    .line 2
    .line 3
    return p0
.end method

.method public getProfile()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/HdrMetadata;->profile:I

    .line 2
    .line 3
    return p0
.end method

.method public setLuma_bit_depth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/HdrMetadata;->luma_bit_depth:I

    .line 2
    .line 3
    return-void
.end method

.method public setMax_content_light_level(I)V
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/HdrMetadata;->max_content_light_level:I

    .line 2
    .line 3
    return-void
.end method

.method public setMax_frame_average_light_level(I)V
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/HdrMetadata;->max_frame_average_light_level:I

    .line 2
    .line 3
    return-void
.end method

.method public setProfile(I)V
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/HdrMetadata;->profile:I

    .line 2
    .line 3
    return-void
.end method
