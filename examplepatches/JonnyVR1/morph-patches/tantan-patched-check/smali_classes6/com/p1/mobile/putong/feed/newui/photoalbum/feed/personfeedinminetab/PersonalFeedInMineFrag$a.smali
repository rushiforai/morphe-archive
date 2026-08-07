.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag$a;
.super Ll/s8h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->X0()Ll/s8h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/s8h;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 2

    .line 1
    const/4 v0, -0x2

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->Y4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->a5(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->Y4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/zzk;->E(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;

    .line 39
    .line 40
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-super {p0, p1, p2}, Ll/s8h;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method
