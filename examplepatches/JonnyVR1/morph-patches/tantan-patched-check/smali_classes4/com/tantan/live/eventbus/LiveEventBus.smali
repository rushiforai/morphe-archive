.class public Lcom/tantan/live/eventbus/LiveEventBus;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$IntlSudGameEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VirtualUserDressUpDlgEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$GameEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VirtualCompanionEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceLiveEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftRecordEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceMedalWallEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopicEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceFlyEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftWallEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceRecentHistoryEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardAirplaneClickEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ChatClickSpanEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopMenuEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$TopChatEventGroup;,
        Lcom/tantan/live/eventbus/LiveEventBus$ScrapInfoDialogEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;,
        Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;,
        Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;,
        Lcom/tantan/live/eventbus/LiveEventBus$GiftSuitEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$UpgradeGiftEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$CampaignVisibleChangeEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$CallCardEventGroup;,
        Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$CustomToastEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$SignInEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;,
        Lcom/tantan/live/eventbus/LiveEventBus$JumpProfileEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FansInvitationEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FansClubMedalEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FollowDialogEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$DynamicBubbleEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ShootEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$WebViewDialogEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$DebugDialogEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ArticulationSelectEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowCardEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$SliderEntryEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;,
        Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;,
        Lcom/tantan/live/eventbus/LiveEventBus$IntlGameBoardEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$VoiceBlackListEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ConfessGiftEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$TopNoticeEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$LiveBlackListEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$ConsumeAlertEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$UnJailCardEvent;,
        Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;,
        Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;,
        Lcom/tantan/live/eventbus/LiveEventBus$SuperGodEvent;
    }
.end annotation


# instance fields
.field public final ArticulationSelectEvent:Lcom/tantan/live/eventbus/LiveEventBus$ArticulationSelectEvent;

.field public final AvatarEvent:Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;

.field public final BeautyEvent:Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;

.field public final BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

.field public final BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

.field public final BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

.field public final CallCardEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$CallCardEventGroup;

.field public final CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

.field public final CampaignVisibleChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$CampaignVisibleChangeEvent;

.field public final ChatClickSpanEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatClickSpanEvent;

.field public final ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

.field public final ChatViewRightChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;

.field public final ClearScreenEvent:Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;

.field public final ConfessGiftEvent:Lcom/tantan/live/eventbus/LiveEventBus$ConfessGiftEvent;

.field public final ConsumeAlertEvent:Lcom/tantan/live/eventbus/LiveEventBus$ConsumeAlertEvent;

.field public final CustomToastEvent:Lcom/tantan/live/eventbus/LiveEventBus$CustomToastEvent;

.field public final DebugDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$DebugDialogEvent;

.field public final DialogCenterEvent:Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;

.field public final DynamicBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$DynamicBubbleEvent;

.field public final EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

.field public final FansClubEntryEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;

.field public final FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

.field public final FansClubMedalEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubMedalEvent;

.field public final FansGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

.field public final FansInvitationEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansInvitationEvent;

.field public final FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

.field public final FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

.field public final FollowDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$FollowDialogEvent;

.field public final FollowGuideEvent:Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;

.field public final FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

.field public final GameEvent:Lcom/tantan/live/eventbus/LiveEventBus$GameEvent;

.field public final GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

.field public final GiftSuitEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftSuitEvent;

.field public final GiftTraysEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;

.field public final GiftWallDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;

.field public final GiftWallV2Event:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;

.field public final HourLeaderBoardEvent:Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;

.field public final IntlGameBoardEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGameBoardEvent;

.field public final IntlGiftComboEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;

.field public final IntlSudGameEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlSudGameEvent;

.field public final IntlVoiceLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceLiveEvent;

.field public final IntlVoiceMedalWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceMedalWallEvent;

.field public final JumpProfileEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpProfileEvent;

.field public final JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

.field public final KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

.field public final KnightGuardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

.field public final KtvDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;

.field public final LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

.field public final LiveBlackListEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBlackListEvent;

