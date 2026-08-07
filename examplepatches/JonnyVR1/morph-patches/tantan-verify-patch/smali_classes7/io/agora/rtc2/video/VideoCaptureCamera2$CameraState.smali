.class interface abstract annotation Lio/agora/rtc2/video/VideoCaptureCamera2$CameraState;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoCaptureCamera2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "CameraState"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final CONFIGURING:I = 0x1

.field public static final EVICTED:I = 0x3

.field public static final OPENING:I = 0x0

.field public static final STARTED:I = 0x2

.field public static final STOPPED:I = 0x4
