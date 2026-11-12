.class public final Leyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final synthetic a:Lgyk;

.field public final synthetic b:Lnj2;

.field public final synthetic c:Lj25;


# direct methods
.method public constructor <init>(Lgyk;Lnj2;Lj25;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leyk;->a:Lgyk;

    iput-object p2, p0, Leyk;->b:Lnj2;

    iput-object p3, p0, Leyk;->c:Lj25;

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 4

    iget-object p1, p0, Leyk;->a:Lgyk;

    iget-object v0, p1, Lgyk;->d:Ldb;

    iget-object v1, p0, Leyk;->b:Lnj2;

    invoke-virtual {v0, v1}, Ldb;->a(Lcb;)V

    iget-object p1, p1, Lgyk;->c:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Leyk;->c:Lj25;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 4

    iget-object p1, p0, Leyk;->a:Lgyk;

    iget-object v0, p1, Lgyk;->d:Ldb;

    iget-object v1, p0, Leyk;->b:Lnj2;

    invoke-virtual {v0, v1}, Ldb;->h(Lcb;)V

    iget-object p1, p1, Lgyk;->c:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Leyk;->c:Lj25;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
