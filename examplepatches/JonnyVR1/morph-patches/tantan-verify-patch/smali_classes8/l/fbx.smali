.class public final synthetic Ll/fbx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xbx;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/xbx;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fbx;->a:Ll/xbx;

    iput-object p2, p0, Ll/fbx;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p3, p0, Ll/fbx;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/fbx;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fbx;->a:Ll/xbx;

    iget-object v1, p0, Ll/fbx;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v2, p0, Ll/fbx;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/fbx;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/xbx;->J0(Ll/xbx;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V

    return-void
.end method
