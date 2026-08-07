.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;
.super Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;",
        "Ll/iam<",
        "Ll/zt6;",
        ">;"
    }
.end annotation


# static fields
.field public static H0:Ljava/lang/String; = "conversationsTabSearch"


# instance fields
.field public B:Landroid/widget/FrameLayout;

.field public C:Lv/VPager;

.field public D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

.field public E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final E0:Ljava/lang/String;

.field public F:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ">;"
        }
    .end annotation
.end field

.field public F0:J

.field public G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

.field public G0:Ljava/lang/String;

.field public H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

.field public I:Landroid/view/View;

.field public J:Landroidx/appcompat/widget/SearchView;

.field public K:Landroid/view/View;

.field public L:Landroid/view/View;

.field public M:I

.field public N:Ll/kcg0;

.field public O:Landroid/view/Menu;

.field public P:Ll/zt6;

.field public Q:Ll/y20;

.field public R:Z

.field public S:J

.field public T:Z

.field public U:Z

.field public V:D

.field public W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

.field public X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

.field public Y:Z

.field public Z:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public k0:I

.field public final p0:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 13
    .line 14
    new-instance v1, Ll/qs6;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/qs6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->Q:Ll/y20;

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->R:Z

    .line 22
    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->S:J

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->T:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->U:Z

    .line 30
    .line 31
    const-wide/16 v3, 0x0

    .line 32
    .line 33
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->V:D

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->Y:Z

    .line 36
    .line 37
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 38
    .line 39
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->Z:Lrx/subjects/a;

    .line 44
    .line 45
    const/high16 v0, 0x42300000    # 44.0f

    .line 46
    .line 47
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->k0:I

    .line 52
    .line 53
    new-instance v0, Ll/ws6;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/ws6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->p0:Ljava/lang/Runnable;

    .line 59
    .line 60
    const-string v0, "all_match_pop_window_key"

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E0:Ljava/lang/String;

    .line 63
    .line 64
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F0:J

    .line 65
    .line 66
    const-string v0, ""

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G0:Ljava/lang/String;

    .line 69
    .line 70
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D5()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static B5(I)Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;
    .locals 3

    .line 1
    if-gez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "init_conversation_tab_index"

    .line 15
    .line 16
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method private D5()V
    .locals 1

    .line 1
    new-instance v0, Ll/zt6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zt6;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->R5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;ILjava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M5(ILjava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->P5(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y4(Ljava/lang/Boolean;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Ll/d19;->S3(Z)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic Z4(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Integer;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->t0:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ie(Ljava/util/List;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    :goto_0
    const/16 p0, 0xa

    .line 36
    .line 37
    :goto_1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic a5(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->l1:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Landroid/view/Menu;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->Q5(Landroid/view/Menu;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J5(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d5(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic e5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f5(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/c;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic g5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->L5(Ljava/lang/Integer;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic h5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->V5()V

    return-void
.end method

.method public static synthetic i5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->S5()Z

    move-result p0

    return p0
.end method

.method public static synthetic j5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->N5(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic k5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->Z5(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->U5()V

    return-void
.end method

.method public static synthetic m5(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->n2:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/g;->n2:Ljava/util/List;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Sn(Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->T5()V

    return-void
.end method

.method public static synthetic o5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W5()V

    return-void
.end method

.method public static synthetic p5(Ll/vg60;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->O6:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    cmp-long v2, v0, v2

    .line 20
    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Ll/vg60;->a:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 52
    .line 53
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 54
    .line 55
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 63
    .line 64
    iget-object p0, p0, Ll/dkb;->O6:Ll/byd0;

    .line 65
    .line 66
    double-to-long v0, v0

    .line 67
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_1
    if-eqz p0, :cond_5

    .line 78
    .line 79
    iget-object v2, p0, Ll/vg60;->a:Ljava/util/List;

    .line 80
    .line 81
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_2

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    long-to-double v0, v0

    .line 89
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    :cond_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_4

    .line 100
    .line 101
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 106
    .line 107
    iget v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 108
    .line 109
    if-lez v3, :cond_3

    .line 110
    .line 111
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 112
    .line 113
    cmpl-double v2, v2, v0

    .line 114
    .line 115
    if-lez v2, :cond_3

    .line 116
    .line 117
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 118
    .line 119
    return-object p0

    .line 120
    :cond_4
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 121
    .line 122
    return-object p0

    .line 123
    :cond_5
    :goto_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 124
    .line 125
    return-object p0
.end method

.method public static synthetic q5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->Y5(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->K5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic s5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->O5()V

    return-void
.end method

.method public static synthetic t5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X5(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic u5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    return p0
.end method

.method public static bridge synthetic v5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->K:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic w5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    return-void
.end method

.method public static bridge synthetic x5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->a6(I)V

    return-void
.end method

.method public static bridge synthetic y5(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;IZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->f6(IZ)V

    return-void
.end method

.method private z5()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->Y0()Lcom/p1/mobile/putong/core/data/RealtimeRefreshNewMatch;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/RealtimeRefreshNewMatch;->function_switch:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/is6;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/is6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/js6;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/js6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method


# virtual methods
.method public A5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;->e()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public C4()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "+",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->P:Ll/zt6;

    .line 2
    .line 3
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->C4()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/zt6;->C0(Ljava/util/Collection;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public C5(Ll/zt6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->P:Ll/zt6;

    .line 2
    .line 3
    return-void
.end method

.method public E5()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "love_letter_remaining"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "love_letter_reply"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final F5(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-le v0, p1, :cond_3

    .line 8
    .line 9
    if-ltz p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->G:Ll/qam;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->G:Ll/qam;

    .line 25
    .line 26
    invoke-interface {p1}, Ll/qam;->g()V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_3
    :goto_0
    return-void
.end method

.method public G5()Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->m5()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const-string v0, "all_matches"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v0, "chat"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string v0, ""

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->pageId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public H4()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->j(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->j(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 24
    .line 25
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->v5()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final H5()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

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
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Ll/kec0;->A7:I

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->d:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 37
    .line 38
    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->setWhisperTabPosition(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 46
    .line 47
    const/16 v1, 0x13

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->setIntlTabTextSize(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->f()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 58
    .line 59
    new-instance v1, Ll/zs6;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/zs6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->e(Lcom/p1/mobile/android/app/Frag;Ll/z20;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const/4 v1, -0x1

    .line 76
    const/4 v2, -0x2

    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    :try_start_0
    sget-object v3, Lcom/p1/mobile/android/app/Act;->TOOLBAR_TITLE_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 80
    .line 81
    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Landroid/widget/TextView;

    .line 86
    .line 87
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_1

    .line 92
    .line 93
    const/16 v4, 0x8

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    :catch_0
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 99
    .line 100
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    if-eqz v3, :cond_2

    .line 105
    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 107
    .line 108
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Landroid/view/ViewGroup;

    .line 113
    .line 114
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 115
    .line 116
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 117
    .line 118
    .line 119
    :cond_2
    new-instance v3, Landroidx/appcompat/widget/Toolbar$e;

    .line 120
    .line 121
    invoke-direct {v3, v2, v1}, Landroidx/appcompat/widget/Toolbar$e;-><init>(II)V

    .line 122
    .line 123
    .line 124
    const v1, 0x800013

    .line 125
    .line 126
    .line 127
    iput v1, v3, Ll/c30$a;->a:I

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 130
    .line 131
    invoke-virtual {v0, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_3
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 136
    .line 137
    invoke-direct {v0, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 138
    .line 139
    .line 140
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->k0:I

    .line 141
    .line 142
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 143
    .line 144
    const v1, 0x800003

    .line 145
    .line 146
    .line 147
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B:Landroid/widget/FrameLayout;

    .line 150
    .line 151
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 152
    .line 153
    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 159
    .line 160
    const/4 v2, 0x2

    .line 161
    new-array v2, v2, [Landroid/view/View;

    .line 162
    .line 163
    aput-object v0, v2, v3

    .line 164
    .line 165
    const/4 v0, 0x1

    .line 166
    aput-object v1, v2, v0

    .line 167
    .line 168
    invoke-static {v2}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 169
    .line 170
    .line 171
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I5()V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public I4()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->j(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->j(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 24
    .line 25
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->I4()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final I5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->rh()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/ks6;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/ks6;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Ll/ls6;

    .line 56
    .line 57
    invoke-direct {v2, p0, v0}, Ll/ls6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;I)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ll/ms6;

    .line 61
    .line 62
    invoke-direct {p0}, Ll/ms6;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic J5(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic K5(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->C:Z

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->C:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->Z:Lrx/subjects/a;

    .line 20
    .line 21
    const-string p1, "message_tab_hide_to_show_refresh"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic L5(Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-ltz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ge p2, v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->f6(IZ)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic M5(ILjava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->r2:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 11
    .line 12
    if-eq v0, p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final synthetic N5(Ljava/lang/Object;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->R:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O5()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Yf(Ll/ner;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Zf(Ll/ner;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic P5(Ljava/util/List;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v1, Ll/os6;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/os6;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ll/ps6;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ll/ps6;-><init>(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final synthetic Q5(Landroid/view/Menu;Ljava/lang/Integer;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/16 v0, 0xa

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-ge p2, v0, :cond_0

    .line 9
    .line 10
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object p2, p2, Ll/dkb;->t0:Ll/jxd0;

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-nez p2, :cond_0

    .line 41
    .line 42
    sget p0, Ll/adc0;->n8:I

    .line 43
    .line 44
    invoke-interface {p1, p0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_4

    .line 53
    .line 54
    invoke-interface {p0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    if-ne p2, v0, :cond_1

    .line 62
    .line 63
    const-string p2, "e_search_button"

    .line 64
    .line 65
    const-string v2, "p_messages_view"

    .line 66
    .line 67
    invoke-static {p2, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 73
    .line 74
    iget-object p2, p2, Ll/dkb;->t0:Ll/jxd0;

    .line 75
    .line 76
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    check-cast p2, Ljava/lang/Boolean;

    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    if-nez p2, :cond_2

    .line 87
    .line 88
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 91
    .line 92
    iget-object p2, p2, Ll/dkb;->t0:Ll/jxd0;

    .line 93
    .line 94
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {p2, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_2
    sget p2, Ll/adc0;->n8:I

    .line 100
    .line 101
    invoke-interface {p1, p2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-eqz p2, :cond_4

    .line 110
    .line 111
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 112
    .line 113
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-eqz p2, :cond_3

    .line 118
    .line 119
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 120
    .line 121
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 124
    .line 125
    invoke-interface {v2, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-ne p2, p0, :cond_3

    .line 130
    .line 131
    move v1, v0

    .line 132
    :cond_3
    xor-int/lit8 p0, v1, 0x1

    .line 133
    .line 134
    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 135
    .line 136
    .line 137
    :cond_4
    return-void
.end method

.method public final synthetic R5(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_search_button"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->e6(Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 28
    .line 29
    const/4 p2, 0x1

    .line 30
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 31
    .line 32
    .line 33
    const-string p0, "p_messages_view,e_search_button,click"

    .line 34
    .line 35
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public S4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->S4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S5()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->e6(Z)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public final synthetic T5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->isIconified()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G0:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->l6(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic U5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic V5()V
    .locals 2

    .line 1
    new-instance v0, Ll/vs6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vs6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x12c

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->m4(Ljava/lang/Runnable;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic W5()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->O4()Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H0:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/main/a$v;->a(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic X5(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 p2, 0x1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return p2

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public final synthetic Y5(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic Z5(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->p0:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->p0:Ljava/lang/Runnable;

    .line 15
    .line 16
    const-wide/16 v0, 0x190

    .line 17
    .line 18
    invoke-virtual {p1, p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final a6(I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F5(I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gra;->a2()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->io(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->p0:Ljava/lang/Runnable;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->p0:Ljava/lang/Runnable;

    .line 38
    .line 39
    const-wide/16 v0, 0x190

    .line 40
    .line 41
    invoke-virtual {p1, p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public b6()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;->getAllMatchView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->l1:Ll/jxd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    const/high16 v1, 0x40000000    # 2.0f

    .line 41
    .line 42
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/high16 v2, 0x40e00000    # 7.0f

    .line 51
    .line 52
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/16 v2, 0x4b

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    sget v2, Ll/qa00;->g:I

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget v2, Ll/qa00;->c:I

    .line 73
    .line 74
    neg-int v2, v2

    .line 75
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const/high16 v2, 0x41500000    # 13.0f

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const/4 v2, 0x1

    .line 86
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->M(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    new-instance v3, Ll/us6;

    .line 95
    .line 96
    invoke-direct {v3}, Ll/us6;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->N(Lcom/p1/mobile/android/ui/bubble/a$d;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const-wide/16 v2, 0xbb8

    .line 108
    .line 109
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v2, "\u5728\u8fd9\u91cc\u67e5\u770b\u6240\u6709\u914d\u5bf9"

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 120
    .line 121
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 122
    .line 123
    or-int/2addr v2, v3

    .line 124
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 125
    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 132
    .line 133
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;->getAllMatchView()Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    sget v3, Ll/adc0;->i6:I

    .line 138
    .line 139
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    const-string v3, "all_match_pop_window_key"

    .line 144
    .line 145
    invoke-virtual {v1, v0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :cond_0
    invoke-static {}, Ll/h39;->N()Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_1

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E5()V

    .line 155
    .line 156
    .line 157
    :cond_1
    return-void
.end method

.method public c0()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 17
    .line 18
    return p0
.end method

.method public c6()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->isIconified()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 28
    .line 29
    .line 30
    return v2

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public d4()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pzi0;->o()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->s1:Ll/byd0;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Ljava/lang/Long;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    xor-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->U:Z

    .line 31
    .line 32
    return-void
.end method

.method public d6(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v2, Ll/kec0;->oe:I

    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-virtual {v0, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->p1(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->S:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 33
    .line 34
    sget v2, Ll/c9c0;->c2:I

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 42
    .line 43
    const-string v2, "ConversationSearchList"

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Lv/VList;->setCrashLogFlag(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->w2()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 61
    .line 62
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 66
    .line 67
    new-array v2, v1, [Landroid/view/View;

    .line 68
    .line 69
    aput-object v0, v2, v4

    .line 70
    .line 71
    invoke-static {v2}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    const/high16 v0, 0x42300000    # 44.0f

    .line 75
    .line 76
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 81
    .line 82
    new-array v3, v1, [Landroid/view/View;

    .line 83
    .line 84
    aput-object v2, v3, v4

    .line 85
    .line 86
    invoke-static {v0, v3}, Ll/bnl0;->Y(I[Landroid/view/View;)V

    .line 87
    .line 88
    .line 89
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G0:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p1, :cond_2

    .line 92
    .line 93
    const-string v0, ""

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 103
    .line 104
    new-instance v1, Ll/rs6;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/rs6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 107
    .line 108
    .line 109
    new-instance v2, Ll/ss6;

    .line 110
    .line 111
    invoke-direct {v2, p0}, Ll/ss6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->x1(Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 119
    .line 120
    invoke-virtual {p1}, Landroidx/appcompat/widget/SearchView;->isIconified()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_3

    .line 125
    .line 126
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->l6(Z)V

    .line 127
    .line 128
    .line 129
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 130
    .line 131
    const/16 p1, 0x8

    .line 132
    .line 133
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final e6(Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p1, v2}, Ll/c30;->w(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, v2}, Ll/c30;->y(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->l6(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    :cond_0
    new-instance p1, Ll/ns6;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Ll/ns6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 45
    .line 46
    .line 47
    const-wide/16 v0, 0x12c

    .line 48
    .line 49
    invoke-static {p0, p1, v0, v1}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->L:Landroid/view/View;

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->L:Landroid/view/View;

    .line 59
    .line 60
    const/4 v2, 0x1

    .line 61
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->O4()Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 69
    .line 70
    sget-object v4, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H0:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p1, v3, v4}, Lcom/p1/mobile/putong/core/newui/main/a$v;->a(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1, v2}, Ll/c30;->w(Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1, v2}, Ll/c30;->y(Z)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/ux0;->c()Landroid/graphics/drawable/Drawable;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p1, v0}, Ll/c30;->C(Landroid/graphics/drawable/Drawable;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 109
    .line 110
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->l6(Z)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->K:Landroid/view/View;

    .line 117
    .line 118
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public f4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->m6()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/gra;->D2()Z

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->z5()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/xs6;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/xs6;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/ys6;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/ys6;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final f6(IZ)V
    .locals 5

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 18
    .line 19
    invoke-interface {v0, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-ne p1, v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move v0, v1

    .line 28
    :goto_0
    if-eqz v0, :cond_3

    .line 29
    .line 30
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object v2, v2, Ll/dkb;->O6:Ll/byd0;

    .line 35
    .line 36
    invoke-static {}, Ll/pzi0;->o()J

    .line 37
    .line 38
    .line 39
    move-result-wide v3

    .line 40
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->r2:Lrx/subjects/a;

    .line 52
    .line 53
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 59
    .line 60
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 67
    .line 68
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l(Z)V

    .line 69
    .line 70
    .line 71
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->u5()V

    .line 74
    .line 75
    .line 76
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 79
    .line 80
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 81
    .line 82
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 83
    .line 84
    .line 85
    move-result-wide v2

    .line 86
    long-to-double v2, v2

    .line 87
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->p6(Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 94
    .line 95
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eq v0, p1, :cond_4

    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 110
    .line 111
    invoke-virtual {v0, p1, p2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 112
    .line 113
    .line 114
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 115
    .line 116
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-eqz p2, :cond_5

    .line 121
    .line 122
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 123
    .line 124
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->k(I)V

    .line 125
    .line 126
    .line 127
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->o6()V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-direct {p1, p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Landroidx/fragment/app/FragmentManager;I)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->i5(Z)Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->i5()Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->l(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-virtual {p1, v0}, Lv/VPager;->setScrollble(Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 59
    .line 60
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$a;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_0

    .line 77
    .line 78
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const-string v1, "init_conversation_tab_index"

    .line 83
    .line 84
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_0

    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2, v1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 101
    .line 102
    .line 103
    :cond_0
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object p1, p1, Ll/r8n;->k:Ll/wyd0;

    .line 108
    .line 109
    const-string v0, ""

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H5()V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public final g6()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h6(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;->h(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zt6;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C5(Ll/zt6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i6(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->c0()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;->i(ILcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->MsgDoubleTabInflate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {p1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    new-instance p2, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C0()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 31
    .line 32
    .line 33
    sget-object p1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->MsgSearchInflate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 34
    .line 35
    filled-new-array {p1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p2}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 40
    .line 41
    .line 42
    new-instance p2, Lv/VPager;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C0()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-direct {p2, v0}, Lv/VPager;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 52
    .line 53
    sget v0, Ll/adc0;->o9:I

    .line 54
    .line 55
    invoke-virtual {p2, v0}, Landroid/view/View;->setId(I)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B:Landroid/widget/FrameLayout;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->C:Lv/VPager;

    .line 61
    .line 62
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 63
    .line 64
    invoke-direct {v2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 71
    .line 72
    .line 73
    new-instance p1, Landroid/view/View;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-direct {p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 83
    .line 84
    const-string p2, "#7fffffff"

    .line 85
    .line 86
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B:Landroid/widget/FrameLayout;

    .line 94
    .line 95
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 96
    .line 97
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 101
    .line 102
    const/4 p2, 0x0

    .line 103
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-interface {p1, p0}, Ll/eu9;->g(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B:Landroid/widget/FrameLayout;

    .line 114
    .line 115
    return-object p0
.end method

.method public j6(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;->j(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k6()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;->k()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public l6(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 10
    .line 11
    new-instance v0, Ll/ts6;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/ts6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 p1, 0x4

    .line 21
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->I:Landroid/view/View;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final m6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->a2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->xe()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/gs6;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/gs6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/hs6;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/hs6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setHasOptionsMenu(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, v0}, Ll/c30;->w(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, v0}, Ll/c30;->y(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->g6()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1, p0}, Ll/eu9;->d(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public n6()V
    .locals 4

    .line 1
    invoke-static {}, Ll/s75;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/h39;->i()Lcom/p1/mobile/putong/core/data/CityCentreConfig;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {}, Ll/pzi0;->o()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    long-to-double v0, v0

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 20
    .line 21
    iget-wide v2, v2, Ll/no7;->R:D

    .line 22
    .line 23
    sub-double/2addr v0, v2

    .line 24
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    div-double/2addr v0, v2

    .line 30
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CityCentreConfig;->refresh_interval_seconds:I

    .line 37
    .line 38
    int-to-double v2, p0

    .line 39
    cmpl-double p0, v0, v2

    .line 40
    .line 41
    if-lez p0, :cond_2

    .line 42
    .line 43
    invoke-static {}, Ll/s75;->m()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/no7;->T3()V

    .line 54
    .line 55
    .line 56
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_2

    .line 69
    .line 70
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ll/s75;->o()V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    return-void
.end method

.method public o6()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 16
    .line 17
    invoke-interface {v2, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-ne v1, p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;->l(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/app/AutoReleaseVideoFrag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->P:Ll/zt6;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/zt6;->Z()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->P:Ll/zt6;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zt6;->a0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4
    .param p1    # Landroid/view/Menu;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/MenuInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->O:Landroid/view/Menu;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/app/PutongAct;->initSearchMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Ll/bkj0;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Landroidx/appcompat/widget/Toolbar;->getContentInsetRight()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-virtual {v1, v3, v2}, Landroidx/appcompat/widget/Toolbar;->setContentInsetsRelative(II)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v1, Landroidx/appcompat/widget/SearchView;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 45
    .line 46
    iget-object v2, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v2, Landroid/view/View;

    .line 49
    .line 50
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->K:Landroid/view/View;

    .line 51
    .line 52
    iget-object p2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast p2, Landroid/view/View;

    .line 55
    .line 56
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->L:Landroid/view/View;

    .line 57
    .line 58
    new-instance p2, Ll/at6;

    .line 59
    .line 60
    invoke-direct {p2, p0, v0}, Ll/at6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, p2}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 67
    .line 68
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$b;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$m;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 77
    .line 78
    new-instance v0, Ll/bt6;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/bt6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$l;)V

    .line 84
    .line 85
    .line 86
    new-instance p2, Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .line 90
    .line 91
    const-string v0, "-1"

    .line 92
    .line 93
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->N:Ll/kcg0;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_1

    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->N:Ll/kcg0;

    .line 105
    .line 106
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 107
    .line 108
    .line 109
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/ct6;

    .line 114
    .line 115
    invoke-direct {v1, p0, p2}, Ll/ct6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Ljava/util/List;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    const/4 v0, 0x1

    .line 127
    invoke-virtual {p2, v0}, Lrx/c;->take(I)Lrx/c;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    new-instance v0, Ll/dt6;

    .line 132
    .line 133
    invoke-direct {v0, p0, p1}, Ll/dt6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;Landroid/view/Menu;)V

    .line 134
    .line 135
    .line 136
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->N:Ll/kcg0;

    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 147
    .line 148
    sget p2, Ll/xdc0;->D:I

    .line 149
    .line 150
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Landroid/widget/ImageView;

    .line 155
    .line 156
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    sget v0, Ll/dbc0;->la:I

    .line 161
    .line 162
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 170
    .line 171
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 172
    .line 173
    .line 174
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->P:Ll/zt6;

    .line 175
    .line 176
    invoke-virtual {p0}, Ll/zt6;->U0()V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    move v0, v1

    .line 21
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->getCount()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-ge v0, v2, :cond_1

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    instance-of v3, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 36
    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    check-cast v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 40
    .line 41
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->w5(Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v0, 0x1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/p560;->c()V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->Y:Z

    .line 61
    .line 62
    :goto_1
    if-eqz p1, :cond_3

    .line 63
    .line 64
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->n2:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-lez v2, :cond_3

    .line 75
    .line 76
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 79
    .line 80
    iget-object v3, v2, Lcom/p1/mobile/putong/core/api/g;->n2:Ljava/util/List;

    .line 81
    .line 82
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Sn(Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->P:Ll/zt6;

    .line 86
    .line 87
    invoke-virtual {v2, p1}, Ll/zt6;->S0(Z)V

    .line 88
    .line 89
    .line 90
    if-nez p1, :cond_e

    .line 91
    .line 92
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 93
    .line 94
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_4

    .line 99
    .line 100
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 101
    .line 102
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 103
    .line 104
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 105
    .line 106
    invoke-interface {v3, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-ne v2, v3, :cond_4

    .line 111
    .line 112
    move v2, v0

    .line 113
    goto :goto_2

    .line 114
    :cond_4
    move v2, v1

    .line 115
    :goto_2
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->p6(Z)V

    .line 116
    .line 117
    .line 118
    if-eqz v2, :cond_6

    .line 119
    .line 120
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 123
    .line 124
    iget-object v2, v2, Ll/dkb;->O6:Ll/byd0;

    .line 125
    .line 126
    invoke-static {}, Ll/pzi0;->o()J

    .line 127
    .line 128
    .line 129
    move-result-wide v3

    .line 130
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-virtual {v2, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->r2:Lrx/subjects/a;

    .line 142
    .line 143
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 144
    .line 145
    invoke-virtual {v2, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 149
    .line 150
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    if-eqz v2, :cond_5

    .line 155
    .line 156
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;

    .line 157
    .line 158
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLeftToolBar;->l(Z)V

    .line 159
    .line 160
    .line 161
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 162
    .line 163
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->u5()V

    .line 164
    .line 165
    .line 166
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->g6()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->U4()V

    .line 170
    .line 171
    .line 172
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    const/4 v3, 0x3

    .line 177
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ei(I)Z

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    if-eqz v2, :cond_7

    .line 182
    .line 183
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-interface {v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-interface {v2}, Ll/qam;->j()V

    .line 192
    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    invoke-interface {v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-interface {v2}, Ll/hbs;->c()Z

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    if-nez v2, :cond_8

    .line 208
    .line 209
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-interface {v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-interface {v2}, Ll/hbs;->d()Z

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    if-eqz v2, :cond_9

    .line 222
    .line 223
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    invoke-interface {v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-interface {v2}, Ll/qam;->c()V

    .line 232
    .line 233
    .line 234
    :cond_9
    :goto_3
    invoke-static {}, Ll/d79;->U()Z

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    if-eqz v2, :cond_a

    .line 239
    .line 240
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 241
    .line 242
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 243
    .line 244
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 245
    .line 246
    .line 247
    :cond_a
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 248
    .line 249
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    if-eqz v2, :cond_b

    .line 254
    .line 255
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 256
    .line 257
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z5()V

    .line 258
    .line 259
    .line 260
    :cond_b
    invoke-static {}, Ll/gra;->D2()Z

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    if-eqz v2, :cond_10

    .line 265
    .line 266
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    invoke-virtual {v2, v3, v0}, Ll/w250;->f(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 275
    .line 276
    .line 277
    move-result v2

    .line 278
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 279
    .line 280
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    if-eqz v3, :cond_d

    .line 285
    .line 286
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 287
    .line 288
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 289
    .line 290
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    if-eqz v3, :cond_d

    .line 295
    .line 296
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 297
    .line 298
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 299
    .line 300
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 301
    .line 302
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    move-result v3

    .line 306
    if-eqz v3, :cond_d

    .line 307
    .line 308
    if-nez v2, :cond_d

    .line 309
    .line 310
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 311
    .line 312
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 313
    .line 314
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 315
    .line 316
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->k0()Z

    .line 317
    .line 318
    .line 319
    move-result v2

    .line 320
    if-eqz v2, :cond_c

    .line 321
    .line 322
    goto :goto_4

    .line 323
    :cond_c
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    invoke-virtual {v2}, Ll/w250;->c()Z

    .line 328
    .line 329
    .line 330
    move-result v2

    .line 331
    if-eqz v2, :cond_d

    .line 332
    .line 333
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 334
    .line 335
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 336
    .line 337
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 338
    .line 339
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K0()V

    .line 340
    .line 341
    .line 342
    :cond_d
    :goto_4
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 343
    .line 344
    .line 345
    move-result-object v2

    .line 346
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 347
    .line 348
    .line 349
    move-result-object v3

    .line 350
    invoke-virtual {v2, v3, v0}, Ll/w250;->f(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 351
    .line 352
    .line 353
    goto :goto_5

    .line 354
    :cond_e
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 355
    .line 356
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    move-result v2

    .line 360
    if-eqz v2, :cond_f

    .line 361
    .line 362
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 363
    .line 364
    const-string v3, ""

    .line 365
    .line 366
    invoke-virtual {v2, v3, v0}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 367
    .line 368
    .line 369
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->J:Landroidx/appcompat/widget/SearchView;

    .line 370
    .line 371
    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 372
    .line 373
    .line 374
    :cond_f
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    const-string v2, "all_match_tip_key"

    .line 379
    .line 380
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    :cond_10
    :goto_5
    if-nez p1, :cond_11

    .line 384
    .line 385
    invoke-static {}, Ll/gra;->k2()Z

    .line 386
    .line 387
    .line 388
    move-result v0

    .line 389
    if-eqz v0, :cond_11

    .line 390
    .line 391
    invoke-static {}, Ll/pzi0;->o()J

    .line 392
    .line 393
    .line 394
    move-result-wide v2

    .line 395
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 396
    .line 397
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 398
    .line 399
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->h1:Ll/byd0;

    .line 400
    .line 401
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    check-cast v0, Ljava/lang/Long;

    .line 406
    .line 407
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 408
    .line 409
    .line 410
    move-result-wide v4

    .line 411
    invoke-static {v2, v3, v4, v5}, Ll/yab;->C(JJ)Z

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    invoke-static {}, Ll/gra;->z0()I

    .line 416
    .line 417
    .line 418
    move-result v2

    .line 419
    invoke-static {}, Ll/gra;->A0()I

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 424
    .line 425
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 426
    .line 427
    invoke-virtual {v4, v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/api/g;->vp(ZIIZ)V

    .line 428
    .line 429
    .line 430
    :cond_11
    if-eqz p1, :cond_12

    .line 431
    .line 432
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    const-string v1, "showNewMatchUserGuidePop"

    .line 437
    .line 438
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 439
    .line 440
    .line 441
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 442
    .line 443
    .line 444
    move-result-object v0

    .line 445
    const-string v1, "newUserShowGuidePop"

    .line 446
    .line 447
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 448
    .line 449
    .line 450
    :cond_12
    if-nez p1, :cond_13

    .line 451
    .line 452
    invoke-static {}, Ll/d09;->e()Z

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    if-eqz v0, :cond_13

    .line 457
    .line 458
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 459
    .line 460
    .line 461
    move-result-object v0

    .line 462
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 463
    .line 464
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 465
    .line 466
    invoke-virtual {v1}, Ll/d19;->E3()Lrx/c;

    .line 467
    .line 468
    .line 469
    move-result-object v1

    .line 470
    new-instance v2, Ll/fs6;

    .line 471
    .line 472
    invoke-direct {v2}, Ll/fs6;-><init>()V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 476
    .line 477
    .line 478
    move-result-object v1

    .line 479
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    invoke-static {}, Ll/psd0;->F()Lcom/p1/mobile/android/rx/a;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 488
    .line 489
    .line 490
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 491
    .line 492
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 493
    .line 494
    .line 495
    const/4 v0, 0x0

    .line 496
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 497
    .line 498
    .line 499
    move-result v1

    .line 500
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 501
    .line 502
    if-nez v1, :cond_18

    .line 503
    .line 504
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 505
    .line 506
    .line 507
    move-result v0

    .line 508
    if-eqz v0, :cond_14

    .line 509
    .line 510
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 511
    .line 512
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 513
    .line 514
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 515
    .line 516
    .line 517
    move-result v0

    .line 518
    if-eqz v0, :cond_14

    .line 519
    .line 520
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 521
    .line 522
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 523
    .line 524
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 525
    .line 526
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 527
    .line 528
    .line 529
    move-result v0

    .line 530
    if-eqz v0, :cond_14

    .line 531
    .line 532
    if-nez p1, :cond_14

    .line 533
    .line 534
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->G:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 535
    .line 536
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 537
    .line 538
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 539
    .line 540
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->v0()V

    .line 541
    .line 542
    .line 543
    :cond_14
    if-nez p1, :cond_15

    .line 544
    .line 545
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->n6()V

    .line 546
    .line 547
    .line 548
    :cond_15
    if-nez p1, :cond_16

    .line 549
    .line 550
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 551
    .line 552
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 553
    .line 554
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->lp()V

    .line 555
    .line 556
    .line 557
    :cond_16
    if-nez p1, :cond_17

    .line 558
    .line 559
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 560
    .line 561
    .line 562
    move-result-object v0

    .line 563
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 564
    .line 565
    .line 566
    move-result-object v0

    .line 567
    invoke-interface {v0}, Ll/ftn0;->c()Z

    .line 568
    .line 569
    .line 570
    move-result v0

    .line 571
    if-eqz v0, :cond_17

    .line 572
    .line 573
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 574
    .line 575
    .line 576
    move-result-object v0

    .line 577
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 578
    .line 579
    .line 580
    move-result-object v0

    .line 581
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 582
    .line 583
    .line 584
    move-result-object v1

    .line 585
    invoke-interface {v0, v1}, Ll/ftn0;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 586
    .line 587
    .line 588
    :cond_17
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 589
    .line 590
    .line 591
    return-void

    .line 592
    :cond_18
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 593
    .line 594
    .line 595
    throw v0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 2
    .param p1    # Landroid/view/Menu;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->M:I

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->F:Ljava/util/List;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ne p1, v0, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, 0x0

    .line 27
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->p6(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final p6(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->O:Landroid/view/Menu;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget v0, Ll/adc0;->n8:I

    .line 7
    .line 8
    invoke-interface {p0, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    if-eqz p1, :cond_2

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    iget-object p1, p1, Ll/dkb;->t0:Ll/jxd0;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_4

    .line 39
    .line 40
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_3
    :goto_0
    return-void

    .line 56
    :cond_4
    :goto_1
    const/4 p1, 0x1

    .line 57
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_messages_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public y4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->y4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag$c;->k(Landroidx/fragment/app/FragmentManager;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
