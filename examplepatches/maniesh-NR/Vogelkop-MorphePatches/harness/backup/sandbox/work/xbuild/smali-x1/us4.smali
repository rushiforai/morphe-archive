.class public final Lus4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lekc;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Ltsd;

.field public final d:Lwnm;


# direct methods
.method public constructor <init>(Lekc;Lcom/opera/android/settings/SettingsManager;Llic;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lus4;->a:Lekc;

    iput-object p2, p0, Lus4;->b:Lcom/opera/android/settings/SettingsManager;

    new-instance p3, Lmr3;

    const/16 v0, 0xf

    invoke-direct {p3, v0}, Lmr3;-><init>(B)V

    const-string v0, "ad_blocking_mode"

    invoke-static {p2, v0, p3}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v3

    new-instance p3, Lmr3;

    const/16 v0, 0x10

    invoke-direct {p3, v0}, Lmr3;-><init>(B)V

    const-string v0, "ad_blocking"

    invoke-static {p2, v0, p3}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v5

    new-instance p3, Lmr3;

    const/16 v0, 0x11

    invoke-direct {p3, v0}, Lmr3;-><init>(B)V

    const-string v0, "tracker_blocker"

    invoke-static {p2, v0, p3}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v6

    new-instance p3, Lmr3;

    const/16 v0, 0x12

    invoke-direct {p3, v0}, Lmr3;-><init>(B)V

    const-string v0, "banner_blocker"

    invoke-static {p2, v0, p3}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v7

    new-instance p3, Lmr3;

    const/16 v0, 0x13

    invoke-direct {p3, v0}, Lmr3;-><init>(B)V

    const-string v0, "ad_blocking_mode.selected_custom_lists"

    invoke-static {p2, v0, p3}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v4

    iput-object v4, p0, Lus4;->c:Ltsd;

    new-instance p2, Lqs4;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    new-instance p3, Lwnm;

    const/4 v0, 0x6

    new-array v0, v0, [Lekc;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object v3, v0, v1

    const/4 v1, 0x2

    aput-object v4, v0, v1

    const/4 v1, 0x3

    aput-object v5, v0, v1

    const/4 v1, 0x4

    aput-object v6, v0, v1

    const/4 v1, 0x5

    aput-object v7, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Lkkc;

    const/4 v8, 0x0

    move-object v2, p1

    invoke-direct/range {v1 .. v8}, Lkkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object p1, v1

    new-instance v1, Llkc;

    const/4 v9, 0x0

    move-object v8, v7

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v2

    move-object v2, p2

    invoke-direct/range {v1 .. v9}, Llkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p2, 0x0

    invoke-direct {p3, p2, v0, p1, v1}, Lwnm;-><init>(Ljava/lang/Object;Ljava/lang/Iterable;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object p3, p0, Lus4;->d:Lwnm;

    return-void
.end method
