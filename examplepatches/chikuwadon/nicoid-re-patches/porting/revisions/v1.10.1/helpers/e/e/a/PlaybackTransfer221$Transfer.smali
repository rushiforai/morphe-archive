.class final Le/e/a/PlaybackTransfer221$Transfer;
.super Ljava/lang/Object;
.source "PlaybackTransfer221.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlaybackTransfer221;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Transfer"
.end annotation


# instance fields
.field committing:Z

.field id:Ljava/lang/String;

.field playing:Z

.field position:J

.field resumeOnCancel:Z

.field source:Ljava/lang/Object;

.field sourcePlayer:Ljava/lang/Object;

.field speed:F

.field target:Ljava/lang/Object;

.field targetPlayer:Ljava/lang/Object;

.field timeout:Ljava/lang/Runnable;

.field toPopup:Z

.field token:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
