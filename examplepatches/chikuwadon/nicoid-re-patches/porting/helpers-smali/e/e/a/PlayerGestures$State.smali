.class Le/e/a/PlayerGestures$State;
.super Ljava/lang/Object;
.source "PlayerGestures.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerGestures;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation


# instance fields
.field active:Z

.field cancelling:Z

.field height:F

.field hide:Ljava/lang/Runnable;

.field hud:Landroid/widget/TextView;

.field rejected:Z

.field start:F

.field target:I

.field video:Landroid/view/View;

.field x:F

.field y:F


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/PlayerGestures$1;)V
    .registers 2
    .param p1, "x0"    # Le/e/a/PlayerGestures$1;

    .line 17
    invoke-direct {p0}, Le/e/a/PlayerGestures$State;-><init>()V

    return-void
.end method
