.class public final synthetic Ll/rza0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rza0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;

    iput-object p2, p0, Ll/rza0;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/rza0;->c:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rza0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;

    iget-object v1, p0, Ll/rza0;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/rza0;->c:Z

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;->R(Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;Ljava/lang/String;ZLandroid/view/View;)V

    return-void
.end method
