.class public Lio/agora/musiccontentcenter/internal/MusicPlayerProperty;
.super Ljava/lang/Object;


# instance fields
.field handler:J

.field id:I


# direct methods
.method public constructor <init>(JI)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lio/agora/musiccontentcenter/internal/MusicPlayerProperty;->handler:J

    iput p3, p0, Lio/agora/musiccontentcenter/internal/MusicPlayerProperty;->id:I

    return-void
.end method
