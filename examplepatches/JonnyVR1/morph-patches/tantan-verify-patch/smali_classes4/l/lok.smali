.class public final synthetic Ll/lok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/mok;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Ll/mok;Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lok;->a:Ll/mok;

    iput-object p2, p0, Ll/lok;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput p3, p0, Ll/lok;->c:I

    iput-object p4, p0, Ll/lok;->d:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lok;->a:Ll/mok;

    iget-object v1, p0, Ll/lok;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget v2, p0, Ll/lok;->c:I

    iget-object p0, p0, Ll/lok;->d:Ljava/lang/StringBuilder;

    invoke-static {v0, v1, v2, p0, p1}, Ll/mok;->E(Ll/mok;Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;Landroid/view/View;)V

    return-void
.end method
