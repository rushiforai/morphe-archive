.class public final Lz9j;
.super Lpde;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final l:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lr16;)V
    .registers 4

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lb3c;->i:Lh58;

    const-string v0, "tabui_layout_mode"

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2, v0}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lb3c;

    invoke-direct {p0, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lz9j;->l:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 4

    const-string v0, "tabui_layout_mode"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    sget-object v0, Lb3c;->i:Lh58;

    iget-object v1, p0, Lz9j;->l:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, p1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb3c;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_19
    return-void
.end method

.method public final l()V
    .registers 4

    iget-object v0, p0, Lz9j;->l:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    sget-object v1, Lb3c;->i:Lh58;

    const-string v2, "tabui_layout_mode"

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v1, v0}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb3c;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final m()V
    .registers 2

    iget-object v0, p0, Lz9j;->l:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method

.method public final r(Ljava/lang/Object;)V
    .registers 3

    invoke-super {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    check-cast p1, Lb3c;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object p0, p0, Lz9j;->l:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "tabui_layout_mode"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method
