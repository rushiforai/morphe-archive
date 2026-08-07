.class public final synthetic Ll/hgz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/lgz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Ll/lgz;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hgz;->a:Ll/lgz;

    iput-object p2, p0, Ll/hgz;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hgz;->a:Ll/lgz;

    iget-object p0, p0, Ll/hgz;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, p0, p1}, Ll/lgz;->o2(Ll/lgz;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V

    return-void
.end method
