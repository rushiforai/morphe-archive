.class public Lcom/p1/mobile/putong/core/data/Conversation;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final ADDITIONAL_AVATARSUMMARY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_BLACKLIST:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/BlackList;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_BLINDBOX:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_CHATASSISTANTQUESTION:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_CHATMM:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ChatMM;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_COMPLIMENT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_CONTINUOUSCHAT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ContinuousChat;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_FATERADAR:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_FEEDINTERACTIONCOUNTER:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_FEEDSTATECOUNTER:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_GAME:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConversationGame;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_GREETINGINFO:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/GreetingInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_HEARTBEATMATCH:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/HeartbeatMatch;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_KANKAN_CONTENTS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContentIdWrapper;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_ICONURL:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_LATESTMESSAGEID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_LATESTTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_LATESTUSERID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_SUBTITLE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_TITLE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_UNSEEN:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_KANKAN_RESONANCE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_LIVEACTIVITY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/data/LiveActivityConversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_LIVEVIRTUALVOICE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_LOCALMOMENTINFO:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_LOVELETTER:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_LOWPAYONESIDE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/LowPayOneside;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_MATCHINFO:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_MESSAGERELATE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/MessageRelate;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_NEWMATCH_LABELEXPOSURETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_ONESIDE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_ONESIDENOMATCH_SELFSEND:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_PINCHAT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/PlatinumPinChat;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_PREVIEWTEXTS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_QUICKCHAT_AVATARBLURRED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_QUICKCHAT_BELL_AGREE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_QUICKCHAT_BELL_ISINITIATOR:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_QUICKCHAT_EXPIRE:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_QUICKCHAT_GUIDEFAKETOGOOD:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_QUICKCHAT_PROGRESS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_RESWIPE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ReSwipeInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_SUGGESTEDTIMELIMITEDMATCH:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_SWIPER:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_TAG:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_TIMELIMITED_ALLOWEXTENSION:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_TIMELIMITED_EXPIREDSECONDS:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_TIMELIMITED_EXPIREDTIMESTAMP:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_TIMELIMITED_EXTENSIONOPERATOR:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_TIMELIMITED_HIDDEN:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_TIMELIMITED_NEWCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_TIMELIMITED_PARTICIPATE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_VOICECALL_ACCEPTEDTIME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADDITIONAL_VOICECALL_REJECTEDTIME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final CLEAREDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final CLEAREDUNTIL:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final CONVERSATIONUSERDISTANCE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final CONVERSATIONUSERUPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final CONVTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_MATCH:Ljava/lang/String; = "default"

.field public static final ENTERTIMES:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXPOSURE_LEVEL_TOP:I = 0x32

.field public static final FOLLOW:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORCESEND:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUP_JOINEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUP_LATESTNOTIFICATIONMSGID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUP_SOURCE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final HASLOCALBREAKICE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEARTBEAT_MATCH:Ljava/lang/String; = "heartbeatMatch"

.field public static final HEAT_MARKS:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEAT_MM:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEAT_ORDERSCORE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEAT_SCORE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEAT_SHOWSCORE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final IMPORTANCE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/StickStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final INSTANT_CHAT:Ljava/lang/String; = "instant_chat"

.field public static final INTIMACY:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ISFAKE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LASTACTIVITYTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LATESTFRIENDCOMMENTCREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LATESTTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LEVEL:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LEVEL_TOP_PLATINUM:I = 0x5a

.field public static final LOCALACTIVETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALBOTHERCODETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALBOTHERINGTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALBOTHERSTATUS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALBOTHERWXTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALCHATBG:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final LOCALDRAFT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALEVERHASMESSAGE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALEXTRAINFO:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALGREETDELETE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALHASMESSAGE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALINSERTEDMOMENTID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALISLIMITEDTRIALSEE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALMATCHFROM:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/data/MatchFrom;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALMESSAGEINSERTREPORTHINT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/NotificationStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALNOTIFYMOMENTID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALONLINETABCLICK:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALPLACEBAN:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/LocalPlaceBan;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALSAFETYREMINDERTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALSPOOFINGNEWTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALSPOOFINGREMINDERTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALUSERUPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final MM:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final MUTED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final MYTALK:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/TalkInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final NEW_LEVEL_TOP:I = 0x64

.field public static final OTHERREADUNTIL:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final OTHERSTATUS:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final OTHERTALK:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/TalkInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final OTHERUSER:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final OTHER_STATUS_DEFAULT:Ljava/lang/String; = "default"

.field public static final OTHER_STATUS_INVALID:Ljava/lang/String; = "invalid"

.field public static final OTHER_STATUS_UNKNOWN:Ljava/lang/String; = "unknown"

.field public static final PLACE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROPERTY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConversationProperty;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final QUICKCHATPROGRESS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final READ:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final READUNTIL:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final REMAINEDTIME:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final REMINDER:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/Reminder;",
            ">;"
        }
    .end annotation
.end field

.field public static final SCENARIOS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final SEE_UPGRADED_MATCH:Ljava/lang/String; = "see_upgraded"

.field public static final SERVER_LEVEL_TOP:I = 0x1

.field public static final STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/data/ConversationStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final STR_LOCALBUSINESSTYPES:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LocalBusinessType;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final SUBTYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/ConversationType;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUGGESTIONSCORE:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final SURPRISE_LEVEL_TOP:I = 0xa

.field public static final TAG_LEVEL_TOP:I = 0x37

.field public static final TYPE:Ljava/lang/String; = "conversation"

.field public static final UNMATCHCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNREADMESSAGES:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final USERMESSAGECOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x58
    .end annotation
.end field

.field public api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public clearedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x76
    .end annotation
.end field

.field public clearedUntil:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x47
    .end annotation
.end field

.field public convType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x59
    .end annotation
.end field

.field public conversationUserDistance:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x55
    .end annotation
.end field

.field public conversationUserUpdatedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x56
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public enterTimes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4e
    .end annotation
.end field

.field public errorWhenParseReswipeInfo:Z

.field public follow:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public forceSend:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x54
    .end annotation
.end field

.field public group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x63
    .end annotation
.end field

.field public hasLocalBreakIce:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x74
    .end annotation
.end field

.field public heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5d
    .end annotation
.end field

.field public importance:Lcom/p1/mobile/putong/core/data/StickStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation
.end field

.field public intimacy:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x72
    .end annotation
.end field

.field public isFake:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7a
    .end annotation
.end field

.field public lastActivityTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x78
    .end annotation
.end field

.field public latestFriendCommentCreatedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5c
    .end annotation
.end field

.field public latestTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public level:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x57
    .end annotation
.end field

.field public localActiveTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public localBotherCodeTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x46
    .end annotation
.end field

.field public localBotherStatus:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x61
    .end annotation
.end field

.field public localBotherWxTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x45
    .end annotation
.end field

.field public localBotheringTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public localBusinessTypes:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LocalBusinessType;",
            ">;"
        }
    .end annotation
.end field

.field public localChatBg:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x65
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation
.end field

.field public localDraft:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x64
    .end annotation
.end field

.field public localEverHasMessage:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public localExtraInfo:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x77
    .end annotation
.end field

.field public localGreetDelete:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5f
    .end annotation
.end field

.field public localHasMessage:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public localInsertedMomentId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x69
    .end annotation
.end field

.field public localIsLimitedTrialSee:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7b
    .end annotation
.end field

.field public localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public localMessageInsertReportHint:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x67
    .end annotation
.end field

.field public localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public localNotifyMomentId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x68
    .end annotation
.end field

.field public localOnlineTabClick:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x66
    .end annotation
.end field

.field public localSafetyReminderTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x52
    .end annotation
.end field

.field public localSpoofingNewTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x75
    .end annotation
.end field

.field public localSpoofingReminderTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x53
    .end annotation
.end field

.field public localUserUpdatedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public mm:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6a
    .end annotation
.end field

.field public muted:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x62
    .end annotation
.end field

.field public myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4b
    .end annotation
.end field

.field public otherReadUntil:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4d
    .end annotation
.end field

.field public otherStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x79
    .end annotation
.end field

.field public otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4c
    .end annotation
.end field

.field public otherUser:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public place:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x49
    .end annotation
.end field

.field public profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

.field public property:Lcom/p1/mobile/putong/core/data/ConversationProperty;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5a
    .end annotation
.end field

.field public quickChatProgress:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x73
    .end annotation
.end field

.field public read:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public readUntil:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public recommendType:Ljava/lang/String;

.field public remainedTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x51
    .end annotation
.end field

.field public reminder:Lcom/p1/mobile/putong/core/data/Reminder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public scenarios:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/data/ConversationStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x48
    .end annotation
.end field

.field public subtype:Lcom/p1/mobile/putong/core/data/ConversationType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4a
    .end annotation
.end field

.field public suggestionScore:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x60
    .end annotation
.end field

.field public unmatchConversation:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x50
    .end annotation
.end field

.field public unreadMessages:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public updatedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4f
    .end annotation
.end field

