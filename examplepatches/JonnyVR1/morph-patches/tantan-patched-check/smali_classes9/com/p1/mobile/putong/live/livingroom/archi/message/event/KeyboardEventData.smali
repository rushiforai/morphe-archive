.class public Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;,
        Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;

.field public final b:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;

.field public final c:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->a:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->b:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->a:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;->Show:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
