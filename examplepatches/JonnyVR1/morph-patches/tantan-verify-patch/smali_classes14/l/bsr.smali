.class public final synthetic Ll/bsr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/msr;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;


# direct methods
.method public synthetic constructor <init>(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bsr;->a:Ll/msr;

    iput-object p2, p0, Ll/bsr;->b:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bsr;->a:Ll/msr;

    iget-object p0, p0, Ll/bsr;->b:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/msr;->a3(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Ljava/lang/Throwable;)V

    return-void
.end method
