.class public final synthetic Ll/qlk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jek$b;


# instance fields
.field public final synthetic a:Ll/hmk;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Ll/hmk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qlk;->a:Ll/hmk;

    iput-object p2, p0, Ll/qlk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qlk;->a:Ll/hmk;

    iget-object p0, p0, Ll/qlk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {v0, p0, p1, p2, p3}, Ll/hmk;->f0(Ll/hmk;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
