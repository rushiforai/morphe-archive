.class public final synthetic Ll/ndy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z

.field public final synthetic d:Ll/dzl;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;Lcom/p1/mobile/putong/data/User;ZLl/dzl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ndy;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;

    iput-object p2, p0, Ll/ndy;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/ndy;->c:Z

    iput-object p4, p0, Ll/ndy;->d:Ll/dzl;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ndy;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;

    iget-object v1, p0, Ll/ndy;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean v2, p0, Ll/ndy;->c:Z

    iget-object p0, p0, Ll/ndy;->d:Ll/dzl;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->b(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;Lcom/p1/mobile/putong/data/User;ZLl/dzl;Landroid/view/View;)V

    return-void
.end method
