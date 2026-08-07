.class public final synthetic Ll/rbj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rbj0;->a:Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rbj0;->a:Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;

    check-cast p1, Ljava/util/HashMap;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->X4(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Ljava/util/HashMap;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
