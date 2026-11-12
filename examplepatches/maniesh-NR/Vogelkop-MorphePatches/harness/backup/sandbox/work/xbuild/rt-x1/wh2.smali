.class public final Lwh2;
.super Llj2;
.source "SourceFile"


# instance fields
.field public final i:Lhjf;

.field public final j:Lcom/opera/android/autofill/AutofillManager;


# direct methods
.method public constructor <init>(Lhjf;Lcom/opera/android/autofill/AutofillManager;)V
    .registers 3

    invoke-direct {p0}, Llj2;-><init>()V

    iput-object p1, p0, Lwh2;->i:Lhjf;

    iput-object p2, p0, Lwh2;->j:Lcom/opera/android/autofill/AutofillManager;

    return-void
.end method


# virtual methods
.method public final c(Landroid/content/Context;Lzy9;Ljava/lang/Runnable;)V
    .registers 6

    new-instance v0, La32;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, p3, v1}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lab;

    const/16 p2, 0x14

    invoke-direct {p1, v0, p2}, Lab;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lwh2;->j:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p0, p1}, Lcom/opera/android/autofill/AutofillManager;->e(Lcom/opera/api/Callback;)V

    return-void
.end method
