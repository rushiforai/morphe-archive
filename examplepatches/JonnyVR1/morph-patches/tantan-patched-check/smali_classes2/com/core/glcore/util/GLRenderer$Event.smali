.class Lcom/core/glcore/util/GLRenderer$Event;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/core/glcore/util/GLRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Event"
.end annotation


# static fields
.field static final ADD_SURFACE:I = 0x1

.field static final RELEASE:I = 0x7

.field static final REMOVE_SURFACE:I = 0x2

.field static final REQ_RENDER:I = 0x4

.field static final RUNNABLE:I = 0x6

.field static final START_RENDER:I = 0x3

.field static final STOP_RENDER:I = 0x5


# instance fields
.field final event:I

.field param:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/core/glcore/util/GLRenderer$Event;->event:I

    .line 5
    .line 6
    return-void
.end method
