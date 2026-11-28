.class public Le/e/a/NicoliveActivity;
.super Landroid/app/Activity;
.source "NicoliveActivity.java"

# interfaces
.implements Le/e/a/NicoliveService$Observer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/NicoliveActivity$ChatAdapter;,
        Le/e/a/NicoliveActivity$FeedAdapter;
    }
.end annotation


# static fields
.field private static final DATE_TAB:Ljava/time/format/DateTimeFormatter;

.field private static final FLOAT_REFRESH:Ljava/lang/String; = "nicolive_float_refresh"

.field private static final FOLLOWING:I = 0x1

.field private static final HUB_LABELS:[Ljava/lang/String;

.field private static final HUB_TABS:[I

.field private static final LAST_TAB:Ljava/lang/String; = "nicolive_last_tab"

.field private static final PROGRAM_TIME:Ljava/time/format/DateTimeFormatter;

.field private static final RANKING:I = 0x4

.field private static final RESERVATIONS:I = 0x5

.field private static final START_TAB:Ljava/lang/String; = "nicolive_start_tab"

.field private static final START_TIME:Ljava/lang/String; = "nicolive_start_time"

.field private static final TAP_BEHAVIOR:Ljava/lang/String; = "nicolive_tap_behavior"

.field static final TIMETABLE:I = 0x3

.field private static final TIMETABLE_TIME:Ljava/time/format/DateTimeFormatter;


# instance fields
.field anonymous:Landroid/widget/CheckBox;

.field atBottom:Z

.field autoMiniPopup:Z

.field body:Landroid/widget/LinearLayout;

.field private bottomRefresh:Landroid/widget/ImageButton;

.field bound:Z

.field browser:Le/e/a/NicoliveBrowser;

.field category:I

.field categoryTabs:Landroid/widget/LinearLayout;

.field chat:Landroid/widget/ListView;

.field chatAdapter:Le/e/a/NicoliveActivity$ChatAdapter;

.field final comments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/NicoliveData$Chat;",
            ">;"
        }
    .end annotation
.end field

.field composer:Landroid/widget/LinearLayout;

.field final connection:Landroid/content/ServiceConnection;

.field private deniedProgramId:Ljava/lang/String;

.field details:Landroid/widget/LinearLayout;

.field draft:Ljava/lang/String;

.field private exitDialog:Landroid/app/AlertDialog;

.field feed:Landroid/widget/ListView;

.field feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

.field feedOffset:I

.field feedPosition:I

.field private followFilter:I

.field fullscreen:Z

.field header:Landroid/widget/LinearLayout;

.field heading:Landroid/widget/TextView;

.field hubTab:I

.field info:Z

.field information:Landroid/widget/TextView;

.field input:Landroid/widget/EditText;

.field latest:Landroid/widget/Button;

.field final listGestures:Le/e/a/NicoliveListGestures;

.field private liveSort:Le/e/a/NicoliveCatalog$Sort;

.field loadToken:I

.field loading:Z

.field login:Landroid/widget/Button;

.field miniFrame:Le/e/a/NicolivePlayerFrame;

.field miniPlay:Landroid/widget/ImageButton;

.field miniTitle:Landroid/widget/TextView;

.field miniTouchSequence:Z

.field miniWindow:Le/e/a/NicoliveFloatingMini206;

.field newComments:I

.field nowPlayingBar:Landroid/widget/LinearLayout;

.field observedCount:J

.field owner:Landroid/widget/TextView;

.field pendingDraft:Ljava/lang/String;

.field private pendingPopupId:Ljava/lang/String;

.field private final pendingRecent:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/NicoliveData$Program;",
            ">;"
        }
    .end annotation
.end field

.field playerFrame:Le/e/a/NicolivePlayerFrame;

.field private postNotice:Landroid/widget/Toast;

.field final programs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/NicoliveData$Program;",
            ">;"
        }
    .end annotation
.end field

.field query:Ljava/lang/String;

.field private rankingState:Le/e/a/NicoliveCatalog$Broadcast;

.field private rankingUsers:Z

.field private recentReady:Z

.field renderedComments:J

.field renderedProgram:Le/e/a/NicoliveData$Program;

.field renderedViews:J

.field requested:Ljava/lang/String;

.field private final reserving:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field resumeLoad:Z

.field root:Landroid/widget/LinearLayout;

.field searchInput:Landroid/widget/EditText;

.field send:Landroid/widget/ImageButton;

.field service:Le/e/a/NicoliveService;

.field private sortButton:Landroid/widget/Button;

.field stats:Landroid/widget/TextView;

.field status:Landroid/widget/TextView;

.field tabs:Landroid/widget/LinearLayout;

.field private timetableDay:Ljava/time/LocalDate;

.field private timetableOnAir:Z

.field private timetableSort:Le/e/a/NicoliveCatalog$Sort;

.field title:Landroid/widget/TextView;

.field viewerPane:Landroid/widget/LinearLayout;

.field watching:Z


