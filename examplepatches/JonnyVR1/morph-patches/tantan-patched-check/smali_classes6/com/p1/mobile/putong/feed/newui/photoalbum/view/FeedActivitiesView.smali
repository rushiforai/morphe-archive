.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VRelative;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VImage;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/v370;

.field public j:Lcom/p1/mobile/putong/app/PutongFrag;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->h:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/v370;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/v370;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->i:Ll/v370;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->z(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->h:Ljava/util/List;

    .line 24
    new-instance p2, Ll/v370;

    invoke-direct {p2}, Ll/v370;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->i:Ll/v370;

    .line 25
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->z(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->h:Ljava/util/List;

    .line 28
    new-instance p2, Ll/v370;

    invoke-direct {p2}, Ll/v370;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->i:Ll/v370;

    .line 29
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->z(Landroid/content/Context;)V

    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/mrb0;->c()V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    new-array p1, p1, [Ll/tfj0$a;

    .line 14
    .line 15
    const-string v0, "e_moment_unread_notes_history"

    .line 16
    .line 17
    const-string v1, "p_nearby"

    .line 18
    .line 19
    invoke-static {v0, v1, p1}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->H()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->B(Landroid/view/View;)V

    return-void
.end method

.method private z(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->d:Lv/VRelative;

    .line 18
    .line 19
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->d:Lv/VRelative;

    .line 23
    .line 24
    new-instance v0, Ll/vmg;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/vmg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->d:Lv/VRelative;

    .line 33
    .line 34
    const/high16 p1, 0x41400000    # 12.0f

    .line 35
    .line 36
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final H()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;->j:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "activities"

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-static {v0, v1, v2, v3, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->X1(Landroid/content/Context;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/wmg;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedActivitiesView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
