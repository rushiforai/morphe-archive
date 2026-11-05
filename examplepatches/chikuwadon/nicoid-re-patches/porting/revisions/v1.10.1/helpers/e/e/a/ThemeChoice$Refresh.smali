.class final Le/e/a/ThemeChoice$Refresh;
.super Ljava/lang/Object;
.source "ThemeChoice.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ThemeChoice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Refresh"
.end annotation


# instance fields
.field private final activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ThemeChoice$Refresh;->activity:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 75
    iget-object v0, p0, Le/e/a/ThemeChoice$Refresh;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Le/e/a/ThemeChoice$Refresh;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Le/e/a/ThemeChoice$Refresh;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->recreate()V

    .line 76
    :cond_15
    return-void
.end method
