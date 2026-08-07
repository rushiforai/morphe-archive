.class public final synthetic Ll/dhk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Ll/bkj0;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic e:Z

.field public final synthetic f:Lcom/p1/mobile/android/app/Act;

.field public final synthetic g:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Ll/bkj0;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dhk;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/dhk;->b:Ll/bkj0;

    iput-object p3, p0, Ll/dhk;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p4, p0, Ll/dhk;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-boolean p5, p0, Ll/dhk;->e:Z

    iput-object p6, p0, Ll/dhk;->f:Lcom/p1/mobile/android/app/Act;

    iput-object p7, p0, Ll/dhk;->g:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/dhk;->a:Landroid/widget/TextView;

    iget-object v1, p0, Ll/dhk;->b:Ll/bkj0;

    iget-object v2, p0, Ll/dhk;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v3, p0, Ll/dhk;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-boolean v4, p0, Ll/dhk;->e:Z

    iget-object v5, p0, Ll/dhk;->f:Lcom/p1/mobile/android/app/Act;

    iget-object v6, p0, Ll/dhk;->g:Ll/x20;

    move-object v7, p1

    check-cast v7, Ll/bkj0;

    invoke-static/range {v0 .. v7}, Ll/ihk;->d(Landroid/widget/TextView;Ll/bkj0;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLcom/p1/mobile/android/app/Act;Ll/x20;Ll/bkj0;)V

    return-void
.end method
