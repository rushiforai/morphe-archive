.class public final synthetic Ll/unk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tnk$b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;


# direct methods
.method public synthetic constructor <init>(Ll/tnk$b;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/unk;->a:Ll/tnk$b;

    iput-object p2, p0, Ll/unk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput-object p3, p0, Ll/unk;->c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/unk;->a:Ll/tnk$b;

    iget-object v1, p0, Ll/unk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget-object p0, p0, Ll/unk;->c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-static {v0, v1, p0, p1}, Ll/tnk$b;->E(Ll/tnk$b;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Landroid/view/View;)V

    return-void
.end method
