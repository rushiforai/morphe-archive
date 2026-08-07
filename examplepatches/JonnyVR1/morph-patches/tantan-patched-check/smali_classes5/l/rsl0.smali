.class public final synthetic Ll/rsl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/data/MessageLocation;


# direct methods
.method public synthetic constructor <init>(ZLl/y20;Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/rsl0;->a:Z

    iput-object p2, p0, Ll/rsl0;->b:Ll/y20;

    iput-object p3, p0, Ll/rsl0;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/rsl0;->a:Z

    iget-object v1, p0, Ll/rsl0;->b:Ll/y20;

    iget-object p0, p0, Ll/rsl0;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->b(ZLl/y20;Lcom/p1/mobile/putong/data/MessageLocation;Landroid/view/View;)V

    return-void
.end method
