.class final Le/e/a/PlayerGestures219$State;
.super Ljava/lang/Object;
.source "PlayerGestures219.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerGestures219;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field candidate:Z

.field claimed:Z

.field doubleTap:Z

.field down:Landroid/view/MotionEvent;

.field downEnabled:Z

.field held:Z

.field holding:Z

.field id:Ljava/lang/String;

.field lastUp:J

.field owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field player:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field portrait:Z

.field quiet:Z

.field replaying:Z

.field side:I

.field single:Ljava/lang/Runnable;

.field time:J

.field up:Landroid/view/MotionEvent;

.field upEnabled:Z

.field x:F

.field y:F


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/PlayerGestures219$State;)V
    .registers 2

    .line 8
    invoke-direct {p0}, Le/e/a/PlayerGestures219$State;-><init>()V

    return-void
.end method
