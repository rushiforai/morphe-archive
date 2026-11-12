.class public final Ldq9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltsd;

.field public final b:Ljze;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lkze;Lpde;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ld58;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Ld58;-><init>(B)V

    const-string v2, "app_layout"

    invoke-static {p1, v2, v0}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v5

    new-instance v0, Ld58;

    const/16 v2, 0x18

    invoke-direct {v0, v2}, Ld58;-><init>(B)V

    const-string v2, "addressbar_position"

    invoke-static {p1, v2, v0}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v6

    new-instance p1, Ld58;

    const/16 v0, 0x19

    invoke-direct {p1, v0}, Ld58;-><init>(B)V

    invoke-static {p3, p1}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v7

    new-instance v4, Lcq9;

    const/4 p1, 0x0

    invoke-direct {v4, p1}, Lcq9;-><init>(B)V

    new-instance p3, Lwnm;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v4, v0, v2, v3, v8}, Lcq9;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v2, 0x4

    new-array v2, v2, [Likc;

    aput-object v5, v2, p1

    const/4 p1, 0x1

    aput-object v6, v2, p1

    const/4 p1, 0x2

    aput-object v7, v2, p1

    const/4 p1, 0x3

    aput-object p2, v2, p1

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    new-instance v2, Lfza;

    const/16 v3, 0x11

    invoke-direct {v2, v3}, Lfza;-><init>(B)V

    new-instance v3, Ln12;

    const/4 v9, 0x3

    move-object v8, p2

    invoke-direct/range {v3 .. v9}, Ln12;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p3, v0, p1, v2, v3}, Lwnm;-><init>(Ljava/lang/Object;Ljava/lang/Iterable;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    invoke-static {p3}, Lxf8;->B(Likc;)Ltsd;

    move-result-object p1

    iput-object p1, p0, Ldq9;->a:Ltsd;

    new-instance p2, Ljze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p3

    invoke-direct {p2, p3}, Ljze;-><init>(Ljava/lang/Object;)V

    new-instance p3, Lry7;

    const/16 v0, 0xc

    invoke-direct {p3, p2, p0, v0}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lcl4;

    invoke-direct {v0, p3, v1}, Lcl4;-><init>(Ljava/lang/Object;B)V

    iget-object p3, p2, Ljze;->l:Lh42;

    invoke-virtual {p3, p1, v0}, Lh42;->s(Lekc;Lf7f;)V

    iput-object p2, p0, Ldq9;->b:Ljze;

    return-void
.end method
