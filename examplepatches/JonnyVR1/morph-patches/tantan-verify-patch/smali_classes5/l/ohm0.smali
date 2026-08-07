.class public final synthetic Ll/ohm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowNoPrivilegeItemView;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/visitor/a$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowNoPrivilegeItemView;ILcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/visitor/a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ohm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowNoPrivilegeItemView;

    iput p2, p0, Ll/ohm0;->b:I

    iput-object p3, p0, Ll/ohm0;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/ohm0;->d:Lcom/p1/mobile/putong/core/ui/visitor/a$a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ohm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowNoPrivilegeItemView;

    iget v1, p0, Ll/ohm0;->b:I

    iget-object v2, p0, Ll/ohm0;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/ohm0;->d:Lcom/p1/mobile/putong/core/ui/visitor/a$a;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowNoPrivilegeItemView;->b(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowNoPrivilegeItemView;ILcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/visitor/a$a;Landroid/view/View;)V

    return-void
.end method
