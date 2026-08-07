.class public Lio/agora/rtc2/ClientRoleOptions;
.super Ljava/lang/Object;


# instance fields
.field public audienceLatencyLevel:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAudienceLatencyLevel()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/ClientRoleOptions;->audienceLatencyLevel:I

    return p0
.end method
