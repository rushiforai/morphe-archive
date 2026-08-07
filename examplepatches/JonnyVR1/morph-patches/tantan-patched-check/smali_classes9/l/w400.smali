.class public final synthetic Ll/w400;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g500;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/g500;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w400;->a:Ll/g500;

    iput-object p2, p0, Ll/w400;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/w400;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w400;->a:Ll/g500;

    iget-object v1, p0, Ll/w400;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/w400;->c:Landroid/view/View;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1}, Ll/g500;->r0(Ll/g500;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method
