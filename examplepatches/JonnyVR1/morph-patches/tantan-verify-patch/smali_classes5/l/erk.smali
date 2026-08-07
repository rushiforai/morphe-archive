.class public final synthetic Ll/erk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/erk;->a:Ll/x20;

    iput-object p2, p0, Ll/erk;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/erk;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/erk;->a:Ll/x20;

    iget-object v1, p0, Ll/erk;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/erk;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0, p1}, Ll/qtk;->k(Ll/x20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V

    return-void
.end method
