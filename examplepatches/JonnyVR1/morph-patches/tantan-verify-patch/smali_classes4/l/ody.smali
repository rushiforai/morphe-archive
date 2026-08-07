.class public final synthetic Ll/ody;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ll/dzl;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;Lcom/p1/mobile/putong/data/User;Ll/dzl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ody;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;

    iput-object p2, p0, Ll/ody;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/ody;->c:Ll/dzl;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ody;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;

    iget-object v1, p0, Ll/ody;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/ody;->c:Ll/dzl;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;Lcom/p1/mobile/putong/data/User;Ll/dzl;Landroid/view/View;)V

    return-void
.end method
