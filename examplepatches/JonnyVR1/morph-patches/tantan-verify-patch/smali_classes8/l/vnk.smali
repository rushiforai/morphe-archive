.class public final synthetic Ll/vnk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tnk$b;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Ll/tnk$b;ILcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vnk;->a:Ll/tnk$b;

    iput p2, p0, Ll/vnk;->b:I

    iput-object p3, p0, Ll/vnk;->c:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vnk;->a:Ll/tnk$b;

    iget v1, p0, Ll/vnk;->b:I

    iget-object p0, p0, Ll/vnk;->c:Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {v0, v1, p0, p1}, Ll/tnk$b;->F(Ll/tnk$b;ILcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V

    return-void
.end method
