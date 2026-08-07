.class public final synthetic Ll/lkk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pkk;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Ll/pkk;Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lkk;->a:Ll/pkk;

    iput-object p2, p0, Ll/lkk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput p3, p0, Ll/lkk;->c:I

    iput-object p4, p0, Ll/lkk;->d:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lkk;->a:Ll/pkk;

    iget-object v1, p0, Ll/lkk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget v2, p0, Ll/lkk;->c:I

    iget-object p0, p0, Ll/lkk;->d:Ljava/lang/StringBuilder;

    invoke-static {v0, v1, v2, p0, p1}, Ll/pkk;->E(Ll/pkk;Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;Landroid/view/View;)V

    return-void
.end method
