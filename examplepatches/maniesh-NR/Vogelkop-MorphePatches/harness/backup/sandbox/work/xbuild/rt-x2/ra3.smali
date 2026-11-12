.class public final Lra3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk32;

.field public final b:Lt1;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lk32;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lk32;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    iput-object v0, p0, Lra3;->a:Lk32;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->u:Lt1;

    iput-object p1, p0, Lra3;->b:Lt1;

    return-void
.end method
