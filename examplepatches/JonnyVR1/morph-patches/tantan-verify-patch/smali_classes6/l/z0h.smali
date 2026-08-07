.class public final synthetic Ll/z0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z0h;->a:Landroid/view/View;

    iput-object p2, p0, Ll/z0h;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/z0h;->c:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z0h;->a:Landroid/view/View;

    iget-object v1, p0, Ll/z0h;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/z0h;->c:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {v0, v1, p0, p1}, Ll/k3h;->p(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method
