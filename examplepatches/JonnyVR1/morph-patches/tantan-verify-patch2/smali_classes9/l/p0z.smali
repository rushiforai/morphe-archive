.class public final synthetic Ll/p0z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

.field public final synthetic b:Z

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;ZILjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p0z;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    iput-boolean p2, p0, Ll/p0z;->b:Z

    iput p3, p0, Ll/p0z;->c:I

    iput-object p4, p0, Ll/p0z;->d:Ljava/lang/String;

    iput p5, p0, Ll/p0z;->e:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p0z;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    iget-boolean v1, p0, Ll/p0z;->b:Z

    iget v2, p0, Ll/p0z;->c:I

    iget-object v3, p0, Ll/p0z;->d:Ljava/lang/String;

    iget p0, p0, Ll/p0z;->e:I

    invoke-static {v0, v1, v2, v3, p0}, Ll/u1z;->p0(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;ZILjava/lang/String;I)V

    return-void
.end method
