.class public final synthetic Ll/ysr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

.field public final synthetic c:I

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ysr;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    iput-object p2, p0, Ll/ysr;->b:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    iput p3, p0, Ll/ysr;->c:I

    iput-boolean p4, p0, Ll/ysr;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ysr;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    iget-object v1, p0, Ll/ysr;->b:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    iget v2, p0, Ll/ysr;->c:I

    iget-boolean p0, p0, Ll/ysr;->d:Z

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->f(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;IZLjava/lang/Long;)V

    return-void
.end method
