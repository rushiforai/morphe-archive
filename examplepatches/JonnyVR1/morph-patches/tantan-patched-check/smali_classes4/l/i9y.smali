.class public final synthetic Ll/i9y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i9y;->a:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    iput-object p2, p0, Ll/i9y;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i9y;->a:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    iget-object p0, p0, Ll/i9y;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->i0(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;Lcom/p1/mobile/putong/data/User;Z)V

    return-void
.end method