# direct methods
.method public static synthetic $r8$lambda$Z2cei3mP5X46Nog20ekraJuHLw0(Le/e/a/NicoliveActivity;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->showSort(Landroid/view/View;)V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 8

    .line 14
    const-string v0, "M/d HH:mm"

    sget-object v1, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;Ljava/util/Locale;)Ljava/time/format/DateTimeFormatter;

    move-result-object v0

    sput-object v0, Le/e/a/NicoliveActivity;->PROGRAM_TIME:Ljava/time/format/DateTimeFormatter;

    .line 15
    const-string v0, "HH:mm"

    invoke-static {v0}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    move-result-object v0

    sput-object v0, Le/e/a/NicoliveActivity;->TIMETABLE_TIME:Ljava/time/format/DateTimeFormatter;

    const/4 v0, 0x6

    .line 16
    new-array v0, v0, [I

    const/4 v1, 0x1

    const/4 v2, 0x4

    aput v2, v0, v1

    const/4 v3, 0x2

    const/4 v4, 0x3

    aput v4, v0, v3

    aput v1, v0, v4

    aput v3, v0, v2

    const/4 v1, 0x5

    aput v1, v0, v1

    sput-object v0, Le/e/a/NicoliveActivity;->HUB_TABS:[I

    .line 17
    const-string v6, "\u5c65\u6b74"

    const-string v7, "\u4e88\u7d04\u30ea\u30b9\u30c8"

    const-string/jumbo v2, "\u653e\u9001\u4e2d"

    const-string v3, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    const-string/jumbo v4, "\u756a\u7d44\u8868"

    const-string v5, "\u30d5\u30a9\u30ed\u30fc"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/NicoliveActivity;->HUB_LABELS:[Ljava/lang/String;

    .line 23
    const-string v0, "M/d(E)"

    sget-object v1, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;Ljava/util/Locale;)Ljava/time/format/DateTimeFormatter;

    move-result-object v0

    sput-object v0, Le/e/a/NicoliveActivity;->DATE_TAB:Ljava/time/format/DateTimeFormatter;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .line 6
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->atBottom:Z

    const-string v1, ""

    iput-object v1, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    iput-object v1, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    iput-object v1, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    iput-object v1, p0, Le/e/a/NicoliveActivity;->pendingDraft:Ljava/lang/String;

    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Le/e/a/NicoliveActivity;->renderedViews:J

    iput-wide v2, p0, Le/e/a/NicoliveActivity;->renderedComments:J

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    .line 8
    new-instance v2, Le/e/a/NicoliveListGestures;

    invoke-direct {v2}, Le/e/a/NicoliveListGestures;-><init>()V

    iput-object v2, p0, Le/e/a/NicoliveActivity;->listGestures:Le/e/a/NicoliveListGestures;

    .line 21
    iput-object v1, p0, Le/e/a/NicoliveActivity;->pendingPopupId:Ljava/lang/String;

    iput-object v1, p0, Le/e/a/NicoliveActivity;->deniedProgramId:Ljava/lang/String;

    .line 26
    sget-object v1, Le/e/a/NicoliveCatalog;->JAPAN:Ljava/time/ZoneId;

    invoke-static {v1}, Ljava/time/LocalDate;->now(Ljava/time/ZoneId;)Ljava/time/LocalDate;

    move-result-object v1

    iput-object v1, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    .line 30
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Le/e/a/NicoliveActivity;->reserving:Ljava/util/Set;

    .line 31
    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->rankingUsers:Z

    .line 32
    sget-object v0, Le/e/a/NicoliveCatalog$Broadcast;->LIVE:Le/e/a/NicoliveCatalog$Broadcast;

    iput-object v0, p0, Le/e/a/NicoliveActivity;->rankingState:Le/e/a/NicoliveCatalog$Broadcast;

    .line 35
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveActivity;->pendingRecent:Ljava/util/LinkedHashMap;

    .line 57
    new-instance v0, Le/e/a/NicoliveActivity$1;

    invoke-direct {v0, p0}, Le/e/a/NicoliveActivity$1;-><init>(Le/e/a/NicoliveActivity;)V

    iput-object v0, p0, Le/e/a/NicoliveActivity;->connection:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic access$0(Le/e/a/NicoliveActivity;)Ljava/lang/String;
    .registers 1

    .line 21
    iget-object p0, p0, Le/e/a/NicoliveActivity;->pendingPopupId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1(Le/e/a/NicoliveActivity;)Le/e/a/NicoliveCatalog$Sort;
    .registers 1

    .line 439
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->activeSort()Le/e/a/NicoliveCatalog$Sort;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$10(Le/e/a/NicoliveActivity;)I
    .registers 1

    .line 29
    iget p0, p0, Le/e/a/NicoliveActivity;->followFilter:I

    return p0
.end method

.method static synthetic access$11(Le/e/a/NicoliveActivity;ILjava/lang/String;ILjava/util/LinkedHashMap;Z)V
    .registers 6

    .line 749
    invoke-direct/range {p0 .. p5}, Le/e/a/NicoliveActivity;->loadFollowPage(ILjava/lang/String;ILjava/util/LinkedHashMap;Z)V

    return-void
.end method

.method static synthetic access$12(Le/e/a/NicoliveActivity;ILjava/lang/String;Ljava/util/LinkedHashMap;Z)V
    .registers 5

    .line 776
    invoke-direct {p0, p1, p2, p3, p4}, Le/e/a/NicoliveActivity;->loadFollowHome(ILjava/lang/String;Ljava/util/LinkedHashMap;Z)V

    return-void
.end method

.method static synthetic access$13(Le/e/a/NicoliveActivity;Ljava/util/Map;Z)V
    .registers 3

    .line 793
    invoke-direct {p0, p1, p2}, Le/e/a/NicoliveActivity;->showFollowing(Ljava/util/Map;Z)V

    return-void
.end method

.method static synthetic access$14(Le/e/a/NicoliveActivity;ILjava/time/LocalDate;Ljava/lang/String;ZZZLjava/util/LinkedHashMap;)V
    .registers 8

    .line 918
    invoke-direct/range {p0 .. p7}, Le/e/a/NicoliveActivity;->loadTimetableDate(ILjava/time/LocalDate;Ljava/lang/String;ZZZLjava/util/LinkedHashMap;)V

    return-void
.end method

.method static synthetic access$15(Le/e/a/NicoliveActivity;Ljava/util/Map;Z)V
    .registers 3

    .line 939
    invoke-direct {p0, p1, p2}, Le/e/a/NicoliveActivity;->showTimetableResults(Ljava/util/Map;Z)V

    return-void
.end method

.method static synthetic access$2(Le/e/a/NicoliveActivity;I)Z
    .registers 2

    .line 555
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->currentLoad(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3(Le/e/a/NicoliveActivity;Ljava/lang/String;)V
    .registers 2

    .line 626
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->showResults(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4(Le/e/a/NicoliveActivity;Ljava/util/List;)V
    .registers 2

    .line 603
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->addLivePrograms(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$5(Le/e/a/NicoliveActivity;ILjava/lang/String;Z)V
    .registers 4

    .line 582
    invoke-direct {p0, p1, p2, p3}, Le/e/a/NicoliveActivity;->loadOfficialNow(ILjava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$6(Le/e/a/NicoliveActivity;IILjava/lang/String;Z)V
    .registers 5

    .line 559
    invoke-direct {p0, p1, p2, p3, p4}, Le/e/a/NicoliveActivity;->loadRecentPage(IILjava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$7(Le/e/a/NicoliveActivity;Ljava/lang/String;Z)V
    .registers 3

    .line 613
    invoke-direct {p0, p1, p2}, Le/e/a/NicoliveActivity;->finishRecent(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$8(Le/e/a/NicoliveActivity;)Ljava/util/Set;
    .registers 1

    .line 30
    iget-object p0, p0, Le/e/a/NicoliveActivity;->reserving:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$9(Le/e/a/NicoliveActivity;)V
    .registers 1

    .line 697
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->refreshReservationsAfterWrite()V

    return-void
.end method

.method private activeBroadcast()Le/e/a/NicoliveService;
    .registers 2

    .line 479
    sget-object p0, Le/e/a/NicoliveService;->active:Le/e/a/NicoliveService;

    if-eqz p0, :cond_0

    .line 480
    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/NicoliveService;->terminal:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private activeSort()Le/e/a/NicoliveCatalog$Sort;
    .registers 3

    .line 440
    iget v0, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object p0, p0, Le/e/a/NicoliveActivity;->timetableSort:Le/e/a/NicoliveCatalog$Sort;

    return-object p0

    :cond_0
    iget-object p0, p0, Le/e/a/NicoliveActivity;->liveSort:Le/e/a/NicoliveCatalog$Sort;

    return-object p0
.end method

.method private addDateTab(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/time/LocalDate;Z)V
    .registers 8

    .line 881
    invoke-static {p0, p2}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p2

    const/4 v0, 0x1

    .line 882
    invoke-virtual {p2, v0}, Landroid/widget/Button;->setSingleLine(Z)V

    const/high16 v1, 0x42700000    # 60.0f

    .line 883
    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 884
    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    if-ne v1, p4, :cond_0

    if-nez p4, :cond_1

    iget-object v1, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {v1, p3}, Ljava/time/LocalDate;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v0, 0x0

    :cond_1
    invoke-static {p2, v0}, Le/e/a/NicoliveUi;->selected(Landroid/widget/Button;Z)V

    .line 885
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x42280000    # 42.0f

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    const/4 v2, -0x2

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 886
    new-instance p1, Le/e/a/NicoliveActivity$32;

    invoke-direct {p1, p0, p3, p4}, Le/e/a/NicoliveActivity$32;-><init>(Le/e/a/NicoliveActivity;Ljava/time/LocalDate;Z)V

    invoke-virtual {p2, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {p2 .. p2}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    invoke-static {p2}, Le/e/a/PressFeedback;->force(Landroid/view/View;)V

    return-void
.end method

.method private addLivePrograms(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Le/e/a/NicoliveData$Program;",
            ">;)V"
        }
    .end annotation

    .line 604
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/NicoliveData$Program;

    invoke-virtual {v0}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->pendingRecent:Ljava/util/LinkedHashMap;

    iget-object v2, v0, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/LinkedHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private addRankingControls(Landroid/widget/LinearLayout;)V
    .registers 5

    .line 804
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->rankingUsers:Z

    if-eqz v0, :cond_0

    const-string v0, "\u30e6\u30fc\u30b6\u30fc \u25be"

    goto :goto_0

    :cond_0
    const-string v0, "\u516c\u5f0f\u30fbCH \u25be"

    :goto_0
    invoke-static {p0, v0}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 805
    new-instance v1, Le/e/a/NicoliveActivity$36;

    invoke-direct {v1, p0, v0}, Le/e/a/NicoliveActivity$36;-><init>(Le/e/a/NicoliveActivity;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 816
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 817
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->rankingState:Le/e/a/NicoliveCatalog$Broadcast;

    iget-object v1, v1, Le/e/a/NicoliveCatalog$Broadcast;->label:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " \u25be"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 818
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u30e9\u30f3\u30ad\u30f3\u30b0\u306e\u5bfe\u8c61"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Le/e/a/NicoliveActivity;->rankingState:Le/e/a/NicoliveCatalog$Broadcast;

    iget-object v2, v2, Le/e/a/NicoliveCatalog$Broadcast;->label:Ljava/lang/String;

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 819
    new-instance v1, Le/e/a/NicoliveActivity$37;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$37;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 830
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private bindSettingChoice(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;[II)V
    .registers 14

    .line 372
    aget v0, p4, p5

    aget-object v0, p3, v0

    invoke-direct {p0, p1, p2, v0}, Le/e/a/NicoliveActivity;->showChoiceValue(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    new-instance v1, Le/e/a/NicoliveActivity$68;

    move-object v2, p0

    move-object v7, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v7}, Le/e/a/NicoliveActivity$68;-><init>(Le/e/a/NicoliveActivity;Ljava/lang/String;[Ljava/lang/String;[IILandroid/widget/Button;)V

    invoke-virtual {v7, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v7 .. v7}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    return-void
.end method

.method private confirmHistoryRemoval(Le/e/a/NicoliveData$Program;)V
    .registers 5

    .line 654
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "\u8996\u8074\u5c65\u6b74\u3092\u524a\u9664"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 655
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p1, Le/e/a/NicoliveData$Program;->title:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\n\u3053\u306e\u7aef\u672b\u306e\u8996\u8074\u5c65\u6b74\u304b\u3089\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 656
    new-instance v1, Le/e/a/NicoliveActivity$35;

    invoke-direct {v1, p0, p1}, Le/e/a/NicoliveActivity$35;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    const-string p0, "\u524a\u9664"

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 670
    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 654
    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private confirmReservation(Le/e/a/NicoliveData$Program;)V
    .registers 5

    .line 721
    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 722
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "\u30bf\u30a4\u30e0\u30b7\u30d5\u30c8\u4e88\u7d04\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 723
    :cond_0
    iget-object v1, p0, Le/e/a/NicoliveActivity;->reserving:Ljava/util/Set;

    iget-object v2, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 724
    :cond_1
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u30bf\u30a4\u30e0\u30b7\u30d5\u30c8\u4e88\u7d04"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p1, Le/e/a/NicoliveData$Program;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 725
    new-instance v2, Le/e/a/NicoliveActivity$42;

    invoke-direct {v2, p0, p1, v0}, Le/e/a/NicoliveActivity$42;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;Ljava/lang/String;)V

    const-string p0, "\u4e88\u7d04\u3059\u308b"

    invoke-virtual {v1, p0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 739
    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 740
    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private confirmReservationRemoval(Le/e/a/NicoliveData$Program;)V
    .registers 6

    .line 674
    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 675
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "\u4e88\u7d04\u306e\u53d6\u6d88\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 676
    :cond_0
    iget-object v1, p0, Le/e/a/NicoliveActivity;->reserving:Ljava/util/Set;

    iget-object v2, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 677
    :cond_1
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u30bf\u30a4\u30e0\u30b7\u30d5\u30c8\u4e88\u7d04\u3092\u524a\u9664"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 678
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p1, Le/e/a/NicoliveData$Program;->title:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n\u4e88\u7d04\u3092\u53d6\u308a\u6d88\u3057\u307e\u3059\u304b\uff1f"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 679
    new-instance v2, Le/e/a/NicoliveActivity$53;

    invoke-direct {v2, p0, p1, v0}, Le/e/a/NicoliveActivity$53;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;Ljava/lang/String;)V

    const-string p0, "\u4e88\u7d04\u3092\u524a\u9664"

    invoke-virtual {v1, p0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 694
    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 677
    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private currentDateLocale()Ljava/util/Locale;
    .registers 3

    .line 874
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "app_lang"

    const-string v1, "0"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 875
    const-string v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    return-object p0

    .line 876
    :cond_0
    const-string v0, "2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p0, Ljava/util/Locale;->TRADITIONAL_CHINESE:Ljava/util/Locale;

    return-object p0

    .line 877
    :cond_1
    const-string v0, "-1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    return-object p0

    .line 878
    :cond_2
    sget-object p0, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    return-object p0
.end method

.method private currentLoad(I)Z
    .registers 3

    .line 556
    iget v0, p0, Le/e/a/NicoliveActivity;->loadToken:I

    if-ne p1, v0, :cond_0

    iget-boolean p1, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private exitHub()V
    .registers 4

    .line 397
    const-string v0, "nicolive_exit_mode"

    invoke-static {p0, v0}, Le/e/a/ExitModeOptions;->mode(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 398
    invoke-static {p0}, Le/e/a/ExitModeOptions;->clear(Landroid/app/Activity;)V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->finish()V

    return-void

    :cond_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 400
    const-string v0, "\u3082\u3046\u4e00\u5ea6\u623b\u308b\u3068\u30cb\u30b3\u751f\u3092\u9589\u3058\u307e\u3059"

    invoke-static {p0, v0}, Le/e/a/ExitModeOptions;->doubleBack(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->finish()V

    return-void

    .line 403
    :cond_1
    invoke-static {p0}, Le/e/a/ExitModeOptions;->clear(Landroid/app/Activity;)V

    .line 404
    iget-object v0, p0, Le/e/a/NicoliveActivity;->exitDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    return-void

    .line 405
    :cond_3
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30cb\u30b3\u751f\u3092\u9589\u3058\u307e\u3059\u304b\uff1f"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 406
    const-string/jumbo v1, "\u901a\u5e38\u306e\u30cb\u30b3\u52d5\u753b\u9762\u306b\u623b\u308a\u307e\u3059"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 407
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 408
    new-instance v1, Le/e/a/NicoliveActivity$27;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$27;-><init>(Le/e/a/NicoliveActivity;)V

    const-string/jumbo v2, "\u623b\u308b"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 405
    iput-object v0, p0, Le/e/a/NicoliveActivity;->exitDialog:Landroid/app/AlertDialog;

    .line 409
    invoke-static {v0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private finishRecent(Ljava/lang/String;Z)V
    .registers 4

    const/4 v0, 0x0

    .line 614
    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->loading:Z

    if-nez p2, :cond_0

    .line 615
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->recentReady:Z

    if-nez v0, :cond_1

    :cond_0
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->publishRecent()V

    :cond_1
    if-eqz p2, :cond_2

    const/4 p2, 0x1

    .line 616
    iput-boolean p2, p0, Le/e/a/NicoliveActivity;->recentReady:Z

    .line 617
    :cond_2
    iget-object p2, p0, Le/e/a/NicoliveActivity;->pendingRecent:Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->clear()V

    .line 618
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->updateRecentStatus(Ljava/lang/String;)V

    return-void
.end method

.method private followControls()Landroid/widget/LinearLayout;
    .registers 9

    .line 634
    invoke-static {p0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 635
    const-string/jumbo v1, "\u653e\u9001\u4e88\u5b9a"

    const-string/jumbo v2, "\u653e\u9001\u7d42\u4e86"

    const-string/jumbo v3, "\u6982\u8981"

    const-string/jumbo v4, "\u653e\u9001\u4e2d"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const/4 v4, 0x4

    if-lt v3, v4, :cond_0

    return-object v0

    .line 638
    :cond_0
    aget-object v4, v1, v3

    invoke-static {p0, v4}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    .line 639
    iget v5, p0, Le/e/a/NicoliveActivity;->followFilter:I

    if-ne v3, v5, :cond_1

    const/4 v5, 0x1

    goto :goto_1

    :cond_1
    move v5, v2

    :goto_1
    invoke-static {v4, v5}, Le/e/a/NicoliveUi;->selected(Landroid/widget/Button;Z)V

    .line 640
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42200000    # 40.0f

    invoke-static {p0, v6}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v5, v2, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 641
    new-instance v5, Le/e/a/NicoliveActivity$0;

    invoke-direct {v5, p0, v3}, Le/e/a/NicoliveActivity$0;-><init>(Le/e/a/NicoliveActivity;I)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v4 .. v4}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private hubNavigation()Landroid/widget/LinearLayout;
    .registers 10

    .line 413
    invoke-static {p0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 414
    const-string v1, "nicoid-live-navigation"

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/16 v1, 0xa

    .line 415
    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->panel(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 416
    const-string v6, "history"

    const-string v7, "schedule"

    const-string v2, "live"

    const-string v3, "ranking"

    const-string v4, "calendar"

    const-string v5, "people"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    .line 417
    :goto_0
    sget-object v4, Le/e/a/NicoliveActivity;->HUB_TABS:[I

    array-length v5, v4

    const/4 v6, -0x1

    if-lt v3, v5, :cond_0

    .line 433
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42480000    # 50.0f

    invoke-static {p0, v3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-direct {v1, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v3, 0x41000000    # 8.0f

    .line 434
    invoke-static {p0, v3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {p0, v3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    const/high16 v5, 0x40800000    # 4.0f

    invoke-static {p0, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {v1, v4, v2, v3, p0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 435
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0

    .line 418
    :cond_0
    aget v4, v4, v3

    .line 419
    sget-object v5, Le/e/a/NicoliveActivity;->HUB_LABELS:[Ljava/lang/String;

    aget-object v5, v5, v3

    aget-object v7, v1, v3

    iget v8, p0, Le/e/a/NicoliveActivity;->hubTab:I

    if-ne v8, v4, :cond_1

    const/4 v8, 0x1

    goto :goto_1

    :cond_1
    move v8, v2

    :goto_1
    invoke-static {p0, v5, v7, v8}, Le/e/a/NicoliveUi;->navigationButton(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/view/View;

    move-result-object v5

    const/4 v7, 0x5

    if-ne v4, v7, :cond_2

    .line 420
    const-string v7, "\u30bf\u30a4\u30e0\u30b7\u30d5\u30c8\u4e88\u7d04\u30ea\u30b9\u30c8"

    invoke-virtual {v5, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 421
    :cond_2
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v7, v2, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 422
    new-instance v6, Le/e/a/NicoliveActivity$30;

    invoke-direct {v6, p0, v4}, Le/e/a/NicoliveActivity$30;-><init>(Le/e/a/NicoliveActivity;I)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v5 .. v5}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method static synthetic lambda$23(Le/e/a/NicoliveData$Program;Le/e/a/NicoliveData$Program;)Z
    .registers 2

    .line 668
    iget-object p0, p0, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$26(Le/e/a/NicoliveData$Program;)I
    .registers 2

    .line 796
    invoke-virtual {p0}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0}, Le/e/a/NicoliveData$Program;->ended()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x2

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$27(Le/e/a/NicoliveData$Program;)J
    .registers 3

    .line 797
    invoke-virtual {p0}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveData$Program;->ended()Z

    move-result v0

    if-nez v0, :cond_0

    iget-wide v0, p0, Le/e/a/NicoliveData$Program;->begin:J

    return-wide v0

    :cond_0
    iget-wide v0, p0, Le/e/a/NicoliveData$Program;->begin:J

    neg-long v0, v0

    return-wide v0
.end method

.method static synthetic lambda$32(Landroid/widget/LinearLayout;Landroid/widget/HorizontalScrollView;)V
    .registers 6

    const/4 v0, 0x0

    move v1, v0

    .line 865
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_0

    return-void

    .line 866
    :cond_0
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 867
    invoke-virtual {v2}, Landroid/view/View;->isSelected()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result p0

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/HorizontalScrollView;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    add-int/2addr p0, v1

    invoke-virtual {p1, p0, v0}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    return-void

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method static synthetic lambda$40(Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 974
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$55([ZLandroid/content/DialogInterface;IZ)V
    .registers 4

    .line 1061
    aput-boolean p3, p0, p2

    return-void
.end method

.method private loadFollowHome(ILjava/lang/String;Ljava/util/LinkedHashMap;Z)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/NicoliveData$Program;",
            ">;Z)V"
        }
    .end annotation

    .line 777
    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    new-instance v1, Le/e/a/NicoliveActivity$9;

    invoke-direct {v1, p0, p1, p3, p4}, Le/e/a/NicoliveActivity$9;-><init>(Le/e/a/NicoliveActivity;ILjava/util/LinkedHashMap;Z)V

    const-string p0, "https://live.nicovideo.jp/"

    invoke-virtual {v0, p0, p2, v1}, Le/e/a/NicoliveBrowser;->load(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method private loadFollowPage(ILjava/lang/String;ILjava/util/LinkedHashMap;Z)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/NicoliveData$Program;",
            ">;Z)V"
        }
    .end annotation

    .line 750
    invoke-static {}, Le/e/a/NicoliveCatalog$Broadcast;->values()[Le/e/a/NicoliveCatalog$Broadcast;

    move-result-object v0

    aget-object v4, v0, p3

    .line 751
    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-static {v4}, Le/e/a/NicoliveCatalog;->followUrl(Le/e/a/NicoliveCatalog$Broadcast;)Ljava/lang/String;

    move-result-object v9

    new-instance v1, Le/e/a/NicoliveActivity$8;

    move-object v2, p0

    move v3, p1

    move-object v8, p2

    move v7, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v8}, Le/e/a/NicoliveActivity$8;-><init>(Le/e/a/NicoliveActivity;ILe/e/a/NicoliveCatalog$Broadcast;Ljava/util/LinkedHashMap;ZILjava/lang/String;)V

    invoke-virtual {v0, v9, v8, v1}, Le/e/a/NicoliveBrowser;->load(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method private loadFollowing(I)V
    .registers 8

    .line 744
    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 745
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u756a\u7d44\u3092\u898b\u308b\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->showResults(Ljava/lang/String;)V

    return-void

    .line 746
    :cond_0
    iget v0, p0, Le/e/a/NicoliveActivity;->followFilter:I

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    add-int/lit8 v0, v0, -0x1

    :goto_0
    move v3, v0

    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    invoke-direct/range {v0 .. v5}, Le/e/a/NicoliveActivity;->loadFollowPage(ILjava/lang/String;ILjava/util/LinkedHashMap;Z)V

    return-void
.end method

.method private loadOfficialNow(ILjava/lang/String;Z)V
    .registers 12

    .line 583
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->recentReady:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Le/e/a/NicoliveActivity;->publishRecent()V

    .line 584
    :cond_0
    sget-object v0, Le/e/a/NicoliveCatalog;->JAPAN:Ljava/time/ZoneId;

    invoke-static {v0}, Ljava/time/LocalDate;->now(Ljava/time/ZoneId;)Ljava/time/LocalDate;

    move-result-object v4

    .line 585
    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-static {v4}, Le/e/a/NicoliveCatalog;->timetableUrl(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v7

    new-instance v1, Le/e/a/NicoliveActivity$4;

    move-object v2, p0

    move v3, p1

    move-object v6, p2

    move v5, p3

    invoke-direct/range {v1 .. v6}, Le/e/a/NicoliveActivity$4;-><init>(Le/e/a/NicoliveActivity;ILjava/time/LocalDate;ZLjava/lang/String;)V

    invoke-virtual {v0, v7, v6, v1}, Le/e/a/NicoliveBrowser;->load(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method private loadRanking(I)V
    .registers 8

    .line 834
    iget-object v0, p0, Le/e/a/NicoliveActivity;->rankingState:Le/e/a/NicoliveCatalog$Broadcast;

    .line 835
    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->rankingUsers:Z

    .line 836
    iget-object v2, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-static {v0}, Le/e/a/NicoliveCatalog;->rankingUrl(Le/e/a/NicoliveCatalog$Broadcast;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Le/e/a/NicoliveActivity$10;

    invoke-direct {v5, p0, p1, v0, v1}, Le/e/a/NicoliveActivity$10;-><init>(Le/e/a/NicoliveActivity;ILe/e/a/NicoliveCatalog$Broadcast;Z)V

    invoke-virtual {v2, v3, v4, v5}, Le/e/a/NicoliveBrowser;->load(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method private loadRecentPage(IILjava/lang/String;Z)V
    .registers 13

    .line 560
    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->liveSort:Le/e/a/NicoliveCatalog$Sort;

    invoke-static {p2, v1}, Le/e/a/NicoliveCatalog;->recentUrl(ILe/e/a/NicoliveCatalog$Sort;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/NicoliveActivity$3;

    move-object v3, p0

    move v4, p1

    move v5, p2

    move-object v6, p3

    move v7, p4

    invoke-direct/range {v2 .. v7}, Le/e/a/NicoliveActivity$3;-><init>(Le/e/a/NicoliveActivity;IILjava/lang/String;Z)V

    invoke-virtual {v0, v1, v6, v2}, Le/e/a/NicoliveBrowser;->load(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method private loadReservations(I)V
    .registers 6

    .line 703
    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 704
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "\u30bf\u30a4\u30e0\u30b7\u30d5\u30c8\u4e88\u7d04\u3092\u898b\u308b\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->showResults(Ljava/lang/String;)V

    return-void

    .line 705
    :cond_0
    iget-object v1, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-static {}, Le/e/a/NicoliveCatalog;->reservationsUrl()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/NicoliveActivity$6;

    invoke-direct {v3, p0, p1}, Le/e/a/NicoliveActivity$6;-><init>(Le/e/a/NicoliveActivity;I)V

    invoke-virtual {v1, v2, v0, v3}, Le/e/a/NicoliveBrowser;->load(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method private loadTimetable(I)V
    .registers 11

    .line 910
    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 911
    iget-object v0, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {v0}, Le/e/a/NicoliveActivity$FeedAdapter;->notifyDataSetChanged()V

    .line 912
    sget-object v0, Le/e/a/NicoliveCatalog;->JAPAN:Ljava/time/ZoneId;

    invoke-static {v0}, Ljava/time/LocalDate;->now(Ljava/time/ZoneId;)Ljava/time/LocalDate;

    move-result-object v0

    .line 913
    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    if-nez v1, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    :cond_0
    move-object v3, v0

    .line 914
    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    iget-boolean v5, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    .line 915
    new-instance v8, Ljava/util/LinkedHashMap;

    invoke-direct {v8}, Ljava/util/LinkedHashMap;-><init>()V

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move v2, p1

    .line 914
    invoke-direct/range {v1 .. v8}, Le/e/a/NicoliveActivity;->loadTimetableDate(ILjava/time/LocalDate;Ljava/lang/String;ZZZLjava/util/LinkedHashMap;)V

    return-void
.end method

.method private loadTimetableDate(ILjava/time/LocalDate;Ljava/lang/String;ZZZLjava/util/LinkedHashMap;)V
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/time/LocalDate;",
            "Ljava/lang/String;",
            "ZZZ",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/NicoliveData$Program;",
            ">;)V"
        }
    .end annotation

    .line 920
    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-static {p2}, Le/e/a/NicoliveCatalog;->timetableUrl(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/NicoliveActivity$11;

    move-object v3, p0

    move v4, p1

    move-object v5, p2

    move-object v9, p3

    move v6, p4

    move/from16 v8, p5

    move/from16 v10, p6

    move-object/from16 v7, p7

    invoke-direct/range {v2 .. v10}, Le/e/a/NicoliveActivity$11;-><init>(Le/e/a/NicoliveActivity;ILjava/time/LocalDate;ZLjava/util/LinkedHashMap;ZLjava/lang/String;Z)V

    invoke-virtual {v0, v1, p3, v2}, Le/e/a/NicoliveBrowser;->load(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method private moveTimetable(I)V
    .registers 9

    .line 890
    sget-object v0, Le/e/a/NicoliveCatalog;->JAPAN:Ljava/time/ZoneId;

    invoke-static {v0}, Ljava/time/LocalDate;->now(Ljava/time/ZoneId;)Ljava/time/LocalDate;

    move-result-object v0

    .line 891
    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    const/4 v2, 0x0

    const-wide/16 v3, 0x1

    if-eqz v1, :cond_1

    if-gez p1, :cond_0

    .line 892
    invoke-virtual {v0, v3, v4}, Ljava/time/LocalDate;->minusDays(J)Ljava/time/LocalDate;

    move-result-object v0

    :cond_0
    invoke-direct {p0, v0, v2}, Le/e/a/NicoliveActivity;->selectTimetableDay(Ljava/time/LocalDate;Z)V

    return-void

    :cond_1
    if-gez p1, :cond_2

    .line 893
    iget-object v1, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {v1, v0}, Ljava/time/LocalDate;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    if-lez p1, :cond_4

    iget-object v1, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {v0, v3, v4}, Ljava/time/LocalDate;->minusDays(J)Ljava/time/LocalDate;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/time/LocalDate;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    const/4 p1, 0x1

    .line 894
    invoke-direct {p0, v0, p1}, Le/e/a/NicoliveActivity;->selectTimetableDay(Ljava/time/LocalDate;Z)V

    return-void

    .line 895
    :cond_4
    iget-object v1, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    int-to-long v3, p1

    invoke-virtual {v1, v3, v4}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object p1

    const-wide/16 v5, 0x7

    invoke-virtual {v0, v5, v6}, Ljava/time/LocalDate;->minusDays(J)Ljava/time/LocalDate;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/time/LocalDate;->isBefore(Ljava/time/chrono/ChronoLocalDate;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 896
    iget-object p1, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {p1, v3, v4}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object p1

    invoke-virtual {v0, v5, v6}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/time/LocalDate;->isAfter(Ljava/time/chrono/ChronoLocalDate;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 897
    iget-object p1, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {p1, v3, v4}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object p1

    invoke-direct {p0, p1, v2}, Le/e/a/NicoliveActivity;->selectTimetableDay(Ljava/time/LocalDate;Z)V

    :cond_5
    return-void
.end method

.method private openBrowser(Ljava/lang/String;)V
    .registers 4

    .line 951
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 952
    new-instance p1, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.APP_BROWSER"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setSelector(Landroid/content/Intent;)V

    .line 953
    :try_start_0
    invoke-virtual {p0, v0}, Le/e/a/NicoliveActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 954
    :catch_0
    const-string p1, "\u30d6\u30e9\u30a6\u30b6\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private openTimetableProgram(Ljava/lang/String;)V
    .registers 4

    .line 947
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://live.nicovideo.jp/watch/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->openBrowser(Ljava/lang/String;)V

    return-void
.end method

.method private prefs()Landroid/content/SharedPreferences;
    .registers 1

    .line 227
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private publishRecent()V
    .registers 3

    .line 608
    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 609
    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->pendingRecent:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 610
    iget-object p0, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {p0}, Le/e/a/NicoliveActivity$FeedAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method private recentFeed()Z
    .registers 2

    .line 552
    iget v0, p0, Le/e/a/NicoliveActivity;->hubTab:I

    if-nez v0, :cond_0

    iget-object p0, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private refreshReservationsAfterWrite()V
    .registers 3

    .line 698
    iget v0, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez v0, :cond_1

    .line 699
    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    iget-boolean v0, v0, Le/e/a/NicoliveBrowser;->imagesPaused:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->loading:Z

    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->resumeLoad:Z

    return-void

    .line 700
    :cond_0
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->load()V

    :cond_1
    return-void
.end method

.method private selectFollow(I)V
    .registers 3

    .line 647
    iget v0, p0, Le/e/a/NicoliveActivity;->followFilter:I

    if-ne v0, p1, :cond_0

    return-void

    .line 648
    :cond_0
    iput p1, p0, Le/e/a/NicoliveActivity;->followFilter:I

    const/4 p1, 0x0

    .line 649
    iput p1, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    iput p1, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    .line 650
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    return-void
.end method

.method private selectTimetableDay(Ljava/time/LocalDate;Z)V
    .registers 4

    .line 902
    iget-object v0, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {p1, v0}, Ljava/time/LocalDate;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    if-ne p2, v0, :cond_0

    return-void

    .line 903
    :cond_0
    iput-object p1, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    .line 904
    iput-boolean p2, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    const/4 p1, 0x0

    .line 905
    iput p1, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    iput p1, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    .line 906
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    return-void
.end method

.method private settingChoiceRow(Landroid/widget/LinearLayout;I)Landroid/widget/Button;
    .registers 5

    .line 337
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, ""

    invoke-static {v0, v1}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    const v1, 0x800013

    .line 338
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    const/high16 v1, 0x41600000    # 14.0f

    .line 339
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    const/high16 v1, 0x42400000    # 48.0f

    .line 340
    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setMinHeight(I)V

    const/4 p0, 0x0

    .line 341
    invoke-virtual {v0, p2, p0, p0, p0}, Landroid/widget/Button;->setPaddingRelative(IIII)V

    .line 342
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 v1, -0x2

    invoke-direct {p0, p2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private settingSwitch(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .registers 6

    .line 321
    new-instance v0, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 322
    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const/high16 p2, 0x42400000    # 48.0f

    .line 323
    invoke-static {p0, p2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setMinHeight(I)V

    .line 324
    invoke-virtual {v0, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 325
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 p3, -0x2

    invoke-direct {p0, p2, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private settingValueColor(Landroid/content/Context;)I
    .registers 10

    .line 356
    invoke-static {p1}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result p1

    .line 357
    invoke-static {p0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/graphics/Color;->luminance(I)F

    move-result p0

    const v0, 0x3e374bc7    # 0.179f

    cmpl-float v0, p0, v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0xff

    :goto_0
    const/4 v1, 0x1

    move v2, p1

    :goto_1
    const/16 v3, 0x20

    if-gt v1, v3, :cond_1

    .line 362
    invoke-static {v2}, Landroid/graphics/Color;->luminance(I)F

    move-result v4

    .line 363
    invoke-static {v4, p0}, Ljava/lang/Math;->max(FF)F

    move-result v5

    const v6, 0x3d4ccccd    # 0.05f

    add-float/2addr v5, v6

    invoke-static {v4, p0}, Ljava/lang/Math;->min(FF)F

    move-result v4

    add-float/2addr v4, v6

    div-float/2addr v5, v4

    const/high16 v4, 0x40900000    # 4.5f

    cmpl-float v4, v5, v4

    if-ltz v4, :cond_2

    :cond_1
    return v2

    .line 364
    :cond_2
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    rsub-int/lit8 v4, v1, 0x20

    mul-int/2addr v2, v4

    mul-int v5, v0, v1

    add-int/2addr v2, v5

    div-int/2addr v2, v3

    .line 365
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v6

    mul-int/2addr v6, v4

    add-int/2addr v6, v5

    div-int/2addr v6, v3

    .line 366
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v7

    mul-int/2addr v7, v4

    add-int/2addr v7, v5

    div-int/2addr v7, v3

    .line 364
    invoke-static {v2, v6, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private showChoiceValue(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 347
    new-instance v0, Landroid/text/SpannableString;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {v0, p3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 348
    new-instance p3, Landroid/text/style/ForegroundColorSpan;

    invoke-static {p1}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v1

    invoke-direct {p3, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 349
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x3

    const/4 v2, 0x0

    const/16 v3, 0x21

    .line 348
    invoke-virtual {v0, p3, v2, v1, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 350
    new-instance p3, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {p1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1}, Le/e/a/NicoliveActivity;->settingValueColor(Landroid/content/Context;)I

    move-result p0

    invoke-direct {p3, p0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 351
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p0

    add-int/lit8 p0, p0, 0x3

    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result p2

    .line 350
    invoke-virtual {v0, p3, p0, p2, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 352
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showFollowing(Ljava/util/Map;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/NicoliveData$Program;",
            ">;Z)V"
        }
    .end annotation

    .line 794
    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 795
    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 796
    iget-object p1, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    new-instance v0, Le/e/a/NicoliveActivity$66;

    invoke-direct {v0}, Le/e/a/NicoliveActivity$66;-><init>()V

    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    move-result-object v0

    .line 797
    new-instance v1, Le/e/a/NicoliveActivity$67;

    invoke-direct {v1}, Le/e/a/NicoliveActivity$67;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/Comparator;->thenComparingLong(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object v0

    .line 796
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 798
    iget-object p1, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u756a\u7d44\u306f\u3042\u308a\u307e\u305b\u3093"

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\u4ef6"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    if-eqz p2, :cond_2

    .line 799
    iget-object p2, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p1, "\u30d5\u30a9\u30ed\u30fc\u4e00\u89a7\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    goto :goto_1

    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " / "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\u4e00\u90e8\u306e\u4e00\u89a7\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 800
    :cond_2
    :goto_1
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->showResults(Ljava/lang/String;)V

    return-void
.end method

.method private showHubMenu()V
    .registers 8

    .line 236
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 237
    const-string/jumbo v1, "\u73fe\u5728\u306e\u4e00\u89a7\u3092\u66f4\u65b0"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u30cb\u30b3\u751f\u306e\u8a2d\u5b9a"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u516c\u5f0f\u30b5\u30a4\u30c8\u3067\u958b\u304f"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/NicoliveActivity$29;

    invoke-direct {v2, p0}, Le/e/a/NicoliveActivity$29;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 243
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 244
    invoke-static {v0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    .line 245
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 247
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 248
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    const/4 v2, 0x2

    .line 249
    new-array v2, v2, [I

    .line 250
    iget-object v3, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->getLocationOnScreen([I)V

    .line 251
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-static {v3}, Le/e/a/NicoliveAppBarPlacement;->position(Landroid/content/SharedPreferences;)I

    move-result v3

    if-nez v3, :cond_0

    const v4, 0x800035

    .line 253
    invoke-virtual {v0, v4}, Landroid/view/Window;->setGravity(I)V

    goto :goto_0

    :cond_0
    const v4, 0x800055

    .line 255
    invoke-virtual {v0, v4}, Landroid/view/Window;->setGravity(I)V

    .line 257
    :goto_0
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    const/high16 v5, 0x41000000    # 8.0f

    .line 258
    invoke-static {p0, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v5

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->x:I

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez v3, :cond_1

    .line 260
    aget v2, v2, v5

    iget-object v3, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v3

    add-int/2addr v2, v3

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, v1

    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_1

    .line 261
    :cond_1
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    aget v2, v2, v5

    sub-int/2addr v1, v2

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 259
    :goto_1
    iput v1, v4, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 262
    invoke-virtual {v0, v4}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    const/high16 v1, 0x43480000    # 200.0f

    .line 263
    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    .line 264
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-static {p0, v3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    sub-int/2addr v2, v3

    .line 263
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/high16 v2, 0x43740000    # 244.0f

    .line 265
    invoke-static {p0, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v1, -0x2

    invoke-virtual {v0, p0, v1}, Landroid/view/Window;->setLayout(II)V

    :cond_2
    return-void
.end method

.method private showHubSettings()V
    .registers 18

    move-object/from16 v0, p0

    .line 271
    invoke-direct {v0}, Le/e/a/NicoliveActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v6

    .line 272
    invoke-static {v0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/NicoliveUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v7

    const/4 v1, 0x0

    .line 273
    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/high16 v2, 0x41a00000    # 20.0f

    .line 274
    invoke-static {v0, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v2

    .line 275
    invoke-virtual {v7, v2, v1, v2, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 276
    const-string v2, "nicolive_float_refresh"

    const/4 v3, 0x1

    invoke-interface {v6, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const-string v4, "\u53f3\u4e0b\u306b\u66f4\u65b0\u30dc\u30bf\u30f3\u3092\u8868\u793a"

    invoke-direct {v0, v7, v4, v2}, Le/e/a/NicoliveActivity;->settingSwitch(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v8

    .line 277
    invoke-virtual {v8}, Landroid/widget/CheckBox;->getCompoundPaddingStart()I

    move-result v2

    invoke-direct {v0, v7, v2}, Le/e/a/NicoliveActivity;->settingChoiceRow(Landroid/widget/LinearLayout;I)Landroid/widget/Button;

    move-result-object v9

    .line 278
    invoke-virtual {v8}, Landroid/widget/CheckBox;->getCompoundPaddingStart()I

    move-result v2

    invoke-direct {v0, v7, v2}, Le/e/a/NicoliveActivity;->settingChoiceRow(Landroid/widget/LinearLayout;I)Landroid/widget/Button;

    move-result-object v2

    .line 279
    invoke-virtual {v8}, Landroid/widget/CheckBox;->getCompoundPaddingStart()I

    move-result v4

    invoke-direct {v0, v7, v4}, Le/e/a/NicoliveActivity;->settingChoiceRow(Landroid/widget/LinearLayout;I)Landroid/widget/Button;

    move-result-object v10

    .line 280
    invoke-virtual {v8}, Landroid/widget/CheckBox;->getCompoundPaddingStart()I

    move-result v4

    invoke-direct {v0, v7, v4}, Le/e/a/NicoliveActivity;->settingChoiceRow(Landroid/widget/LinearLayout;I)Landroid/widget/Button;

    move-result-object v11

    .line 281
    invoke-virtual {v8}, Landroid/widget/CheckBox;->getCompoundPaddingStart()I

    move-result v4

    invoke-direct {v0, v7, v4}, Le/e/a/NicoliveActivity;->settingChoiceRow(Landroid/widget/LinearLayout;I)Landroid/widget/Button;

    move-result-object v12

    .line 282
    sget-object v4, Le/e/a/NicoliveActivity;->HUB_LABELS:[Ljava/lang/String;

    array-length v5, v4

    add-int/2addr v5, v3

    invoke-static {v4, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    .line 283
    array-length v4, v4

    const-string v13, "\u524d\u56de\u958b\u3044\u305f\u30bf\u30d6"

    aput-object v13, v5, v4

    .line 284
    const-string v4, "nicolive_start_tab"

    invoke-interface {v6, v4, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    move v13, v1

    move v14, v13

    .line 286
    :goto_0
    sget-object v15, Le/e/a/NicoliveActivity;->HUB_TABS:[I

    array-length v3, v15

    if-lt v13, v3, :cond_1

    const/4 v3, -0x1

    if-ne v4, v3, :cond_0

    .line 287
    sget-object v3, Le/e/a/NicoliveActivity;->HUB_LABELS:[Ljava/lang/String;

    array-length v14, v3

    .line 288
    :cond_0
    const-string v3, "nicolive_start_time"

    invoke-interface {v6, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 289
    const-string v4, "nicolive_tap_behavior"

    invoke-interface {v6, v4, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    const/4 v13, 0x1

    invoke-static {v13, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 290
    const-string v4, "nicolive_exit_mode"

    invoke-static {v0, v4}, Le/e/a/ExitModeOptions;->mode(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    .line 291
    invoke-static {v6}, Le/e/a/NicoliveAppBarPlacement;->position(Landroid/content/SharedPreferences;)I

    move-result v13

    filled-new-array {v14, v3, v1, v4, v13}, [I

    move-result-object v4

    .line 292
    const-string/jumbo v1, "\u7d4c\u904e\u6642\u9593"

    const-string/jumbo v3, "\u653e\u9001\u958b\u59cb\u6642\u523b"

    filled-new-array {v1, v3}, [Ljava/lang/String;

    move-result-object v13

    move-object v1, v2

    .line 293
    const-string/jumbo v2, "\u6700\u521d\u306b\u958b\u304f\u30bf\u30d6"

    move-object v3, v5

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Le/e/a/NicoliveActivity;->bindSettingChoice(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 294
    const-string/jumbo v2, "\u653e\u9001\u4e2d\u306e\u6642\u523b\u8868\u793a"

    const/4 v5, 0x1

    move-object/from16 v0, p0

    move-object v1, v10

    move-object v3, v13

    invoke-direct/range {v0 .. v5}, Le/e/a/NicoliveActivity;->bindSettingChoice(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 295
    const-string/jumbo v0, "\u901a\u5e38\u518d\u751f"

    const-string v1, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x2

    const-string v2, "\u30bf\u30c3\u30d7\u6642\u306e\u52d5\u4f5c"

    move-object/from16 v0, p0

    move-object v1, v11

    invoke-direct/range {v0 .. v5}, Le/e/a/NicoliveActivity;->bindSettingChoice(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 296
    sget-object v3, Le/e/a/NicoliveAppBarPlacement;->LABELS:[Ljava/lang/String;

    const/4 v5, 0x4

    const-string v2, "\u30a2\u30d7\u30ea\u30d0\u30fc\u306e\u914d\u7f6e"

    move-object v1, v12

    invoke-direct/range {v0 .. v5}, Le/e/a/NicoliveActivity;->bindSettingChoice(Landroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 297
    invoke-static {v0}, Le/e/a/ExitModeOptions;->labels(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    aget v2, v4, v2

    aget-object v1, v1, v2

    const-string v2, "\u30cb\u30b3\u751f\u3092\u9589\u3058\u308b\u3068\u304d\u306e\u78ba\u8a8d"

    invoke-direct {v0, v9, v2, v1}, Le/e/a/NicoliveActivity;->showChoiceValue(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    new-instance v1, Le/e/a/NicoliveActivity$14;

    invoke-direct {v1, v0, v4, v9}, Le/e/a/NicoliveActivity$14;-><init>(Le/e/a/NicoliveActivity;[ILandroid/widget/Button;)V

    invoke-virtual {v9, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v9 .. v9}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    const-string v1, "nicolive_resume_chase"

    const/4 v2, 0x0

    invoke-interface {v6, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const-string/jumbo v1, "\u8ffd\u3063\u304b\u3051\u518d\u751f\u3092\u524d\u56de\u306e\u4f4d\u7f6e\u304b\u3089\u518d\u958b"

    const-string v3, "Resume catch-up playback from the last position"

    const-string/jumbo v12, "\u5f9e\u4e0a\u6b21\u4f4d\u7f6e\u7e7c\u7e8c\u8ffd\u770b"

    invoke-static {v0, v1, v3, v12}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v7, v1, v2}, Le/e/a/NicoliveActivity;->settingSwitch(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v12

    invoke-static {v12}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 305
    new-instance v1, Landroid/widget/ScrollView;

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 306
    invoke-virtual {v1, v7}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 307
    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\u30cb\u30b3\u751f\u306e\u8a2d\u5b9a"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    .line 308
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 309
    new-instance v2, Le/e/a/NicoliveActivity$15;

    move-object v9, v2

    move-object v10, v0

    move-object v11, v4

    move-object v13, v8

    move-object v14, v12

    move-object v12, v6

    invoke-direct/range {v9 .. v14}, Le/e/a/NicoliveActivity$15;-><init>(Le/e/a/NicoliveActivity;[ILandroid/content/SharedPreferences;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V

    const-string/jumbo v0, "\u9069\u7528"

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 317
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 307
    invoke-static {v0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void

    :cond_1
    move-object v3, v11

    move-object v11, v5

    move-object v5, v3

    move-object v3, v10

    move-object v10, v12

    .line 286
    aget v12, v15, v13

    if-ne v12, v4, :cond_2

    move v14, v13

    :cond_2
    add-int/lit8 v13, v13, 0x1

    move-object v12, v11

    move-object v11, v5

    move-object v5, v12

    move-object v12, v10

    move-object v10, v3

    goto/16 :goto_0
.end method

.method private showProgramActions(Le/e/a/NicoliveData$Program;)V
    .registers 6

    .line 958
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 959
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 960
    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 961
    const-string/jumbo v2, "\u901a\u5e38\u518d\u751f"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Le/e/a/NicoliveActivity$44;

    invoke-direct {v2, p0, p1}, Le/e/a/NicoliveActivity$44;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 962
    const-string v2, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Le/e/a/NicoliveActivity$45;

    invoke-direct {v2, p0, p1}, Le/e/a/NicoliveActivity$45;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 964
    :cond_0
    const-string v2, "\u516c\u5f0f\u30b5\u30a4\u30c8\u3067\u958b\u304f"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Le/e/a/NicoliveActivity$46;

    invoke-direct {v2, p0, p1}, Le/e/a/NicoliveActivity$46;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 966
    :goto_0
    iget v2, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 967
    const-string/jumbo v2, "\u8996\u8074\u5c65\u6b74\u304b\u3089\u524a\u9664"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Le/e/a/NicoliveActivity$47;

    invoke-direct {v2, p0, p1}, Le/e/a/NicoliveActivity$47;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    const/4 v3, 0x5

    if-ne v2, v3, :cond_2

    .line 969
    const-string v2, "\u30bf\u30a4\u30e0\u30b7\u30d5\u30c8\u4e88\u7d04\u3092\u53d6\u308a\u6d88\u3059"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Le/e/a/NicoliveActivity$48;

    invoke-direct {v2, p0, p1}, Le/e/a/NicoliveActivity$48;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 970
    :cond_2
    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->scheduled()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 971
    const-string v2, "\u30bf\u30a4\u30e0\u30b7\u30d5\u30c8\u4e88\u7d04"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Le/e/a/NicoliveActivity$49;

    invoke-direct {v2, p0, p1}, Le/e/a/NicoliveActivity$49;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 973
    :cond_3
    :goto_1
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string/jumbo p1, "\u756a\u7d44\u306e\u64cd\u4f5c"

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/4 p1, 0x0

    .line 974
    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/CharSequence;

    new-instance v0, Le/e/a/NicoliveActivity$50;

    invoke-direct {v0, v1}, Le/e/a/NicoliveActivity$50;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 973
    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private showResults(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 627
    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->loading:Z

    .line 628
    iget-object v0, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 629
    iget-object p1, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {p1}, Le/e/a/NicoliveActivity$FeedAdapter;->notifyDataSetChanged()V

    .line 630
    iget-object p1, p0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    iget v0, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    iget p0, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    invoke-virtual {p1, v0, p0}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    return-void
.end method

.method private showSort(Landroid/view/View;)V
    .registers 12

    .line 449
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-direct {v0, p0, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 450
    invoke-static {}, Le/e/a/NicoliveCatalog$Sort;->values()[Le/e/a/NicoliveCatalog$Sort;

    move-result-object p1

    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const/4 v4, 0x1

    if-lt v3, v1, :cond_0

    .line 453
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p1

    invoke-interface {p1, v2, v4, v4}, Landroid/view/Menu;->setGroupCheckable(IZZ)V

    .line 454
    new-instance p1, Le/e/a/NicoliveActivity$43;

    invoke-direct {p1, p0}, Le/e/a/NicoliveActivity$43;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, p1}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 458
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    return-void

    .line 450
    :cond_0
    aget-object v5, p1, v3

    .line 451
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v6

    invoke-virtual {v5}, Le/e/a/NicoliveCatalog$Sort;->ordinal()I

    move-result v7

    invoke-virtual {v5}, Le/e/a/NicoliveCatalog$Sort;->ordinal()I

    move-result v8

    iget-object v9, v5, Le/e/a/NicoliveCatalog$Sort;->label:Ljava/lang/String;

    invoke-static {v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v2, v7, v8, v9}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    move-result-object v6

    invoke-direct {p0}, Le/e/a/NicoliveActivity;->activeSort()Le/e/a/NicoliveCatalog$Sort;

    move-result-object v7

    if-eq v5, v7, :cond_1

    move v4, v2

    :cond_1
    invoke-interface {v6, v4}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private showTimetableResults(Ljava/util/Map;Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/NicoliveData$Program;",
            ">;Z)V"
        }
    .end annotation

    .line 940
    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 941
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Official and channel "

    const-string v1, "\u5b98\u65b9\u53ca\u983b\u9053 "

    const-string v2, "\u516c\u5f0f\u30fb\u30c1\u30e3\u30f3\u30cd\u30eb "

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " programs"

    const-string v1, " \u500b\u7bc0\u76ee"

    const-string v2, "\u4ef6"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 942
    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    const-string/jumbo p1, "\u756a\u7d44\u8868\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    goto :goto_0

    :cond_0
    const-string/jumbo p1, "\u756a\u7d44\u306f\u3042\u308a\u307e\u305b\u3093"

    :goto_0
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->showResults(Ljava/lang/String;)V

    return-void

    :cond_1
    if-eqz p2, :cond_2

    .line 943
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " / "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\u4e00\u90e8\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_2
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->showResults(Ljava/lang/String;)V

    return-void
.end method

.method private timetableControls()Landroid/widget/HorizontalScrollView;
    .registers 10

    .line 852
    new-instance v0, Landroid/widget/HorizontalScrollView;

    invoke-direct {v0, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 853
    invoke-virtual {v0, v1}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 854
    const-string v2, "nicoid-live-timetable-dates"

    invoke-virtual {v0, v2}, Landroid/widget/HorizontalScrollView;->setTag(Ljava/lang/Object;)V

    .line 855
    invoke-static {p0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    .line 856
    invoke-virtual {v0, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 857
    sget-object v3, Le/e/a/NicoliveCatalog;->JAPAN:Ljava/time/ZoneId;

    invoke-static {v3}, Ljava/time/LocalDate;->now(Ljava/time/ZoneId;)Ljava/time/LocalDate;

    move-result-object v3

    const-wide/16 v4, 0x7

    .line 858
    invoke-virtual {v3, v4, v5}, Ljava/time/LocalDate;->minusDays(J)Ljava/time/LocalDate;

    move-result-object v6

    invoke-virtual {v3, v4, v5}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object v4

    .line 859
    iget-object v5, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {v5, v6}, Ljava/time/LocalDate;->isBefore(Ljava/time/chrono/ChronoLocalDate;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {v5, v4}, Ljava/time/LocalDate;->isAfter(Ljava/time/chrono/ChronoLocalDate;)Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_0
    iput-object v3, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    .line 860
    :cond_1
    :goto_0
    invoke-virtual {v6, v4}, Ljava/time/LocalDate;->isAfter(Ljava/time/chrono/ChronoLocalDate;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 864
    new-instance p0, Le/e/a/NicoliveActivity$28;

    invoke-direct {p0, v2, v0}, Le/e/a/NicoliveActivity$28;-><init>(Landroid/widget/LinearLayout;Landroid/widget/HorizontalScrollView;)V

    invoke-virtual {v0, p0}, Landroid/widget/HorizontalScrollView;->post(Ljava/lang/Runnable;)Z

    return-object v0

    .line 861
    :cond_2
    invoke-virtual {v6, v3}, Ljava/time/LocalDate;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string/jumbo v5, "\u653e\u9001\u4e2d"

    const/4 v7, 0x1

    invoke-direct {p0, v2, v5, v3, v7}, Le/e/a/NicoliveActivity;->addDateTab(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/time/LocalDate;Z)V

    .line 862
    :cond_3
    invoke-virtual {v6, v3}, Ljava/time/LocalDate;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string v5, "\u4eca\u65e5"

    goto :goto_1

    :cond_4
    const-string v5, "M/d(E)"

    invoke-direct {p0}, Le/e/a/NicoliveActivity;->currentDateLocale()Ljava/util/Locale;

    move-result-object v7

    invoke-static {v5, v7}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;Ljava/util/Locale;)Ljava/time/format/DateTimeFormatter;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/time/LocalDate;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-direct {p0, v2, v5, v6, v1}, Le/e/a/NicoliveActivity;->addDateTab(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/time/LocalDate;Z)V

    const-wide/16 v7, 0x1

    .line 860
    invoke-virtual {v6, v7, v8}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object v6

    goto :goto_0
.end method

.method private updateHubDisplayOptions()V
    .registers 5

    .line 330
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "nicolive_float_refresh"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 331
    iget-object v1, p0, Le/e/a/NicoliveActivity;->bottomRefresh:Landroid/widget/ImageButton;

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 332
    iget-object v1, p0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    if-eqz v0, :cond_1

    const/high16 v0, 0x42780000    # 62.0f

    invoke-static {p0, v0}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v0

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    invoke-virtual {v1, v2, v2, v2, v0}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 333
    iget-object p0, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {p0}, Le/e/a/NicoliveActivity$FeedAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method private updateRecentStatus(Ljava/lang/String;)V
    .registers 6

    .line 622
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Live "

    const-string/jumbo v2, "\u76f4\u64ad\u4e2d "

    const-string/jumbo v3, "\u653e\u9001\u4e2d "

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {v1}, Le/e/a/NicoliveActivity$FeedAdapter;->getCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " items"

    const-string v2, " \u500b\u7bc0\u76ee"

    const-string v3, "\u4ef6"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 623
    iget-object p0, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " / "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private updateSortLabel()V
    .registers 4

    .line 444
    iget-object v0, p0, Le/e/a/NicoliveActivity;->sortButton:Landroid/widget/Button;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Le/e/a/NicoliveActivity;->activeSort()Le/e/a/NicoliveCatalog$Sort;

    move-result-object v2

    iget-object v2, v2, Le/e/a/NicoliveCatalog$Sort;->label:Ljava/lang/String;

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " \u25be"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 445
    iget-object v0, p0, Le/e/a/NicoliveActivity;->sortButton:Landroid/widget/Button;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u4e26\u3079\u66ff\u3048"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Le/e/a/NicoliveActivity;->activeSort()Le/e/a/NicoliveCatalog$Sort;

    move-result-object p0

    iget-object p0, p0, Le/e/a/NicoliveCatalog$Sort;->label:Ljava/lang/String;

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static validHubTab(I)I
    .registers 6

    .line 231
    sget-object v0, Le/e/a/NicoliveActivity;->HUB_TABS:[I

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-lt v3, v1, :cond_0

    return v2

    :cond_0
    aget v4, v0, v3

    if-ne v4, p0, :cond_1

    return v4

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method activateRequestedPopup()V
    .registers 3

    .line 998
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_3

    iget-object v0, p0, Le/e/a/NicoliveActivity;->pendingPopupId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 999
    iget-object v0, p0, Le/e/a/NicoliveActivity;->pendingPopupId:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Le/e/a/NicoliveActivity;->pendingPopupId:Ljava/lang/String;

    .line 1000
    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-boolean v1, v1, Le/e/a/NicoliveService;->stopped:Z

    if-nez v1, :cond_3

    .line 1001
    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v1, v1, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-boolean v1, v1, Le/e/a/NicoliveService;->terminal:Z

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {v1, v0}, Le/e/a/NicoliveService;->open(Ljava/lang/String;)V

    .line 1002
    :cond_1
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {v0}, Le/e/a/NicoliveService;->showPopup()V

    .line 1003
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    if-nez v0, :cond_2

    const-string v0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u3092\u958b\u59cb\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1004
    :cond_2
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->updateNowPlaying()V

    :cond_3
    return-void
.end method

.method base()V
    .registers 6

    .line 104
    iget-object v0, p0, Le/e/a/NicoliveActivity;->listGestures:Le/e/a/NicoliveListGestures;

    invoke-virtual {v0}, Le/e/a/NicoliveListGestures;->reset()V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->renderedProgram:Le/e/a/NicoliveData$Program;

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Le/e/a/NicoliveActivity;->renderedComments:J

    iput-wide v0, p0, Le/e/a/NicoliveActivity;->renderedViews:J

    new-instance v0, Le/e/a/NicoliveSwipeLayout;

    new-instance v1, Le/e/a/NicoliveActivity$64;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$64;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-direct {v0, p0, v1}, Le/e/a/NicoliveSwipeLayout;-><init>(Landroid/content/Context;Le/e/a/NicoliveSwipeLayout$Change;)V

    iput-object v0, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    invoke-static {v0}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setFitsSystemWindows(Z)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Le/e/a/NicoliveActivity;->setContentView(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42400000    # 48.0f

    invoke-static {p0, v3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    const/4 v4, -0x1

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {p0}, Le/e/a/NicoliveUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    iget-object p0, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v4, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method bind()V
    .registers 4

    .line 102
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->bound:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Le/e/a/NicoliveService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->connection:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Le/e/a/NicoliveActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->bound:Z

    return-void
.end method

.method public changed()V
    .registers 9

    .line 1042
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->updateNowPlaying()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_f

    iget-object v0, v0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    iget-boolean v0, v0, Le/e/a/NicoliveData$Program;->canWatch:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    invoke-virtual {p0, v0}, Le/e/a/NicoliveActivity;->showWatchRestriction(Le/e/a/NicoliveData$Program;)V

    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-boolean v0, v0, Le/e/a/NicoliveService;->stopped:Z

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-eqz v0, :cond_2

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->unbind()V

    return-void

    :cond_2
    if-eqz v1, :cond_f

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Le/e/a/NicolivePlayerFrame;->updateControls()V

    :cond_3
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->renderedProgram:Le/e/a/NicoliveData$Program;

    const/4 v2, 0x0

    const-string v3, ""

    if-eqz v0, :cond_7

    if-eq v1, v0, :cond_4

    iget-object v1, p0, Le/e/a/NicoliveActivity;->title:Landroid/widget/TextView;

    iget-object v4, v0, Le/e/a/NicoliveData$Program;->title:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->owner:Landroid/widget/TextView;

    iget-object v4, v0, Le/e/a/NicoliveData$Program;->owner:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->information:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Le/e/a/NicoliveData$Program;->title:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "\n\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v0, Le/e/a/NicoliveData$Program;->owner:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v0, Le/e/a/NicoliveData$Program;->description:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4
    iget-object v1, p0, Le/e/a/NicoliveActivity;->renderedProgram:Le/e/a/NicoliveData$Program;

    if-ne v1, v0, :cond_5

    iget-wide v4, p0, Le/e/a/NicoliveActivity;->renderedViews:J

    iget-wide v6, v0, Le/e/a/NicoliveData$Program;->views:J

    cmp-long v1, v4, v6

    if-nez v1, :cond_5

    iget-wide v4, p0, Le/e/a/NicoliveActivity;->renderedComments:J

    iget-wide v6, v0, Le/e/a/NicoliveData$Program;->comments:J

    cmp-long v1, v4, v6

    if-eqz v1, :cond_6

    :cond_5
    iget-object v1, p0, Le/e/a/NicoliveActivity;->stats:Landroid/widget/TextView;

    iget-wide v4, v0, Le/e/a/NicoliveData$Program;->views:J

    iget-wide v6, v0, Le/e/a/NicoliveData$Program;->comments:J

    invoke-static {p0, v4, v5, v6, v7}, Le/e/a/NicoliveUi;->statistics(Landroid/content/Context;JJ)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->stats:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Viewers: "

    const-string/jumbo v6, "\u89c0\u773e\uff1a"

    const-string/jumbo v7, "\u6765\u5834 "

    invoke-static {p0, v7, v5, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v5, v0, Le/e/a/NicoliveData$Program;->views:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, ", comments: "

    const-string/jumbo v6, "\uff0c\u7559\u8a00\uff1a"

    const-string v7, "\u3001\u30b3\u30e1\u30f3\u30c8 "

    invoke-static {p0, v7, v5, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, v0, Le/e/a/NicoliveData$Program;->comments:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-wide v4, v0, Le/e/a/NicoliveData$Program;->views:J

    iput-wide v4, p0, Le/e/a/NicoliveActivity;->renderedViews:J

    iget-wide v4, v0, Le/e/a/NicoliveData$Program;->comments:J

    iput-wide v4, p0, Le/e/a/NicoliveActivity;->renderedComments:J

    :cond_6
    iput-object v0, p0, Le/e/a/NicoliveActivity;->renderedProgram:Le/e/a/NicoliveData$Program;

    goto :goto_0

    :cond_7
    if-eqz v1, :cond_8

    iput-object v2, p0, Le/e/a/NicoliveActivity;->renderedProgram:Le/e/a/NicoliveData$Program;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->title:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->owner:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->information:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->stats:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->stats:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_8
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v4, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v4, v4, Le/e/a/NicoliveService;->status:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-boolean v4, v4, Le/e/a/NicoliveService;->commentsConnected:Z

    if-nez v4, :cond_9

    iget-object v4, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {v4}, Le/e/a/NicoliveService;->playing()Z

    move-result v4

    if-eqz v4, :cond_9

    const-string v3, " / \u30b3\u30e1\u30f3\u30c8\u672a\u63a5\u7d9a"

    :cond_9
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    iget-object v3, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_a
    const/4 v1, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_b

    .line 1043
    iget-boolean v4, v0, Le/e/a/NicoliveData$Program;->loggedIn:Z

    if-eqz v4, :cond_b

    invoke-virtual {v0}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v4

    if-eqz v4, :cond_b

    iget-object v4, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-boolean v4, v4, Le/e/a/NicoliveService;->terminal:Z

    if-nez v4, :cond_b

    move v4, v1

    goto :goto_1

    :cond_b
    move v4, v3

    :goto_1
    iget-object v5, p0, Le/e/a/NicoliveActivity;->composer:Landroid/widget/LinearLayout;

    const/16 v6, 0x8

    if-eqz v4, :cond_c

    move v7, v3

    goto :goto_2

    :cond_c
    move v7, v6

    :goto_2
    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v5, p0, Le/e/a/NicoliveActivity;->login:Landroid/widget/Button;

    if-eqz v0, :cond_d

    iget-boolean v0, v0, Le/e/a/NicoliveData$Program;->loggedIn:Z

    if-nez v0, :cond_d

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-boolean v0, v0, Le/e/a/NicoliveService;->terminal:Z

    if-nez v0, :cond_d

    move v6, v3

    :cond_d
    invoke-virtual {v5, v6}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->send:Landroid/widget/ImageButton;

    if-eqz v4, :cond_e

    iget-object v4, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v4, v4, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    if-eqz v4, :cond_e

    iget-object v4, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v4, v4, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    iget-boolean v4, v4, Le/e/a/NicoliveSession;->posting:Z

    if-nez v4, :cond_e

    move v4, v1

    goto :goto_3

    :cond_e
    move v4, v3

    :goto_3
    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1044
    iget-wide v4, p0, Le/e/a/NicoliveActivity;->observedCount:J

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-wide v6, v0, Le/e/a/NicoliveService;->deliveredCount:J

    cmp-long v0, v4, v6

    if-nez v0, :cond_10

    iget-object v0, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v4, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v4, v4, Le/e/a/NicoliveService;->history:Ljava/util/ArrayDeque;

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->size()I

    move-result v4

    if-ne v0, v4, :cond_10

    :cond_f
    return-void

    :cond_10
    iget-object v0, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v0

    iget-object v4, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getChildCount()I

    move-result v4

    if-lez v4, :cond_11

    iget-object v4, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    invoke-virtual {v4, v3}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    goto :goto_4

    :cond_11
    move v4, v3

    :goto_4
    if-ltz v0, :cond_12

    iget-object v5, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_12

    iget-object v2, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Le/e/a/NicoliveData$Chat;

    :cond_12
    iget-object v0, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    iget-object v5, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v5, v5, Le/e/a/NicoliveService;->history:Ljava/util/ArrayDeque;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Le/e/a/NicoliveActivity;->chatAdapter:Le/e/a/NicoliveActivity$ChatAdapter;

    invoke-virtual {v0}, Le/e/a/NicoliveActivity$ChatAdapter;->notifyDataSetChanged()V

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->atBottom:Z

    if-eqz v0, :cond_13

    iget-object v0, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    iget-object v2, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    goto :goto_6

    :cond_13
    if-nez v2, :cond_14

    const/4 v0, -0x1

    goto :goto_5

    :cond_14
    iget-object v0, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    :goto_5
    if-ltz v0, :cond_15

    iget-object v1, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    invoke-virtual {v1, v0, v4}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    :cond_15
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-wide v0, v0, Le/e/a/NicoliveService;->deliveredCount:J

    iget-wide v4, p0, Le/e/a/NicoliveActivity;->observedCount:J

    sub-long/2addr v0, v4

    const-wide/16 v4, 0x270f

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    iget v1, p0, Le/e/a/NicoliveActivity;->newComments:I

    add-int/2addr v1, v0

    const/16 v0, 0x270f

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Le/e/a/NicoliveActivity;->newComments:I

    if-lez v0, :cond_16

    iget-object v0, p0, Le/e/a/NicoliveActivity;->latest:Landroid/widget/Button;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "New "

    const-string/jumbo v4, "\u65b0\u589e "

    const-string/jumbo v5, "\u65b0\u7740 "

    invoke-static {p0, v5, v2, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Le/e/a/NicoliveActivity;->newComments:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " comments / Jump to latest"

    const-string v4, " \u5247\u7559\u8a00\uff0f\u8df3\u81f3\u6700\u65b0"

    const-string v5, "\u4ef6 / \u6700\u65b0\u30b3\u30e1\u30f3\u30c8\u3078"

    invoke-static {p0, v5, v2, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->latest:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    :cond_16
    :goto_6
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-wide v0, v0, Le/e/a/NicoliveService;->deliveredCount:J

    iput-wide v0, p0, Le/e/a/NicoliveActivity;->observedCount:J

    return-void
.end method

.method commentMenu(Le/e/a/NicoliveData$Chat;)V
    .registers 6

    .line 1057
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30b3\u30e1\u30f3\u30c8"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u3053\u306e\u30e6\u30fc\u30b6\u30fc\u3092NG\u306b\u767b\u9332"

    const-string v2, "\u3053\u306e\u672c\u6587\u3092NG\u30ef\u30fc\u30c9\u306b\u767b\u9332"

    const-string/jumbo v3, "\u672c\u6587\u3092\u30b3\u30d4\u30fc"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/NicoliveActivity$34;

    invoke-direct {v2, p0, p1}, Le/e/a/NicoliveActivity$34;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Chat;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    .line 39
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez v0, :cond_4

    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    .line 42
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 43
    iget-object v4, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Le/e/a/NicoliveFloatingMini206;->getVisibility()I

    move-result v4

    if-nez v4, :cond_0

    .line 44
    iget-object v4, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    invoke-virtual {v4, v3}, Le/e/a/NicoliveFloatingMini206;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    .line 43
    :goto_0
    iput-boolean v3, p0, Le/e/a/NicoliveActivity;->miniTouchSequence:Z

    .line 47
    :cond_1
    iget-boolean v3, p0, Le/e/a/NicoliveActivity;->miniTouchSequence:Z

    if-eqz v3, :cond_3

    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eq v0, v2, :cond_2

    const/4 v2, 0x3

    if-eq v0, v2, :cond_2

    return p1

    .line 49
    :cond_2
    iput-boolean v1, p0, Le/e/a/NicoliveActivity;->miniTouchSequence:Z

    return p1

    .line 52
    :cond_3
    iget-object v0, p0, Le/e/a/NicoliveActivity;->listGestures:Le/e/a/NicoliveListGestures;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    invoke-virtual {v0, p0, v1, p1}, Le/e/a/NicoliveListGestures;->handle(Le/e/a/NicoliveActivity;Landroid/widget/ListView;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_4

    return v2

    .line 54
    :cond_4
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method fitViewer()V
    .registers 8

    .line 1040
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_4

    iget-object v0, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    if-lez v0, :cond_4

    iget-object v0, p0, Le/e/a/NicoliveActivity;->details:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_4

    iget-object v0, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    const/high16 v1, 0x43f00000    # 480.0f

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ge v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    iget-object v1, p0, Le/e/a/NicoliveActivity;->details:Landroid/widget/LinearLayout;

    const/16 v4, 0x8

    if-eqz v0, :cond_1

    move v0, v4

    goto :goto_1

    :cond_1
    move v0, v3

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 v0, 0x6

    new-array v1, v0, [Landroid/view/View;

    iget-object v5, p0, Le/e/a/NicoliveActivity;->details:Landroid/widget/LinearLayout;

    aput-object v5, v1, v3

    iget-object v5, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    aput-object v5, v1, v2

    const/4 v2, 0x2

    iget-object v5, p0, Le/e/a/NicoliveActivity;->tabs:Landroid/widget/LinearLayout;

    aput-object v5, v1, v2

    const/4 v2, 0x3

    iget-object v5, p0, Le/e/a/NicoliveActivity;->composer:Landroid/widget/LinearLayout;

    aput-object v5, v1, v2

    const/4 v2, 0x4

    iget-object v5, p0, Le/e/a/NicoliveActivity;->login:Landroid/widget/Button;

    aput-object v5, v1, v2

    const/4 v2, 0x5

    iget-object v5, p0, Le/e/a/NicoliveActivity;->latest:Landroid/widget/Button;

    aput-object v5, v1, v2

    move v2, v3

    :goto_2
    if-lt v3, v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3fe38e39

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/high16 v1, 0x42900000    # 72.0f

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    iget-object v3, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v3

    sub-int/2addr v3, v2

    const/high16 v2, 0x42800000    # 64.0f

    invoke-static {p0, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v2

    sub-int/2addr v3, v2

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {v1}, Le/e/a/NicolivePlayerFrame;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v2, v0, :cond_4

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object p0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {p0, v1}, Le/e/a/NicolivePlayerFrame;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_2
    aget-object v5, v1, v3

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-eq v6, v4, :cond_3

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v2, v5

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_4
    return-void
.end method

.method fromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .registers 2

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 67
    :cond_0
    const-string p0, "program"

    invoke-virtual {p1, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/NicoliveData;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    return-object p0

    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/NicoliveData;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method hub()V
    .registers 17

    move-object/from16 v0, p0

    .line 105
    iget-boolean v1, v0, Le/e/a/NicoliveActivity;->watching:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    invoke-direct {v0}, Le/e/a/NicoliveActivity;->recentFeed()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, v0, Le/e/a/NicoliveActivity;->recentReady:Z

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    iget-object v4, v0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-virtual {v4}, Le/e/a/NicoliveBrowser;->resumeImages()V

    iput-boolean v3, v0, Le/e/a/NicoliveActivity;->watching:Z

    iput-boolean v3, v0, Le/e/a/NicoliveActivity;->fullscreen:Z

    invoke-virtual {v0}, Le/e/a/NicoliveActivity;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x480

    invoke-virtual {v4, v5}, Landroid/view/Window;->clearFlags(I)V

    const/4 v4, -0x1

    invoke-virtual {v0, v4}, Le/e/a/NicoliveActivity;->setRequestedOrientation(I)V

    iget-object v5, v0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v5, :cond_1

    iget-object v6, v0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v6, :cond_1

    invoke-virtual {v5, v6}, Le/e/a/NicoliveService;->detach(Le/e/a/NicolivePlayerFrame;)V

    :cond_1
    const/4 v5, 0x0

    iput-object v5, v0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    iput-object v5, v0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    iput-object v5, v0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    .line 106
    iget-object v6, v0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v6, :cond_2

    iget-object v7, v0, Le/e/a/NicoliveActivity;->miniFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v7, :cond_2

    invoke-virtual {v6, v7}, Le/e/a/NicoliveService;->detach(Le/e/a/NicolivePlayerFrame;)V

    .line 107
    :cond_2
    iput-object v5, v0, Le/e/a/NicoliveActivity;->miniFrame:Le/e/a/NicolivePlayerFrame;

    iput-object v5, v0, Le/e/a/NicoliveActivity;->miniTitle:Landroid/widget/TextView;

    iput-object v5, v0, Le/e/a/NicoliveActivity;->miniPlay:Landroid/widget/ImageButton;

    iput-object v5, v0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    .line 108
    invoke-virtual {v0}, Le/e/a/NicoliveActivity;->base()V

    .line 109
    const-string v6, "back"

    const-string/jumbo v7, "\u623b\u308b"

    invoke-static {v0, v6, v7}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v6

    iget-object v7, v0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v7, Le/e/a/NicoliveActivity$16;

    invoke-direct {v7, v0}, Le/e/a/NicoliveActivity$16;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v6 .. v6}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    iget v6, v0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v7, 0x5

    if-ne v6, v7, :cond_3

    const-string v6, "\u30bf\u30a4\u30e0\u30b7\u30d5\u30c8\u4e88\u7d04\u30ea\u30b9\u30c8"

    goto :goto_1

    :cond_3
    const-string/jumbo v6, "\u751f\u653e\u9001"

    :goto_1
    const/16 v7, 0x12

    invoke-static {v0, v6, v7}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v6

    iput-object v6, v0, Le/e/a/NicoliveActivity;->heading:Landroid/widget/TextView;

    iget-object v7, v0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v8, v3, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v6, "more"

    const-string v7, "\u30cb\u30b3\u751f\u30e1\u30cb\u30e5\u30fc"

    invoke-static {v0, v6, v7}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v6

    const-string v7, "nicoid-live-menu"

    invoke-virtual {v6, v7}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    iget-object v7, v0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v7, Le/e/a/NicoliveActivity$18;

    invoke-direct {v7, v0}, Le/e/a/NicoliveActivity$18;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v6 .. v6}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 110
    iput-object v5, v0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    .line 111
    iget v6, v0, Le/e/a/NicoliveActivity;->hubTab:I

    const/high16 v7, 0x41600000    # 14.0f

    const/4 v8, 0x3

    const/high16 v10, 0x41400000    # 12.0f

    if-nez v6, :cond_4

    .line 112
    invoke-static {v0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v6

    const/16 v11, 0xa

    .line 113
    invoke-static {v0, v11}, Le/e/a/NicoliveUi;->panel(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v11

    invoke-virtual {v6, v11}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 114
    const-string/jumbo v11, "\u756a\u7d44\u540d / lv\u756a\u53f7 / URL"

    invoke-static {v0, v11}, Le/e/a/NicoliveUi;->input(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v11

    iput-object v11, v0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    .line 115
    invoke-virtual {v11, v5}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 116
    iget-object v11, v0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    invoke-static {v0, v10}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-virtual {v11, v12, v3, v3, v3}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 117
    iget-object v11, v0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    invoke-virtual {v11, v7}, Landroid/widget/EditText;->setTextSize(F)V

    .line 118
    iget-object v11, v0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    iget-object v12, v0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 119
    iget-object v11, v0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    invoke-virtual {v11, v8}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 120
    iget-object v11, v0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v3, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    const-string v11, "search"

    const-string/jumbo v12, "\u691c\u7d22 / \u756a\u7d44\u3092\u958b\u304f"

    invoke-static {v0, v11, v12}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v11

    .line 122
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x42300000    # 44.0f

    invoke-static {v0, v13}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v13

    invoke-direct {v12, v13, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    new-instance v12, Le/e/a/NicoliveActivity$19;

    invoke-direct {v12, v0}, Le/e/a/NicoliveActivity$19;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v11, v12}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v11 .. v11}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 124
    iget-object v11, v0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    new-instance v12, Le/e/a/NicoliveActivity$20;

    invoke-direct {v12, v0}, Le/e/a/NicoliveActivity$20;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 129
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x42280000    # 42.0f

    invoke-static {v0, v12}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-direct {v11, v4, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v12, 0x41200000    # 10.0f

    .line 130
    invoke-static {v0, v12}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v13

    const/high16 v14, 0x40800000    # 4.0f

    invoke-static {v0, v14}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v14

    invoke-static {v0, v12}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v12

    const/high16 v15, 0x40000000    # 2.0f

    invoke-static {v0, v15}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v15

    invoke-virtual {v11, v13, v14, v12, v15}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 131
    iget-object v12, v0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v12, v6, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 133
    :cond_4
    iput-object v5, v0, Le/e/a/NicoliveActivity;->categoryTabs:Landroid/widget/LinearLayout;

    .line 134
    iget v6, v0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v11, 0x4

    if-nez v6, :cond_7

    .line 135
    invoke-static {v0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v6

    iput-object v6, v0, Le/e/a/NicoliveActivity;->categoryTabs:Landroid/widget/LinearLayout;

    .line 136
    const-string v6, "\u3059\u3079\u3066"

    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v12, "\u30e6\u30fc\u30b6\u30fc"

    invoke-static {v12}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "\u516c\u5f0f"

    invoke-static {v13}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "\u30c1\u30e3\u30f3\u30cd\u30eb"

    invoke-static {v14}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    filled-new-array {v6, v12, v13, v14}, [Ljava/lang/String;

    move-result-object v6

    move v12, v3

    :goto_2
    if-lt v12, v11, :cond_5

    .line 146
    iget-object v6, v0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    iget-object v12, v0, Le/e/a/NicoliveActivity;->categoryTabs:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_4

    .line 139
    :cond_5
    aget-object v13, v6, v12

    invoke-static {v0, v13}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v13

    .line 140
    invoke-virtual {v13, v10}, Landroid/widget/Button;->setTextSize(F)V

    .line 141
    invoke-virtual {v13, v3, v3, v3, v3}, Landroid/widget/Button;->setPadding(IIII)V

    .line 142
    iget v14, v0, Le/e/a/NicoliveActivity;->category:I

    if-ne v12, v14, :cond_6

    move v14, v2

    goto :goto_3

    :cond_6
    move v14, v3

    :goto_3
    invoke-static {v13, v14}, Le/e/a/NicoliveUi;->selected(Landroid/widget/Button;Z)V

    .line 143
    iget-object v14, v0, Le/e/a/NicoliveActivity;->categoryTabs:Landroid/widget/LinearLayout;

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42200000    # 40.0f

    invoke-static {v0, v7}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-direct {v15, v3, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v14, v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    new-instance v7, Le/e/a/NicoliveActivity$21;

    invoke-direct {v7, v0, v12}, Le/e/a/NicoliveActivity$21;-><init>(Le/e/a/NicoliveActivity;I)V

    invoke-virtual {v13, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v13 .. v13}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 148
    :cond_7
    :goto_4
    iget v6, v0, Le/e/a/NicoliveActivity;->hubTab:I

    if-ne v6, v8, :cond_8

    iget-object v6, v0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    invoke-direct {v0}, Le/e/a/NicoliveActivity;->timetableControls()Landroid/widget/HorizontalScrollView;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 149
    :cond_8
    iget v6, v0, Le/e/a/NicoliveActivity;->hubTab:I

    if-ne v6, v2, :cond_9

    iget-object v6, v0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    invoke-direct {v0}, Le/e/a/NicoliveActivity;->followControls()Landroid/widget/LinearLayout;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_9
    const/16 v6, 0xd

    .line 150
    const-string v7, ""

    invoke-static {v0, v7, v6}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v6

    iput-object v6, v0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    .line 151
    invoke-static {v0, v10}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-static {v0, v10}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-virtual {v6, v12, v3, v10, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 152
    iget-object v6, v0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    const/4 v10, 0x2

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 153
    iget-object v6, v0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 154
    iget-object v6, v0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    invoke-static {v6}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result v10

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    invoke-static {v0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v6

    .line 156
    iget-object v10, v0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v3, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    iget v10, v0, Le/e/a/NicoliveActivity;->hubTab:I

    if-eqz v10, :cond_a

    if-ne v10, v8, :cond_b

    .line 158
    :cond_a
    invoke-static {v0, v7}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v8

    iput-object v8, v0, Le/e/a/NicoliveActivity;->sortButton:Landroid/widget/Button;

    .line 159
    const-string v10, "nicoid-live-sort"

    invoke-virtual {v8, v10}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 160
    iget-object v8, v0, Le/e/a/NicoliveActivity;->sortButton:Landroid/widget/Button;

    invoke-virtual {v8, v2}, Landroid/widget/Button;->setMaxLines(I)V

    .line 161
    iget-object v8, v0, Le/e/a/NicoliveActivity;->sortButton:Landroid/widget/Button;

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v8, v10}, Landroid/widget/Button;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 162
    invoke-direct {v0}, Le/e/a/NicoliveActivity;->updateSortLabel()V

    .line 163
    iget-object v8, v0, Le/e/a/NicoliveActivity;->sortButton:Landroid/widget/Button;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    invoke-direct {v10, v12, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    iget-object v8, v0, Le/e/a/NicoliveActivity;->sortButton:Landroid/widget/Button;

    new-instance v10, Le/e/a/NicoliveActivity$22;

    invoke-direct {v10, v0}, Le/e/a/NicoliveActivity$22;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v8, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v8 .. v8}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 166
    :cond_b
    iget v8, v0, Le/e/a/NicoliveActivity;->hubTab:I

    if-ne v8, v11, :cond_c

    invoke-direct {v0, v6}, Le/e/a/NicoliveActivity;->addRankingControls(Landroid/widget/LinearLayout;)V

    .line 167
    :cond_c
    iget-object v8, v0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x42100000    # 36.0f

    invoke-static {v0, v11}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v11

    invoke-direct {v10, v4, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v6, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    new-instance v6, Landroid/widget/FrameLayout;

    invoke-direct {v6, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 169
    iget-object v8, v0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v4, v3, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v6, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 170
    new-instance v8, Landroid/widget/ListView;

    invoke-direct {v8, v0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    .line 171
    invoke-virtual {v8, v5}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 172
    iget-object v8, v0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    invoke-virtual {v8, v3}, Landroid/widget/ListView;->setCacheColorHint(I)V

    .line 173
    iget-object v8, v0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    invoke-virtual {v8, v3}, Landroid/widget/ListView;->setClipToPadding(Z)V

    .line 174
    new-instance v8, Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-direct {v8, v0}, Le/e/a/NicoliveActivity$FeedAdapter;-><init>(Le/e/a/NicoliveActivity;)V

    iput-object v8, v0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    .line 175
    iget-object v9, v0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    invoke-virtual {v9, v8}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 176
    iget-object v8, v0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v9, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    iget-object v4, v0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    new-instance v8, Le/e/a/NicoliveActivity$23;

    invoke-direct {v8, v0}, Le/e/a/NicoliveActivity$23;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v4, v8}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-static/range {v4 .. v4}, Le/e/a/PressFeedback;->list(Landroid/widget/AbsListView;)V

    .line 183
    iget-object v4, v0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    new-instance v8, Le/e/a/NicoliveActivity$24;

    invoke-direct {v8, v0}, Le/e/a/NicoliveActivity$24;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v4, v8}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 189
    const-string v4, "refresh"

    const-string v8, "\u4e00\u89a7\u3092\u66f4\u65b0"

    invoke-static {v0, v4, v8}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v4

    iput-object v4, v0, Le/e/a/NicoliveActivity;->bottomRefresh:Landroid/widget/ImageButton;

    .line 190
    const-string v8, "nicoid-live-bottom-refresh"

    invoke-virtual {v4, v8}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 191
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 192
    invoke-virtual {v4, v2}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 193
    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v8

    invoke-virtual {v4, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 194
    iget-object v8, v0, Le/e/a/NicoliveActivity;->bottomRefresh:Landroid/widget/ImageButton;

    invoke-virtual {v8, v4}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v4, 0x41600000    # 14.0f

    .line 195
    invoke-static {v0, v4}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v4

    .line 196
    iget-object v8, v0, Le/e/a/NicoliveActivity;->bottomRefresh:Landroid/widget/ImageButton;

    invoke-virtual {v8, v4, v4, v4, v4}, Landroid/widget/ImageButton;->setPadding(IIII)V

    const/high16 v8, 0x42680000    # 58.0f

    .line 197
    invoke-static {v0, v8}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v8

    .line 198
    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v10, 0x55

    invoke-direct {v9, v8, v8, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 199
    invoke-virtual {v9, v3, v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 200
    iget-object v4, v0, Le/e/a/NicoliveActivity;->bottomRefresh:Landroid/widget/ImageButton;

    invoke-virtual {v6, v4, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 201
    iget-object v4, v0, Le/e/a/NicoliveActivity;->bottomRefresh:Landroid/widget/ImageButton;

    new-instance v6, Le/e/a/NicoliveActivity$25;

    invoke-direct {v6, v0}, Le/e/a/NicoliveActivity$25;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v4, v6}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v4 .. v4}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 202
    invoke-direct {v0}, Le/e/a/NicoliveActivity;->updateHubDisplayOptions()V

    .line 205
    iput-object v5, v0, Le/e/a/NicoliveActivity;->nowPlayingBar:Landroid/widget/LinearLayout;

    .line 206
    new-instance v4, Le/e/a/NicolivePlayerFrame;

    invoke-direct {v4, v0, v3}, Le/e/a/NicolivePlayerFrame;-><init>(Landroid/content/Context;Z)V

    iput-object v4, v0, Le/e/a/NicoliveActivity;->miniFrame:Le/e/a/NicolivePlayerFrame;

    .line 207
    invoke-virtual {v4, v2}, Le/e/a/NicolivePlayerFrame;->compact(Z)V

    .line 208
    iget-object v2, v0, Le/e/a/NicoliveActivity;->miniFrame:Le/e/a/NicolivePlayerFrame;

    .line 209
    new-instance v4, Le/e/a/NicoliveActivity$26;

    invoke-direct {v4, v0}, Le/e/a/NicoliveActivity$26;-><init>(Le/e/a/NicoliveActivity;)V

    .line 210
    new-instance v5, Le/e/a/NicoliveActivity$17;

    invoke-direct {v5, v0}, Le/e/a/NicoliveActivity$17;-><init>(Le/e/a/NicoliveActivity;)V

    .line 208
    invoke-static {v0, v2, v4, v5}, Le/e/a/NicoliveFloatingMini206;->install(Le/e/a/NicoliveActivity;Le/e/a/NicolivePlayerFrame;Ljava/lang/Runnable;Ljava/lang/Runnable;)Le/e/a/NicoliveFloatingMini206;

    move-result-object v2

    iput-object v2, v0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    .line 212
    iget-object v2, v0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    invoke-direct {v0}, Le/e/a/NicoliveActivity;->hubNavigation()Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 213
    iget-object v2, v0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    iget-object v4, v0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    iget-object v5, v0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    invoke-direct {v0}, Le/e/a/NicoliveActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-static {v6}, Le/e/a/NicoliveAppBarPlacement;->position(Landroid/content/SharedPreferences;)I

    move-result v6

    invoke-static {v2, v4, v5, v6}, Le/e/a/NicoliveAppBarPlacement;->place(Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroid/view/View;I)V

    .line 214
    invoke-virtual {v0}, Le/e/a/NicoliveActivity;->updateNowPlaying()V

    if-eqz v1, :cond_d

    .line 216
    iput-boolean v3, v0, Le/e/a/NicoliveActivity;->loading:Z

    .line 217
    iget-object v1, v0, Le/e/a/NicoliveActivity;->pendingRecent:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    .line 218
    invoke-direct {v0, v7}, Le/e/a/NicoliveActivity;->updateRecentStatus(Ljava/lang/String;)V

    .line 219
    iget-object v1, v0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    iget v2, v0, Le/e/a/NicoliveActivity;->feedPosition:I

    iget v0, v0, Le/e/a/NicoliveActivity;->feedOffset:I

    invoke-virtual {v1, v2, v0}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    return-void

    .line 221
    :cond_d
    invoke-direct {v0}, Le/e/a/NicoliveActivity;->recentFeed()Z

    move-result v1

    if-nez v1, :cond_e

    iget-object v1, v0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 222
    :cond_e
    invoke-virtual {v0}, Le/e/a/NicoliveActivity;->load()V

    return-void
.end method

.method synthetic lambda$0$e-e-a-NicoliveActivity(I)V
    .registers 3

    .line 104
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    if-nez v0, :cond_1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Le/e/a/NicoliveActivity;->info:Z

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->showPane()V

    :cond_1
    return-void

    :cond_2
    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->moveCategory(I)V

    return-void
.end method

.method synthetic lambda$1$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 2

    .line 109
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->exitHub()V

    return-void
.end method

.method synthetic lambda$10$e-e-a-NicoliveActivity()V
    .registers 2

    .line 209
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->activeBroadcast()Le/e/a/NicoliveService;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {p0, v0}, Le/e/a/NicoliveActivity;->watch(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$11$e-e-a-NicoliveActivity()V
    .registers 2

    .line 210
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->activeBroadcast()Le/e/a/NicoliveService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Le/e/a/NicoliveService;->stopPlayback()V

    :cond_0
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->updateNowPlaying()V

    return-void
.end method

.method synthetic lambda$12$e-e-a-NicoliveActivity(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 0
    if-eqz p2, :cond_2

    const/4 p1, 0x1

    if-eq p2, p1, :cond_1

    const/4 p1, 0x2

    if-eq p2, p1, :cond_0

    return-void

    .line 241
    :cond_0
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->officialPage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->openBrowser(Ljava/lang/String;)V

    return-void

    .line 240
    :cond_1
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->showHubSettings()V

    return-void

    .line 239
    :cond_2
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->refreshFeed()V

    return-void
.end method

.method synthetic lambda$13$e-e-a-NicoliveActivity([ILandroid/widget/Button;Landroid/view/View;)V
    .registers 7

    .line 298
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    .line 299
    const-string v0, "\u30cb\u30b3\u751f\u3092\u9589\u3058\u308b\u3068\u304d\u306e\u78ba\u8a8d"

    invoke-virtual {p3, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    .line 300
    invoke-static {p0}, Le/e/a/ExitModeOptions;->labels(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    aget v1, p1, v1

    new-instance v2, Le/e/a/NicoliveActivity$33;

    invoke-direct {v2, p0, p1, p2}, Le/e/a/NicoliveActivity$33;-><init>(Le/e/a/NicoliveActivity;[ILandroid/widget/Button;)V

    invoke-virtual {p3, v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    .line 304
    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 298
    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$14$e-e-a-NicoliveActivity([ILandroid/widget/Button;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    const/4 v0, 0x3

    .line 301
    aput p4, p1, v0

    .line 302
    invoke-static {p0}, Le/e/a/ExitModeOptions;->labels(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p1

    aget-object p1, p1, p4

    const-string p4, "\u30cb\u30b3\u751f\u3092\u9589\u3058\u308b\u3068\u304d\u306e\u78ba\u8a8d"

    invoke-direct {p0, p2, p4, p1}, Le/e/a/NicoliveActivity;->showChoiceValue(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method synthetic lambda$15$e-e-a-NicoliveActivity([ILandroid/content/SharedPreferences;Landroid/widget/CheckBox;Landroid/content/DialogInterface;I)V
    .registers 8

    .line 0
    const/4 p4, 0x0

    .line 310
    aget p5, p1, p4

    sget-object v0, Le/e/a/NicoliveActivity;->HUB_TABS:[I

    array-length v1, v0

    if-ne p5, v1, :cond_0

    const/4 p5, -0x1

    goto :goto_0

    :cond_0
    aget p5, v0, p5

    .line 311
    :goto_0
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const/4 v0, 0x3

    aget v0, p1, v0

    const-string v1, "nicolive_exit_mode"

    invoke-interface {p2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    .line 312
    const-string v0, "nicolive_float_refresh"

    invoke-virtual {p3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p3

    invoke-interface {p2, v0, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string p3, "nicolive_start_tab"

    invoke-interface {p2, p3, p5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const/4 p3, 0x1

    .line 313
    aget p5, p1, p3

    if-ne p5, p3, :cond_1

    move p4, p3

    :cond_1
    const-string p3, "nicolive_start_time"

    invoke-interface {p2, p3, p4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const/4 p3, 0x2

    aget p3, p1, p3

    const-string p4, "nicolive_tap_behavior"

    invoke-interface {p2, p4, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    .line 314
    const-string p3, "nicoid_live_app_bar_position"

    const/4 p4, 0x4

    aget p5, p1, p4

    invoke-interface {p2, p3, p5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 315
    iget-boolean p2, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez p2, :cond_2

    iget-object p2, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    iget-object p3, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    iget-object p5, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    aget p1, p1, p4

    invoke-static {p2, p3, p5, p1}, Le/e/a/NicoliveAppBarPlacement;->place(Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroid/view/View;I)V

    .line 316
    :cond_2
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->updateHubDisplayOptions()V

    return-void
.end method

.method synthetic lambda$16$e-e-a-NicoliveActivity(Ljava/lang/String;[Ljava/lang/String;[IILandroid/widget/Button;Landroid/view/View;)V
    .registers 15

    .line 373
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p6

    invoke-virtual {p6, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p6

    .line 374
    aget v0, p3, p4

    new-instance v1, Le/e/a/NicoliveActivity$31;

    move-object v2, p0

    move-object v6, p1

    move-object v7, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v1 .. v7}, Le/e/a/NicoliveActivity$31;-><init>(Le/e/a/NicoliveActivity;[IILandroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {p6, v7, v0, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    .line 378
    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 373
    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$17$e-e-a-NicoliveActivity([IILandroid/widget/Button;Ljava/lang/String;[Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 8

    .line 375
    aput p7, p1, p2

    .line 376
    aget-object p1, p5, p7

    invoke-direct {p0, p3, p4, p1}, Le/e/a/NicoliveActivity;->showChoiceValue(Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    invoke-interface {p6}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method synthetic lambda$18$e-e-a-NicoliveActivity(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 408
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->finish()V

    return-void
.end method

.method synthetic lambda$19$e-e-a-NicoliveActivity(ILandroid/view/View;)V
    .registers 5

    .line 423
    iget p2, p0, Le/e/a/NicoliveActivity;->hubTab:I

    if-ne p2, p1, :cond_0

    return-void

    :cond_0
    const/4 p2, 0x0

    .line 424
    iput-boolean p2, p0, Le/e/a/NicoliveActivity;->recentReady:Z

    .line 425
    iput p1, p0, Le/e/a/NicoliveActivity;->hubTab:I

    .line 426
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "nicolive_last_tab"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 427
    const-string p1, ""

    iput-object p1, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    .line 428
    iput p2, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    .line 429
    iput p2, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    .line 430
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    return-void
.end method

.method synthetic lambda$2$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 2

    .line 109
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->showHubMenu()V

    return-void
.end method

.method synthetic lambda$20$e-e-a-NicoliveActivity(Landroid/view/MenuItem;)Z
    .registers 3

    .line 455
    invoke-static {}, Le/e/a/NicoliveCatalog$Sort;->values()[Le/e/a/NicoliveCatalog$Sort;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    aget-object p1, v0, p1

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->selectSort(Le/e/a/NicoliveCatalog$Sort;)V

    const/4 p0, 0x1

    return p0
.end method

.method synthetic lambda$21$e-e-a-NicoliveActivity(ILandroid/view/View;)V
    .registers 3

    .line 641
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->selectFollow(I)V

    return-void
.end method

.method synthetic lambda$22$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;Landroid/content/DialogInterface;I)V
    .registers 11

    .line 658
    const-string p2, "nicolive_history"

    const/4 p3, 0x1

    :try_start_0
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 659
    new-instance v1, Lorg/json/JSONArray;

    const-string v2, "[]"

    invoke-interface {v0, p2, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 660
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    const/4 v3, 0x0

    .line 661
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v3, v4, :cond_3

    .line 665
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p2

    if-nez p2, :cond_0

    .line 666
    const-string/jumbo p1, "\u8996\u8074\u5c65\u6b74\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 668
    :cond_0
    iget p2, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v0, 0x2

    if-ne p2, v0, :cond_2

    iget-boolean p2, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez p2, :cond_2

    iget-object p2, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    new-instance v0, Le/e/a/NicoliveActivity$39;

    invoke-direct {v0, p1}, Le/e/a/NicoliveActivity$39;-><init>(Le/e/a/NicoliveData$Program;)V

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    iget-object p1, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    const-string/jumbo p1, "\u8996\u8074\u5c65\u6b74\u306f\u3042\u308a\u307e\u305b\u3093"

    goto :goto_1

    :cond_1
    const-string/jumbo p1, "\u8996\u8074\u5c65\u6b74"

    :goto_1
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->showResults(Ljava/lang/String;)V

    :cond_2
    return-void

    .line 662
    :cond_3
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 663
    iget-object v5, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    const-string v6, "nicoliveProgramId"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    :cond_4
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 669
    :catch_0
    const-string/jumbo p1, "\u8996\u8074\u5c65\u6b74\u3092\u524a\u9664\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$24$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 680
    iget-object p3, p0, Le/e/a/NicoliveActivity;->reserving:Ljava/util/Set;

    iget-object p4, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-interface {p3, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_0

    return-void

    .line 681
    :cond_0
    iget-object p3, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    iget-object p4, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    new-instance v0, Le/e/a/NicoliveActivity$5;

    invoke-direct {v0, p0, p1}, Le/e/a/NicoliveActivity$5;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    invoke-virtual {p3, p4, p2, v0}, Le/e/a/NicoliveBrowser;->cancelReservation(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method synthetic lambda$25$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 726
    iget-object p3, p0, Le/e/a/NicoliveActivity;->reserving:Ljava/util/Set;

    iget-object p4, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-interface {p3, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_0

    return-void

    .line 727
    :cond_0
    iget-object p3, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    iget-object p4, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    new-instance v0, Le/e/a/NicoliveActivity$7;

    invoke-direct {v0, p0, p1}, Le/e/a/NicoliveActivity$7;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    invoke-virtual {p3, p4, p2, v0}, Le/e/a/NicoliveBrowser;->reserve(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method synthetic lambda$28$e-e-a-NicoliveActivity(Landroid/widget/Button;Landroid/view/View;)V
    .registers 7

    .line 806
    new-instance p2, Landroid/widget/PopupMenu;

    invoke-direct {p2, p0, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 807
    invoke-virtual {p2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p1

    const-string v0, "\u30e6\u30fc\u30b6\u30fc\u756a\u7d44"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-interface {p1, v1, v2, v1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 808
    invoke-virtual {p2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p1

    const/4 v0, 0x2

    const-string v3, "\u516c\u5f0f\u30fb\u30c1\u30e3\u30f3\u30cd\u30eb\u756a\u7d44"

    invoke-interface {p1, v1, v0, v2, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 809
    new-instance p1, Le/e/a/NicoliveActivity$65;

    invoke-direct {p1, p0}, Le/e/a/NicoliveActivity$65;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {p2, p1}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 814
    invoke-virtual {p2}, Landroid/widget/PopupMenu;->show()V

    return-void
.end method

.method synthetic lambda$29$e-e-a-NicoliveActivity(Landroid/view/MenuItem;)Z
    .registers 5

    .line 810
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v0

    .line 811
    :goto_0
    iget-boolean v2, p0, Le/e/a/NicoliveActivity;->rankingUsers:Z

    if-eq v2, p1, :cond_1

    iput-boolean p1, p0, Le/e/a/NicoliveActivity;->rankingUsers:Z

    iput v0, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    iput v0, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    :cond_1
    return v1
.end method

.method synthetic lambda$3$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 2

    .line 123
    iget-object p1, p0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->searchValue(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$30$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 6

    .line 820
    invoke-static {}, Le/e/a/NicoliveCatalog$Broadcast;->values()[Le/e/a/NicoliveCatalog$Broadcast;

    move-result-object p1

    .line 821
    array-length v0, p1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 822
    :goto_0
    array-length v2, p1

    if-lt v1, v2, :cond_0

    .line 823
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u30e9\u30f3\u30ad\u30f3\u30b0\u306e\u5bfe\u8c61"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 824
    iget-object v2, p0, Le/e/a/NicoliveActivity;->rankingState:Le/e/a/NicoliveCatalog$Broadcast;

    invoke-virtual {v2}, Le/e/a/NicoliveCatalog$Broadcast;->ordinal()I

    move-result v2

    new-instance v3, Le/e/a/NicoliveActivity$41;

    invoke-direct {v3, p0, p1}, Le/e/a/NicoliveActivity$41;-><init>(Le/e/a/NicoliveActivity;[Le/e/a/NicoliveCatalog$Broadcast;)V

    invoke-virtual {v1, v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 827
    const-string/jumbo p1, "\u9589\u3058\u308b"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 828
    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void

    .line 822
    :cond_0
    aget-object v2, p1, v1

    iget-object v2, v2, Le/e/a/NicoliveCatalog$Broadcast;->label:Ljava/lang/String;

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method synthetic lambda$31$e-e-a-NicoliveActivity([Le/e/a/NicoliveCatalog$Broadcast;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 825
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 826
    iget-object p2, p0, Le/e/a/NicoliveActivity;->rankingState:Le/e/a/NicoliveCatalog$Broadcast;

    aget-object p1, p1, p3

    if-eq p2, p1, :cond_0

    iput-object p1, p0, Le/e/a/NicoliveActivity;->rankingState:Le/e/a/NicoliveCatalog$Broadcast;

    const/4 p1, 0x0

    iput p1, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    iput p1, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    :cond_0
    return-void
.end method

.method synthetic lambda$33$e-e-a-NicoliveActivity(Ljava/time/LocalDate;ZLandroid/view/View;)V
    .registers 4

    .line 886
    invoke-direct {p0, p1, p2}, Le/e/a/NicoliveActivity;->selectTimetableDay(Ljava/time/LocalDate;Z)V

    return-void
.end method

.method synthetic lambda$34$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;)V
    .registers 2

    .line 961
    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->watch(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$35$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;)V
    .registers 2

    .line 962
    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->openPopupFromHub(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$36$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;)V
    .registers 2

    .line 964
    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->openTimetableProgram(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$37$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;)V
    .registers 2

    .line 967
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->confirmHistoryRemoval(Le/e/a/NicoliveData$Program;)V

    return-void
.end method

.method synthetic lambda$38$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;)V
    .registers 2

    .line 969
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->confirmReservationRemoval(Le/e/a/NicoliveData$Program;)V

    return-void
.end method

.method synthetic lambda$39$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;)V
    .registers 2

    .line 971
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->confirmReservation(Le/e/a/NicoliveData$Program;)V

    return-void
.end method

.method synthetic lambda$4$e-e-a-NicoliveActivity(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 4

    .line 0
    const/4 p1, 0x3

    if-eq p2, p1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 126
    :cond_0
    iget-object p1, p0, Le/e/a/NicoliveActivity;->searchInput:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->searchValue(Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method

.method synthetic lambda$41$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Program;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 1016
    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->openTimetableProgram(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$42$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 2

    .line 1026
    iget-object p1, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    :cond_0
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    return-void
.end method

.method synthetic lambda$43$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 2

    .line 1026
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->popup()V

    return-void
.end method

.method synthetic lambda$44$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 2

    .line 1026
    iget-object p0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveService;->reconnect()V

    :cond_0
    return-void
.end method

.method synthetic lambda$45$e-e-a-NicoliveActivity(Ljava/lang/String;Landroid/view/View;)V
    .registers 3

    .line 1029
    const-string/jumbo p2, "\u756a\u7d44\u60c5\u5831"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/NicoliveActivity;->info:Z

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->showPane()V

    return-void
.end method

.method synthetic lambda$46$e-e-a-NicoliveActivity(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 6

    .line 1030
    iget-object p1, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/NicoliveData$Chat;

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->commentMenu(Le/e/a/NicoliveData$Chat;)V

    const/4 p0, 0x1

    return p0
.end method

.method synthetic lambda$47$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 5

    .line 0
    const/4 p1, 0x1

    .line 1032
    iput-boolean p1, p0, Le/e/a/NicoliveActivity;->atBottom:Z

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/NicoliveActivity;->newComments:I

    iget-object v1, p0, Le/e/a/NicoliveActivity;->latest:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    iget-object p0, p0, Le/e/a/NicoliveActivity;->comments:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr p0, p1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setSelection(I)V

    return-void
.end method

.method synthetic lambda$48$e-e-a-NicoliveActivity(Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 1033
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "nicolive_anonymous"

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method synthetic lambda$49$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 2

    .line 1033
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->send()V

    return-void
.end method

.method synthetic lambda$5$e-e-a-NicoliveActivity(ILandroid/view/View;)V
    .registers 3

    .line 144
    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->selectCategory(I)V

    return-void
.end method

.method synthetic lambda$50$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 3

    .line 1033
    :try_start_0
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "com.sauzask.nicoid.ModernLoginActivity"

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const-string p1, "\u30ed\u30b0\u30a4\u30f3\u753b\u9762\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$51$e-e-a-NicoliveActivity()V
    .registers 1

    .line 1033
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->fitViewer()V

    return-void
.end method

.method synthetic lambda$52$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Chat;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    if-nez p3, :cond_0

    .line 1057
    const-string p2, "clipboard"

    invoke-virtual {p0, p2}, Le/e/a/NicoliveActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/ClipboardManager;

    const-string p2, "\u30b3\u30e1\u30f3\u30c8"

    iget-object p1, p1, Le/e/a/NicoliveData$Chat;->text:Ljava/lang/String;

    invoke-static {p2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    return-void

    :cond_0
    iget-object p2, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz p2, :cond_2

    const/4 v0, 0x1

    iget-object p2, p2, Le/e/a/NicoliveService;->ng:Le/e/a/NicoliveNg;

    if-ne p3, v0, :cond_1

    iget-object p1, p1, Le/e/a/NicoliveData$Chat;->user:Ljava/lang/String;

    invoke-virtual {p2, p1}, Le/e/a/NicoliveNg;->addUser(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p1, p1, Le/e/a/NicoliveData$Chat;->text:Ljava/lang/String;

    invoke-virtual {p2, p1}, Le/e/a/NicoliveNg;->addWord(Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object p1, p1, Le/e/a/NicoliveService;->history:Ljava/util/ArrayDeque;

    new-instance p2, Le/e/a/NicoliveActivity$40;

    invoke-direct {p2, p0}, Le/e/a/NicoliveActivity$40;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {p1, p2}, Ljava/util/ArrayDeque;->removeIf(Ljava/util/function/Predicate;)Z

    iget-object p1, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    iget-object p1, p1, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {p1}, Le/e/a/NicoliveCommentsView;->clear()V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->changed()V

    :cond_2
    return-void
.end method

.method synthetic lambda$53$e-e-a-NicoliveActivity(Le/e/a/NicoliveData$Chat;)Z
    .registers 2

    .line 1057
    iget-object p0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object p0, p0, Le/e/a/NicoliveService;->ng:Le/e/a/NicoliveNg;

    invoke-virtual {p0, p1}, Le/e/a/NicoliveNg;->blocked(Le/e/a/NicoliveData$Chat;)Z

    move-result p0

    return p0
.end method

.method synthetic lambda$54$e-e-a-NicoliveActivity(Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 1060
    iget-object p2, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-nez p2, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p3, p2, :cond_1

    iget-object p0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/NicoliveService;->selectQuality(Ljava/lang/String;)V

    return-void

    :cond_1
    if-ne p3, p2, :cond_2

    iget-object p0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {p0}, Le/e/a/NicoliveService;->reconnect()V

    return-void

    :cond_2
    add-int/lit8 p2, p2, 0x1

    if-ne p3, p2, :cond_3

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->popup()V

    return-void

    :cond_3
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->ngSettings()V

    return-void
.end method

.method synthetic lambda$56$e-e-a-NicoliveActivity(Ljava/util/ArrayList;[ZLjava/util/ArrayList;Ljava/util/Set;Ljava/util/Set;Landroid/content/DialogInterface;I)V
    .registers 9

    .line 0
    const/4 p6, 0x0

    .line 1061
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p7

    if-lt p6, p7, :cond_1

    iget-object p1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p1, Le/e/a/NicoliveService;->ng:Le/e/a/NicoliveNg;

    iget-object p1, p1, Le/e/a/NicoliveNg;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "nicolive_ng_users"

    invoke-interface {p1, p2, p4}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "nicolive_ng_words"

    invoke-interface {p1, p2, p5}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object p0, p0, Le/e/a/NicoliveService;->ng:Le/e/a/NicoliveNg;

    invoke-virtual {p0}, Le/e/a/NicoliveNg;->reload()V

    return-void

    :cond_1
    aget-boolean p7, p2, p6

    if-eqz p7, :cond_3

    invoke-virtual {p3, p6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p7

    check-cast p7, Ljava/lang/String;

    const-string v0, "\u30e6\u30fc\u30b6\u30fc: "

    invoke-virtual {p7, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p7

    if-eqz p7, :cond_2

    invoke-virtual {p1, p6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p7

    invoke-interface {p4, p7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-virtual {p1, p6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p7

    invoke-interface {p5, p7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_3
    :goto_1
    add-int/lit8 p6, p6, 0x1

    goto :goto_0
.end method

.method synthetic lambda$7$e-e-a-NicoliveActivity(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6

    .line 178
    iget-object p1, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {p1}, Le/e/a/NicoliveActivity$FeedAdapter;->getCount()I

    move-result p1

    if-lt p3, p1, :cond_0

    return-void

    .line 179
    :cond_0
    iget-object p1, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {p1, p3}, Le/e/a/NicoliveActivity$FeedAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/NicoliveData$Program;

    .line 180
    iget p2, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 p3, 0x3

    if-eq p2, p3, :cond_1

    const/4 p3, 0x1

    if-eq p2, p3, :cond_1

    const/4 p3, 0x4

    if-eq p2, p3, :cond_1

    const/4 p3, 0x5

    if-ne p2, p3, :cond_2

    :cond_1
    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->openTimetableProgram(Ljava/lang/String;)V

    return-void

    .line 181
    :cond_2
    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->openSelectedProgram(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$8$e-e-a-NicoliveActivity(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 6

    .line 184
    iget-object p1, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {p1}, Le/e/a/NicoliveActivity$FeedAdapter;->getCount()I

    move-result p1

    if-lt p3, p1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 185
    :cond_0
    iget-object p1, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {p1, p3}, Le/e/a/NicoliveActivity$FeedAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/NicoliveData$Program;

    .line 186
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->showProgramActions(Le/e/a/NicoliveData$Program;)V

    const/4 p0, 0x1

    return p0
.end method

.method synthetic lambda$9$e-e-a-NicoliveActivity(Landroid/view/View;)V
    .registers 2

    .line 201
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->refreshFeed()V

    return-void
.end method

.method load()V
    .registers 6

    .line 521
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Le/e/a/NicoliveActivity;->loadToken:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Le/e/a/NicoliveActivity;->loadToken:I

    iput-boolean v1, p0, Le/e/a/NicoliveActivity;->loading:Z

    iget-object v2, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    const-string v3, "\u53d6\u5f97\u4e2d\u2026"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 522
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->recentFeed()Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_2

    .line 523
    iget-object v1, p0, Le/e/a/NicoliveActivity;->pendingRecent:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    .line 524
    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->recentReady:Z

    if-nez v1, :cond_1

    .line 525
    iget-object v1, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 526
    iget-object v1, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {v1}, Le/e/a/NicoliveActivity$FeedAdapter;->notifyDataSetChanged()V

    .line 528
    :cond_1
    invoke-direct {p0, v3}, Le/e/a/NicoliveActivity;->updateRecentStatus(Ljava/lang/String;)V

    .line 529
    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v4, v1, v4}, Le/e/a/NicoliveActivity;->loadRecentPage(IILjava/lang/String;Z)V

    return-void

    .line 532
    :cond_2
    iget v2, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_3

    invoke-direct {p0, v0}, Le/e/a/NicoliveActivity;->loadTimetable(I)V

    return-void

    :cond_3
    const/4 v3, 0x4

    if-ne v2, v3, :cond_4

    .line 533
    invoke-direct {p0, v0}, Le/e/a/NicoliveActivity;->loadRanking(I)V

    return-void

    :cond_4
    const/4 v3, 0x5

    if-ne v2, v3, :cond_5

    .line 534
    invoke-direct {p0, v0}, Le/e/a/NicoliveActivity;->loadReservations(I)V

    return-void

    :cond_5
    if-ne v2, v1, :cond_6

    .line 535
    invoke-direct {p0, v0}, Le/e/a/NicoliveActivity;->loadFollowing(I)V

    return-void

    :cond_6
    const/4 v1, 0x2

    if-ne v2, v1, :cond_b

    .line 536
    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "nicolive_history"

    const-string v3, "[]"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    move v1, v4

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_9

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_7

    const/4 v2, 0x0

    goto :goto_1

    :cond_7
    invoke-static {v2}, Le/e/a/NicoliveData$Program;->listing(Lorg/json/JSONObject;)Le/e/a/NicoliveData$Program;

    move-result-object v2

    :goto_1
    if-eqz v2, :cond_8

    iget-object v3, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    :cond_9
    iput-boolean v4, p0, Le/e/a/NicoliveActivity;->loading:Z

    iget-object v0, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    const-string/jumbo v1, "\u8996\u8074\u5c65\u6b74\u306f\u3042\u308a\u307e\u305b\u3093"

    goto :goto_2

    :cond_a
    const-string/jumbo v1, "\u8996\u8074\u5c65\u6b74"

    :goto_2
    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {p0}, Le/e/a/NicoliveActivity$FeedAdapter;->notifyDataSetChanged()V

    return-void

    .line 537
    :cond_b
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://live.nicovideo.jp/search?keyword="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 538
    iget-object v2, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/NicoliveActivity$2;

    invoke-direct {v4, p0, v0}, Le/e/a/NicoliveActivity$2;-><init>(Le/e/a/NicoliveActivity;I)V

    invoke-virtual {v2, v1, v3, v4}, Le/e/a/NicoliveBrowser;->load(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method moveCategory(I)V
    .registers 6

    .line 502
    iget v0, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v1, 0x0

    const/4 v2, 0x3

    if-nez v0, :cond_0

    iget v0, p0, Le/e/a/NicoliveActivity;->category:I

    add-int/2addr v0, p1

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->selectCategory(I)V

    return-void

    :cond_0
    const/4 v3, 0x1

    if-ne v0, v3, :cond_1

    .line 503
    iget v0, p0, Le/e/a/NicoliveActivity;->followFilter:I

    add-int/2addr v0, p1

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->selectFollow(I)V

    return-void

    :cond_1
    if-ne v0, v2, :cond_2

    .line 504
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->moveTimetable(I)V

    :cond_2
    return-void
.end method

.method ngSettings()V
    .registers 9

    .line 1061
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v6, Ljava/util/HashSet;

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->ng:Le/e/a/NicoliveNg;

    iget-object v0, v0, Le/e/a/NicoliveNg;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "nicolive_ng_users"

    sget-object v2, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    invoke-direct {v6, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v7, Ljava/util/HashSet;

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->ng:Le/e/a/NicoliveNg;

    iget-object v0, v0, Le/e/a/NicoliveNg;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "nicolive_ng_words"

    sget-object v2, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    invoke-direct {v7, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v4, v0, [Z

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "\u751f\u653e\u9001\u306eNG\u8a2d\u5b9a"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/CharSequence;

    new-instance v2, Le/e/a/NicoliveActivity$51;

    invoke-direct {v2, v4}, Le/e/a/NicoliveActivity$51;-><init>([Z)V

    invoke-virtual {v0, v1, v4, v2}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Le/e/a/NicoliveActivity$52;

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Le/e/a/NicoliveActivity$52;-><init>(Le/e/a/NicoliveActivity;Ljava/util/ArrayList;[ZLjava/util/ArrayList;Ljava/util/Set;Ljava/util/Set;)V

    const-string/jumbo p0, "\u9078\u629e\u3092\u524a\u9664"

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string/jumbo v0, "\u9589\u3058\u308b"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void

    :cond_1
    move-object v2, p0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "\u30ef\u30fc\u30c9: "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object p0, v2

    goto :goto_1

    :cond_2
    move-object v2, p0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "\u30e6\u30fc\u30b6\u30fc: "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object p0, v2

    goto/16 :goto_0
.end method

.method officialPage()Ljava/lang/String;
    .registers 3

    .line 382
    iget v0, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_6

    const/4 v1, 0x2

    if-eq v0, v1, :cond_5

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    .line 391
    iget-object v0, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "https://live.nicovideo.jp/recent"

    return-object p0

    .line 392
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://live.nicovideo.jp/search?keyword="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 390
    :cond_1
    const-string p0, "https://www.nicovideo.jp/my/timeshift-reservations"

    return-object p0

    .line 383
    :cond_2
    iget-object p0, p0, Le/e/a/NicoliveActivity;->rankingState:Le/e/a/NicoliveCatalog$Broadcast;

    invoke-static {p0}, Le/e/a/NicoliveCatalog;->rankingUrl(Le/e/a/NicoliveCatalog$Broadcast;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 385
    :cond_3
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    if-eqz v0, :cond_4

    const-string p0, "https://live.nicovideo.jp/timetable"

    return-object p0

    :cond_4
    iget-object p0, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-static {p0}, Le/e/a/NicoliveCatalog;->timetableUrl(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 389
    :cond_5
    const-string p0, "https://www.nicovideo.jp/my/history/live"

    return-object p0

    .line 387
    :cond_6
    iget v0, p0, Le/e/a/NicoliveActivity;->followFilter:I

    if-nez v0, :cond_7

    sget-object p0, Le/e/a/NicoliveCatalog$Broadcast;->LIVE:Le/e/a/NicoliveCatalog$Broadcast;

    goto :goto_0

    .line 388
    :cond_7
    invoke-static {}, Le/e/a/NicoliveCatalog$Broadcast;->values()[Le/e/a/NicoliveCatalog$Broadcast;

    move-result-object v0

    iget p0, p0, Le/e/a/NicoliveActivity;->followFilter:I

    sub-int/2addr p0, v1

    aget-object p0, v0, p0

    .line 387
    :goto_0
    invoke-static {p0}, Le/e/a/NicoliveCatalog;->followUrl(Le/e/a/NicoliveCatalog$Broadcast;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public onBackPressed()V
    .registers 2

    .line 1062
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->toggleFullscreen()V

    return-void

    :cond_0
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    return-void

    :cond_2
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->exitHub()V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    .line 101
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    :cond_0
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->updateViewerLayout()V

    return-void

    :cond_2
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 7

    .line 58
    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Le/e/a/UiTheme191;->activity(Landroid/app/Activity;)V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    new-instance v0, Le/e/a/NicoliveBrowser;

    invoke-direct {v0}, Le/e/a/NicoliveBrowser;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-virtual {v0, p0}, Le/e/a/NicoliveBrowser;->setContext(Landroid/content/Context;)V

    .line 59
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 60
    const-string v1, "nicolive_live_sort"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Le/e/a/NicoliveCatalog$Sort;->NEWEST:Le/e/a/NicoliveCatalog$Sort;

    invoke-static {v1, v3}, Le/e/a/NicoliveCatalog$Sort;->restore(Ljava/lang/String;Le/e/a/NicoliveCatalog$Sort;)Le/e/a/NicoliveCatalog$Sort;

    move-result-object v1

    iput-object v1, p0, Le/e/a/NicoliveActivity;->liveSort:Le/e/a/NicoliveCatalog$Sort;

    .line 61
    const-string v1, "nicolive_timetable_sort"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Le/e/a/NicoliveCatalog$Sort;->OLDEST:Le/e/a/NicoliveCatalog$Sort;

    invoke-static {v1, v3}, Le/e/a/NicoliveCatalog$Sort;->restore(Ljava/lang/String;Le/e/a/NicoliveCatalog$Sort;)Le/e/a/NicoliveCatalog$Sort;

    move-result-object v1

    iput-object v1, p0, Le/e/a/NicoliveActivity;->timetableSort:Le/e/a/NicoliveCatalog$Sort;

    .line 62
    const-string v1, "nicolive_start_tab"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v4, -0x1

    if-ne v1, v4, :cond_0

    .line 63
    const-string v1, "nicolive_last_tab"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    :cond_0
    invoke-static {v1}, Le/e/a/NicoliveActivity;->validHubTab(I)I

    move-result v0

    iput v0, p0, Le/e/a/NicoliveActivity;->hubTab:I

    if-eqz p1, :cond_1

    .line 64
    const-string v0, "timetableOnAir"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    const-string v0, "draft"

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    const-string v0, "query"

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    const-string v0, "hubTab"

    iget v1, p0, Le/e/a/NicoliveActivity;->hubTab:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Le/e/a/NicoliveActivity;->validHubTab(I)I

    move-result v0

    iput v0, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const-string v0, "category"

    invoke-virtual {p1, v0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Le/e/a/NicoliveActivity;->category:I

    :try_start_0
    const-string v0, "timetableDay"

    iget-object v1, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {v1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/time/LocalDate;->parse(Ljava/lang/CharSequence;)Ljava/time/LocalDate;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;
    :try_end_0
    .catch Ljava/time/DateTimeException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const-string v0, "program"

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    :cond_1
    if-nez p1, :cond_2

    .line 65
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->fromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    iput-object p1, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    :cond_2
    iget-object p1, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->watch(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    :goto_0
    return-void
.end method

.method protected onDestroy()V
    .registers 2

    .line 99
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->unbind()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Le/e/a/NicoliveBrowser;->close()V

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .registers 2

    .line 68
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->setIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->fromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->watch(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected onResume()V
    .registers 3

    .line 72
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->refreshAccount()V

    .line 73
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->autoMiniPopup:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_0

    iget-object v0, v0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->miniFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_0

    .line 74
    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {v1, v0}, Le/e/a/NicoliveService;->returnToFrame(Le/e/a/NicolivePlayerFrame;)V

    const/4 v0, 0x0

    .line 75
    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->autoMiniPopup:Z

    .line 77
    :cond_0
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->updateNowPlaying()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    .line 100
    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    :cond_0
    const-string v0, "draft"

    iget-object v1, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "query"

    iget-object v1, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "hubTab"

    iget v1, p0, Le/e/a/NicoliveActivity;->hubTab:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "category"

    iget v1, p0, Le/e/a/NicoliveActivity;->category:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "timetableOnAir"

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->timetableDay:Ljava/time/LocalDate;

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "timetableDay"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, ""

    :goto_0
    const-string v1, "program"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onStart()V
    .registers 2

    .line 69
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-virtual {v0}, Le/e/a/NicoliveBrowser;->resumeImages()V

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->resumeLoad:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->resumeLoad:Z

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->loading:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->load()V

    :cond_0
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez v0, :cond_1

    sget-object v0, Le/e/a/NicoliveService;->active:Le/e/a/NicoliveService;

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->bind()V

    return-void
.end method

.method protected onStop()V
    .registers 2

    .line 70
    iget-object v0, p0, Le/e/a/NicoliveActivity;->listGestures:Le/e/a/NicoliveListGestures;

    invoke-virtual {v0}, Le/e/a/NicoliveListGestures;->reset()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->postNotice:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    :cond_0
    invoke-static {p0}, Le/e/a/ExitModeOptions;->clear(Landroid/app/Activity;)V

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->loading:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->resumeLoad:Z

    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-virtual {v0}, Le/e/a/NicoliveBrowser;->pauseImages()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    :cond_2
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->unbind()V

    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method

.method protected onUserLeaveHint()V
    .registers 5

    .line 80
    invoke-super {p0}, Landroid/app/Activity;->onUserLeaveHint()V

    .line 83
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    if-eqz v0, :cond_0

    .line 84
    invoke-virtual {v0}, Le/e/a/NicoliveFloatingMini206;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_0

    .line 85
    iget-boolean v0, v0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    if-nez v0, :cond_0

    .line 86
    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    .line 87
    new-array v0, v0, [I

    .line 88
    iget-object v1, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    invoke-virtual {v1, v0}, Le/e/a/NicoliveFloatingMini206;->getLocationOnScreen([I)V

    .line 89
    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {v1}, Le/e/a/NicoliveService;->showPopup()V

    .line 90
    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v1, v1, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    if-eqz v1, :cond_0

    .line 91
    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v2, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    invoke-virtual {v2}, Le/e/a/NicoliveFloatingMini206;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Le/e/a/NicoliveService;->resizePopup(I)V

    .line 92
    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v0, v0, v3

    invoke-virtual {v1, v2, v0}, Le/e/a/NicoliveService;->movePopup(II)V

    .line 93
    iget-object v0, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Le/e/a/NicoliveFloatingMini206;->setVisibility(I)V

    .line 94
    iput-boolean v3, p0, Le/e/a/NicoliveActivity;->autoMiniPopup:Z

    :cond_0
    return-void
.end method

.method openPopupFromHub(Ljava/lang/String;)V
    .registers 4

    .line 984
    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 985
    const-string p1, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u306b\u306f\u91cd\u306d\u3066\u8868\u793a\u3059\u308b\u6a29\u9650\u304c\u5fc5\u8981\u3067\u3059"

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 986
    new-instance p1, Landroid/content/Intent;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "package:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    invoke-direct {p1, v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 989
    :cond_0
    iput-object p1, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    iput-object p1, p0, Le/e/a/NicoliveActivity;->pendingPopupId:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/NicoliveActivity;->deniedProgramId:Ljava/lang/String;

    .line 990
    new-instance v0, Landroid/content/Intent;

    const-class v1, Le/e/a/NicoliveService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "program"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 991
    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 992
    iget-object p1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz p1, :cond_1

    iget-boolean p1, p1, Le/e/a/NicoliveService;->stopped:Z

    if-nez p1, :cond_1

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->activateRequestedPopup()V

    goto :goto_0

    .line 993
    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->bind()V

    .line 994
    :goto_0
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->updateNowPlaying()V

    return-void
.end method

.method openSelectedProgram(Ljava/lang/String;)V
    .registers 5

    .line 978
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "nicolive_tap_behavior"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->openPopupFromHub(Ljava/lang/String;)V

    return-void

    .line 979
    :cond_0
    invoke-virtual {p0, p1}, Le/e/a/NicoliveActivity;->watch(Ljava/lang/String;)V

    return-void
.end method

.method playerSettings()V
    .registers 7

    .line 1060
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v1, v1, Le/e/a/NicoliveService;->qualities:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    const-string v2, "\u518d\u63a5\u7d9a"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string/jumbo v2, "\u751f\u653e\u9001\u306eNG\u8a2d\u5b9a"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string/jumbo v3, "\u753b\u8cea\u3068\u8a2d\u5b9a"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/CharSequence;

    new-instance v3, Le/e/a/NicoliveActivity$13;

    invoke-direct {v3, p0, v0}, Le/e/a/NicoliveActivity$13;-><init>(Le/e/a/NicoliveActivity;Ljava/util/ArrayList;)V

    invoke-virtual {v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    return-void

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v5, v5, Le/e/a/NicoliveService;->selected:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "\u2713  "

    goto :goto_1

    :cond_2
    const-string v5, "\u3000 "

    :goto_1
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Le/e/a/NicoliveData;->qualityLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method popup()V
    .registers 4

    .line 1058
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_2

    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "package:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Le/e/a/NicoliveActivity;->startActivity(Landroid/content/Intent;)V

    const-string/jumbo v0, "\u8a31\u53ef\u5f8c\u306b\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u30dc\u30bf\u30f3\u3092\u62bc\u3057\u3066\u304f\u3060\u3055\u3044"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {v0}, Le/e/a/NicoliveService;->showPopup()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    :cond_2
    return-void
.end method

.method public posted(ZLjava/lang/String;)V
    .registers 6

    if-eqz p1, :cond_1

    .line 1049
    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    const-string v1, ""

    if-eqz v0, :cond_0

    iget-object v2, p0, Le/e/a/NicoliveActivity;->pendingDraft:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1050
    :cond_0
    iput-object v1, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    iput-object v1, p0, Le/e/a/NicoliveActivity;->pendingDraft:Ljava/lang/String;

    .line 1052
    :cond_1
    iget-object v0, p0, Le/e/a/NicoliveActivity;->postNotice:Landroid/widget/Toast;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    :cond_2
    if-eqz p1, :cond_3

    .line 1053
    const-string p2, "\u30b3\u30e1\u30f3\u30c8\u3092\u6295\u7a3f\u3057\u307e\u3057\u305f"

    :cond_3
    const/4 p1, 0x0

    invoke-static {p0, p2, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NicoliveActivity;->postNotice:Landroid/widget/Toast;

    .line 1054
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 1055
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->changed()V

    return-void
.end method

.method programLabel(Le/e/a/NicoliveData$Program;)Ljava/lang/String;
    .registers 13

    .line 1063
    iget-object v0, p1, Le/e/a/NicoliveData$Program;->provider:Ljava/lang/String;

    const-string v1, "official"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u516c\u5f0f"

    goto :goto_0

    :cond_0
    iget-object v0, p1, Le/e/a/NicoliveData$Program;->provider:Ljava/lang/String;

    const-string v1, "channel"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "CH"

    goto :goto_0

    :cond_1
    iget-object v0, p1, Le/e/a/NicoliveData$Program;->provider:Ljava/lang/String;

    const-string v1, "user"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p1, Le/e/a/NicoliveData$Program;->provider:Ljava/lang/String;

    const-string v1, "community"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "\u751f\u653e\u9001"

    goto :goto_0

    :cond_2
    const-string v0, "\u30e6\u30fc\u30b6\u30fc"

    :goto_0
    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v2, 0x2

    const-string v3, " / "

    if-ne v1, v2, :cond_3

    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo p1, "\u8996\u8074\u5c65\u6b74"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    const/4 v2, 0x3

    const-string/jumbo v4, "\u653e\u9001\u4e2d"

    const-string/jumbo v5, "\u653e\u9001\u7d42\u4e86"

    const-string/jumbo v6, "\u653e\u9001\u4e88\u5b9a"

    const-wide/16 v7, 0x0

    if-ne v1, v2, :cond_6

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->timetableOnAir:Z

    if-nez v1, :cond_6

    iget-wide v1, p1, Le/e/a/NicoliveData$Program;->begin:J

    cmp-long v1, v1, v7

    if-lez v1, :cond_6

    sget-object p0, Le/e/a/NicoliveActivity;->TIMETABLE_TIME:Ljava/time/format/DateTimeFormatter;

    iget-wide v1, p1, Le/e/a/NicoliveData$Program;->begin:J

    invoke-static {v1, v2}, Ljava/time/Instant;->ofEpochSecond(J)Ljava/time/Instant;

    move-result-object v1

    sget-object v2, Le/e/a/NicoliveCatalog;->JAPAN:Ljava/time/ZoneId;

    invoke-virtual {v1, v2}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/time/format/DateTimeFormatter;->format(Ljava/time/temporal/TemporalAccessor;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->ended()Z

    move-result p1

    if-eqz p1, :cond_4

    move-object v4, v5

    goto :goto_1

    :cond_4
    move-object v4, v6

    :cond_5
    :goto_1
    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_6
    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v1

    if-nez v1, :cond_9

    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->ended()Z

    move-result p0

    if-nez p0, :cond_7

    move-object v5, v6

    :cond_7
    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iget-wide v1, p1, Le/e/a/NicoliveData$Program;->begin:J

    cmp-long v1, v1, v7

    if-lez v1, :cond_8

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Le/e/a/NicoliveActivity;->PROGRAM_TIME:Ljava/time/format/DateTimeFormatter;

    iget-wide v4, p1, Le/e/a/NicoliveData$Program;->begin:J

    invoke-static {v4, v5}, Ljava/time/Instant;->ofEpochSecond(J)Ljava/time/Instant;

    move-result-object p1

    sget-object v2, Le/e/a/NicoliveCatalog;->JAPAN:Ljava/time/ZoneId;

    invoke-virtual {p1, v2}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/time/format/DateTimeFormatter;->format(Ljava/time/temporal/TemporalAccessor;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_9
    iget-wide v1, p1, Le/e/a/NicoliveData$Program;->begin:J

    cmp-long v1, v1, v7

    if-lez v1, :cond_a

    invoke-direct {p0}, Le/e/a/NicoliveActivity;->prefs()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "nicolive_start_time"

    const/4 v5, 0x0

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_a

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Le/e/a/NicoliveActivity;->PROGRAM_TIME:Ljava/time/format/DateTimeFormatter;

    iget-wide v2, p1, Le/e/a/NicoliveData$Program;->begin:J

    invoke-static {v2, v3}, Ljava/time/Instant;->ofEpochSecond(J)Ljava/time/Instant;

    move-result-object p1

    sget-object v2, Le/e/a/NicoliveCatalog;->JAPAN:Ljava/time/ZoneId;

    invoke-virtual {p1, v2}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/time/format/DateTimeFormatter;->format(Ljava/time/temporal/TemporalAccessor;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " started"

    const-string v0, " \u958b\u59cb"

    invoke-static {p0, v0, p1, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_a
    iget-wide v1, p1, Le/e/a/NicoliveData$Program;->begin:J

    cmp-long v1, v1, v7

    const-wide/16 v5, 0x3c

    if-lez v1, :cond_b

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v9, 0x3e8

    div-long/2addr v1, v9

    iget-wide v9, p1, Le/e/a/NicoliveData$Program;->begin:J

    sub-long/2addr v1, v9

    div-long/2addr v1, v5

    invoke-static {v7, v8, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    goto :goto_2

    :cond_b
    const-wide/16 v1, -0x1

    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    cmp-long v0, v1, v7

    if-gez v0, :cond_c

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    :cond_c
    cmp-long v0, v1, v5

    const-string v3, " \u5206\u9418\u524d\u958b\u59cb"

    const-string v4, " min elapsed"

    const-string v7, "\u5206\u7d4c\u904e"

    if-gez v0, :cond_d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    div-long v8, v1, v5

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, " hr "

    const-string v9, " \u5c0f\u6642 "

    const-string/jumbo v10, "\u6642\u9593"

    invoke-static {p0, v10, v8, v9}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    rem-long/2addr v1, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    :goto_3
    invoke-static {p0, v7, v4, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_4
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method refreshAccount()V
    .registers 3

    .line 98
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_0

    iget-object v0, v0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    iget-boolean v0, v0, Le/e/a/NicoliveData$Program;->loggedIn:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    if-eqz v0, :cond_0

    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "user_session="

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v1, v1, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->accountCookie:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->open(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method refreshFeed()V
    .registers 2

    const/4 v0, 0x0

    .line 495
    iput v0, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    .line 496
    iput v0, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    .line 497
    iget-object v0, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-virtual {v0}, Le/e/a/NicoliveBrowser;->refresh()V

    .line 498
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->load()V

    return-void
.end method

.method searchValue(Ljava/lang/String;)V
    .registers 6

    .line 1020
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/NicoliveData;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {p0, v1}, Le/e/a/NicoliveActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    iget-object v2, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Le/e/a/NicoliveActivity;->watch(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iput-boolean v3, p0, Le/e/a/NicoliveActivity;->recentReady:Z

    iget-object v0, p0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {v0}, Le/e/a/NicoliveActivity$FeedAdapter;->notifyDataSetChanged()V

    :cond_1
    iput-object p1, p0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    iput v3, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    iput v3, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    iget p1, p0, Le/e/a/NicoliveActivity;->hubTab:I

    if-eqz p1, :cond_2

    iput v3, p0, Le/e/a/NicoliveActivity;->hubTab:I

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->hub()V

    return-void

    :cond_2
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->load()V

    return-void
.end method

.method selectCategory(I)V
    .registers 5

    .line 508
    iget-object v0, p0, Le/e/a/NicoliveActivity;->categoryTabs:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_1

    .line 509
    iget v0, p0, Le/e/a/NicoliveActivity;->category:I

    if-eq v0, p1, :cond_1

    .line 510
    iput p1, p0, Le/e/a/NicoliveActivity;->category:I

    const/4 p1, 0x0

    move v0, p1

    .line 511
    :goto_0
    iget-object v1, p0, Le/e/a/NicoliveActivity;->categoryTabs:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_2

    .line 514
    iput p1, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    .line 515
    iput p1, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    .line 516
    iget-object v0, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {v0}, Le/e/a/NicoliveActivity$FeedAdapter;->notifyDataSetChanged()V

    .line 517
    iget-object v0, p0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setSelection(I)V

    .line 518
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->recentFeed()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Le/e/a/NicoliveActivity;->loading:Z

    if-eqz p1, :cond_0

    const-string p1, "\u53d6\u5f97\u4e2d\u2026"

    goto :goto_1

    :cond_0
    const-string p1, ""

    :goto_1
    invoke-direct {p0, p1}, Le/e/a/NicoliveActivity;->updateRecentStatus(Ljava/lang/String;)V

    :cond_1
    return-void

    .line 512
    :cond_2
    iget-object v1, p0, Le/e/a/NicoliveActivity;->categoryTabs:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iget v2, p0, Le/e/a/NicoliveActivity;->category:I

    if-ne v0, v2, :cond_3

    const/4 v2, 0x1

    goto :goto_2

    :cond_3
    move v2, p1

    :goto_2
    invoke-static {v1, v2}, Le/e/a/NicoliveUi;->selected(Landroid/widget/Button;Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method selectSort(Le/e/a/NicoliveCatalog$Sort;)V
    .registers 5

    .line 462
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->activeSort()Le/e/a/NicoliveCatalog$Sort;

    move-result-object v0

    if-ne p1, v0, :cond_0

    return-void

    .line 463
    :cond_0
    iget v0, p0, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    if-eqz v0, :cond_2

    .line 464
    iput-object p1, p0, Le/e/a/NicoliveActivity;->timetableSort:Le/e/a/NicoliveCatalog$Sort;

    goto :goto_1

    .line 465
    :cond_2
    iput-object p1, p0, Le/e/a/NicoliveActivity;->liveSort:Le/e/a/NicoliveCatalog$Sort;

    .line 466
    :goto_1
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    if-eqz v0, :cond_3

    .line 467
    const-string v0, "nicolive_timetable_sort"

    goto :goto_2

    :cond_3
    const-string v0, "nicolive_live_sort"

    :goto_2
    invoke-virtual {p1}, Le/e/a/NicoliveCatalog$Sort;->name()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 468
    iput v2, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    .line 469
    iput v2, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    .line 470
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->updateSortLabel()V

    .line 471
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->recentFeed()Z

    move-result p1

    if-eqz p1, :cond_4

    iput-boolean v2, p0, Le/e/a/NicoliveActivity;->recentReady:Z

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->load()V

    return-void

    .line 473
    :cond_4
    iget-object p1, p0, Le/e/a/NicoliveActivity;->feedAdapter:Le/e/a/NicoliveActivity$FeedAdapter;

    invoke-virtual {p1}, Le/e/a/NicoliveActivity$FeedAdapter;->notifyDataSetChanged()V

    .line 474
    iget-object p0, p0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    invoke-virtual {p0, v2}, Landroid/widget/ListView;->setSelection(I)V

    return-void
.end method

.method send()V
    .registers 5

    .line 1046
    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->codePointCount(II)I

    move-result v1

    const/16 v3, 0x4b

    if-le v1, v3, :cond_0

    const-string v0, "\u30b3\u30e1\u30f3\u30c8\u306f75\u6587\u5b57\u4ee5\u5185\u3067\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_0
    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v1, :cond_1

    iget-object v3, p0, Le/e/a/NicoliveActivity;->anonymous:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    invoke-virtual {v1, v0, v3}, Le/e/a/NicoliveService;->send(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    iput-object v0, p0, Le/e/a/NicoliveActivity;->pendingDraft:Ljava/lang/String;

    iget-object p0, p0, Le/e/a/NicoliveActivity;->send:Landroid/widget/ImageButton;

    invoke-virtual {p0, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    return-void

    :cond_1
    const-string/jumbo v0, "\u73fe\u5728\u306f\u6295\u7a3f\u3067\u304d\u307e\u305b\u3093\u3002\u518d\u751f\u30fb\u63a5\u7d9a\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method showPane()V
    .registers 6

    .line 1041
    iget-object v0, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Le/e/a/NicoliveActivity;->tabs:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_5

    iget-object v1, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    iget-boolean v2, p0, Le/e/a/NicoliveActivity;->info:Z

    const/16 v3, 0x8

    if-eqz v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    move v2, v0

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setVisibility(I)V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    const-string v2, "infoScroll"

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-boolean v2, p0, Le/e/a/NicoliveActivity;->info:Z

    if-eqz v2, :cond_2

    move v2, v0

    goto :goto_2

    :cond_2
    move v2, v3

    :goto_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    iget-object v1, p0, Le/e/a/NicoliveActivity;->information:Landroid/widget/TextView;

    iget-boolean p0, p0, Le/e/a/NicoliveActivity;->info:Z

    if-nez p0, :cond_4

    move v0, v3

    :cond_4
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    :cond_5
    iget-object v2, p0, Le/e/a/NicoliveActivity;->tabs:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iget-boolean v3, p0, Le/e/a/NicoliveActivity;->info:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_6

    if-ne v1, v4, :cond_7

    goto :goto_3

    :cond_6
    if-eqz v1, :cond_8

    :cond_7
    move v4, v0

    :cond_8
    :goto_3
    invoke-static {v2, v4}, Le/e/a/NicoliveUi;->selected(Landroid/widget/Button;Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method showWatchRestriction(Le/e/a/NicoliveData$Program;)V
    .registers 5

    if-eqz p1, :cond_2

    .line 1008
    iget-boolean v0, p1, Le/e/a/NicoliveData$Program;->canWatch:Z

    if-nez v0, :cond_2

    iget-object v0, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->deniedProgramId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1009
    iget-object v0, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/NicoliveActivity;->deniedProgramId:Ljava/lang/String;

    .line 1010
    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->accessLabel()Ljava/lang/String;

    move-result-object v0

    .line 1011
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v0, "\u3053\u306e\u756a\u7d44"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\u306e\u756a\u7d44"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\u306f\u73fe\u5728\u306e\u30a2\u30ab\u30a6\u30f3\u30c8\u3067\u8996\u8074\u3067\u304d\u307e\u305b\u3093\u3002"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1012
    iget-boolean v1, p1, Le/e/a/NicoliveData$Program;->loggedIn:Z

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\n\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u306a\u5834\u5408\u304c\u3042\u308a\u307e\u3059\u3002"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 1013
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\n\u8996\u8074\u6a29\u30fb\u8cfc\u5165\u72b6\u6cc1\u30fb\u30c1\u30e3\u30f3\u30cd\u30eb\u4f1a\u54e1\u8cc7\u683c\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1014
    :goto_1
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "\u8996\u8074\u6761\u4ef6\u306e\u78ba\u8a8d"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1015
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1016
    new-instance v1, Le/e/a/NicoliveActivity$38;

    invoke-direct {v1, p0, p1}, Le/e/a/NicoliveActivity$38;-><init>(Le/e/a/NicoliveActivity;Le/e/a/NicoliveData$Program;)V

    const-string p0, "\u516c\u5f0f\u30b5\u30a4\u30c8\u3067\u78ba\u8a8d"

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 1017
    const-string/jumbo p1, "\u9589\u3058\u308b"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 1014
    invoke-static {p0}, Le/e/a/NicoliveUi;->dialog(Landroid/app/AlertDialog;)V

    :cond_2
    return-void
.end method

.method toggleFullscreen()V
    .registers 3

    .line 1059
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    xor-int/lit8 v1, v0, 0x1

    iput-boolean v1, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    if-nez v0, :cond_0

    const/4 v0, 0x6

    goto :goto_0

    :cond_0
    const/4 v0, 0x7

    :goto_0
    invoke-virtual {p0, v0}, Le/e/a/NicoliveActivity;->setRequestedOrientation(I)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->updateViewerLayout()V

    return-void
.end method

.method unbind()V
    .registers 3

    .line 103
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Le/e/a/NicoliveService;->unobserve(Le/e/a/NicoliveService$Observer;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {v1, v0}, Le/e/a/NicoliveService;->detach(Le/e/a/NicolivePlayerFrame;)V

    :cond_0
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->bound:Z

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Le/e/a/NicoliveActivity;->connection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Le/e/a/NicoliveActivity;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->bound:Z

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    return-void
.end method

.method updateNowPlaying()V
    .registers 5

    .line 485
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    if-eqz v0, :cond_3

    .line 486
    invoke-direct {p0}, Le/e/a/NicoliveActivity;->activeBroadcast()Le/e/a/NicoliveService;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 487
    iget-object v2, v0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    if-nez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v1

    .line 488
    :goto_0
    iget-object v3, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    if-nez v2, :cond_1

    const/16 v1, 0x8

    :cond_1
    invoke-virtual {v3, v1}, Le/e/a/NicoliveFloatingMini206;->setVisibility(I)V

    if-eqz v2, :cond_3

    .line 490
    iget-object v1, p0, Le/e/a/NicoliveActivity;->miniFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v1, :cond_2

    iget-object v1, v0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    iget-object v2, p0, Le/e/a/NicoliveActivity;->miniFrame:Le/e/a/NicolivePlayerFrame;

    if-eq v1, v2, :cond_2

    invoke-virtual {v0, v2}, Le/e/a/NicoliveService;->returnToFrame(Le/e/a/NicolivePlayerFrame;)V

    .line 491
    :cond_2
    iget-object p0, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    invoke-virtual {p0, v0}, Le/e/a/NicoliveFloatingMini206;->sync(Le/e/a/NicoliveService;)V

    :cond_3
    return-void
.end method

.method updateViewerLayout()V
    .registers 5

    .line 1035
    iget-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_4

    iget-object v0, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_4

    .line 1036
    iget-object v0, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    if-nez v1, :cond_1

    move v2, v3

    :cond_1
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setFitsSystemWindows(Z)V

    .line 1037
    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    const/16 v1, 0x400

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 1038
    :goto_1
    iget-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {v0}, Le/e/a/NicolivePlayerFrame;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    goto :goto_2

    :cond_3
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    const v2, 0x3fe38e39

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    :goto_2
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v1, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {v1, v0}, Le/e/a/NicolivePlayerFrame;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    invoke-virtual {v0, v1}, Le/e/a/NicolivePlayerFrame;->fullscreen(Z)V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->showPane()V

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    if-nez v0, :cond_4

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->fitViewer()V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->changed()V

    :cond_4
    return-void
.end method

.method viewer()V
    .registers 16

    .line 1025
    iget-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Le/e/a/NicolivePlayerFrame;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->updateViewerLayout()V

    return-void

    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    invoke-virtual {v1, v0}, Le/e/a/NicoliveService;->detach(Le/e/a/NicolivePlayerFrame;)V

    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->base()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move v1, v3

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->root:Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    const/4 v4, 0x1

    xor-int/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setFitsSystemWindows(Z)V

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    const/16 v1, 0x400

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_1

    :cond_3
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    :goto_1
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 1026
    const-string v0, "back"

    const-string/jumbo v1, "\u756a\u7d44\u4e00\u89a7\u306b\u623b\u308b"

    invoke-static {p0, v0, v1}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Le/e/a/NicoliveActivity$54;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$54;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    const-string/jumbo v0, "\u751f\u653e\u9001"

    const/16 v1, 0x10

    invoke-static {p0, v0, v1}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->heading:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v5, v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "popup"

    const-string v1, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7"

    invoke-static {p0, v0, v1}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Le/e/a/NicoliveActivity$55;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$55;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    const-string v0, "refresh"

    const-string v1, "\u518d\u63a5\u7d9a"

    invoke-static {p0, v0, v1}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NicoliveActivity;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Le/e/a/NicoliveActivity$56;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$56;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 1027
    new-instance v0, Le/e/a/NicolivePlayerFrame;

    invoke-direct {v0, p0, v3}, Le/e/a/NicolivePlayerFrame;-><init>(Landroid/content/Context;Z)V

    iput-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    iget-boolean v0, p0, Le/e/a/NicoliveActivity;->fullscreen:Z

    if-eqz v0, :cond_4

    move v0, v6

    goto :goto_2

    :cond_4
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    const v1, 0x3fe38e39

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    :goto_2
    iget-object v1, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    iget-object v5, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v6, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_5

    iget-object v1, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {v0, v1}, Le/e/a/NicoliveService;->returnToFrame(Le/e/a/NicolivePlayerFrame;)V

    :cond_5
    invoke-static {p0}, Le/e/a/NicoliveUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v6, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1028
    invoke-static {p0}, Le/e/a/NicoliveUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->details:Landroid/widget/LinearLayout;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v8, 0x40a00000    # 5.0f

    invoke-static {p0, v8}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-static {p0, v8}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-virtual {v0, v5, v9, v10, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const-string/jumbo v0, "\u756a\u7d44\u60c5\u5831\u3092\u53d6\u5f97\u4e2d\u2026"

    const/16 v5, 0xf

    invoke-static {p0, v0, v5}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->title:Landroid/widget/TextView;

    const/4 v5, 0x2

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->title:Landroid/widget/TextView;

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->details:Landroid/widget/LinearLayout;

    iget-object v8, p0, Le/e/a/NicoliveActivity;->title:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v0, ""

    const/16 v8, 0xc

    invoke-static {p0, v0, v8}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    iput-object v9, p0, Le/e/a/NicoliveActivity;->owner:Landroid/widget/TextView;

    iget-object v10, p0, Le/e/a/NicoliveActivity;->details:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 v9, 0xb

    invoke-static {p0, v0, v9}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    iput-object v9, p0, Le/e/a/NicoliveActivity;->stats:Landroid/widget/TextView;

    invoke-static {v9}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v9, p0, Le/e/a/NicoliveActivity;->details:Landroid/widget/LinearLayout;

    iget-object v10, p0, Le/e/a/NicoliveActivity;->stats:Landroid/widget/TextView;

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v9, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    iget-object v10, p0, Le/e/a/NicoliveActivity;->details:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string/jumbo v9, "\u63a5\u7d9a\u4e2d\u2026"

    invoke-static {p0, v9, v8}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v8

    iput-object v8, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    invoke-static {p0}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v8, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-virtual {v8, v9, v3, v10, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v8, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    iget-object v9, p0, Le/e/a/NicoliveActivity;->status:Landroid/widget/TextView;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-static {p0, v11}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v11

    invoke-direct {v10, v6, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1029
    invoke-static {p0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v8

    iput-object v8, p0, Le/e/a/NicoliveActivity;->tabs:Landroid/widget/LinearLayout;

    const-string v8, "\u30b3\u30e1\u30f3\u30c8"

    const-string/jumbo v9, "\u756a\u7d44\u60c5\u5831"

    filled-new-array {v8, v9}, [Ljava/lang/String;

    move-result-object v8

    move v9, v3

    :goto_3
    const/high16 v10, 0x42200000    # 40.0f

    if-lt v9, v5, :cond_7

    iget-object v5, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    iget-object v8, p0, Le/e/a/NicoliveActivity;->tabs:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1030
    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iget-object v8, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v6, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v5, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v8, Landroid/widget/ListView;

    invoke-direct {v8, p0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    iget-object v8, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    invoke-virtual {v8, v3}, Landroid/widget/ListView;->setCacheColorHint(I)V

    new-instance v8, Le/e/a/NicoliveActivity$ChatAdapter;

    invoke-direct {v8, p0}, Le/e/a/NicoliveActivity$ChatAdapter;-><init>(Le/e/a/NicoliveActivity;)V

    iput-object v8, p0, Le/e/a/NicoliveActivity;->chatAdapter:Le/e/a/NicoliveActivity$ChatAdapter;

    iget-object v9, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    invoke-virtual {v9, v8}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v8, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v9, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v8, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    new-instance v9, Le/e/a/NicoliveActivity$12;

    invoke-direct {v9, p0}, Le/e/a/NicoliveActivity$12;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v8, v9}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    iget-object v8, p0, Le/e/a/NicoliveActivity;->chat:Landroid/widget/ListView;

    new-instance v9, Le/e/a/NicoliveActivity$58;

    invoke-direct {v9, p0}, Le/e/a/NicoliveActivity$58;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v8, v9}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    const/16 v8, 0xe

    .line 1031
    invoke-static {p0, v0, v8}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->information:Landroid/widget/TextView;

    const/16 v8, 0x30

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->information:Landroid/widget/TextView;

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v8

    const/high16 v9, 0x41200000    # 10.0f

    invoke-static {p0, v9}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v11

    invoke-virtual {v0, v8, v9, v11, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->information:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const-string v8, "infoScroll"

    invoke-virtual {v0, v8}, Landroid/widget/ScrollView;->setTag(Ljava/lang/Object;)V

    iget-object v8, p0, Le/e/a/NicoliveActivity;->information:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->setVisibility(I)V

    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v8, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v0, v8}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1032
    const-string/jumbo v0, "\u6700\u65b0\u30b3\u30e1\u30f3\u30c8\u3078"

    invoke-static {p0, v0}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->latest:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/NicoliveActivity;->latest:Landroid/widget/Button;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0, v10}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-direct {v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->latest:Landroid/widget/Button;

    new-instance v2, Le/e/a/NicoliveActivity$59;

    invoke-direct {v2, p0}, Le/e/a/NicoliveActivity$59;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 1033
    invoke-static {p0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->composer:Landroid/widget/LinearLayout;

    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/NicoliveActivity;->anonymous:Landroid/widget/CheckBox;

    const-string v2, "\u533f\u540d"

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->anonymous:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setTextSize(F)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->anonymous:Landroid/widget/CheckBox;

    invoke-static {v0}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->anonymous:Landroid/widget/CheckBox;

    invoke-static {p0}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result v1

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->anonymous:Landroid/widget/CheckBox;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "nicolive_anonymous"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->anonymous:Landroid/widget/CheckBox;

    new-instance v1, Le/e/a/NicoliveActivity$60;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$60;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->composer:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->anonymous:Landroid/widget/CheckBox;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x428c0000    # 70.0f

    invoke-static {p0, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v8, 0x42400000    # 48.0f

    invoke-static {p0, v8}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-direct {v2, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "\u30b3\u30e1\u30f3\u30c8\u3092\u5165\u529b\u2026"

    invoke-static {p0, v0}, Le/e/a/NicoliveUi;->input(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    new-array v1, v4, [Landroid/text/InputFilter;

    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    const/16 v4, 0x96

    invoke-direct {v2, v4}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->composer:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0, v8}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-direct {v2, v3, v4, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "send"

    const-string v1, "\u30b3\u30e1\u30f3\u30c8\u3092\u9001\u4fe1"

    invoke-static {p0, v0, v1}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->send:Landroid/widget/ImageButton;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->composer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->send:Landroid/widget/ImageButton;

    new-instance v1, Le/e/a/NicoliveActivity$61;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$61;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->composer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v0, "\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u30b3\u30e1\u30f3\u30c8\u3059\u308b"

    invoke-static {p0, v0}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->login:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->viewerPane:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42300000    # 44.0f

    invoke-static {p0, v3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-direct {v2, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->login:Landroid/widget/Button;

    new-instance v1, Le/e/a/NicoliveActivity$62;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$62;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->showPane()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Le/e/a/NicoliveActivity$63;

    invoke-direct {v1, p0}, Le/e/a/NicoliveActivity$63;-><init>(Le/e/a/NicoliveActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->updateViewerLayout()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->changed()V

    :cond_6
    return-void

    .line 1029
    :cond_7
    aget-object v11, v8, v9

    invoke-static {p0, v11}, Le/e/a/NicoliveUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v12

    iget-object v13, p0, Le/e/a/NicoliveActivity;->tabs:Landroid/widget/LinearLayout;

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0, v10}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-direct {v14, v3, v10, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v13, v12, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v10, Le/e/a/NicoliveActivity$57;

    invoke-direct {v10, p0, v11}, Le/e/a/NicoliveActivity$57;-><init>(Le/e/a/NicoliveActivity;Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v12 .. v12}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_3
.end method

.method watch(Ljava/lang/String;)V
    .registers 5

    .line 1021
    invoke-static {p0}, Le/e/a/ExitModeOptions;->clear(Landroid/app/Activity;)V

    const-string v0, ""

    iput-object v0, p0, Le/e/a/NicoliveActivity;->pendingPopupId:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iput-object v0, p0, Le/e/a/NicoliveActivity;->deniedProgramId:Ljava/lang/String;

    :cond_0
    iget-boolean v1, p0, Le/e/a/NicoliveActivity;->watching:Z

    const/4 v2, 0x0

    if-nez v1, :cond_2

    iget-object v1, p0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    iput v1, p0, Le/e/a/NicoliveActivity;->feedPosition:I

    iget-object v1, p0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p0, Le/e/a/NicoliveActivity;->feed:Landroid/widget/ListView;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    iput v1, p0, Le/e/a/NicoliveActivity;->feedOffset:I

    :cond_2
    iget-object v1, p0, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-virtual {v1}, Le/e/a/NicoliveBrowser;->pauseImages()V

    iget-object v1, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    iput-object v0, p0, Le/e/a/NicoliveActivity;->draft:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/NicoliveActivity;->pendingDraft:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/NicoliveActivity;->input:Landroid/widget/EditText;

    if-eqz v1, :cond_3

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    iput-object p1, p0, Le/e/a/NicoliveActivity;->requested:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->watching:Z

    iput-boolean v2, p0, Le/e/a/NicoliveActivity;->info:Z

    iput-boolean v0, p0, Le/e/a/NicoliveActivity;->atBottom:Z

    iput v2, p0, Le/e/a/NicoliveActivity;->newComments:I

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Le/e/a/NicoliveActivity;->observedCount:J

    iget v1, p0, Le/e/a/NicoliveActivity;->loadToken:I

    add-int/2addr v1, v0

    iput v1, p0, Le/e/a/NicoliveActivity;->loadToken:I

    .line 1022
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_4

    iget-object v1, p0, Le/e/a/NicoliveActivity;->miniFrame:Le/e/a/NicolivePlayerFrame;

    if-eqz v1, :cond_4

    invoke-virtual {v0, v1}, Le/e/a/NicoliveService;->detach(Le/e/a/NicolivePlayerFrame;)V

    :cond_4
    const/4 v0, 0x0

    .line 1023
    iput-object v0, p0, Le/e/a/NicoliveActivity;->miniFrame:Le/e/a/NicolivePlayerFrame;

    iput-object v0, p0, Le/e/a/NicoliveActivity;->miniTitle:Landroid/widget/TextView;

    iput-object v0, p0, Le/e/a/NicoliveActivity;->miniPlay:Landroid/widget/ImageButton;

    iput-object v0, p0, Le/e/a/NicoliveActivity;->miniWindow:Le/e/a/NicoliveFloatingMini206;

    .line 1024
    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->viewer()V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Le/e/a/NicoliveService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "program"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/NicoliveActivity;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->bind()V

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    if-eqz v0, :cond_7

    iget-boolean v0, v0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-boolean v0, v0, Le/e/a/NicoliveService;->terminal:Z

    if-eqz v0, :cond_6

    :cond_5
    iget-object v0, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    invoke-virtual {v0, p1}, Le/e/a/NicoliveService;->open(Ljava/lang/String;)V

    :cond_6
    iget-object p1, p0, Le/e/a/NicoliveActivity;->service:Le/e/a/NicoliveService;

    iget-object v0, p0, Le/e/a/NicoliveActivity;->playerFrame:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {p1, v0}, Le/e/a/NicoliveService;->returnToFrame(Le/e/a/NicolivePlayerFrame;)V

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->changed()V

    :cond_7
    return-void
.end method
