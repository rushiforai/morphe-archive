.class public final synthetic Ll/s1v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s1v;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;

    iput-object p2, p0, Ll/s1v;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s1v;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;

    iget-object p0, p0, Ll/s1v;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->j(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;Landroid/view/View;)V

    return-void
.end method
