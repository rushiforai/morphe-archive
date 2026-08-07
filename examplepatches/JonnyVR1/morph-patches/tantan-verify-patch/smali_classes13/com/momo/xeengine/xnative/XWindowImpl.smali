.class public Lcom/momo/xeengine/xnative/XWindowImpl;
.super Lcom/momo/xeengine/xnative/XWindowNative;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/xnative/IXWindow;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field height:I

.field private point:J

.field width:I


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/xnative/XWindowNative;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->width:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->height:I

    .line 8
    .line 9
    iput-object p1, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->executor:Ljava/util/concurrent/Executor;

    .line 10
    .line 11
    iput-wide p2, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->point:J

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/xnative/XWindowImpl;FFFF)V
    .locals 7

    .line 1
    iget-wide v1, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->point:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move v3, p1

    .line 11
    move v4, p2

    .line 12
    move v5, p3

    .line 13
    move v6, p4

    .line 14
    invoke-virtual/range {v0 .. v6}, Lcom/momo/xeengine/xnative/XWindowNative;->nativeSetSafeArea(JFFFF)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/momo/xeengine/xnative/XWindowImpl;II)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->point:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iput p1, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->width:I

    .line 10
    .line 11
    iput p2, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->height:I

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/momo/xeengine/xnative/XWindowNative;->nativeSetSize(JII)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public SetSafeArea(FFFF)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->executor:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    new-instance v1, Ll/amq0;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move v3, p1

    .line 7
    move v4, p2

    .line 8
    move v5, p3

    .line 9
    move v6, p4

    .line 10
    invoke-direct/range {v1 .. v6}, Ll/amq0;-><init>(Lcom/momo/xeengine/xnative/XWindowImpl;FFFF)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public SetSize(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->executor:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    new-instance v1, Ll/bmq0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/bmq0;-><init>(Lcom/momo/xeengine/xnative/XWindowImpl;II)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/momo/xeengine/xnative/XWindowImpl;->point:J

    .line 4
    .line 5
    return-void
.end method
