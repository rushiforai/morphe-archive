.class final Le/e/a/PopupHoldSpeed$State;
.super Ljava/lang/Object;
.source "PopupHoldSpeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PopupHoldSpeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field holding:Z

.field hud:Landroid/widget/TextView;

.field id:Ljava/lang/String;

.field monitor:Ljava/lang/Runnable;

.field original:F

.field owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field rate:F

.field root:Landroid/view/ViewGroup;

.field start:Ljava/lang/Runnable;

.field video:Landroid/view/View;

.field x:F

.field y:F


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/PopupHoldSpeed$State;)V
    .registers 2

    .line 21
    invoke-direct {p0}, Le/e/a/PopupHoldSpeed$State;-><init>()V

    return-void
.end method
