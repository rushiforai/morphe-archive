.class public final Lhr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Les2;


# instance fields
.field public final synthetic a:Lmr2;


# direct methods
.method public constructor <init>(Lmr2;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhr2;->a:Lmr2;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 8

    iget-object p0, p0, Lhr2;->a:Lmr2;

    iget-object v0, p0, Lmr2;->y:Lfr2;

    if-nez v0, :cond_7

    const/4 v0, 0x0

    :cond_7
    iget-object v1, v0, Lfr2;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_e
    if-ge v3, v2, :cond_25

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgr2;

    iget-object v5, v4, Lgr2;->a:Ljava/lang/String;

    invoke-static {v5, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_25

    :cond_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    :cond_25
    :goto_25
    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    iget-object p0, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p0, p1}, Lcom/opera/android/autofill/AutofillManager;->f(Ljava/lang/String;)V

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lhr2;->a:Lmr2;

    iput-object p1, p0, Lmr2;->x:Ljava/lang/String;

    return-void
.end method
