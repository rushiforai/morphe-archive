.class public final synthetic Ll/jjm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jjm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

    iput-object p2, p0, Ll/jjm0;->b:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jjm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

    iget-object p0, p0, Ll/jjm0;->b:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->e(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Landroid/view/View;)V

    return-void
.end method
