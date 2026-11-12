.class public final Lfug;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final b:Z

.field public final c:Lrii;

.field public d:Lwb0;


# direct methods
.method public constructor <init>(ZLrii;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    iput-boolean p1, p0, Lfug;->b:Z

    iput-object p2, p0, Lfug;->c:Lrii;

    sget-object p1, Lwb0;->d:Lwb0;

    iput-object p1, p0, Lfug;->d:Lwb0;

    return-void
.end method


# virtual methods
.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    iget-boolean p0, p0, Lfug;->b:Z

    if-eqz p0, :cond_8

    const p0, 0x7f1407de

    goto :goto_b

    :cond_8
    const p0, 0x7f1407e0

    :goto_b
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f14092a

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f141194

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f150292

    return p0
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    iget-boolean p0, p0, Lfug;->b:Z

    if-eqz p0, :cond_8

    const p0, 0x7f1407df

    goto :goto_b

    :cond_8
    const p0, 0x7f1407e1

    :goto_b
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 4

    iget-object p1, p0, Lfug;->d:Lwb0;

    iget-object p0, p0, Lfug;->c:Lrii;

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lw7j;

    iget-object p0, p0, Lw7j;->d:Ljava/lang/Object;

    check-cast p0, Lx5f;

    const/4 p2, 0x4

    const/4 v0, 0x0

    invoke-virtual {p0, p2, p1, v0}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 2

    sget-object p1, Lwb0;->c:Lwb0;

    iput-object p1, p0, Lfug;->d:Lwb0;

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 2

    sget-object p1, Lwb0;->b:Lwb0;

    iput-object p1, p0, Lfug;->d:Lwb0;

    iget-object p0, p0, Lfug;->c:Lrii;

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lw7j;

    iget-object p0, p0, Lw7j;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyug;

    const/16 p1, 0xe

    invoke-virtual {p0, p1}, Lyug;->a(I)V

    return-void
.end method
