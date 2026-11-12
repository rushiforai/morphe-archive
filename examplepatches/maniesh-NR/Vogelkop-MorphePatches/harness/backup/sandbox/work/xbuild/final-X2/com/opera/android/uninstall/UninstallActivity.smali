.class public final Lcom/opera/android/uninstall/UninstallActivity;
.super Lfp1;
.source "SourceFile"

# interfaces
.implements Ln7n;
.implements Lm24;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/opera/android/uninstall/UninstallActivity;",
        "Lfp1;",
        "Ln7n;",
        "Lm24;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic e:I


# instance fields
.field public final a:Lxg7;

.field public final b:Lv78;

.field public final c:Lpad;

.field public d:Lw6j;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lfp1;-><init>()V

    new-instance v0, Lxg7;

    invoke-direct {v0, p0}, Lxg7;-><init>(Lcom/opera/android/uninstall/UninstallActivity;)V

    iput-object v0, p0, Lcom/opera/android/uninstall/UninstallActivity;->a:Lxg7;

    new-instance v1, Lv78;

    invoke-static {v0}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v0

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lv78;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/uninstall/UninstallActivity;->b:Lv78;

    new-instance v0, Lpad;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lpad;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/uninstall/UninstallActivity;->c:Lpad;

    return-void
.end method


# virtual methods
.method public final a(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/uninstall/UninstallActivity;->c:Lpad;

    invoke-virtual {p0, p1}, Lpad;->t(Ll24;)V

    return-void
.end method

.method public final c(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/uninstall/UninstallActivity;->c:Lpad;

    invoke-virtual {p0, p1}, Lpad;->A(Ll24;)V

    return-void
.end method

.method public final getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    const-string v0, "com.opera.android.BPR_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p0

    :cond_9
    invoke-super {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final j()Lr7n;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/uninstall/UninstallActivity;->b:Lv78;

    return-object p0
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1}, Landroidx/fragment/app/r;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Locp;->p(Landroid/view/Window;Z)V

    new-instance p1, Lw6j;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lvml;->d:Lumi;

    new-instance v2, Lqfl;

    const/16 v3, 0xd

    invoke-direct {v2, p0, v3}, Lqfl;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lp7l;

    const/16 v4, 0x19

    invoke-direct {v3, p0, v4}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0, v1, v2, v3}, Lw6j;-><init>(Landroid/content/Context;Lumi;Lqfl;Lp7l;)V

    iput-object p1, p0, Lcom/opera/android/uninstall/UninstallActivity;->d:Lw6j;

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    new-instance v0, Lul9;

    iget-object v1, p0, Lcom/opera/android/uninstall/UninstallActivity;->a:Lxg7;

    invoke-static {v1}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lul9;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p1, Landroidx/fragment/app/w;->B:Lol9;

    const p1, 0x7f0d0446

    invoke-virtual {p0, p1}, Lfp1;->setContentView(I)V

    invoke-static {p0}, Lf03;->f(Landroid/app/Activity;)V

    invoke-virtual {p0}, Lxd5;->getOnBackPressedDispatcher()Lkcf;

    move-result-object p1

    new-instance v0, Lxt2;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lxt2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0, v0}, Lkcf;->a(Lndc;Lgcf;)V

    return-void
.end method
