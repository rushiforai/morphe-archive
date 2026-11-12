.class public final Ldqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public final synthetic c:Lfqe;


# direct methods
.method public constructor <init>(Lfqe;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldqe;->c:Lfqe;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-boolean v0, p0, Ldqe;->b:Z

    if-eqz v0, :cond_7

    iget-object p0, p0, Ldqe;->a:Ljava/lang/String;

    return-object p0

    :cond_7
    iget-object p0, p0, Ldqe;->c:Lfqe;

    iget-object p0, p0, Lfqe;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object p0

    invoke-virtual {p0}, Ljk5;->a()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
