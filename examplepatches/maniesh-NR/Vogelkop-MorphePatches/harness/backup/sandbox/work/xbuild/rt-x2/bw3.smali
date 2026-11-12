.class public final Lbw3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lq6e;


# direct methods
.method public constructor <init>(Ltw3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p1, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->O0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lq6e;

    iput-object p1, p0, Lbw3;->a:Lq6e;

    return-void
.end method
