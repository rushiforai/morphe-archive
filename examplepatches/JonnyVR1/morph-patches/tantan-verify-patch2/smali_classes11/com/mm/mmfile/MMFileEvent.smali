.class public interface abstract annotation Lcom/mm/mmfile/MMFileEvent;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final EVENT_DISK_FREE_LOW:I = 0x5

.field public static final EVENT_GET_DISK_FREE_ERROR:I = 0x4

.field public static final EVENT_MOVE_OLD_FILE:I = 0x3

.field public static final EVENT_OPEN_MMP_ERROR:I = 0x2

.field public static final EVENT_OPEN_NEW_LOG_FILE:I = 0x6

.field public static final EVENT_OUT_OF_BUFFER:I = 0x1

.field public static final EVENT_WRITE_ERROR:I
