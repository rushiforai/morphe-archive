.class public final synthetic Ll/evn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

.field public final synthetic b:Ll/ftn;

.field public final synthetic c:Ll/ftn;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Ll/ftn;Ll/ftn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/evn;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    iput-object p2, p0, Ll/evn;->b:Ll/ftn;

    iput-object p3, p0, Ll/evn;->c:Ll/ftn;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/evn;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    iget-object v1, p0, Ll/evn;->b:Ll/ftn;

    iget-object p0, p0, Ll/evn;->c:Ll/ftn;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->c(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Ll/ftn;Ll/ftn;)V

    return-void
.end method