.field public final LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

.field public final LiveGiftSkinEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;

.field public final LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

.field public final LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

.field public final LiveTipEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;

.field public final LiveVoiceChatGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;

.field public final ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

.field public final MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

.field public final MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

.field public final MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

.field public final MotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

.field public final MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

.field public final MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

.field public final ObsPlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;

.field public final ObsPreviewEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;

.field public final OfficialShowCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowCardEvent;

.field public final OfficialShowEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;

.field public final OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

.field public final OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

.field public final OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

.field public final PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

.field public final PlugPubEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;

.field public final PreLoadEvent:Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;

.field public final RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

.field public final RoomMysteryEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;

.field public final SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

.field public final ScrapInfoDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$ScrapInfoDialogEvent;

.field public final SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

.field public final ShootEvent:Lcom/tantan/live/eventbus/LiveEventBus$ShootEvent;

.field public final SignInEvent:Lcom/tantan/live/eventbus/LiveEventBus$SignInEvent;

.field public final SliderEntryEvent:Lcom/tantan/live/eventbus/LiveEventBus$SliderEntryEvent;

.field public final StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

.field public final SuperGodEvent:Lcom/tantan/live/eventbus/LiveEventBus$SuperGodEvent;

.field public final TopChatEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$TopChatEventGroup;

.field public final TopNoticeEvent:Lcom/tantan/live/eventbus/LiveEventBus$TopNoticeEvent;

.field public final TraysViewEvent:Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;

.field public final UnJailCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$UnJailCardEvent;

.field public final UndercoverPlayerChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;

.field public final UpgradeGiftEvent:Lcom/tantan/live/eventbus/LiveEventBus$UpgradeGiftEvent;

.field public final VirtualCompanionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualCompanionEvent;

.field public final VirtualRoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

.field public final VirtualUserDressUpDlgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualUserDressUpDlgEvent;

.field public final VoiceApplyManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;

.field public final VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

.field public final VoiceBlackListEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceBlackListEvent;

.field public final VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

.field public final VoiceChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;

.field public final VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

.field public final VoiceFlyEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceFlyEvent;

.field public final VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

.field public final VoiceGiftRecordEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftRecordEvent;

.field public final VoiceGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftWallEvent;

.field public final VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

.field public final VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

.field public final VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

.field public final VoiceMicEmojiEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;

.field public final VoiceMotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;

.field public final VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

.field public final VoicePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;

.field public final VoiceRecentHistoryEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRecentHistoryEvent;

.field public final VoiceRoomBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;

.field public final VoiceSweetEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;

.field public final VoiceTopMenuEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopMenuEvent;

.field public final VoiceTopicEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopicEvent;

.field public final VoiceUserCardAirplaneClickEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardAirplaneClickEvent;

.field public final VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

.field public final VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

.field public final WebViewDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$WebViewDialogEvent;

