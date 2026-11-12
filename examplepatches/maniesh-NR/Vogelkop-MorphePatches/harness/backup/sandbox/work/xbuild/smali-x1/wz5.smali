.class public abstract Lwz5;
.super Landroid/app/Activity;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    iput-object p1, p0, Lwz5;->a:Ljava/lang/String;

    iput p2, p0, Lwz5;->b:I

    iput-object p3, p0, Lwz5;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()I
    .registers 1

    iget p0, p0, Lwz5;->b:I

    return p0
.end method

.method public b()Ljava/lang/CharSequence;
    .registers 1

    invoke-virtual {p0}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.intent.action.CREATE_SHORTCUT"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_39

    invoke-virtual {p0}, Lwz5;->a()I

    move-result p1

    invoke-virtual {p0}, Lwz5;->b()Ljava/lang/CharSequence;

    move-result-object v0

    sget-object v1, Lvml;->d:Lumi;

    new-instance v2, Lso4;

    const/4 v3, 0x2

    invoke-direct {v2, p0, p1, v0, v3}, Lso4;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p1

    new-instance v0, Ljl4;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Ljl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-void

    :cond_39
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method