.field public userMessageCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5b
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Conversation$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Conversation$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$5;

    .line 34
    .line 35
    const-string v1, "localHasMessage_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALHASMESSAGE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$6;

    .line 43
    .line 44
    const-string v1, "read_c"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$6;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->READ:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$7;

    .line 52
    .line 53
    const-string v1, "otherUser_c"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$7;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->OTHERUSER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$8;

    .line 61
    .line 62
    const-string v1, "readUntil_c"

    .line 63
    .line 64
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$8;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->READUNTIL:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$9;

    .line 70
    .line 71
    const-string v1, "latestTime_c"

    .line 72
    .line 73
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$9;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LATESTTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 77
    .line 78
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$10;

    .line 79
    .line 80
    const-string v1, "createdTime_c"

    .line 81
    .line 82
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$10;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 86
    .line 87
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$11;

    .line 88
    .line 89
    const-string v1, "localMatchFrom_c"

    .line 90
    .line 91
    sget-object v2, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 92
    .line 93
    const-string v3, "str_localMatchFrom_c"

    .line 94
    .line 95
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Conversation$11;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 96
    .line 97
    .line 98
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALMATCHFROM:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 99
    .line 100
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$12;

    .line 101
    .line 102
    const-string v1, "localNotificationStatus_c"

    .line 103
    .line 104
    sget-object v2, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 105
    .line 106
    const-string v3, "str_localNotificationStatus_c"

    .line 107
    .line 108
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Conversation$12;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 109
    .line 110
    .line 111
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 112
    .line 113
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$13;

    .line 114
    .line 115
    const-string v1, "localBotheringTime_c"

    .line 116
    .line 117
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$13;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALBOTHERINGTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 121
    .line 122
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$14;

    .line 123
    .line 124
    const-string v1, "scenarios_c"

    .line 125
    .line 126
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$14;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->SCENARIOS:Lcom/tantanapp/common/data/orm/Column;

    .line 130
    .line 131
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$15;

    .line 132
    .line 133
    const-string v1, "localActiveTime_c"

    .line 134
    .line 135
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$15;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALACTIVETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 139
    .line 140
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$16;

    .line 141
    .line 142
    const-string v1, "unreadMessages_c"

    .line 143
    .line 144
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$16;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->UNREADMESSAGES:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 148
    .line 149
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$17;

    .line 150
    .line 151
    const-string v1, "localEverHasMessage_c"

    .line 152
    .line 153
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$17;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALEVERHASMESSAGE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 157
    .line 158
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$18;

    .line 159
    .line 160
    const-string v1, "reminder_c"

    .line 161
    .line 162
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$18;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->REMINDER:Lcom/tantanapp/common/data/orm/Column;

    .line 166
    .line 167
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$19;

    .line 168
    .line 169
    const-string v1, "localUserUpdatedTime_c"

    .line 170
    .line 171
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$19;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALUSERUPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 175
    .line 176
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$20;

    .line 177
    .line 178
    const-string v1, "importance_c"

    .line 179
    .line 180
    sget-object v2, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 181
    .line 182
    const-string v3, "str_importance_c"

    .line 183
    .line 184
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Conversation$20;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 185
    .line 186
    .line 187
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->IMPORTANCE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 188
    .line 189
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$21;

    .line 190
    .line 191
    const-string v1, "localOnlineTabClick_c"

    .line 192
    .line 193
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$21;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALONLINETABCLICK:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 197
    .line 198
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$22;

    .line 199
    .line 200
    const-string v1, "follow_c"

    .line 201
    .line 202
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$22;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->FOLLOW:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 206
    .line 207
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$23;

    .line 208
    .line 209
    const-string v1, "localBotherWxTime_c"

    .line 210
    .line 211
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$23;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALBOTHERWXTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 215
    .line 216
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$24;

    .line 217
    .line 218
    const-string v1, "localBotherCodeTime_c"

    .line 219
    .line 220
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$24;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALBOTHERCODETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 224
    .line 225
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$25;

    .line 226
    .line 227
    const-string v1, "clearedUntil_c"

    .line 228
    .line 229
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$25;-><init>(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->CLEAREDUNTIL:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 233
    .line 234
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$26;

    .line 235
    .line 236
    const-string v1, "status_c"

    .line 237
    .line 238
    sget-object v2, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 239
    .line 240
    const-string v3, "str_status_c"

    .line 241
    .line 242
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Conversation$26;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 243
    .line 244
    .line 245
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 246
    .line 247
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$27;

    .line 248
    .line 249
    const-string v1, "place_c"

    .line 250
    .line 251
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$27;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->PLACE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 255
    .line 256
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$28;

    .line 257
    .line 258
    const-string v1, "subtype_c"

    .line 259
    .line 260
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 261
    .line 262
    const-string v3, "str_subtype_c"

    .line 263
    .line 264
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Conversation$28;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 265
    .line 266
    .line 267
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->SUBTYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 268
    .line 269
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$29;

    .line 270
    .line 271
    const-string v1, "myTalk_c"

    .line 272
    .line 273
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$29;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->MYTALK:Lcom/tantanapp/common/data/orm/Column;

    .line 277
    .line 278
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$30;

    .line 279
    .line 280
    const-string v1, "otherTalk_c"

    .line 281
    .line 282
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$30;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->OTHERTALK:Lcom/tantanapp/common/data/orm/Column;

    .line 286
    .line 287
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$31;

    .line 288
    .line 289
    const-string v1, "otherReadUntil_c"

    .line 290
    .line 291
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$31;-><init>(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->OTHERREADUNTIL:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 295
    .line 296
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$32;

    .line 297
    .line 298
    const-string v1, "enterTimes_c"

    .line 299
    .line 300
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$32;-><init>(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ENTERTIMES:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 304
    .line 305
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$33;

    .line 306
    .line 307
    const-string v1, "updatedTime_c"

    .line 308
    .line 309
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$33;-><init>(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 313
    .line 314
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$34;

    .line 315
    .line 316
    const-string v1, "unmatchConversation_c"

    .line 317
    .line 318
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$34;-><init>(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->UNMATCHCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 322
    .line 323
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$35;

    .line 324
    .line 325
    const-string v1, "remainedTime_c"

    .line 326
    .line 327
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$35;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->REMAINEDTIME:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 331
    .line 332
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$36;

    .line 333
    .line 334
    const-string v1, "localSafetyReminderTime_c"

    .line 335
    .line 336
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$36;-><init>(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALSAFETYREMINDERTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 340
    .line 341
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$37;

    .line 342
    .line 343
    const-string v1, "localSpoofingReminderTime_c"

    .line 344
    .line 345
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$37;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALSPOOFINGREMINDERTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 349
    .line 350
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$38;

    .line 351
    .line 352
    const-string v1, "forceSend_c"

    .line 353
    .line 354
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$38;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->FORCESEND:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 358
    .line 359
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$39;

    .line 360
    .line 361
    const-string v1, "conversationUserDistance_c"

    .line 362
    .line 363
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$39;-><init>(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->CONVERSATIONUSERDISTANCE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 367
    .line 368
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$40;

    .line 369
    .line 370
    const-string v1, "conversationUserUpdatedTime_c"

    .line 371
    .line 372
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$40;-><init>(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->CONVERSATIONUSERUPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 376
    .line 377
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$41;

    .line 378
    .line 379
    const-string v1, "level_c"

    .line 380
    .line 381
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$41;-><init>(Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LEVEL:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 385
    .line 386
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$42;

    .line 387
    .line 388
    const-string v1, "additional_quickChat_avatarBlurred_c"

    .line 389
    .line 390
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$42;-><init>(Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_QUICKCHAT_AVATARBLURRED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 394
    .line 395
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$43;

    .line 396
    .line 397
    const-string v1, "additional_voiceCall_rejectedTime_c"

    .line 398
    .line 399
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$43;-><init>(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_VOICECALL_REJECTEDTIME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 403
    .line 404
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$44;

    .line 405
    .line 406
    const-string v1, "additional_voiceCall_acceptedTime_c"

    .line 407
    .line 408
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$44;-><init>(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_VOICECALL_ACCEPTEDTIME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 412
    .line 413
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$45;

    .line 414
    .line 415
    const-string v1, "additional_timeLimited_expiredTimestamp_c"

    .line 416
    .line 417
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$45;-><init>(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_TIMELIMITED_EXPIREDTIMESTAMP:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 421
    .line 422
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$46;

    .line 423
    .line 424
    const-string v1, "additional_timeLimited_participate_c"

    .line 425
    .line 426
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$46;-><init>(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_TIMELIMITED_PARTICIPATE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 430
    .line 431
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$47;

    .line 432
    .line 433
    const-string v1, "additional_timeLimited_allowExtension_c"

    .line 434
    .line 435
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$47;-><init>(Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_TIMELIMITED_ALLOWEXTENSION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 439
    .line 440
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$48;

    .line 441
    .line 442
    const-string v1, "additional_timeLimited_extensionOperator_c"

    .line 443
    .line 444
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$48;-><init>(Ljava/lang/String;)V

    .line 445
    .line 446
    .line 447
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_TIMELIMITED_EXTENSIONOPERATOR:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 448
    .line 449
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$49;

    .line 450
    .line 451
    const-string v1, "convType_c"

    .line 452
    .line 453
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$49;-><init>(Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->CONVTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 457
    .line 458
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$50;

    .line 459
    .line 460
    const-string v1, "property_c"

    .line 461
    .line 462
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$50;-><init>(Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->PROPERTY:Lcom/tantanapp/common/data/orm/Column;

    .line 466
    .line 467
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$51;

    .line 468
    .line 469
    const-string v1, "userMessageCount_c"

    .line 470
    .line 471
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$51;-><init>(Ljava/lang/String;)V

    .line 472
    .line 473
    .line 474
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->USERMESSAGECOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 475
    .line 476
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$52;

    .line 477
    .line 478
    const-string v1, "latestFriendCommentCreatedTime_c"

    .line 479
    .line 480
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$52;-><init>(Ljava/lang/String;)V

    .line 481
    .line 482
    .line 483
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LATESTFRIENDCOMMENTCREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 484
    .line 485
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$53;

    .line 486
    .line 487
    const-string v1, "heat_orderScore_c"

    .line 488
    .line 489
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$53;-><init>(Ljava/lang/String;)V

    .line 490
    .line 491
    .line 492
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->HEAT_ORDERSCORE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 493
    .line 494
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$54;

    .line 495
    .line 496
    const-string v1, "heat_showScore_c"

    .line 497
    .line 498
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$54;-><init>(Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->HEAT_SHOWSCORE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 502
    .line 503
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$55;

    .line 504
    .line 505
    const-string v1, "heat_marks_c"

    .line 506
    .line 507
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$55;-><init>(Ljava/lang/String;)V

    .line 508
    .line 509
    .line 510
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->HEAT_MARKS:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 511
    .line 512
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$56;

    .line 513
    .line 514
    const-string v1, "heat_mm_c"

    .line 515
    .line 516
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$56;-><init>(Ljava/lang/String;)V

    .line 517
    .line 518
    .line 519
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->HEAT_MM:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 520
    .line 521
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$57;

    .line 522
    .line 523
    const-string v1, "heat_score_c"

    .line 524
    .line 525
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$57;-><init>(Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->HEAT_SCORE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 529
    .line 530
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$58;

    .line 531
    .line 532
    const-string v1, "additional_oneSideNoMatch_selfSend_c"

    .line 533
    .line 534
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$58;-><init>(Ljava/lang/String;)V

    .line 535
    .line 536
    .line 537
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_ONESIDENOMATCH_SELFSEND:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 538
    .line 539
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$59;

    .line 540
    .line 541
    const-string v1, "localGreetDelete_c"

    .line 542
    .line 543
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$59;-><init>(Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALGREETDELETE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 547
    .line 548
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$60;

    .line 549
    .line 550
    const-string v1, "additional_timeLimited_hidden_c"

    .line 551
    .line 552
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$60;-><init>(Ljava/lang/String;)V

    .line 553
    .line 554
    .line 555
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_TIMELIMITED_HIDDEN:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 556
    .line 557
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$61;

    .line 558
    .line 559
    const-string v1, "additional_timeLimited_newConversation_c"

    .line 560
    .line 561
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$61;-><init>(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_TIMELIMITED_NEWCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 565
    .line 566
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$62;

    .line 567
    .line 568
    const-string v1, "additional_timeLimited_expiredSeconds_c"

    .line 569
    .line 570
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$62;-><init>(Ljava/lang/String;)V

    .line 571
    .line 572
    .line 573
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_TIMELIMITED_EXPIREDSECONDS:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 574
    .line 575
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$63;

    .line 576
    .line 577
    const-string v1, "suggestionScore_c"

    .line 578
    .line 579
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$63;-><init>(Ljava/lang/String;)V

    .line 580
    .line 581
    .line 582
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->SUGGESTIONSCORE:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 583
    .line 584
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$64;

    .line 585
    .line 586
    const-string v1, "localBotherStatus_c"

    .line 587
    .line 588
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$64;-><init>(Ljava/lang/String;)V

    .line 589
    .line 590
    .line 591
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALBOTHERSTATUS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 592
    .line 593
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$65;

    .line 594
    .line 595
    const-string v1, "muted_c"

    .line 596
    .line 597
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$65;-><init>(Ljava/lang/String;)V

    .line 598
    .line 599
    .line 600
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->MUTED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 601
    .line 602
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$66;

    .line 603
    .line 604
    const-string v1, "group_latestNotificationMsgId_c"

    .line 605
    .line 606
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$66;-><init>(Ljava/lang/String;)V

    .line 607
    .line 608
    .line 609
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->GROUP_LATESTNOTIFICATIONMSGID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 610
    .line 611
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$67;

    .line 612
    .line 613
    const-string v1, "group_joinedTime_c"

    .line 614
    .line 615
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$67;-><init>(Ljava/lang/String;)V

    .line 616
    .line 617
    .line 618
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->GROUP_JOINEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 619
    .line 620
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$68;

    .line 621
    .line 622
    const-string v1, "additional_oneSide_c"

    .line 623
    .line 624
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$68;-><init>(Ljava/lang/String;)V

    .line 625
    .line 626
    .line 627
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_ONESIDE:Lcom/tantanapp/common/data/orm/Column;

    .line 628
    .line 629
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$69;

    .line 630
    .line 631
    const-string v1, "localDraft_c"

    .line 632
    .line 633
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$69;-><init>(Ljava/lang/String;)V

    .line 634
    .line 635
    .line 636
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALDRAFT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 637
    .line 638
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$70;

    .line 639
    .line 640
    const-string v1, "localChatBg_c"

    .line 641
    .line 642
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$70;-><init>(Ljava/lang/String;)V

    .line 643
    .line 644
    .line 645
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALCHATBG:Lcom/tantanapp/common/data/orm/Column;

    .line 646
    .line 647
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$71;

    .line 648
    .line 649
    const-string v1, "localPlaceBan_c"

    .line 650
    .line 651
    sget-object v2, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 652
    .line 653
    const-string v3, "str_localPlaceBan_c"

    .line 654
    .line 655
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Conversation$71;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 656
    .line 657
    .line 658
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALPLACEBAN:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 659
    .line 660
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$72;

    .line 661
    .line 662
    const-string v1, "additional_kankan_contents_c"

    .line 663
    .line 664
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$72;-><init>(Ljava/lang/String;)V

    .line 665
    .line 666
    .line 667
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_KANKAN_CONTENTS:Lcom/tantanapp/common/data/orm/Column;

    .line 668
    .line 669
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$73;

    .line 670
    .line 671
    const-string v1, "additional_kankan_resonance_c"

    .line 672
    .line 673
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$73;-><init>(Ljava/lang/String;)V

    .line 674
    .line 675
    .line 676
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_KANKAN_RESONANCE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 677
    .line 678
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$74;

    .line 679
    .line 680
    const-string v1, "additional_kankan_greetingSummaryDetail_unseen_c"

    .line 681
    .line 682
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$74;-><init>(Ljava/lang/String;)V

    .line 683
    .line 684
    .line 685
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_UNSEEN:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 686
    .line 687
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$75;

    .line 688
    .line 689
    const-string v1, "additional_kankan_greetingSummaryDetail_latestTime_c"

    .line 690
    .line 691
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$75;-><init>(Ljava/lang/String;)V

    .line 692
    .line 693
    .line 694
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_LATESTTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 695
    .line 696
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$76;

    .line 697
    .line 698
    const-string v1, "additional_kankan_greetingSummaryDetail_latestUserId_c"

    .line 699
    .line 700
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$76;-><init>(Ljava/lang/String;)V

    .line 701
    .line 702
    .line 703
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_LATESTUSERID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 704
    .line 705
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$77;

    .line 706
    .line 707
    const-string v1, "additional_kankan_greetingSummaryDetail_latestMessageId_c"

    .line 708
    .line 709
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$77;-><init>(Ljava/lang/String;)V

    .line 710
    .line 711
    .line 712
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_LATESTMESSAGEID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 713
    .line 714
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$78;

    .line 715
    .line 716
    const-string v1, "additional_quickChat_bell_isInitiator_c"

    .line 717
    .line 718
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$78;-><init>(Ljava/lang/String;)V

    .line 719
    .line 720
    .line 721
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_QUICKCHAT_BELL_ISINITIATOR:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 722
    .line 723
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$79;

    .line 724
    .line 725
    const-string v1, "additional_quickChat_bell_agree_c"

    .line 726
    .line 727
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$79;-><init>(Ljava/lang/String;)V

    .line 728
    .line 729
    .line 730
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_QUICKCHAT_BELL_AGREE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 731
    .line 732
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$80;

    .line 733
    .line 734
    const-string v1, "localMessageInsertReportHint_c"

    .line 735
    .line 736
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$80;-><init>(Ljava/lang/String;)V

    .line 737
    .line 738
    .line 739
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALMESSAGEINSERTREPORTHINT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 740
    .line 741
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$81;

    .line 742
    .line 743
    const-string v1, "localNotifyMomentId_c"

    .line 744
    .line 745
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$81;-><init>(Ljava/lang/String;)V

    .line 746
    .line 747
    .line 748
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALNOTIFYMOMENTID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 749
    .line 750
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$82;

    .line 751
    .line 752
    const-string v1, "localInsertedMomentId_c"

    .line 753
    .line 754
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$82;-><init>(Ljava/lang/String;)V

    .line 755
    .line 756
    .line 757
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALINSERTEDMOMENTID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 758
    .line 759
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$83;

    .line 760
    .line 761
    const-string v1, "mm_c"

    .line 762
    .line 763
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$83;-><init>(Ljava/lang/String;)V

    .line 764
    .line 765
    .line 766
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->MM:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 767
    .line 768
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$84;

    .line 769
    .line 770
    const-string v1, "additional_quickChat_expire_c"

    .line 771
    .line 772
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$84;-><init>(Ljava/lang/String;)V

    .line 773
    .line 774
    .line 775
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_QUICKCHAT_EXPIRE:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 776
    .line 777
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$85;

    .line 778
    .line 779
    const-string v1, "str_localBusinessTypes_c"

    .line 780
    .line 781
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$85;-><init>(Ljava/lang/String;)V

    .line 782
    .line 783
    .line 784
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->STR_LOCALBUSINESSTYPES:Lcom/tantanapp/common/data/orm/Column;

    .line 785
    .line 786
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$86;

    .line 787
    .line 788
    const-string v1, "intimacy_c"

    .line 789
    .line 790
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$86;-><init>(Ljava/lang/String;)V

    .line 791
    .line 792
    .line 793
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->INTIMACY:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 794
    .line 795
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$87;

    .line 796
    .line 797
    const-string v1, "quickChatProgress_c"

    .line 798
    .line 799
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$87;-><init>(Ljava/lang/String;)V

    .line 800
    .line 801
    .line 802
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->QUICKCHATPROGRESS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 803
    .line 804
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$88;

    .line 805
    .line 806
    const-string v1, "group_source_c"

    .line 807
    .line 808
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$88;-><init>(Ljava/lang/String;)V

    .line 809
    .line 810
    .line 811
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->GROUP_SOURCE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 812
    .line 813
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$89;

    .line 814
    .line 815
    const-string v1, "additional_quickChat_progress_c"

    .line 816
    .line 817
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$89;-><init>(Ljava/lang/String;)V

    .line 818
    .line 819
    .line 820
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_QUICKCHAT_PROGRESS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 821
    .line 822
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$90;

    .line 823
    .line 824
    const-string v1, "additional_feedStateCounter_c"

    .line 825
    .line 826
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$90;-><init>(Ljava/lang/String;)V

    .line 827
    .line 828
    .line 829
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_FEEDSTATECOUNTER:Lcom/tantanapp/common/data/orm/Column;

    .line 830
    .line 831
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$91;

    .line 832
    .line 833
    const-string v1, "additional_suggestedTimeLimitedMatch_c"

    .line 834
    .line 835
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$91;-><init>(Ljava/lang/String;)V

    .line 836
    .line 837
    .line 838
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_SUGGESTEDTIMELIMITEDMATCH:Lcom/tantanapp/common/data/orm/Column;

    .line 839
    .line 840
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$92;

    .line 841
    .line 842
    const-string v1, "additional_kankan_greetingSummaryDetail_iconURL_c"

    .line 843
    .line 844
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$92;-><init>(Ljava/lang/String;)V

    .line 845
    .line 846
    .line 847
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_ICONURL:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 848
    .line 849
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$93;

    .line 850
    .line 851
    const-string v1, "additional_kankan_greetingSummaryDetail_title_c"

    .line 852
    .line 853
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$93;-><init>(Ljava/lang/String;)V

    .line 854
    .line 855
    .line 856
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_TITLE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 857
    .line 858
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$94;

    .line 859
    .line 860
    const-string v1, "additional_kankan_greetingSummaryDetail_subtitle_c"

    .line 861
    .line 862
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$94;-><init>(Ljava/lang/String;)V

    .line 863
    .line 864
    .line 865
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_KANKAN_GREETINGSUMMARYDETAIL_SUBTITLE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 866
    .line 867
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$95;

    .line 868
    .line 869
    const-string v1, "additional_heartbeatMatch_c"

    .line 870
    .line 871
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$95;-><init>(Ljava/lang/String;)V

    .line 872
    .line 873
    .line 874
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_HEARTBEATMATCH:Lcom/tantanapp/common/data/orm/Column;

    .line 875
    .line 876
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$96;

    .line 877
    .line 878
    const-string v1, "hasLocalBreakIce_c"

    .line 879
    .line 880
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$96;-><init>(Ljava/lang/String;)V

    .line 881
    .line 882
    .line 883
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->HASLOCALBREAKICE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 884
    .line 885
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$97;

    .line 886
    .line 887
    const-string v1, "additional_avatarSummary_c"

    .line 888
    .line 889
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$97;-><init>(Ljava/lang/String;)V

    .line 890
    .line 891
    .line 892
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_AVATARSUMMARY:Lcom/tantanapp/common/data/orm/Column;

    .line 893
    .line 894
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$98;

    .line 895
    .line 896
    const-string v1, "additional_feedInteractionCounter_c"

    .line 897
    .line 898
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$98;-><init>(Ljava/lang/String;)V

    .line 899
    .line 900
    .line 901
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_FEEDINTERACTIONCOUNTER:Lcom/tantanapp/common/data/orm/Column;

    .line 902
    .line 903
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$99;

    .line 904
    .line 905
    const-string v1, "localSpoofingNewTime_c"

    .line 906
    .line 907
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$99;-><init>(Ljava/lang/String;)V

    .line 908
    .line 909
    .line 910
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALSPOOFINGNEWTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 911
    .line 912
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$100;

    .line 913
    .line 914
    const-string v1, "additional_liveVirtualVoice_c"

    .line 915
    .line 916
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$100;-><init>(Ljava/lang/String;)V

    .line 917
    .line 918
    .line 919
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_LIVEVIRTUALVOICE:Lcom/tantanapp/common/data/orm/Column;

    .line 920
    .line 921
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$101;

    .line 922
    .line 923
    const-string v1, "clearedTime_c"

    .line 924
    .line 925
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$101;-><init>(Ljava/lang/String;)V

    .line 926
    .line 927
    .line 928
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->CLEAREDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 929
    .line 930
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$102;

    .line 931
    .line 932
    const-string v1, "additional_localMomentInfo_c"

    .line 933
    .line 934
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$102;-><init>(Ljava/lang/String;)V

    .line 935
    .line 936
    .line 937
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_LOCALMOMENTINFO:Lcom/tantanapp/common/data/orm/Column;

    .line 938
    .line 939
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$103;

    .line 940
    .line 941
    const-string v1, "localExtraInfo_c"

    .line 942
    .line 943
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$103;-><init>(Ljava/lang/String;)V

    .line 944
    .line 945
    .line 946
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALEXTRAINFO:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 947
    .line 948
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$104;

    .line 949
    .line 950
    const-string v1, "lastActivityTime_c"

    .line 951
    .line 952
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$104;-><init>(Ljava/lang/String;)V

    .line 953
    .line 954
    .line 955
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LASTACTIVITYTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 956
    .line 957
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$105;

    .line 958
    .line 959
    const-string v1, "additional_liveActivity_c"

    .line 960
    .line 961
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$105;-><init>(Ljava/lang/String;)V

    .line 962
    .line 963
    .line 964
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_LIVEACTIVITY:Lcom/tantanapp/common/data/orm/Column;

    .line 965
    .line 966
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$106;

    .line 967
    .line 968
    const-string v1, "additional_game_c"

    .line 969
    .line 970
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$106;-><init>(Ljava/lang/String;)V

    .line 971
    .line 972
    .line 973
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_GAME:Lcom/tantanapp/common/data/orm/Column;

    .line 974
    .line 975
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$107;

    .line 976
    .line 977
    const-string v1, "additional_tag_c"

    .line 978
    .line 979
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$107;-><init>(Ljava/lang/String;)V

    .line 980
    .line 981
    .line 982
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_TAG:Lcom/tantanapp/common/data/orm/Column;

    .line 983
    .line 984
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$108;

    .line 985
    .line 986
    const-string v1, "additional_chatAssistantQuestion_c"

    .line 987
    .line 988
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$108;-><init>(Ljava/lang/String;)V

    .line 989
    .line 990
    .line 991
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_CHATASSISTANTQUESTION:Lcom/tantanapp/common/data/orm/Column;

    .line 992
    .line 993
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$109;

    .line 994
    .line 995
    const-string v1, "additional_quickChat_guideFakeToGood_c"

    .line 996
    .line 997
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$109;-><init>(Ljava/lang/String;)V

    .line 998
    .line 999
    .line 1000
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_QUICKCHAT_GUIDEFAKETOGOOD:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 1001
    .line 1002
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$110;

    .line 1003
    .line 1004
    const-string v1, "otherStatus_c"

    .line 1005
    .line 1006
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$110;-><init>(Ljava/lang/String;)V

    .line 1007
    .line 1008
    .line 1009
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->OTHERSTATUS:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 1010
    .line 1011
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$111;

    .line 1012
    .line 1013
    const-string v1, "additional_continuousChat_c"

    .line 1014
    .line 1015
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$111;-><init>(Ljava/lang/String;)V

    .line 1016
    .line 1017
    .line 1018
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_CONTINUOUSCHAT:Lcom/tantanapp/common/data/orm/Column;

    .line 1019
    .line 1020
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$112;

    .line 1021
    .line 1022
    const-string v1, "additional_pinChat_c"

    .line 1023
    .line 1024
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$112;-><init>(Ljava/lang/String;)V

    .line 1025
    .line 1026
    .line 1027
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_PINCHAT:Lcom/tantanapp/common/data/orm/Column;

    .line 1028
    .line 1029
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$113;

    .line 1030
    .line 1031
    const-string v1, "additional_reSwipe_c"

    .line 1032
    .line 1033
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$113;-><init>(Ljava/lang/String;)V

    .line 1034
    .line 1035
    .line 1036
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_RESWIPE:Lcom/tantanapp/common/data/orm/Column;

    .line 1037
    .line 1038
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$114;

    .line 1039
    .line 1040
    const-string v1, "additional_blindbox_c"

    .line 1041
    .line 1042
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$114;-><init>(Ljava/lang/String;)V

    .line 1043
    .line 1044
    .line 1045
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_BLINDBOX:Lcom/tantanapp/common/data/orm/Column;

    .line 1046
    .line 1047
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$115;

    .line 1048
    .line 1049
    const-string v1, "additional_previewTexts_c"

    .line 1050
    .line 1051
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$115;-><init>(Ljava/lang/String;)V

    .line 1052
    .line 1053
    .line 1054
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_PREVIEWTEXTS:Lcom/tantanapp/common/data/orm/Column;

    .line 1055
    .line 1056
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$116;

    .line 1057
    .line 1058
    const-string v1, "additional_greetingInfo_c"

    .line 1059
    .line 1060
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$116;-><init>(Ljava/lang/String;)V

    .line 1061
    .line 1062
    .line 1063
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_GREETINGINFO:Lcom/tantanapp/common/data/orm/Column;

    .line 1064
    .line 1065
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$117;

    .line 1066
    .line 1067
    const-string v1, "additional_fateRadar_c"

    .line 1068
    .line 1069
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$117;-><init>(Ljava/lang/String;)V

    .line 1070
    .line 1071
    .line 1072
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_FATERADAR:Lcom/tantanapp/common/data/orm/Column;

    .line 1073
    .line 1074
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$118;

    .line 1075
    .line 1076
    const-string v1, "isFake_c"

    .line 1077
    .line 1078
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$118;-><init>(Ljava/lang/String;)V

    .line 1079
    .line 1080
    .line 1081
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ISFAKE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 1082
    .line 1083
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$119;

    .line 1084
    .line 1085
    const-string v1, "additional_lowPayOneside_c"

    .line 1086
    .line 1087
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$119;-><init>(Ljava/lang/String;)V

    .line 1088
    .line 1089
    .line 1090
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_LOWPAYONESIDE:Lcom/tantanapp/common/data/orm/Column;

    .line 1091
    .line 1092
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$120;

    .line 1093
    .line 1094
    const-string v1, "additional_matchInfo_c"

    .line 1095
    .line 1096
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$120;-><init>(Ljava/lang/String;)V

    .line 1097
    .line 1098
    .line 1099
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_MATCHINFO:Lcom/tantanapp/common/data/orm/Column;

    .line 1100
    .line 1101
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$121;

    .line 1102
    .line 1103
    const-string v1, "additional_newMatch_labelExposureTime_c"

    .line 1104
    .line 1105
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$121;-><init>(Ljava/lang/String;)V

    .line 1106
    .line 1107
    .line 1108
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_NEWMATCH_LABELEXPOSURETIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 1109
    .line 1110
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$122;

    .line 1111
    .line 1112
    const-string v1, "additional_loveLetter_c"

    .line 1113
    .line 1114
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$122;-><init>(Ljava/lang/String;)V

    .line 1115
    .line 1116
    .line 1117
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_LOVELETTER:Lcom/tantanapp/common/data/orm/Column;

    .line 1118
    .line 1119
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$123;

    .line 1120
    .line 1121
    const-string v1, "localIsLimitedTrialSee_c"

    .line 1122
    .line 1123
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$123;-><init>(Ljava/lang/String;)V

    .line 1124
    .line 1125
    .line 1126
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->LOCALISLIMITEDTRIALSEE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 1127
    .line 1128
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$124;

    .line 1129
    .line 1130
    const-string v1, "additional_chatMM_c"

    .line 1131
    .line 1132
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$124;-><init>(Ljava/lang/String;)V

    .line 1133
    .line 1134
    .line 1135
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_CHATMM:Lcom/tantanapp/common/data/orm/Column;

    .line 1136
    .line 1137
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$125;

    .line 1138
    .line 1139
    const-string v1, "additional_blackList_c"

    .line 1140
    .line 1141
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$125;-><init>(Ljava/lang/String;)V

    .line 1142
    .line 1143
    .line 1144
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_BLACKLIST:Lcom/tantanapp/common/data/orm/Column;

    .line 1145
    .line 1146
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$126;

    .line 1147
    .line 1148
    const-string v1, "additional_messageRelate_c"

    .line 1149
    .line 1150
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$126;-><init>(Ljava/lang/String;)V

    .line 1151
    .line 1152
    .line 1153
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_MESSAGERELATE:Lcom/tantanapp/common/data/orm/Column;

    .line 1154
    .line 1155
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$127;

    .line 1156
    .line 1157
    const-string v1, "additional_compliment_c"

    .line 1158
    .line 1159
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$127;-><init>(Ljava/lang/String;)V

    .line 1160
    .line 1161
    .line 1162
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_COMPLIMENT:Lcom/tantanapp/common/data/orm/Column;

    .line 1163
    .line 1164
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$128;

    .line 1165
    .line 1166
    const-string v1, "additional_swiper_c"

    .line 1167
    .line 1168
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation$128;-><init>(Ljava/lang/String;)V

    .line 1169
    .line 1170
    .line 1171
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->ADDITIONAL_SWIPER:Lcom/tantanapp/common/data/orm/Column;

    .line 1172
    .line 1173
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation$129;

    .line 1174
    .line 1175
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Conversation$129;-><init>()V

    .line 1176
    .line 1177
    .line 1178
    sput-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->DB_ADAPTER:Ll/vzf0;

    .line 1179
    .line 1180
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/LocalBusinessType;)Lcom/p1/mobile/putong/core/data/LocalBusinessType;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->clone()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Conversation;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 365
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Conversation;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PartialIdList;->clone()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 39
    .line 40
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 41
    .line 42
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 43
    .line 44
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 45
    .line 46
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 55
    .line 56
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 57
    .line 58
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 61
    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    new-instance v2, Ll/r46;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/r46;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 74
    .line 75
    :cond_1
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 76
    .line 77
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 80
    .line 81
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 82
    .line 83
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 84
    .line 85
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 88
    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Reminder;->clone()Lcom/p1/mobile/putong/core/data/Reminder;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 96
    .line 97
    :cond_2
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 98
    .line 99
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 102
    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 106
    .line 107
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 108
    .line 109
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 110
    .line 111
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 112
    .line 113
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 114
    .line 115
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 116
    .line 117
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 118
    .line 119
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 122
    .line 123
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 126
    .line 127
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 130
    .line 131
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 134
    .line 135
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 138
    .line 139
    if-eqz v1, :cond_3

    .line 140
    .line 141
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/TalkInfo;->clone()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 146
    .line 147
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 148
    .line 149
    if-eqz v1, :cond_4

    .line 150
    .line 151
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/TalkInfo;->clone()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 156
    .line 157
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 158
    .line 159
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 160
    .line 161
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 162
    .line 163
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 164
    .line 165
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 166
    .line 167
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 168
    .line 169
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 170
    .line 171
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 172
    .line 173
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 174
    .line 175
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 176
    .line 177
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 178
    .line 179
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 180
    .line 181
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 182
    .line 183
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 184
    .line 185
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 186
    .line 187
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 188
    .line 189
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 190
    .line 191
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 192
    .line 193
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 194
    .line 195
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 196
    .line 197
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 198
    .line 199
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 202
    .line 203
    if-eqz v1, :cond_5

    .line 204
    .line 205
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 210
    .line 211
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 212
    .line 213
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 216
    .line 217
    if-eqz v1, :cond_6

    .line 218
    .line 219
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationProperty;->clone()Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 224
    .line 225
    :cond_6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 226
    .line 227
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 228
    .line 229
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 230
    .line 231
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 234
    .line 235
    if-eqz v1, :cond_7

    .line 236
    .line 237
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->clone()Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 242
    .line 243
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 244
    .line 245
    if-eqz v1, :cond_8

    .line 246
    .line 247
    new-instance v2, Ll/s46;

    .line 248
    .line 249
    invoke-direct {v2}, Ll/s46;-><init>()V

    .line 250
    .line 251
    .line 252
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 257
    .line 258
    :cond_8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 259
    .line 260
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 261
    .line 262
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 263
    .line 264
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 265
    .line 266
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 267
    .line 268
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 269
    .line 270
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 271
    .line 272
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 273
    .line 274
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 275
    .line 276
    if-eqz v1, :cond_9

    .line 277
    .line 278
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->clone()Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 283
    .line 284
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 285
    .line 286
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 287
    .line 288
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 289
    .line 290
    if-eqz v1, :cond_a

    .line 291
    .line 292
    new-instance v2, Ll/t46;

    .line 293
    .line 294
    invoke-direct {v2}, Ll/t46;-><init>()V

    .line 295
    .line 296
    .line 297
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 302
    .line 303
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 304
    .line 305
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 306
    .line 307
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 308
    .line 309
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 310
    .line 311
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 312
    .line 313
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 314
    .line 315
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 316
    .line 317
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 318
    .line 319
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 320
    .line 321
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 322
    .line 323
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 324
    .line 325
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 326
    .line 327
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 328
    .line 329
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 330
    .line 331
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 332
    .line 333
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 334
    .line 335
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 336
    .line 337
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 338
    .line 339
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 340
    .line 341
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 342
    .line 343
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 344
    .line 345
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 346
    .line 347
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 348
    .line 349
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 350
    .line 351
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 352
    .line 353
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 354
    .line 355
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 356
    .line 357
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 358
    .line 359
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 360
    .line 361
    iput p0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 362
    .line 363
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 364
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    return-object p0
.end method

.method public doubleDefault()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "default"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 12
    .line 13
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 22
    .line 23
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 24
    .line 25
    if-ne p1, v3, :cond_3

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 28
    .line 29
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 30
    .line 31
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 38
    .line 39
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 68
    .line 69
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 70
    .line 71
    cmpl-double p1, v3, v5

    .line 72
    .line 73
    if-nez p1, :cond_3

    .line 74
    .line 75
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 76
    .line 77
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 78
    .line 79
    cmpl-double p1, v3, v5

    .line 80
    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 84
    .line 85
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 86
    .line 87
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_3

    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 94
    .line 95
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 96
    .line 97
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_3

    .line 102
    .line 103
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 104
    .line 105
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 106
    .line 107
    cmpl-double p1, v3, v5

    .line 108
    .line 109
    if-nez p1, :cond_3

    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 112
    .line 113
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 114
    .line 115
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-eqz p1, :cond_3

    .line 120
    .line 121
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 122
    .line 123
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 124
    .line 125
    cmpl-double p1, v3, v5

    .line 126
    .line 127
    if-nez p1, :cond_3

    .line 128
    .line 129
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 130
    .line 131
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 132
    .line 133
    if-ne p1, v3, :cond_3

    .line 134
    .line 135
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 136
    .line 137
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 138
    .line 139
    if-ne p1, v3, :cond_3

    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 142
    .line 143
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 144
    .line 145
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-eqz p1, :cond_3

    .line 150
    .line 151
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 152
    .line 153
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 154
    .line 155
    cmpl-double p1, v3, v5

    .line 156
    .line 157
    if-nez p1, :cond_3

    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 160
    .line 161
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 162
    .line 163
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    if-eqz p1, :cond_3

    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-eqz p1, :cond_3

    .line 178
    .line 179
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 180
    .line 181
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 182
    .line 183
    if-ne p1, v3, :cond_3

    .line 184
    .line 185
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 186
    .line 187
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 188
    .line 189
    cmpl-double p1, v3, v5

    .line 190
    .line 191
    if-nez p1, :cond_3

    .line 192
    .line 193
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 194
    .line 195
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 196
    .line 197
    cmpl-double p1, v3, v5

    .line 198
    .line 199
    if-nez p1, :cond_3

    .line 200
    .line 201
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 202
    .line 203
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 204
    .line 205
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-eqz p1, :cond_3

    .line 210
    .line 211
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 212
    .line 213
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 214
    .line 215
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-eqz p1, :cond_3

    .line 220
    .line 221
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 222
    .line 223
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 224
    .line 225
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_3

    .line 230
    .line 231
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 232
    .line 233
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 234
    .line 235
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result p1

    .line 239
    if-eqz p1, :cond_3

    .line 240
    .line 241
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 242
    .line 243
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 244
    .line 245
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-eqz p1, :cond_3

    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 252
    .line 253
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 254
    .line 255
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_3

    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 262
    .line 263
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 264
    .line 265
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    if-eqz p1, :cond_3

    .line 270
    .line 271
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 272
    .line 273
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 274
    .line 275
    if-ne p1, v3, :cond_3

    .line 276
    .line 277
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 278
    .line 279
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 280
    .line 281
    cmpl-double p1, v3, v5

    .line 282
    .line 283
    if-nez p1, :cond_3

    .line 284
    .line 285
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 286
    .line 287
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 288
    .line 289
    if-ne p1, v3, :cond_3

    .line 290
    .line 291
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 292
    .line 293
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 294
    .line 295
    cmp-long p1, v3, v5

    .line 296
    .line 297
    if-nez p1, :cond_3

    .line 298
    .line 299
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 300
    .line 301
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 302
    .line 303
    cmpl-double p1, v3, v5

    .line 304
    .line 305
    if-nez p1, :cond_3

    .line 306
    .line 307
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 308
    .line 309
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 310
    .line 311
    cmpl-double p1, v3, v5

    .line 312
    .line 313
    if-nez p1, :cond_3

    .line 314
    .line 315
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 316
    .line 317
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 318
    .line 319
    if-ne p1, v3, :cond_3

    .line 320
    .line 321
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 322
    .line 323
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 324
    .line 325
    if-ne p1, v3, :cond_3

    .line 326
    .line 327
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 328
    .line 329
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 330
    .line 331
    cmpl-double p1, v3, v5

    .line 332
    .line 333
    if-nez p1, :cond_3

    .line 334
    .line 335
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 336
    .line 337
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 338
    .line 339
    if-ne p1, v3, :cond_3

    .line 340
    .line 341
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 342
    .line 343
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 344
    .line 345
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result p1

    .line 349
    if-eqz p1, :cond_3

    .line 350
    .line 351
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 352
    .line 353
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 354
    .line 355
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    move-result p1

    .line 359
    if-eqz p1, :cond_3

    .line 360
    .line 361
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 362
    .line 363
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 364
    .line 365
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    move-result p1

    .line 369
    if-eqz p1, :cond_3

    .line 370
    .line 371
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 372
    .line 373
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 374
    .line 375
    if-ne p1, v3, :cond_3

    .line 376
    .line 377
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 378
    .line 379
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 380
    .line 381
    cmpl-double p1, v3, v5

    .line 382
    .line 383
    if-nez p1, :cond_3

    .line 384
    .line 385
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 386
    .line 387
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 388
    .line 389
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result p1

    .line 393
    if-eqz p1, :cond_3

    .line 394
    .line 395
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 396
    .line 397
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 398
    .line 399
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 400
    .line 401
    .line 402
    move-result p1

    .line 403
    if-eqz p1, :cond_3

    .line 404
    .line 405
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 406
    .line 407
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 408
    .line 409
    if-ne p1, v3, :cond_3

    .line 410
    .line 411
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 412
    .line 413
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 414
    .line 415
    cmpl-double p1, v3, v5

    .line 416
    .line 417
    if-nez p1, :cond_3

    .line 418
    .line 419
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 420
    .line 421
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 422
    .line 423
    if-ne p1, v3, :cond_3

    .line 424
    .line 425
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 426
    .line 427
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 428
    .line 429
    if-ne p1, v3, :cond_3

    .line 430
    .line 431
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 432
    .line 433
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 434
    .line 435
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result p1

    .line 439
    if-eqz p1, :cond_3

    .line 440
    .line 441
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 442
    .line 443
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 444
    .line 445
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result p1

    .line 449
    if-eqz p1, :cond_3

    .line 450
    .line 451
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 452
    .line 453
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 454
    .line 455
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 456
    .line 457
    .line 458
    move-result p1

    .line 459
    if-eqz p1, :cond_3

    .line 460
    .line 461
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 462
    .line 463
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 464
    .line 465
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result p1

    .line 469
    if-eqz p1, :cond_3

    .line 470
    .line 471
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 472
    .line 473
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 474
    .line 475
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 476
    .line 477
    .line 478
    move-result p1

    .line 479
    if-eqz p1, :cond_3

    .line 480
    .line 481
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 482
    .line 483
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 484
    .line 485
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 486
    .line 487
    .line 488
    move-result p1

    .line 489
    if-eqz p1, :cond_3

    .line 490
    .line 491
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 492
    .line 493
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 494
    .line 495
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 496
    .line 497
    .line 498
    move-result p1

    .line 499
    if-eqz p1, :cond_3

    .line 500
    .line 501
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 502
    .line 503
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 504
    .line 505
    if-ne p1, v3, :cond_3

    .line 506
    .line 507
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 508
    .line 509
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 510
    .line 511
    if-ne p1, v3, :cond_3

    .line 512
    .line 513
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 514
    .line 515
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 516
    .line 517
    if-ne p1, v3, :cond_3

    .line 518
    .line 519
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 520
    .line 521
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 522
    .line 523
    if-ne p1, v3, :cond_3

    .line 524
    .line 525
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 526
    .line 527
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 528
    .line 529
    cmpl-double p1, v3, v5

    .line 530
    .line 531
    if-nez p1, :cond_3

    .line 532
    .line 533
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 534
    .line 535
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 536
    .line 537
    cmpl-double p1, v3, v5

    .line 538
    .line 539
    if-nez p1, :cond_3

    .line 540
    .line 541
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 542
    .line 543
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 544
    .line 545
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 546
    .line 547
    .line 548
    move-result p1

    .line 549
    if-eqz p1, :cond_3

    .line 550
    .line 551
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 552
    .line 553
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 554
    .line 555
    cmpl-double p1, v3, v5

    .line 556
    .line 557
    if-nez p1, :cond_3

    .line 558
    .line 559
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 560
    .line 561
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 562
    .line 563
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 564
    .line 565
    .line 566
    move-result p1

    .line 567
    if-eqz p1, :cond_3

    .line 568
    .line 569
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 570
    .line 571
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 572
    .line 573
    if-ne p1, v3, :cond_3

    .line 574
    .line 575
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 576
    .line 577
    iget p1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 578
    .line 579
    if-ne p0, p1, :cond_3

    .line 580
    .line 581
    return v0

    .line 582
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "conversation"

    .line 2
    .line 3
    return-object p0
.end method

.method public hasReSwipeConvIceBreak()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 30
    .line 31
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->autoSendMessage:Z

    .line 32
    .line 33
    xor-int/lit8 p0, p0, 0x1

    .line 34
    .line 35
    return p0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public hasRemoveLabel()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/CharSequence;

    .line 23
    .line 24
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 9

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_28

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tantanapp/common/data/DbObject;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 12
    .line 13
    const/16 v2, 0x4d5

    .line 14
    .line 15
    const/16 v3, 0x4cf

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    move v1, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PartialIdList;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v1, v4

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v4

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v4

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    goto :goto_4

    .line 74
    :cond_4
    move v1, v4

    .line 75
    :goto_4
    add-int/2addr v0, v1

    .line 76
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 77
    .line 78
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 79
    .line 80
    .line 81
    move-result-wide v5

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    const/16 v1, 0x20

    .line 85
    .line 86
    ushr-long v7, v5, v1

    .line 87
    .line 88
    xor-long/2addr v5, v7

    .line 89
    long-to-int v5, v5

    .line 90
    add-int/2addr v0, v5

    .line 91
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 92
    .line 93
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 94
    .line 95
    .line 96
    move-result-wide v5

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    ushr-long v7, v5, v1

    .line 100
    .line 101
    xor-long/2addr v5, v7

    .line 102
    long-to-int v5, v5

    .line 103
    add-int/2addr v0, v5

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 107
    .line 108
    if-eqz v5, :cond_5

    .line 109
    .line 110
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    goto :goto_5

    .line 115
    :cond_5
    move v5, v4

    .line 116
    :goto_5
    add-int/2addr v0, v5

    .line 117
    mul-int/lit8 v0, v0, 0x29

    .line 118
    .line 119
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 120
    .line 121
    if-eqz v5, :cond_6

    .line 122
    .line 123
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    goto :goto_6

    .line 128
    :cond_6
    move v5, v4

    .line 129
    :goto_6
    add-int/2addr v0, v5

    .line 130
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 131
    .line 132
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 133
    .line 134
    .line 135
    move-result-wide v5

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    ushr-long v7, v5, v1

    .line 139
    .line 140
    xor-long/2addr v5, v7

    .line 141
    long-to-int v5, v5

    .line 142
    add-int/2addr v0, v5

    .line 143
    mul-int/lit8 v0, v0, 0x29

    .line 144
    .line 145
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 146
    .line 147
    if-eqz v5, :cond_7

    .line 148
    .line 149
    invoke-interface {v5}, Ljava/util/List;->hashCode()I

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    goto :goto_7

    .line 154
    :cond_7
    move v5, v4

    .line 155
    :goto_7
    add-int/2addr v0, v5

    .line 156
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 157
    .line 158
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 159
    .line 160
    .line 161
    move-result-wide v5

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    ushr-long v7, v5, v1

    .line 165
    .line 166
    xor-long/2addr v5, v7

    .line 167
    long-to-int v5, v5

    .line 168
    add-int/2addr v0, v5

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    iget v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 172
    .line 173
    add-int/2addr v0, v5

    .line 174
    mul-int/lit8 v0, v0, 0x29

    .line 175
    .line 176
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 177
    .line 178
    if-eqz v5, :cond_8

    .line 179
    .line 180
    move v5, v3

    .line 181
    goto :goto_8

    .line 182
    :cond_8
    move v5, v2

    .line 183
    :goto_8
    add-int/2addr v0, v5

    .line 184
    mul-int/lit8 v0, v0, 0x29

    .line 185
    .line 186
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 187
    .line 188
    if-eqz v5, :cond_9

    .line 189
    .line 190
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/Reminder;->hashCode()I

    .line 191
    .line 192
    .line 193
    move-result v5

    .line 194
    goto :goto_9

    .line 195
    :cond_9
    move v5, v4

    .line 196
    :goto_9
    add-int/2addr v0, v5

    .line 197
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 198
    .line 199
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 200
    .line 201
    .line 202
    move-result-wide v5

    .line 203
    mul-int/lit8 v0, v0, 0x29

    .line 204
    .line 205
    ushr-long v7, v5, v1

    .line 206
    .line 207
    xor-long/2addr v5, v7

    .line 208
    long-to-int v5, v5

    .line 209
    add-int/2addr v0, v5

    .line 210
    mul-int/lit8 v0, v0, 0x29

    .line 211
    .line 212
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 213
    .line 214
    if-eqz v5, :cond_a

    .line 215
    .line 216
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 217
    .line 218
    .line 219
    move-result v5

    .line 220
    goto :goto_a

    .line 221
    :cond_a
    move v5, v4

    .line 222
    :goto_a
    add-int/2addr v0, v5

    .line 223
    mul-int/lit8 v0, v0, 0x29

    .line 224
    .line 225
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 226
    .line 227
    if-eqz v5, :cond_b

    .line 228
    .line 229
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    goto :goto_b

    .line 234
    :cond_b
    move v5, v4

    .line 235
    :goto_b
    add-int/2addr v0, v5

    .line 236
    mul-int/lit8 v0, v0, 0x29

    .line 237
    .line 238
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 239
    .line 240
    if-eqz v5, :cond_c

    .line 241
    .line 242
    move v5, v3

    .line 243
    goto :goto_c

    .line 244
    :cond_c
    move v5, v2

    .line 245
    :goto_c
    add-int/2addr v0, v5

    .line 246
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 247
    .line 248
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 249
    .line 250
    .line 251
    move-result-wide v5

    .line 252
    mul-int/lit8 v0, v0, 0x29

    .line 253
    .line 254
    ushr-long v7, v5, v1

    .line 255
    .line 256
    xor-long/2addr v5, v7

    .line 257
    long-to-int v5, v5

    .line 258
    add-int/2addr v0, v5

    .line 259
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 260
    .line 261
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 262
    .line 263
    .line 264
    move-result-wide v5

    .line 265
    mul-int/lit8 v0, v0, 0x29

    .line 266
    .line 267
    ushr-long v7, v5, v1

    .line 268
    .line 269
    xor-long/2addr v5, v7

    .line 270
    long-to-int v5, v5

    .line 271
    add-int/2addr v0, v5

    .line 272
    mul-int/lit8 v0, v0, 0x29

    .line 273
    .line 274
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 275
    .line 276
    if-eqz v5, :cond_d

    .line 277
    .line 278
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 279
    .line 280
    .line 281
    move-result v5

    .line 282
    goto :goto_d

    .line 283
    :cond_d
    move v5, v4

    .line 284
    :goto_d
    add-int/2addr v0, v5

    .line 285
    mul-int/lit8 v0, v0, 0x29

    .line 286
    .line 287
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 288
    .line 289
    if-eqz v5, :cond_e

    .line 290
    .line 291
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 292
    .line 293
    .line 294
    move-result v5

    .line 295
    goto :goto_e

    .line 296
    :cond_e
    move v5, v4

    .line 297
    :goto_e
    add-int/2addr v0, v5

    .line 298
    mul-int/lit8 v0, v0, 0x29

    .line 299
    .line 300
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 301
    .line 302
    if-eqz v5, :cond_f

    .line 303
    .line 304
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 305
    .line 306
    .line 307
    move-result v5

    .line 308
    goto :goto_f

    .line 309
    :cond_f
    move v5, v4

    .line 310
    :goto_f
    add-int/2addr v0, v5

    .line 311
    mul-int/lit8 v0, v0, 0x29

    .line 312
    .line 313
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 314
    .line 315
    if-eqz v5, :cond_10

    .line 316
    .line 317
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 318
    .line 319
    .line 320
    move-result v5

    .line 321
    goto :goto_10

    .line 322
    :cond_10
    move v5, v4

    .line 323
    :goto_10
    add-int/2addr v0, v5

    .line 324
    mul-int/lit8 v0, v0, 0x29

    .line 325
    .line 326
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 327
    .line 328
    if-eqz v5, :cond_11

    .line 329
    .line 330
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/TalkInfo;->hashCode()I

    .line 331
    .line 332
    .line 333
    move-result v5

    .line 334
    goto :goto_11

    .line 335
    :cond_11
    move v5, v4

    .line 336
    :goto_11
    add-int/2addr v0, v5

    .line 337
    mul-int/lit8 v0, v0, 0x29

    .line 338
    .line 339
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 340
    .line 341
    if-eqz v5, :cond_12

    .line 342
    .line 343
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/TalkInfo;->hashCode()I

    .line 344
    .line 345
    .line 346
    move-result v5

    .line 347
    goto :goto_12

    .line 348
    :cond_12
    move v5, v4

    .line 349
    :goto_12
    add-int/2addr v0, v5

    .line 350
    mul-int/lit8 v0, v0, 0x29

    .line 351
    .line 352
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 353
    .line 354
    if-eqz v5, :cond_13

    .line 355
    .line 356
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 357
    .line 358
    .line 359
    move-result v5

    .line 360
    goto :goto_13

    .line 361
    :cond_13
    move v5, v4

    .line 362
    :goto_13
    add-int/2addr v0, v5

    .line 363
    mul-int/lit8 v0, v0, 0x29

    .line 364
    .line 365
    iget v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 366
    .line 367
    add-int/2addr v0, v5

    .line 368
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 369
    .line 370
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 371
    .line 372
    .line 373
    move-result-wide v5

    .line 374
    mul-int/lit8 v0, v0, 0x29

    .line 375
    .line 376
    ushr-long v7, v5, v1

    .line 377
    .line 378
    xor-long/2addr v5, v7

    .line 379
    long-to-int v5, v5

    .line 380
    add-int/2addr v0, v5

    .line 381
    mul-int/lit8 v0, v0, 0x29

    .line 382
    .line 383
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 384
    .line 385
    if-eqz v5, :cond_14

    .line 386
    .line 387
    move v5, v3

    .line 388
    goto :goto_14

    .line 389
    :cond_14
    move v5, v2

    .line 390
    :goto_14
    add-int/2addr v0, v5

    .line 391
    mul-int/lit8 v0, v0, 0x29

    .line 392
    .line 393
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 394
    .line 395
    ushr-long v7, v5, v1

    .line 396
    .line 397
    xor-long/2addr v5, v7

    .line 398
    long-to-int v5, v5

    .line 399
    add-int/2addr v0, v5

    .line 400
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 401
    .line 402
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 403
    .line 404
    .line 405
    move-result-wide v5

    .line 406
    mul-int/lit8 v0, v0, 0x29

    .line 407
    .line 408
    ushr-long v7, v5, v1

    .line 409
    .line 410
    xor-long/2addr v5, v7

    .line 411
    long-to-int v5, v5

    .line 412
    add-int/2addr v0, v5

    .line 413
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 414
    .line 415
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 416
    .line 417
    .line 418
    move-result-wide v5

    .line 419
    mul-int/lit8 v0, v0, 0x29

    .line 420
    .line 421
    ushr-long v7, v5, v1

    .line 422
    .line 423
    xor-long/2addr v5, v7

    .line 424
    long-to-int v5, v5

    .line 425
    add-int/2addr v0, v5

    .line 426
    mul-int/lit8 v0, v0, 0x29

    .line 427
    .line 428
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 429
    .line 430
    if-eqz v5, :cond_15

    .line 431
    .line 432
    move v5, v3

    .line 433
    goto :goto_15

    .line 434
    :cond_15
    move v5, v2

    .line 435
    :goto_15
    add-int/2addr v0, v5

    .line 436
    mul-int/lit8 v0, v0, 0x29

    .line 437
    .line 438
    iget v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 439
    .line 440
    add-int/2addr v0, v5

    .line 441
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 442
    .line 443
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 444
    .line 445
    .line 446
    move-result-wide v5

    .line 447
    mul-int/lit8 v0, v0, 0x29

    .line 448
    .line 449
    ushr-long v7, v5, v1

    .line 450
    .line 451
    xor-long/2addr v5, v7

    .line 452
    long-to-int v5, v5

    .line 453
    add-int/2addr v0, v5

    .line 454
    mul-int/lit8 v0, v0, 0x29

    .line 455
    .line 456
    iget v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 457
    .line 458
    add-int/2addr v0, v5

    .line 459
    mul-int/lit8 v0, v0, 0x29

    .line 460
    .line 461
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 462
    .line 463
    if-eqz v5, :cond_16

    .line 464
    .line 465
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->hashCode()I

    .line 466
    .line 467
    .line 468
    move-result v5

    .line 469
    goto :goto_16

    .line 470
    :cond_16
    move v5, v4

    .line 471
    :goto_16
    add-int/2addr v0, v5

    .line 472
    mul-int/lit8 v0, v0, 0x29

    .line 473
    .line 474
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 475
    .line 476
    if-eqz v5, :cond_17

    .line 477
    .line 478
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 479
    .line 480
    .line 481
    move-result v5

    .line 482
    goto :goto_17

    .line 483
    :cond_17
    move v5, v4

    .line 484
    :goto_17
    add-int/2addr v0, v5

    .line 485
    mul-int/lit8 v0, v0, 0x29

    .line 486
    .line 487
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 488
    .line 489
    if-eqz v5, :cond_18

    .line 490
    .line 491
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/ConversationProperty;->hashCode()I

    .line 492
    .line 493
    .line 494
    move-result v5

    .line 495
    goto :goto_18

    .line 496
    :cond_18
    move v5, v4

    .line 497
    :goto_18
    add-int/2addr v0, v5

    .line 498
    mul-int/lit8 v0, v0, 0x29

    .line 499
    .line 500
    iget v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 501
    .line 502
    add-int/2addr v0, v5

    .line 503
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 504
    .line 505
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 506
    .line 507
    .line 508
    move-result-wide v5

    .line 509
    mul-int/lit8 v0, v0, 0x29

    .line 510
    .line 511
    ushr-long v7, v5, v1

    .line 512
    .line 513
    xor-long/2addr v5, v7

    .line 514
    long-to-int v5, v5

    .line 515
    add-int/2addr v0, v5

    .line 516
    mul-int/lit8 v0, v0, 0x29

    .line 517
    .line 518
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 519
    .line 520
    if-eqz v5, :cond_19

    .line 521
    .line 522
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->hashCode()I

    .line 523
    .line 524
    .line 525
    move-result v5

    .line 526
    goto :goto_19

    .line 527
    :cond_19
    move v5, v4

    .line 528
    :goto_19
    add-int/2addr v0, v5

    .line 529
    mul-int/lit8 v0, v0, 0x29

    .line 530
    .line 531
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 532
    .line 533
    if-eqz v5, :cond_1a

    .line 534
    .line 535
    invoke-interface {v5}, Ljava/util/List;->hashCode()I

    .line 536
    .line 537
    .line 538
    move-result v5

    .line 539
    goto :goto_1a

    .line 540
    :cond_1a
    move v5, v4

    .line 541
    :goto_1a
    add-int/2addr v0, v5

    .line 542
    mul-int/lit8 v0, v0, 0x29

    .line 543
    .line 544
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 545
    .line 546
    if-eqz v5, :cond_1b

    .line 547
    .line 548
    move v5, v3

    .line 549
    goto :goto_1b

    .line 550
    :cond_1b
    move v5, v2

    .line 551
    :goto_1b
    add-int/2addr v0, v5

    .line 552
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 553
    .line 554
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 555
    .line 556
    .line 557
    move-result-wide v5

    .line 558
    mul-int/lit8 v0, v0, 0x29

    .line 559
    .line 560
    ushr-long v7, v5, v1

    .line 561
    .line 562
    xor-long/2addr v5, v7

    .line 563
    long-to-int v5, v5

    .line 564
    add-int/2addr v0, v5

    .line 565
    mul-int/lit8 v0, v0, 0x29

    .line 566
    .line 567
    iget v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 568
    .line 569
    add-int/2addr v0, v5

    .line 570
    mul-int/lit8 v0, v0, 0x29

    .line 571
    .line 572
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 573
    .line 574
    if-eqz v5, :cond_1c

    .line 575
    .line 576
    move v5, v3

    .line 577
    goto :goto_1c

    .line 578
    :cond_1c
    move v5, v2

    .line 579
    :goto_1c
    add-int/2addr v0, v5

    .line 580
    mul-int/lit8 v0, v0, 0x29

    .line 581
    .line 582
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 583
    .line 584
    if-eqz v5, :cond_1d

    .line 585
    .line 586
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->hashCode()I

    .line 587
    .line 588
    .line 589
    move-result v5

    .line 590
    goto :goto_1d

    .line 591
    :cond_1d
    move v5, v4

    .line 592
    :goto_1d
    add-int/2addr v0, v5

    .line 593
    mul-int/lit8 v0, v0, 0x29

    .line 594
    .line 595
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 596
    .line 597
    if-eqz v5, :cond_1e

    .line 598
    .line 599
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 600
    .line 601
    .line 602
    move-result v5

    .line 603
    goto :goto_1e

    .line 604
    :cond_1e
    move v5, v4

    .line 605
    :goto_1e
    add-int/2addr v0, v5

    .line 606
    mul-int/lit8 v0, v0, 0x29

    .line 607
    .line 608
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 609
    .line 610
    if-eqz v5, :cond_1f

    .line 611
    .line 612
    invoke-interface {v5}, Ljava/util/List;->hashCode()I

    .line 613
    .line 614
    .line 615
    move-result v5

    .line 616
    goto :goto_1f

    .line 617
    :cond_1f
    move v5, v4

    .line 618
    :goto_1f
    add-int/2addr v0, v5

    .line 619
    mul-int/lit8 v0, v0, 0x29

    .line 620
    .line 621
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 622
    .line 623
    if-eqz v5, :cond_20

    .line 624
    .line 625
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 626
    .line 627
    .line 628
    move-result v5

    .line 629
    goto :goto_20

    .line 630
    :cond_20
    move v5, v4

    .line 631
    :goto_20
    add-int/2addr v0, v5

    .line 632
    mul-int/lit8 v0, v0, 0x29

    .line 633
    .line 634
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 635
    .line 636
    if-eqz v5, :cond_21

    .line 637
    .line 638
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 639
    .line 640
    .line 641
    move-result v5

    .line 642
    goto :goto_21

    .line 643
    :cond_21
    move v5, v4

    .line 644
    :goto_21
    add-int/2addr v0, v5

    .line 645
    mul-int/lit8 v0, v0, 0x29

    .line 646
    .line 647
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 648
    .line 649
    if-eqz v5, :cond_22

    .line 650
    .line 651
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 652
    .line 653
    .line 654
    move-result v5

    .line 655
    goto :goto_22

    .line 656
    :cond_22
    move v5, v4

    .line 657
    :goto_22
    add-int/2addr v0, v5

    .line 658
    mul-int/lit8 v0, v0, 0x29

    .line 659
    .line 660
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 661
    .line 662
    if-eqz v5, :cond_23

    .line 663
    .line 664
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 665
    .line 666
    .line 667
    move-result v5

    .line 668
    goto :goto_23

    .line 669
    :cond_23
    move v5, v4

    .line 670
    :goto_23
    add-int/2addr v0, v5

    .line 671
    mul-int/lit8 v0, v0, 0x29

    .line 672
    .line 673
    iget v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 674
    .line 675
    add-int/2addr v0, v5

    .line 676
    mul-int/lit8 v0, v0, 0x29

    .line 677
    .line 678
    iget v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 679
    .line 680
    add-int/2addr v0, v5

    .line 681
    mul-int/lit8 v0, v0, 0x29

    .line 682
    .line 683
    iget v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 684
    .line 685
    add-int/2addr v0, v5

    .line 686
    mul-int/lit8 v0, v0, 0x29

    .line 687
    .line 688
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 689
    .line 690
    if-eqz v5, :cond_24

    .line 691
    .line 692
    move v5, v3

    .line 693
    goto :goto_24

    .line 694
    :cond_24
    move v5, v2

    .line 695
    :goto_24
    add-int/2addr v0, v5

    .line 696
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 697
    .line 698
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 699
    .line 700
    .line 701
    move-result-wide v5

    .line 702
    mul-int/lit8 v0, v0, 0x29

    .line 703
    .line 704
    ushr-long v7, v5, v1

    .line 705
    .line 706
    xor-long/2addr v5, v7

    .line 707
    long-to-int v5, v5

    .line 708
    add-int/2addr v0, v5

    .line 709
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 710
    .line 711
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 712
    .line 713
    .line 714
    move-result-wide v5

    .line 715
    mul-int/lit8 v0, v0, 0x29

    .line 716
    .line 717
    ushr-long v7, v5, v1

    .line 718
    .line 719
    xor-long/2addr v5, v7

    .line 720
    long-to-int v5, v5

    .line 721
    add-int/2addr v0, v5

    .line 722
    mul-int/lit8 v0, v0, 0x29

    .line 723
    .line 724
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 725
    .line 726
    if-eqz v5, :cond_25

    .line 727
    .line 728
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 729
    .line 730
    .line 731
    move-result v5

    .line 732
    goto :goto_25

    .line 733
    :cond_25
    move v5, v4

    .line 734
    :goto_25
    add-int/2addr v0, v5

    .line 735
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 736
    .line 737
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 738
    .line 739
    .line 740
    move-result-wide v5

    .line 741
    mul-int/lit8 v0, v0, 0x29

    .line 742
    .line 743
    ushr-long v7, v5, v1

    .line 744
    .line 745
    xor-long/2addr v5, v7

    .line 746
    long-to-int v1, v5

    .line 747
    add-int/2addr v0, v1

    .line 748
    mul-int/lit8 v0, v0, 0x29

    .line 749
    .line 750
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 751
    .line 752
    if-eqz v1, :cond_26

    .line 753
    .line 754
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 755
    .line 756
    .line 757
    move-result v4

    .line 758
    :cond_26
    add-int/2addr v0, v4

    .line 759
    mul-int/lit8 v0, v0, 0x29

    .line 760
    .line 761
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 762
    .line 763
    if-eqz v1, :cond_27

    .line 764
    .line 765
    move v2, v3

    .line 766
    :cond_27
    add-int/2addr v0, v2

    .line 767
    mul-int/lit8 v0, v0, 0x29

    .line 768
    .line 769
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 770
    .line 771
    add-int/2addr v0, v1

    .line 772
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 773
    .line 774
    :cond_28
    return v0
.end method

.method public isAnonymous()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "anonymous"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isConfessionFirstConv()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/GreetingInfo;->fromGreeting:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GreetingInfo;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 28
    .line 29
    const-string v0, "confession"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public isExposureTop()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 2
    .line 3
    const/16 v0, 0x32

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

.method public isFakeHeartbeatConv()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public isFakeOneSideConv()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "fake_one_side"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isFakeQuickChatConv()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatConv()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public isForceDropDownCell()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->newMatchExpShowInList()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->lowPayOneSideConv()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public isHeartBeatLock()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "heartbeatMatch"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 32
    .line 33
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public isHeartbeatConv()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "heartbeatMatch"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isLimitMatch()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "heartbeatMatch"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 32
    .line 33
    iget p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    if-ne p0, v0, :cond_0

    .line 37
    .line 38
    return v0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public isLimitedTrialSee(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "free_see_match"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->limitedTrialSee:Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->limitedTrialSee:Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LimitedTrialSee;->actorId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public isMarriageConv()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "marriage"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isMediaBuzzConv()Z
    .locals 3

    .line 1
    const-string v0, "lovebuzz"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, "voiceBuzz"

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

    .line 50
    .line 51
    const-string v2, "videoBuzz"

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

    .line 64
    .line 65
    const-string v2, "memojiBuzz"

    .line 66
    .line 67
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_2

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 76
    .line 77
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->alwaysShow:Z

    .line 78
    .line 79
    if-nez v0, :cond_2

    .line 80
    .line 81
    const-string v0, "active"

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->mode:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_1
    return v1

    .line 93
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 94
    return p0

    .line 95
    :cond_3
    return v1
.end method

.method public isOtherStatusInvalid()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "invalid"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isOtherStatusUnknown()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "unknown"

    .line 12
    .line 13
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public isPlatinumTop()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 2
    .line 3
    const/16 v0, 0x5a

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

.method public isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->clearAvatar:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "true"

    .line 26
    .line 27
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public isQuickChatConv()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "quickchat"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isReSwipeConv()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 24
    .line 25
    const-string v0, "liked"

    .line 26
    .line 27
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public isSVipAdConversation()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 2
    .line 3
    const-string v0, "svipad"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isSeeUpgradedConv()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "see_upgraded"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isTalkConversation()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 2
    .line 3
    const-string v0, "shuoshuo"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isTop()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 2
    .line 3
    const/16 v0, 0x64

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

.method public labelExposureTime()D
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 22
    .line 23
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->labelExposureTime:D

    .line 24
    .line 25
    return-wide v0

    .line 26
    :cond_0
    const-wide/16 v0, 0x0

    .line 27
    .line 28
    return-wide v0
.end method

.method public limitMatchGreetEmoji()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, ""

    .line 15
    .line 16
    return-object p0
.end method

.method public limitMatchGreetText()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, ""

    .line 15
    .line 16
    return-object p0
.end method

.method public lowPayOneSideConv()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "fake_one_side"

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 32
    .line 33
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/LowPayOneside;->isActor:Z

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public mutedByFriend()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/BlackList;->mutedBy:Z

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public needCheckValidStatus()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    const-string v2, "fake_id_"

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "group"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_2
    :goto_0
    return v1
.end method

.method public newMatchExpShowInList()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ConversationTag;->showInList:Z

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 47
    .line 48
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 49
    .line 50
    if-nez v0, :cond_4

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 61
    .line 62
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 63
    .line 64
    if-nez v0, :cond_5

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 75
    .line 76
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 77
    .line 78
    if-nez v0, :cond_6

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 85
    .line 86
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 87
    .line 88
    if-nez v0, :cond_7

    .line 89
    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 95
    .line 96
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 97
    .line 98
    if-nez v0, :cond_8

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 105
    .line 106
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 107
    .line 108
    if-nez v0, :cond_9

    .line 109
    .line 110
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 111
    .line 112
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 113
    .line 114
    if-nez v0, :cond_a

    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 121
    .line 122
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 123
    .line 124
    if-nez v0, :cond_b

    .line 125
    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->new_()Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 131
    .line 132
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 133
    .line 134
    if-nez v0, :cond_c

    .line 135
    .line 136
    new-instance v0, Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .line 140
    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 142
    .line 143
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 144
    .line 145
    if-nez v0, :cond_d

    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 152
    .line 153
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 154
    .line 155
    if-nez v0, :cond_e

    .line 156
    .line 157
    sget-object v0, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 164
    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 166
    .line 167
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 168
    .line 169
    if-nez v0, :cond_f

    .line 170
    .line 171
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 172
    .line 173
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 174
    .line 175
    if-nez v0, :cond_10

    .line 176
    .line 177
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 178
    .line 179
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 180
    .line 181
    if-nez v0, :cond_11

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 184
    .line 185
    :cond_11
    return-void
.end method

.method public onApiParseComplete()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->api_only_messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 17
    .line 18
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
