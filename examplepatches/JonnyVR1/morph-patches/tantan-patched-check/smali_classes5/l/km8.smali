.class public final synthetic Ll/km8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/x20;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/km8;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/km8;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/km8;->c:Z

    iput-object p4, p0, Ll/km8;->d:Ll/x20;

    iput-object p5, p0, Ll/km8;->e:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/km8;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/km8;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/km8;->c:Z

    iget-object v3, p0, Ll/km8;->d:Ll/x20;

    iget-object v4, p0, Ll/km8;->e:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->C0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/x20;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
