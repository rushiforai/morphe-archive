.class public Lio/agora/rtc2/video/ContentInspectConfig$ContentInspectModule;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/ContentInspectConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ContentInspectModule"
.end annotation


# instance fields
.field public interval:I

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/video/ContentInspectConfig$ContentInspectModule;->type:I

    iput v0, p0, Lio/agora/rtc2/video/ContentInspectConfig$ContentInspectModule;->interval:I

    return-void
.end method
