.class public interface abstract annotation Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder$VideoEncodeResultCode;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "VideoEncodeResultCode"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final VIDEO_ENCODE_FAIL:I = -0x2

.field public static final VIDEO_ENCODE_SUCCESS:I = 0x0

.field public static final VIDEO_MEDIA_NOT_HAS_USE:I = -0x1

.field public static final VIDEO_START_SUCCESS:I
