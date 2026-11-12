.class public final Lfw3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/OperaApplication;


# direct methods
.method public constructor <init>(Ltw3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p1, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iput-object p1, p0, Lfw3;->a:Lcom/opera/android/OperaApplication;

    return-void
.end method
