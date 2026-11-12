.class public Lcom/leanplum/internal/ActionManager$MessageMatchResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/ActionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessageMatchResult"
.end annotation


# instance fields
.field public matchedActivePeriod:Z

.field public matchedLimit:Z

.field public matchedTrigger:Z

.field public matchedUnlessTrigger:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
