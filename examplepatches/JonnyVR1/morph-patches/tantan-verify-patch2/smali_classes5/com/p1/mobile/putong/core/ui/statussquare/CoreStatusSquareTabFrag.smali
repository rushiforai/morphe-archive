.class public Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# static fields
.field public static X:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static Y:Ljava/lang/String;


# instance fields
.field public A:Lv/VImage;

.field public B:Lv/VImage;

.field public C:Lv/VImage;

.field public D:Lv/VPullDownRefreshLayout;

.field public E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

.field public F:Lv/VLinear;

.field public final G:J

.field public H:Lv/VText;

.field public I:Lv/VProgressBar;

.field public J:Ljava/lang/String;

.field public final K:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public final L:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public M:Ljava/lang/Runnable;

.field public N:Z

.field public O:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;

.field public P:Ljava/lang/String;

.field public Q:I

.field public R:Z

.field public S:I

.field public T:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public U:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

.field public V:I

.field public W:I

.field public z:Lv/VRelative;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->X:Lrx/subjects/b;

    .line 6
    .line 7
    const-string v0, "\u8bed\u804a\u4e2d"

    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Y:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0x5265c00

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->G:J

    .line 8
    .line 9
    new-instance v0, Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->K:Ljava/util/Queue;

    .line 15
    .line 16
    new-instance v0, Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->L:Ljava/util/Queue;

    .line 22
    .line 23
    new-instance v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->N:Z

    .line 32
    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Q:I

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R:Z

    .line 37
    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->S:I

    .line 39
    .line 40
    const/4 v0, 0x4

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->V:I

    .line 42
    .line 43
    const/4 v0, 0x3

    .line 44
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->W:I

    .line 45
    .line 46
    return-void
.end method

