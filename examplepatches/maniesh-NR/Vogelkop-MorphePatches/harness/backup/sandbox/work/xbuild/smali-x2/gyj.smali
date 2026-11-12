.class public final Lgyj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Ldg7;

.field public final d:Lezg;

.field public e:Z


# direct methods
.method public constructor <init>(ILcom/opera/android/settings/SettingsManager;Ldg7;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lgyj;->a:I

    iput-object p2, p0, Lgyj;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lgyj;->c:Ldg7;

    new-instance p1, Lezg;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lezg;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lgyj;->d:Lezg;

    iget-object p1, p0, Lgyj;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p2, "speed_dial.plus_button"

    invoke-virtual {p1, p2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lgyj;->e:Z

    return-void
.end method
