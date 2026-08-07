.class public Lcom/p1/mobile/putong/core/ui/settings/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/settings/b;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/b$a;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/b$a;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->S(Lcom/p1/mobile/putong/core/ui/settings/b;)Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "share_to"

    .line 12
    .line 13
    const-string v1, "system"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {v0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "e_share_tantan_new_ui_button"

    .line 24
    .line 25
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/b$a;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "unknown"

    .line 35
    .line 36
    invoke-static {p1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v0, "menu"

    .line 49
    .line 50
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->D1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/util/ArrayList;)Lrx/c;

    .line 51
    .line 52
    .line 53
    return-void
.end method
