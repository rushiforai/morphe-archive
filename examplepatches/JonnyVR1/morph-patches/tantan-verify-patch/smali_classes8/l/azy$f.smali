.class public Ll/azy$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/azy;->B(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

.field public final synthetic b:Ll/azy;


# direct methods
.method public constructor <init>(Ll/azy;Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/azy$f;->b:Ll/azy;

    .line 2
    .line 3
    iput-object p2, p0, Ll/azy$f;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/azy$f;->b:Ll/azy;

    .line 2
    .line 3
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    iget-object p0, p0, Ll/azy$f;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->v0(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
