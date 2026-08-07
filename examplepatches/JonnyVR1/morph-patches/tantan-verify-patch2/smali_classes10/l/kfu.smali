.class public final synthetic Ll/kfu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pfu;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic d:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/pfu;Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Dialog;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kfu;->a:Ll/pfu;

    iput-object p2, p0, Ll/kfu;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/kfu;->c:Lcom/p1/mobile/android/app/Dialog;

    iput-object p4, p0, Ll/kfu;->d:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kfu;->a:Ll/pfu;

    iget-object v1, p0, Ll/kfu;->b:Ljava/lang/Runnable;

    iget-object v2, p0, Ll/kfu;->c:Lcom/p1/mobile/android/app/Dialog;

    iget-object p0, p0, Ll/kfu;->d:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/pfu;->b(Ll/pfu;Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Dialog;Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
