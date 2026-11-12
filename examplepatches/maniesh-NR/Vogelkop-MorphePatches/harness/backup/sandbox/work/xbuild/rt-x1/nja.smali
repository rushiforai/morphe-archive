.class public final enum Lnja;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lnja;

.field public static final synthetic c:[Lnja;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 36

    new-instance v1, Lnja;

    const/4 v0, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v1, v3, v0, v2}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lnja;->b:Lnja;

    new-instance v2, Lnja;

    const/4 v0, 0x1

    const-string v3, "SiaImpression"

    const-string v4, "SIAIMPRESSION"

    invoke-direct {v2, v4, v0, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lnja;

    const/4 v0, 0x2

    const-string v4, "SiaClick"

    const-string v5, "SIACLICK"

    invoke-direct {v3, v5, v0, v4}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Lnja;

    const/4 v0, 0x3

    const-string v5, "SourceImpression"

    const-string v6, "SOURCEIMPRESSION"

    invoke-direct {v4, v6, v0, v5}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Lnja;

    const/4 v0, 0x4

    const-string v6, "SourceClick"

    const-string v7, "SOURCECLICK"

    invoke-direct {v5, v7, v0, v6}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v6, Lnja;

    const/4 v0, 0x5

    const-string v7, "AskAriaSummarizeClicked"

    const-string v8, "ASKARIASUMMARIZECLICKED"

    invoke-direct {v6, v8, v0, v7}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v7, Lnja;

    const/4 v0, 0x6

    const-string v8, "AskAriaTellMeMoreClicked"

    const-string v9, "ASKARIATELLMEMORECLICKED"

    invoke-direct {v7, v9, v0, v8}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v8, Lnja;

    const/4 v0, 0x7

    const-string v9, "OnFirstResponseSucceeded"

    const-string v10, "ONFIRSTRESPONSESUCCEEDED"

    invoke-direct {v8, v10, v0, v9}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v9, Lnja;

    const/16 v0, 0x8

    const-string v10, "SignedInSuccess"

    const-string v11, "SIGNEDINSUCCESS"

    invoke-direct {v9, v11, v0, v10}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v10, Lnja;

    const/16 v0, 0x9

    const-string v11, "SignedInUnSuccessful"

    const-string v12, "SIGNEDINUNSUCCESSFUL"

    invoke-direct {v10, v12, v0, v11}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v11, Lnja;

    const/16 v0, 0xa

    const-string v12, "ConsentMessageSeen"

    const-string v13, "CONSENTMESSAGESEEN"

    invoke-direct {v11, v13, v0, v12}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v12, Lnja;

    const/16 v0, 0xb

    const-string v13, "DailyMessageLimitReached"

    const-string v14, "DAILYMESSAGELIMITREACHED"

    invoke-direct {v12, v14, v0, v13}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v13, Lnja;

    const/16 v0, 0xc

    const-string v14, "ImageGenerationLimitReached"

    const-string v15, "IMAGEGENERATIONLIMITREACHED"

    invoke-direct {v13, v15, v0, v14}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v14, Lnja;

    const/16 v0, 0xd

    const-string v15, "FollowUpQuestionsImpression"

    move-object/from16 v16, v1

    const-string v1, "FOLLOWUPQUESTIONSIMPRESSION"

    invoke-direct {v14, v1, v0, v15}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v15, Lnja;

    const/16 v0, 0xe

    const-string v1, "FollowUpQuestionsClick"

    move-object/from16 v17, v2

    const-string v2, "FOLLOWUPQUESTIONSCLICK"

    invoke-direct {v15, v2, v0, v1}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnja;

    const/16 v1, 0xf

    const-string v2, "RichResponseImpression"

    move-object/from16 v18, v3

    const-string v3, "RICHRESPONSEIMPRESSION"

    invoke-direct {v0, v3, v1, v2}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnja;

    const/16 v2, 0x10

    const-string v3, "RichResponseItemImpression"

    move-object/from16 v19, v0

    const-string v0, "RICHRESPONSEITEMIMPRESSION"

    invoke-direct {v1, v0, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnja;

    const/16 v2, 0x11

    const-string v3, "RichResponseImagesImpression"

    move-object/from16 v20, v1

    const-string v1, "RICHRESPONSEIMAGESIMPRESSION"

    invoke-direct {v0, v1, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnja;

    const/16 v2, 0x12

    const-string v3, "RichResponseImageClick"

    move-object/from16 v21, v0

    const-string v0, "RICHRESPONSEIMAGECLICK"

    invoke-direct {v1, v0, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnja;

    const/16 v2, 0x13

    const-string v3, "RichResponseItemChanged"

    move-object/from16 v22, v1

    const-string v1, "RICHRESPONSEITEMCHANGED"

    invoke-direct {v0, v1, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnja;

    const/16 v2, 0x14

    const-string v3, "RichResponseItemChangeByTouch"

    move-object/from16 v23, v0

    const-string v0, "RICHRESPONSEITEMCHANGEBYTOUCH"

    invoke-direct {v1, v0, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnja;

    const/16 v2, 0x15

    const-string v3, "MatchBetImpression"

    move-object/from16 v24, v1

    const-string v1, "MATCHBETIMPRESSION"

    invoke-direct {v0, v1, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnja;

    const/16 v2, 0x16

    const-string v3, "OddsScrollToBottom"

    move-object/from16 v25, v0

    const-string v0, "ODDSSCROLLTOBOTTOM"

    invoke-direct {v1, v0, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnja;

    const/16 v2, 0x17

    const-string v3, "EventBetScrollToBottom"

    move-object/from16 v26, v1

    const-string v1, "EVENTBETSCROLLTOBOTTOM"

    invoke-direct {v0, v1, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnja;

    const/16 v2, 0x18

    const-string v3, "GroupBetScrollToBottom"

    move-object/from16 v27, v0

    const-string v0, "GROUPBETSCROLLTOBOTTOM"

    invoke-direct {v1, v0, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnja;

    const/16 v2, 0x19

    const-string v3, "OddsProviderImpression"

    move-object/from16 v28, v1

    const-string v1, "ODDSPROVIDERIMPRESSION"

    invoke-direct {v0, v1, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnja;

    const/16 v2, 0x1a

    const-string v3, "OddsProviderClick"

    move-object/from16 v29, v0

    const-string v0, "ODDSPROVIDERCLICK"

    invoke-direct {v1, v0, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnja;

    const/16 v2, 0x1b

    const-string v3, "openAllSourcesInTabGroupClick"

    move-object/from16 v30, v1

    const-string v1, "OPENALLSOURCESINTABGROUPCLICK"

    invoke-direct {v0, v1, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnja;

    const/16 v2, 0x1c

    const-string v3, "openChatHistoryClick"

    move-object/from16 v31, v0

    const-string v0, "OPENCHATHISTORYCLICK"

    invoke-direct {v1, v0, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnja;

    const/16 v2, 0x1d

    const-string v3, "openInputFileClick"

    move-object/from16 v32, v1

    const-string v1, "OPENINPUTFILECLICK"

    invoke-direct {v0, v1, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnja;

    const/16 v2, 0x1e

    const-string v3, "OperaLogin"

    move-object/from16 v33, v0

    const-string v0, "OPERALOGIN"

    invoke-direct {v1, v0, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnja;

    const/16 v2, 0x1f

    const-string v3, "SandboxedLogin"

    move-object/from16 v34, v1

    const-string v1, "SANDBOXEDLOGIN"

    invoke-direct {v0, v1, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnja;

    const/16 v2, 0x20

    const-string v3, "GoogleLogin"

    move-object/from16 v35, v0

    const-string v0, "GOOGLELOGIN"

    invoke-direct {v1, v0, v2, v3}, Lnja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    move-object/from16 v17, v20

    move-object/from16 v18, v21

    move-object/from16 v20, v23

    move-object/from16 v21, v24

    move-object/from16 v23, v26

    move-object/from16 v24, v27

    move-object/from16 v26, v29

    move-object/from16 v27, v30

    move-object/from16 v29, v32

    move-object/from16 v30, v33

    move-object/from16 v32, v35

    move-object/from16 v33, v1

    move-object/from16 v1, v16

    move-object/from16 v16, v19

    move-object/from16 v19, v22

    move-object/from16 v22, v25

    move-object/from16 v25, v28

    move-object/from16 v28, v31

    move-object/from16 v31, v34

    filled-new-array/range {v1 .. v33}, [Lnja;

    move-result-object v0

    sput-object v0, Lnja;->c:[Lnja;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lnja;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnja;
    .registers 2

    const-class v0, Lnja;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnja;

    return-object p0
.end method

.method public static values()[Lnja;
    .registers 1

    sget-object v0, Lnja;->c:[Lnja;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnja;

    return-object v0
.end method
