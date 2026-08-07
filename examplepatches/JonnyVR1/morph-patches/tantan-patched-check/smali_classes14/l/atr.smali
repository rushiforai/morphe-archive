.class public final synthetic Ll/atr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

.field public final synthetic b:Ll/grr;

.field public final synthetic c:Ll/grr;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Ll/grr;Ll/grr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/atr;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    iput-object p2, p0, Ll/atr;->b:Ll/grr;

    iput-object p3, p0, Ll/atr;->c:Ll/grr;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/atr;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    iget-object v1, p0, Ll/atr;->b:Ll/grr;

    iget-object p0, p0, Ll/atr;->c:Ll/grr;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->e(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Ll/grr;Ll/grr;)V

    return-void
.end method
