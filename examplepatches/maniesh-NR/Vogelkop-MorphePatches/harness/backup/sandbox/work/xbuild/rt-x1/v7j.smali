.class public final Lv7j;
.super Lpde;
.source "SourceFile"


# instance fields
.field public final l:Lu7j;

.field public final synthetic m:Lkotlin/jvm/functions/Function1;

.field public final synthetic n:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lcom/opera/android/settings/SettingsManager;Ljava/lang/Object;)V
    .registers 11

    iput-object p2, p0, Lv7j;->m:Lkotlin/jvm/functions/Function1;

    iput-object p3, p0, Lv7j;->n:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {p0, p4}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v0, Lu7j;

    const/4 v5, 0x1

    move-object v2, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lu7j;-><init>(Ljava/lang/String;Ljava/lang/Object;Lbr9;Lcom/opera/android/settings/SettingsManager;B)V

    iput-object v0, v2, Lv7j;->l:Lu7j;

    return-void
.end method


# virtual methods
.method public final l()V
    .registers 3

    iget-object v0, p0, Lv7j;->m:Lkotlin/jvm/functions/Function1;

    iget-object v1, p0, Lv7j;->n:Lcom/opera/android/settings/SettingsManager;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lv7j;->l:Lu7j;

    invoke-virtual {v1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method

.method public final m()V
    .registers 2

    iget-object v0, p0, Lv7j;->n:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lv7j;->l:Lu7j;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
