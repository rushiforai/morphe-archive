.class public final synthetic Ll/p9y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p9y;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;

    iput-object p2, p0, Ll/p9y;->b:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p9y;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;

    iget-object p0, p0, Ll/p9y;->b:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->m0(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V

    return-void
.end method