.method private synthetic E4(Lcom/p1/mobile/android/app/c;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R5()V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->N:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 22
    .line 23
    const-wide/16 v2, 0x7d0

    .line 24
    .line 25
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 26
    .line 27
    .line 28
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 29
    .line 30
    if-ne p1, v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->p5()V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 36
    .line 37
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method private synthetic F5(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->N:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 25
    .line 26
    const-wide/16 v0, 0x7d0

    .line 27
    .line 28
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void

    .line 32
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 33
    .line 34
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic G5(Z)V
    .locals 2

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->N:Z

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 14
    .line 15
    const-wide/16 v0, 0x7d0

    .line 16
    .line 17
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic H5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->F:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->C5(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->J5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->H5()V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/util/List;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M5(Ljava/util/List;Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->G5(Z)V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->B5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->I5(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->O5(ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->F5(Ll/pf60;)V

    return-void
.end method

.method public static synthetic Z4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/util/List;Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->L5(Ljava/util/List;Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic a5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->N5(ZLjava/util/List;)V

    return-void
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->K5(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->A5(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static bridge synthetic d5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic e5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->U:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    return-object p0
.end method

.method public static bridge synthetic f5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Ljava/util/Queue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->K:Ljava/util/Queue;

    return-object p0
.end method

.method public static bridge synthetic g5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->J:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic h5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Lv/VProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->I:Lv/VProgressBar;

    return-object p0
.end method

.method public static bridge synthetic i5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->H:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic j5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->N:Z

    return-void
.end method

.method public static bridge synthetic k5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->V:I

    return-void
.end method

.method public static bridge synthetic l5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->U:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    return-void
.end method

.method public static n5(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;I)Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "bubbleInfo"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 14
    .line 15
    .line 16
    const-string p1, "footRes"

    .line 17
    .line 18
    invoke-virtual {v1, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    const-string p1, "from"

    .line 22
    .line 23
    invoke-virtual {v1, p1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method private o5(Lcom/p1/mobile/putong/data/BubbleInfo;)Z
    .locals 2

    .line 1
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 2
    .line 3
    const-wide v0, 0x4194997000000000L    # 8.64E7

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    add-double/2addr p0, v0

    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    long-to-double v0, v0

    .line 14
    sub-double/2addr p0, v0

    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    cmpl-double p0, p0, v0

    .line 18
    .line 19
    if-lez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method


# virtual methods
.method public final synthetic A5(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 9
    .line 10
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/data/StateEmotion;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StateEmotion;->emotions:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/data/StateEmotion;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StateEmotion;->categoryName:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/p1/mobile/putong/data/StateEmotion;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StateEmotion;->categoryName:Ljava/lang/String;

    .line 61
    .line 62
    sput-object v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Y:Ljava/lang/String;

    .line 63
    .line 64
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/p1/mobile/putong/data/StateEmotion;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StateEmotion;->emotions:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    const/4 v0, 0x1

    .line 79
    goto :goto_0

    .line 80
    :cond_1
    move v0, v1

    .line 81
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R:Z

    .line 82
    .line 83
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Lcom/p1/mobile/putong/data/StateEmotion;

    .line 88
    .line 89
    iget-object p1, p1, Lcom/p1/mobile/putong/data/StateEmotion;->emotions:Ljava/util/List;

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Q5(Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R:Z

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_3
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R:Z

    .line 99
    .line 100
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->y5()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final synthetic B5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->y5()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R:Z

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic C5(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 9
    .line 10
    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->T:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 21
    .line 22
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-ge v1, v2, :cond_1

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 39
    .line 40
    iget-object v3, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->T:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 43
    .line 44
    iget-object v4, v4, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_0

    .line 51
    .line 52
    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->T:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 60
    .line 61
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    :cond_2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->x5(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/List;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v0, Ll/qza;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/qza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->z5(Ljava/util/List;Ll/y20;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->z:Lv/VRelative;

    .line 78
    .line 79
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->F:Lv/VLinear;

    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 89
    .line 90
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->G(Z)Ll/mvc0;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic D5(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->getData()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->F:Lv/VLinear;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->G(Z)Ll/mvc0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic E5(Ljava/util/List;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->setDataList(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->z:Lv/VRelative;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->F:Lv/VLinear;

    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 25
    .line 26
    invoke-virtual {p1, v2}, Lv/smart_refresh/SmartRefreshLayout;->G(Z)Ll/mvc0;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->J:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->H:Lv/VText;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->H:Lv/VText;

    .line 50
    .line 51
    const-string v0, "\u65e0\u66f4\u591a\u72b6\u6001"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->I:Lv/VProgressBar;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->I:Lv/VProgressBar;

    .line 65
    .line 66
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 70
    .line 71
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->o()Ll/mvc0;

    .line 72
    .line 73
    .line 74
    :cond_3
    return-void
.end method

.method public final synthetic I5(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;)V
    .locals 14

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->getDataWrapper()Ll/uf3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->e:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 8
    .line 9
    sget-object v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;->momentChatRoom:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 10
    .line 11
    const-string v3, "owner_id"

    .line 12
    .line 13
    const-string v4, "state_id"

    .line 14
    .line 15
    const-string v5, "e_state_type"

    .line 16
    .line 17
    const-string v6, "e_state"

    .line 18
    .line 19
    const-string v7, "p_state_explore"

    .line 20
    .line 21
    if-ne v1, v2, :cond_0

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "anchorId"

    .line 28
    .line 29
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v8

    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, "liveId"

    .line 38
    .line 39
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v9

    .line 43
    const-string v1, "audio_card_type"

    .line 44
    .line 45
    const-string v2, "state_explore_bubble"

    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v10

    .line 51
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->topicId:Ljava/lang/String;

    .line 54
    .line 55
    const-string v2, "topic_id"

    .line 56
    .line 57
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v11

    .line 61
    const-string v1, "audio_room_label"

    .line 62
    .line 63
    const-string v2, ""

    .line 64
    .line 65
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v12

    .line 69
    const-string v1, "voice_template"

    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v13

    .line 75
    filled-new-array/range {v8 .. v13}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const-string v8, "e_live_audio_room_enter"

    .line 80
    .line 81
    invoke-static {v8, v7, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    const-string v1, "audio_room"

    .line 85
    .line 86
    invoke-static {v5, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const-string v5, "refer_source"

    .line 91
    .line 92
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->P:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v5, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 103
    .line 104
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v3, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    filled-new-array {v1, v5, v4, v3}, [Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-static {v6, v7, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 132
    .line 133
    invoke-interface {v1, p0, v0, v7, v2}, Ll/ftn0;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->f()V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iget-object v2, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 149
    .line 150
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 151
    .line 152
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_1

    .line 159
    .line 160
    return-void

    .line 161
    :cond_1
    const-string v1, "state"

    .line 162
    .line 163
    invoke-static {v5, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    iget-object v2, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 168
    .line 169
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    iget-object v4, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 176
    .line 177
    iget-object v4, v4, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 178
    .line 179
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 180
    .line 181
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    filled-new-array {v1, v2, v3}, [Ll/pf60;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-static {v6, v7, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 190
    .line 191
    .line 192
    iget-object v1, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 193
    .line 194
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->o5(Lcom/p1/mobile/putong/data/BubbleInfo;)Z

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    if-nez v2, :cond_2

    .line 199
    .line 200
    const-string p1, "\u72b6\u6001\u5df2\u7ed3\u675f"

    .line 201
    .line 202
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 206
    .line 207
    new-instance v1, Ll/wza;

    .line 208
    .line 209
    invoke-direct {v1, p0}, Ll/wza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->P(Ll/uf3;Ll/x20;)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :cond_2
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->O:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;

    .line 217
    .line 218
    new-instance p1, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 219
    .line 220
    iget-object v0, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 221
    .line 222
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 223
    .line 224
    invoke-direct {p1, v0, v7}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    const-string v0, "p_quickchat,state"

    .line 228
    .line 229
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public final synthetic J5(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->O:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->O:Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->f()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic K5(Ll/mvc0;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->N:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->M:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->u5()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->V:I

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->J:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->P5(Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic L5(Ljava/util/List;Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 4
    .line 5
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    check-cast p3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/data/StateEmotion;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StateEmotion;->emotions:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/data/StateEmotion;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StateEmotion;->emotions:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    move v0, v1

    .line 51
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R:Z

    .line 52
    .line 53
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    check-cast p3, Lcom/p1/mobile/putong/data/StateEmotion;

    .line 58
    .line 59
    iget-object p3, p3, Lcom/p1/mobile/putong/data/StateEmotion;->emotions:Ljava/util/List;

    .line 60
    .line 61
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Q5(Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R:Z

    .line 66
    .line 67
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->z5(Ljava/util/List;Ll/y20;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic M5(Ljava/util/List;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    .line 2
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R:Z

    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->z5(Ljava/util/List;Ll/y20;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic N5(ZLjava/util/List;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x2

    .line 9
    if-ne v1, v2, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->U:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 19
    .line 20
    new-instance p1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 30
    .line 31
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->J(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    if-eqz p1, :cond_1

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->U:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->J(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->J:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_4

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->K:Ljava/util/Queue;

    .line 59
    .line 60
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_4

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->H:Lv/VText;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->H:Lv/VText;

    .line 75
    .line 76
    const-string p2, "\u65e0\u66f4\u591a\u72b6\u6001"

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->I:Lv/VProgressBar;

    .line 82
    .line 83
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->I:Lv/VProgressBar;

    .line 90
    .line 91
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->G(Z)Ll/mvc0;

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 100
    .line 101
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->o()Ll/mvc0;

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final synthetic O5(ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 5

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->T:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v1, v2, :cond_1

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 33
    .line 34
    iget-object v3, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->T:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 37
    .line 38
    iget-object v4, v4, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->x5(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/List;)Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->K:Ljava/util/Queue;

    .line 57
    .line 58
    invoke-interface {v0, p2}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->J:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->P5(Ljava/lang/String;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public P5(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->K:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->V:I

    .line 8
    .line 9
    if-ge v0, v1, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->K:Ljava/util/Queue;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->gk(Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/yza;

    .line 46
    .line 47
    invoke-direct {v0, p0, p2}, Ll/yza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Z)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Ll/zza;

    .line 51
    .line 52
    invoke-direct {p0}, Ll/zza;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->s5()Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance v0, Ll/xza;

    .line 68
    .line 69
    invoke-direct {v0, p0, p2}, Ll/xza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->z5(Ljava/util/List;Ll/y20;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final Q5(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Emotion;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v1, v2, :cond_1

    .line 19
    .line 20
    new-instance v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 21
    .line 22
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lcom/p1/mobile/putong/data/Emotion;

    .line 30
    .line 31
    iput-object v3, v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 32
    .line 33
    sget-object v3, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;->momentChatRoom:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 34
    .line 35
    iput-object v3, v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->e:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 36
    .line 37
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->L:Ljava/util/Queue;

    .line 44
    .line 45
    invoke-interface {p0, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public R5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/jza;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/jza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->H7()Lrx/subjects/b;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/rza;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/rza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->t5()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->W:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    const-string p1, ""

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "from"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->P:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->setReferSource(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 37
    .line 38
    const-string v0, "p_state_explore"

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->setFrom(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 44
    .line 45
    new-instance v0, Ll/sza;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/sza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->setBottomListener(Ll/ll50;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 54
    .line 55
    new-instance v0, Ll/tza;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/tza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->setClickListener(Ll/y20;)V

    .line 61
    .line 62
    .line 63
    sget-object p1, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->X:Lrx/subjects/b;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance v0, Ll/uza;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/uza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 82
    .line 83
    new-instance v0, Ll/vza;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/vza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v0}, Lv/VPullDownRefreshLayout;->M(Ll/tm50;)Ll/mvc0;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v1, "footRes"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    const/4 v1, 0x0

    .line 110
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    sget v0, Ll/adc0;->Xa:I

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Landroid/widget/LinearLayout;

    .line 121
    .line 122
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->w5(Landroid/widget/LinearLayout;)Lv/VText;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->H:Lv/VText;

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->v5(Landroid/widget/LinearLayout;)Lv/VProgressBar;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->I:Lv/VProgressBar;

    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->H:Lv/VText;

    .line 135
    .line 136
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_1

    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->H:Lv/VText;

    .line 143
    .line 144
    const-string v1, "\u6b63\u5728\u52a0\u8f7d\u66f4\u591a\u72b6\u6001..."

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 150
    .line 151
    new-instance v1, Lv/smart_refresh/wrapper/RefreshFooterWrapper;

    .line 152
    .line 153
    invoke-direct {v1, p1}, Lv/smart_refresh/wrapper/RefreshFooterWrapper;-><init>(Landroid/view/View;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v1}, Lv/VPullDownRefreshLayout;->Q(Ll/jvc0;)Ll/mvc0;

    .line 157
    .line 158
    .line 159
    const/4 v0, 0x0

    .line 160
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 164
    .line 165
    new-instance v1, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;

    .line 166
    .line 167
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Landroid/view/View;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->N(Ll/xm50;)Ll/mvc0;

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 174
    .line 175
    new-instance v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$c;

    .line 176
    .line 177
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$c;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->r5()V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->m5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/a0b;->b(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_state_explore"

    .line 2
    .line 3
    return-object p0
.end method

.method public q5(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Sd()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    new-instance p1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v0, "\u627e\u4eba\u4e00\u8d77"

    .line 38
    .line 39
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    :cond_0
    return-object p0
.end method

.method public final r5()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "bubbleInfo"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->T:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->q1:Lcom/p1/mobile/putong/core/api/i;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/i;->u3()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/kza;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/kza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/lza;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/lza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final s5()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->V:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->K:Ljava/util/Queue;

    .line 12
    .line 13
    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 18
    .line 19
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-object v0
.end method

.method public t5()I
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "moment_post_status_config"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "insertCount"

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->W:I

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    const/4 v0, 0x3

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->W:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    :catch_0
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->W:I

    .line 36
    .line 37
    return p0
.end method

.method public u5()I
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "moment_post_status_config"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "stateSquareLimit"

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return p0

    .line 29
    :catch_0
    :cond_0
    const/4 p0, 0x4

    .line 30
    return p0
.end method

.method public final v5(Landroid/widget/LinearLayout;)Lv/VProgressBar;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p0, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v1, v0, Lv/VProgressBar;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    check-cast v0, Lv/VProgressBar;

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public w5(Landroid/widget/LinearLayout;)Lv/VText;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p0, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v1, v0, Lv/VText;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    check-cast v0, Lv/VText;

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final x5(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->J:Ljava/lang/String;

    .line 8
    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_1

    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 22
    .line 23
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 31
    .line 32
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->q5(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iput-object v3, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v3, Lcom/p1/mobile/putong/core/data/Bubbles;

    .line 39
    .line 40
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/Bubbles;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v4, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 44
    .line 45
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/Bubbles;->userID:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    iget-object v5, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 54
    .line 55
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v4, v5}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    if-nez v4, :cond_0

    .line 62
    .line 63
    const-string v4, ""

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_0
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    :goto_1
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v3, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->f:Lcom/p1/mobile/putong/core/data/Bubbles;

    .line 81
    .line 82
    iput-object v2, v1, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 83
    .line 84
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    add-int/lit8 v0, v0, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    return-object p1
.end method

.method public y5()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->J:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->gk(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/mza;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/mza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/nza;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/nza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final z5(Ljava/util/List;Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
            ">;",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->W:I

    .line 21
    .line 22
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Q:I

    .line 23
    .line 24
    sub-int v2, v1, v2

    .line 25
    .line 26
    sub-int/2addr v0, v2

    .line 27
    div-int/2addr v0, v1

    .line 28
    const/4 v1, 0x1

    .line 29
    add-int/2addr v0, v1

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->L:Ljava/util/Queue;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/Collection;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-le v0, v2, :cond_2

    .line 37
    .line 38
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->R:Z

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->q1:Lcom/p1/mobile/putong/core/api/i;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/i;->u3()Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/oza;

    .line 56
    .line 57
    invoke-direct {v1, p0, p1, p2}, Ll/oza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/util/List;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    new-instance v2, Ll/pza;

    .line 61
    .line 62
    invoke-direct {v2, p0, p1, p2}, Ll/pza;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/util/List;Ll/y20;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    new-instance v2, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    const/4 v3, 0x0

    .line 84
    move v4, v3

    .line 85
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->S:I

    .line 90
    .line 91
    if-ge v4, v5, :cond_7

    .line 92
    .line 93
    add-int/lit8 v6, v6, 0x1

    .line 94
    .line 95
    iput v6, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->S:I

    .line 96
    .line 97
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    check-cast v5, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 102
    .line 103
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->W:I

    .line 111
    .line 112
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Q:I

    .line 113
    .line 114
    sub-int/2addr v6, v7

    .line 115
    if-ne v5, v6, :cond_6

    .line 116
    .line 117
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->L:Ljava/util/Queue;

    .line 118
    .line 119
    invoke-interface {v5}, Ljava/util/Collection;->size()I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-lez v5, :cond_5

    .line 124
    .line 125
    new-instance v5, Ljava/util/Random;

    .line 126
    .line 127
    invoke-direct {v5}, Ljava/util/Random;-><init>()V

    .line 128
    .line 129
    .line 130
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->W:I

    .line 131
    .line 132
    invoke-virtual {v5, v6}, Ljava/util/Random;->nextInt(I)I

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    if-nez v5, :cond_3

    .line 137
    .line 138
    move v5, v1

    .line 139
    :cond_3
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Q:I

    .line 140
    .line 141
    if-eqz v6, :cond_4

    .line 142
    .line 143
    move v5, v3

    .line 144
    :cond_4
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->L:Ljava/util/Queue;

    .line 145
    .line 146
    invoke-interface {v6}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    check-cast v6, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 151
    .line 152
    invoke-interface {v2, v5, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    :cond_5
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 156
    .line 157
    .line 158
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 159
    .line 160
    .line 161
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Q:I

    .line 162
    .line 163
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->S:I

    .line 164
    .line 165
    :cond_6
    add-int/lit8 v4, v4, 0x1

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_7
    iput v6, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Q:I

    .line 169
    .line 170
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    if-eqz p0, :cond_8

    .line 175
    .line 176
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 177
    .line 178
    .line 179
    :cond_8
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method
