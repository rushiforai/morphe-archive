.class public Lcom/p1/mobile/putong/core/ui/result/VipContent;
.super Lv/VRecyclerView;
.source "SourceFile"

# interfaces
.implements Ll/ugb0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/result/VipContent$a;
    }
.end annotation


# static fields
.field public static final e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/result/VipContent$a;

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 14
    .line 15
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 16
    .line 17
    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->e:Ljava/util/ArrayList;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->d:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContent;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->d:Z

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContent;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->d:Z

    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContent;->init()V

    return-void
.end method

.method public static bridge synthetic G()Ljava/util/ArrayList;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->e:Ljava/util/ArrayList;

    return-object v0
.end method

.method private init()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x41200000    # 10.0f

    .line 6
    .line 7
    invoke-static {}, Ll/vnb;->m1()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    mul-float/2addr v1, v0

    .line 12
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->c:Lcom/p1/mobile/putong/core/ui/result/VipContent$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->d:Z

    .line 22
    .line 23
    invoke-direct {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->c:Lcom/p1/mobile/putong/core/ui/result/VipContent$a;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->c:Lcom/p1/mobile/putong/core/ui/result/VipContent$a;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent;->d:Z

    .line 3
    .line 4
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContent;->H(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
