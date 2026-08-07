.class public final synthetic Ll/fhk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fhk;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/fhk;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/fhk;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-boolean p4, p0, Ll/fhk;->d:Z

    iput-object p5, p0, Ll/fhk;->e:Lcom/p1/mobile/android/app/Act;

    iput-object p6, p0, Ll/fhk;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/fhk;->a:Landroid/widget/TextView;

    iget-object v1, p0, Ll/fhk;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/fhk;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-boolean v3, p0, Ll/fhk;->d:Z

    iget-object v4, p0, Ll/fhk;->e:Lcom/p1/mobile/android/app/Act;

    iget-object v5, p0, Ll/fhk;->f:Ll/x20;

    move-object v6, p1

    check-cast v6, Ll/pf60;

    invoke-static/range {v0 .. v6}, Ll/ihk;->b(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLcom/p1/mobile/android/app/Act;Ll/x20;Ll/pf60;)V

    return-void
.end method
