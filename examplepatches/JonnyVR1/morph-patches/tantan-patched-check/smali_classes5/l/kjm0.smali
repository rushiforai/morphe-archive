.class public final synthetic Ll/kjm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/visitor/a$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/core/ui/visitor/a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kjm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

    iput-object p2, p0, Ll/kjm0;->b:Lcom/p1/mobile/putong/core/ui/visitor/a$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kjm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

    iget-object p0, p0, Ll/kjm0;->b:Lcom/p1/mobile/putong/core/ui/visitor/a$a;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->c(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/core/ui/visitor/a$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
