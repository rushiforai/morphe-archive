.class final Le/e/a/HoldSpeed$State;
.super Ljava/lang/Object;
.source "HoldSpeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/HoldSpeed;
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

.field cancelling:Z

.field consume:Z

.field fragment:Ljava/lang/Object;

.field holding:Z

.field hud:Landroid/widget/TextView;

.field id:Ljava/lang/String;

.field monitor:Ljava/lang/Runnable;

.field original:F

.field rate:F

.field start:Ljava/lang/Runnable;

.field video:Landroid/view/View;

.field x:F

.field y:F


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/HoldSpeed$State;)V
    .registers 2

    .line 20
    invoke-direct {p0}, Le/e/a/HoldSpeed$State;-><init>()V

    return-void
.end method
