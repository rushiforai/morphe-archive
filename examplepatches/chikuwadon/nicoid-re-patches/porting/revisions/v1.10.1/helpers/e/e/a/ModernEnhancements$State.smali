.class final Le/e/a/ModernEnhancements$State;
.super Ljava/lang/Object;
.source "ModernEnhancements.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ModernEnhancements;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field alive:Z

.field generation:I

.field loop:Landroid/widget/Button;

.field quality:Landroid/widget/Button;

.field resume:Z

.field seek:J

.field speed:Landroid/widget/Button;

.field unplugged:Z


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/ModernEnhancements$State;->seek:J

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/ModernEnhancements$State;->alive:Z

    .line 28
    return-void
.end method

.method synthetic constructor <init>(Le/e/a/ModernEnhancements$State;)V
    .registers 2

    .line 28
    invoke-direct {p0}, Le/e/a/ModernEnhancements$State;-><init>()V

    return-void
.end method
