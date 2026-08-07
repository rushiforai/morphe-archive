.class public final synthetic Ll/mhm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/cfm0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/cfm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mhm0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/mhm0;->b:Ll/cfm0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mhm0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/mhm0;->b:Ll/cfm0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowHasPrivilegeItemView;->a(Lcom/p1/mobile/android/app/Act;Ll/cfm0;Landroid/view/View;)V

    return-void
.end method
