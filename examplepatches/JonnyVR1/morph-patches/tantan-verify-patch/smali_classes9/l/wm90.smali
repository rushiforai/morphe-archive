.class public final synthetic Ll/wm90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

.field public final synthetic b:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wm90;->a:Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    iput-object p2, p0, Ll/wm90;->b:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wm90;->a:Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    iget-object p0, p0, Ll/wm90;->b:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->i2(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method
