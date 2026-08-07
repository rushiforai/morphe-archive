.class public final synthetic Ll/ar30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

.field public final synthetic b:Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ar30;->a:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    iput-object p2, p0, Ll/ar30;->b:Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    iput-object p3, p0, Ll/ar30;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ar30;->a:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    iget-object v1, p0, Ll/ar30;->b:Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    iget-object v2, p0, Ll/ar30;->c:Lcom/p1/mobile/putong/data/User;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->q0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/User;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
