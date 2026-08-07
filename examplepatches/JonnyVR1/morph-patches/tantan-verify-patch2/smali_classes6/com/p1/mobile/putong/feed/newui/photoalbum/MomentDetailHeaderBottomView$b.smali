.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->z(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/GroupIdBox;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->s(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->s(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->a()Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
