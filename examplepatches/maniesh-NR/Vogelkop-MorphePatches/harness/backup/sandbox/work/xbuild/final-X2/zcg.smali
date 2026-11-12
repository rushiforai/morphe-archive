.class public final Lzcg;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lru9;

.field public final c:Lmdf;

.field public final d:Lvbg;

.field public final e:Lcom/opera/android/settings/SettingsManager;

.field public final f:Lqln;

.field public final g:Lcom/opera/android/startup/WelcomeActivity;

.field public final h:Lijd;

.field public final i:Lshf;

.field public final j:Ljava/util/LinkedHashSet;

.field public final k:Ljava/util/LinkedHashSet;

.field public l:Z

.field public final m:Ljava/util/List;

.field public final n:Lwnm;

.field public final o:Lagm;

.field public p:Leef;


# direct methods
.method public constructor <init>(Lyk6;Lh0a;Lxnc;Lru9;Lmdf;Lcq5;Lvbg;Lcom/opera/android/settings/SettingsManager;Lqln;Lcom/opera/android/startup/WelcomeActivity;)V
    .registers 14

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p4, p0, Lzcg;->b:Lru9;

    iput-object p5, p0, Lzcg;->c:Lmdf;

    iput-object p7, p0, Lzcg;->d:Lvbg;

    iput-object p8, p0, Lzcg;->e:Lcom/opera/android/settings/SettingsManager;

    iput-object p9, p0, Lzcg;->f:Lqln;

    iput-object p10, p0, Lzcg;->g:Lcom/opera/android/startup/WelcomeActivity;

    new-instance p4, Lijd;

    invoke-direct {p4}, Ljava/lang/Object;-><init>()V

    iput-object p1, p4, Lijd;->d:Ljava/lang/Object;

    iput-object p2, p4, Lijd;->e:Ljava/lang/Object;

    iput-object p3, p4, Lijd;->f:Ljava/lang/Object;

    iput-object p8, p4, Lijd;->g:Ljava/lang/Object;

    invoke-virtual {p4}, Lijd;->a()Ljava/util/ArrayList;

    move-result-object p5

    iget-object p7, p1, Lyk6;->i:Lkze;

    iget-object p10, p1, Lyk6;->j:Lkze;

    iget-object p1, p1, Lyk6;->k:Lkze;

    iget-object p2, p2, Lh0a;->d:Lode;

    iget-object p3, p3, Lxnc;->a:Lkze;

    new-instance v0, Lm3g;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lm3g;-><init>(B)V

    const-string v1, "live_scores_enabled"

    invoke-static {p8, v1, v0}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v0

    new-instance v1, Lm3g;

    const/16 v2, 0xd

    invoke-direct {v1, v2}, Lm3g;-><init>(B)V

    const-string v2, "enable_newsfeed"

    invoke-static {p8, v2, v1}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p8

    const/4 v1, 0x7

    new-array v1, v1, [Lekc;

    const/4 v2, 0x0

    aput-object p7, v1, v2

    const/4 p7, 0x1

    aput-object p10, v1, p7

    const/4 p7, 0x2

    aput-object p1, v1, p7

    const/4 p1, 0x3

    aput-object p2, v1, p1

    const/4 p1, 0x4

    aput-object p3, v1, p1

    const/4 p1, 0x5

    aput-object v0, v1, p1

    const/4 p1, 0x6

    aput-object p8, v1, p1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    new-instance p2, Ld8e;

    const/16 p3, 0xf

    invoke-direct {p2, p4, p3}, Ld8e;-><init>(Ljava/lang/Object;B)V

    new-instance p3, Lwnm;

    new-instance p7, Lfza;

    const/16 p8, 0x11

    invoke-direct {p7, p8}, Lfza;-><init>(B)V

    invoke-direct {p3, p5, p1, p7, p2}, Lwnm;-><init>(Ljava/lang/Object;Ljava/lang/Iterable;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object p3, p4, Lijd;->h:Ljava/lang/Object;

    iput-object p4, p0, Lzcg;->h:Lijd;

    new-instance p1, Lshf;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p6, p1, Lshf;->a:Ljava/lang/Object;

    iput-object p9, p1, Lshf;->b:Ljava/lang/Object;

    new-instance p2, Ld8e;

    const/16 p3, 0xe

    invoke-direct {p2, p1, p3}, Ld8e;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p1, Lshf;->c:Ljava/lang/Object;

    iput-object p1, p0, Lzcg;->i:Lshf;

    new-instance p2, Ljava/util/LinkedHashSet;

    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p2, p0, Lzcg;->j:Ljava/util/LinkedHashSet;

    new-instance p2, Ljava/util/LinkedHashSet;

    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p2, p0, Lzcg;->k:Ljava/util/LinkedHashSet;

    iget-object p1, p1, Lshf;->c:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lycg;

    iget-object p2, p2, Lycg;->a:Ljava/util/List;

    iput-object p2, p0, Lzcg;->m:Ljava/util/List;

    iget-object p2, p4, Lijd;->h:Ljava/lang/Object;

    check-cast p2, Lwnm;

    iput-object p2, p0, Lzcg;->n:Lwnm;

    iget-object p2, p9, Lqln;->g:Lagm;

    iput-object p2, p0, Lzcg;->o:Lagm;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lycg;

    iget-object p1, p1, Lycg;->b:Leef;

    iput-object p1, p0, Lzcg;->p:Leef;

    return-void
.end method
