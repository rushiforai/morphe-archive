.class final Le/e/a/PlaybackLifecycle219$Snapshot;
.super Ljava/lang/Object;
.source "PlaybackLifecycle219.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlaybackLifecycle219;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Snapshot"
.end annotation


# instance fields
.field id:Ljava/lang/String;

.field player:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field resume:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/PlaybackLifecycle219$Snapshot;)V
    .registers 2

    .line 10
    invoke-direct {p0}, Le/e/a/PlaybackLifecycle219$Snapshot;-><init>()V

    return-void
.end method
