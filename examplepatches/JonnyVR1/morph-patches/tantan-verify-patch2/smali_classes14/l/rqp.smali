.class public final synthetic Ll/rqp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    iput-object p2, p0, Ll/rqp;->b:Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    iget-object p0, p0, Ll/rqp;->b:Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->P(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Landroid/view/View;)V

    return-void
.end method
