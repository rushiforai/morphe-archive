.class public Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private frames:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorStackFrame;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorStackFrame;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;->frames:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getFrames()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorStackFrame;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;->frames:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFrames(Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorStackFrame;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;->frames:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