.field private final mEventBusImpl:Ll/v3f;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/v3f;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/v3f;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->mEventBusImpl:Ll/v3f;

    .line 10
    .line 11
    new-instance v1, Ll/b7s;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/b7s;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/v3f;->j(Ll/cu6;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 25
    .line 26
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlGiftComboEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;

    .line 32
    .line 33
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$IntlSudGameEvent;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlSudGameEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlSudGameEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlSudGameEvent;

    .line 39
    .line 40
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 46
    .line 47
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 53
    .line 54
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VirtualUserDressUpDlgEvent;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualUserDressUpDlgEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualUserDressUpDlgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualUserDressUpDlgEvent;

    .line 60
    .line 61
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$GameEvent;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$GameEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GameEvent:Lcom/tantan/live/eventbus/LiveEventBus$GameEvent;

    .line 67
    .line 68
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VirtualCompanionEvent;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualCompanionEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualCompanionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualCompanionEvent;

    .line 74
    .line 75
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceLiveEvent;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceLiveEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlVoiceLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceLiveEvent;

    .line 81
    .line 82
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftRecordEvent;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftRecordEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGiftRecordEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftRecordEvent;

    .line 88
    .line 89
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 90
    .line 91
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 92
    .line 93
    .line 94
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 95
    .line 96
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;

    .line 97
    .line 98
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoicePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;

    .line 102
    .line 103
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;

    .line 104
    .line 105
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 106
    .line 107
    .line 108
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceSweetEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;

    .line 109
    .line 110
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceMedalWallEvent;

    .line 111
    .line 112
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceMedalWallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 113
    .line 114
    .line 115
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlVoiceMedalWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceMedalWallEvent;

    .line 116
    .line 117
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;

    .line 118
    .line 119
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 120
    .line 121
    .line 122
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMicEmojiEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;

    .line 123
    .line 124
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopicEvent;

    .line 125
    .line 126
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopicEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceTopicEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopicEvent;

    .line 130
    .line 131
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceFlyEvent;

    .line 132
    .line 133
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceFlyEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 134
    .line 135
    .line 136
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceFlyEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceFlyEvent;

    .line 137
    .line 138
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 141
    .line 142
    .line 143
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceRoomBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;

    .line 144
    .line 145
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;

    .line 146
    .line 147
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 148
    .line 149
    .line 150
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->UndercoverPlayerChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;

    .line 151
    .line 152
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftWallEvent;

    .line 153
    .line 154
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftWallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 155
    .line 156
    .line 157
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftWallEvent;

    .line 158
    .line 159
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 160
    .line 161
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 162
    .line 163
    .line 164
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 165
    .line 166
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRecentHistoryEvent;

    .line 167
    .line 168
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRecentHistoryEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 169
    .line 170
    .line 171
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceRecentHistoryEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRecentHistoryEvent;

    .line 172
    .line 173
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 174
    .line 175
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 176
    .line 177
    .line 178
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 179
    .line 180
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;

    .line 181
    .line 182
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 183
    .line 184
    .line 185
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceApplyManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;

    .line 186
    .line 187
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 188
    .line 189
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 190
    .line 191
    .line 192
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 193
    .line 194
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 195
    .line 196
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 197
    .line 198
    .line 199
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 200
    .line 201
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 202
    .line 203
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 204
    .line 205
    .line 206
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 207
    .line 208
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 209
    .line 210
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 211
    .line 212
    .line 213
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 214
    .line 215
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 216
    .line 217
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 218
    .line 219
    .line 220
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 221
    .line 222
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardAirplaneClickEvent;

    .line 223
    .line 224
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardAirplaneClickEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 225
    .line 226
    .line 227
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardAirplaneClickEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardAirplaneClickEvent;

    .line 228
    .line 229
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;

    .line 230
    .line 231
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 232
    .line 233
    .line 234
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;

    .line 235
    .line 236
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;

    .line 237
    .line 238
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 239
    .line 240
    .line 241
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;

    .line 242
    .line 243
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ChatClickSpanEvent;

    .line 244
    .line 245
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatClickSpanEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 246
    .line 247
    .line 248
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatClickSpanEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatClickSpanEvent;

    .line 249
    .line 250
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopMenuEvent;

    .line 251
    .line 252
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopMenuEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 253
    .line 254
    .line 255
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceTopMenuEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopMenuEvent;

    .line 256
    .line 257
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 258
    .line 259
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 260
    .line 261
    .line 262
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 263
    .line 264
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

    .line 265
    .line 266
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 267
    .line 268
    .line 269
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KnightGuardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

    .line 270
    .line 271
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$TopChatEventGroup;

    .line 272
    .line 273
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$TopChatEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 274
    .line 275
    .line 276
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->TopChatEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$TopChatEventGroup;

    .line 277
    .line 278
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ScrapInfoDialogEvent;

    .line 279
    .line 280
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ScrapInfoDialogEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 281
    .line 282
    .line 283
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ScrapInfoDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$ScrapInfoDialogEvent;

    .line 284
    .line 285
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 286
    .line 287
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 288
    .line 289
    .line 290
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 291
    .line 292
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 293
    .line 294
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 295
    .line 296
    .line 297
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 298
    .line 299
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 300
    .line 301
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 302
    .line 303
    .line 304
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 305
    .line 306
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$GiftSuitEvent;

    .line 307
    .line 308
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftSuitEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 309
    .line 310
    .line 311
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftSuitEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftSuitEvent;

    .line 312
    .line 313
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;

    .line 314
    .line 315
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 316
    .line 317
    .line 318
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->TraysViewEvent:Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;

    .line 319
    .line 320
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;

    .line 321
    .line 322
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 323
    .line 324
    .line 325
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftTraysEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;

    .line 326
    .line 327
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$UpgradeGiftEvent;

    .line 328
    .line 329
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$UpgradeGiftEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 330
    .line 331
    .line 332
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->UpgradeGiftEvent:Lcom/tantan/live/eventbus/LiveEventBus$UpgradeGiftEvent;

    .line 333
    .line 334
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 335
    .line 336
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 337
    .line 338
    .line 339
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 340
    .line 341
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$CampaignVisibleChangeEvent;

    .line 342
    .line 343
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$CampaignVisibleChangeEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 344
    .line 345
    .line 346
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CampaignVisibleChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$CampaignVisibleChangeEvent;

    .line 347
    .line 348
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$CallCardEventGroup;

    .line 349
    .line 350
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallCardEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 351
    .line 352
    .line 353
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallCardEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$CallCardEventGroup;

    .line 354
    .line 355
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;

    .line 356
    .line 357
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 358
    .line 359
    .line 360
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->HourLeaderBoardEvent:Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;

    .line 361
    .line 362
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$CustomToastEvent;

    .line 363
    .line 364
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$CustomToastEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 365
    .line 366
    .line 367
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CustomToastEvent:Lcom/tantan/live/eventbus/LiveEventBus$CustomToastEvent;

    .line 368
    .line 369
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;

    .line 370
    .line 371
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 372
    .line 373
    .line 374
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BeautyEvent:Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;

    .line 375
    .line 376
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 377
    .line 378
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 379
    .line 380
    .line 381
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 382
    .line 383
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 384
    .line 385
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 386
    .line 387
    .line 388
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 389
    .line 390
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;

    .line 391
    .line 392
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 393
    .line 394
    .line 395
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->AvatarEvent:Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;

    .line 396
    .line 397
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

    .line 398
    .line 399
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 400
    .line 401
    .line 402
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

    .line 403
    .line 404
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 405
    .line 406
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 407
    .line 408
    .line 409
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 410
    .line 411
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$SignInEvent;

    .line 412
    .line 413
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$SignInEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 414
    .line 415
    .line 416
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SignInEvent:Lcom/tantan/live/eventbus/LiveEventBus$SignInEvent;

    .line 417
    .line 418
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;

    .line 419
    .line 420
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 421
    .line 422
    .line 423
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomMysteryEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;

    .line 424
    .line 425
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$JumpProfileEvent;

    .line 426
    .line 427
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpProfileEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 428
    .line 429
    .line 430
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpProfileEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpProfileEvent;

    .line 431
    .line 432
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;

    .line 433
    .line 434
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 435
    .line 436
    .line 437
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlugPubEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;

    .line 438
    .line 439
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;

    .line 440
    .line 441
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 442
    .line 443
    .line 444
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FollowGuideEvent:Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;

    .line 445
    .line 446
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 447
    .line 448
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 449
    .line 450
    .line 451
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 452
    .line 453
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 454
    .line 455
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 456
    .line 457
    .line 458
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 459
    .line 460
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 461
    .line 462
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 463
    .line 464
    .line 465
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 466
    .line 467
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 468
    .line 469
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 470
    .line 471
    .line 472
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 473
    .line 474
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 475
    .line 476
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 477
    .line 478
    .line 479
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 480
    .line 481
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FansInvitationEvent;

    .line 482
    .line 483
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansInvitationEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 484
    .line 485
    .line 486
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansInvitationEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansInvitationEvent;

    .line 487
    .line 488
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 489
    .line 490
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 491
    .line 492
    .line 493
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 494
    .line 495
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;

    .line 496
    .line 497
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 498
    .line 499
    .line 500
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEntryEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;

    .line 501
    .line 502
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FansClubMedalEvent;

    .line 503
    .line 504
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubMedalEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 505
    .line 506
    .line 507
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubMedalEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubMedalEvent;

    .line 508
    .line 509
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 510
    .line 511
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 512
    .line 513
    .line 514
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 515
    .line 516
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;

    .line 517
    .line 518
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 519
    .line 520
    .line 521
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatViewRightChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;

    .line 522
    .line 523
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 524
    .line 525
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 526
    .line 527
    .line 528
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 529
    .line 530
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FollowDialogEvent;

    .line 531
    .line 532
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FollowDialogEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 533
    .line 534
    .line 535
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FollowDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$FollowDialogEvent;

    .line 536
    .line 537
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$DynamicBubbleEvent;

    .line 538
    .line 539
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$DynamicBubbleEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 540
    .line 541
    .line 542
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->DynamicBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$DynamicBubbleEvent;

    .line 543
    .line 544
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ShootEvent;

    .line 545
    .line 546
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ShootEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 547
    .line 548
    .line 549
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ShootEvent:Lcom/tantan/live/eventbus/LiveEventBus$ShootEvent;

    .line 550
    .line 551
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$WebViewDialogEvent;

    .line 552
    .line 553
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$WebViewDialogEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 554
    .line 555
    .line 556
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->WebViewDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$WebViewDialogEvent;

    .line 557
    .line 558
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;

    .line 559
    .line 560
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 561
    .line 562
    .line 563
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ClearScreenEvent:Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;

    .line 564
    .line 565
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$DebugDialogEvent;

    .line 566
    .line 567
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$DebugDialogEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 568
    .line 569
    .line 570
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->DebugDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$DebugDialogEvent;

    .line 571
    .line 572
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ArticulationSelectEvent;

    .line 573
    .line 574
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ArticulationSelectEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 575
    .line 576
    .line 577
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ArticulationSelectEvent:Lcom/tantan/live/eventbus/LiveEventBus$ArticulationSelectEvent;

    .line 578
    .line 579
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;

    .line 580
    .line 581
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 582
    .line 583
    .line 584
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PreLoadEvent:Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;

    .line 585
    .line 586
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 587
    .line 588
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 589
    .line 590
    .line 591
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 592
    .line 593
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 594
    .line 595
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 596
    .line 597
    .line 598
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 599
    .line 600
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 601
    .line 602
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 603
    .line 604
    .line 605
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 606
    .line 607
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowCardEvent;

    .line 608
    .line 609
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowCardEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 610
    .line 611
    .line 612
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowCardEvent;

    .line 613
    .line 614
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;

    .line 615
    .line 616
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 617
    .line 618
    .line 619
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;

    .line 620
    .line 621
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$SliderEntryEvent;

    .line 622
    .line 623
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$SliderEntryEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 624
    .line 625
    .line 626
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SliderEntryEvent:Lcom/tantan/live/eventbus/LiveEventBus$SliderEntryEvent;

    .line 627
    .line 628
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;

    .line 629
    .line 630
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 631
    .line 632
    .line 633
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;

    .line 634
    .line 635
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;

    .line 636
    .line 637
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 638
    .line 639
    .line 640
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPreviewEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;

    .line 641
    .line 642
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;

    .line 643
    .line 644
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 645
    .line 646
    .line 647
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveTipEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;

    .line 648
    .line 649
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 650
    .line 651
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 652
    .line 653
    .line 654
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 655
    .line 656
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 657
    .line 658
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 659
    .line 660
    .line 661
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 662
    .line 663
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 664
    .line 665
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 666
    .line 667
    .line 668
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 669
    .line 670
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 671
    .line 672
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 673
    .line 674
    .line 675
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 676
    .line 677
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 678
    .line 679
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 680
    .line 681
    .line 682
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 683
    .line 684
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;

    .line 685
    .line 686
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 687
    .line 688
    .line 689
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->DialogCenterEvent:Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;

    .line 690
    .line 691
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 692
    .line 693
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 694
    .line 695
    .line 696
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 697
    .line 698
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 699
    .line 700
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 701
    .line 702
    .line 703
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 704
    .line 705
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

    .line 706
    .line 707
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 708
    .line 709
    .line 710
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

    .line 711
    .line 712
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 713
    .line 714
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 715
    .line 716
    .line 717
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 718
    .line 719
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 720
    .line 721
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 722
    .line 723
    .line 724
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 725
    .line 726
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 727
    .line 728
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 729
    .line 730
    .line 731
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 732
    .line 733
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$IntlGameBoardEvent;

    .line 734
    .line 735
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlGameBoardEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 736
    .line 737
    .line 738
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlGameBoardEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGameBoardEvent;

    .line 739
    .line 740
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;

    .line 741
    .line 742
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 743
    .line 744
    .line 745
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KtvDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;

    .line 746
    .line 747
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

    .line 748
    .line 749
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 750
    .line 751
    .line 752
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualRoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

    .line 753
    .line 754
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;

    .line 755
    .line 756
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 757
    .line 758
    .line 759
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftWallDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;

    .line 760
    .line 761
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceBlackListEvent;

    .line 762
    .line 763
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceBlackListEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 764
    .line 765
    .line 766
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceBlackListEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceBlackListEvent;

    .line 767
    .line 768
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;

    .line 769
    .line 770
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 771
    .line 772
    .line 773
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveVoiceChatGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveVoiceChatGroupEvent;

    .line 774
    .line 775
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ConfessGiftEvent;

    .line 776
    .line 777
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ConfessGiftEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 778
    .line 779
    .line 780
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ConfessGiftEvent:Lcom/tantan/live/eventbus/LiveEventBus$ConfessGiftEvent;

    .line 781
    .line 782
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 783
    .line 784
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 785
    .line 786
    .line 787
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 788
    .line 789
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$TopNoticeEvent;

    .line 790
    .line 791
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$TopNoticeEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 792
    .line 793
    .line 794
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->TopNoticeEvent:Lcom/tantan/live/eventbus/LiveEventBus$TopNoticeEvent;

    .line 795
    .line 796
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$LiveBlackListEvent;

    .line 797
    .line 798
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBlackListEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 799
    .line 800
    .line 801
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBlackListEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBlackListEvent;

    .line 802
    .line 803
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$ConsumeAlertEvent;

    .line 804
    .line 805
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$ConsumeAlertEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 806
    .line 807
    .line 808
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ConsumeAlertEvent:Lcom/tantan/live/eventbus/LiveEventBus$ConsumeAlertEvent;

    .line 809
    .line 810
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$UnJailCardEvent;

    .line 811
    .line 812
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$UnJailCardEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 813
    .line 814
    .line 815
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->UnJailCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$UnJailCardEvent;

    .line 816
    .line 817
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;

    .line 818
    .line 819
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 820
    .line 821
    .line 822
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftWallV2Event:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;

    .line 823
    .line 824
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;

    .line 825
    .line 826
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 827
    .line 828
    .line 829
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveGiftSkinEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;

    .line 830
    .line 831
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$SuperGodEvent;

    .line 832
    .line 833
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$SuperGodEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 834
    .line 835
    .line 836
    iput-object v0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SuperGodEvent:Lcom/tantan/live/eventbus/LiveEventBus$SuperGodEvent;

    .line 837
    .line 838
    return-void
.end method

.method public static bridge synthetic a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->mEventBusImpl:Ll/v3f;

    return-object p0
.end method
