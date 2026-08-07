.class public final synthetic Ll/ccq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ccq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;

    iput-object p2, p0, Ll/ccq;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    iput-object p3, p0, Ll/ccq;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ccq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;

    iget-object v1, p0, Ll/ccq;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    iget-object p0, p0, Ll/ccq;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->c(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
