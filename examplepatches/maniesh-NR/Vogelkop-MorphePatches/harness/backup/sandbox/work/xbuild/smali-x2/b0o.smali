.class public final Lb0o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr7n;


# instance fields
.field public final a:Lj4c;

.field public final b:La0o;

.field public final c:Lj4c;

.field public final d:Lg92;

.field public final e:Ltzn;

.field public final f:Lj4c;

.field public final g:Lcq5;

.field public final h:Lj4c;

.field public final i:Lwv1;

.field public final j:Lcom/opera/android/settings/SettingsManager;

.field public final k:La0o;

.field public final l:Lcom/opera/android/Lazy;

.field public final m:Lcom/opera/android/startup/WelcomeActivity;


# direct methods
.method public constructor <init>(Lj4c;La0o;Lj4c;Lg92;Ltzn;Lj4c;Lcq5;Lj4c;Lwv1;Lcom/opera/android/settings/SettingsManager;La0o;Lcom/opera/android/Lazy;Lcom/opera/android/startup/WelcomeActivity;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb0o;->a:Lj4c;

    iput-object p2, p0, Lb0o;->b:La0o;

    iput-object p3, p0, Lb0o;->c:Lj4c;

    iput-object p4, p0, Lb0o;->d:Lg92;

    iput-object p5, p0, Lb0o;->e:Ltzn;

    iput-object p6, p0, Lb0o;->f:Lj4c;

    iput-object p7, p0, Lb0o;->g:Lcq5;

    iput-object p8, p0, Lb0o;->h:Lj4c;

    iput-object p9, p0, Lb0o;->i:Lwv1;

    iput-object p10, p0, Lb0o;->j:Lcom/opera/android/settings/SettingsManager;

    iput-object p11, p0, Lb0o;->k:La0o;

    iput-object p12, p0, Lb0o;->l:Lcom/opera/android/Lazy;

    iput-object p13, p0, Lb0o;->m:Lcom/opera/android/startup/WelcomeActivity;

    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/Class;)Ll7n;
    .registers 15

    const-class v0, Lzcg;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_54

    new-instance v2, Lzcg;

    iget-object v0, p0, Lb0o;->a:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lyk6;

    iget-object v0, p0, Lb0o;->c:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lh0a;

    iget-object v0, p0, Lb0o;->d:Lg92;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lxnc;

    iget-object v0, p0, Lb0o;->b:La0o;

    invoke-virtual {v0}, La0o;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lru9;

    iget-object v0, p0, Lb0o;->f:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lmdf;

    iget-object v0, p0, Lb0o;->h:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lvbg;

    iget-object v0, p0, Lb0o;->l:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lqln;

    iget-object v12, p0, Lb0o;->m:Lcom/opera/android/startup/WelcomeActivity;

    iget-object v8, p0, Lb0o;->g:Lcq5;

    iget-object v10, p0, Lb0o;->j:Lcom/opera/android/settings/SettingsManager;

    invoke-direct/range {v2 .. v12}, Lzcg;-><init>(Lyk6;Lh0a;Lxnc;Lru9;Lmdf;Lcq5;Lvbg;Lcom/opera/android/settings/SettingsManager;Lqln;Lcom/opera/android/startup/WelcomeActivity;)V

    goto :goto_77

    :cond_54
    const-class v0, Lq0o;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_76

    new-instance v2, Lq0o;

    iget-object v0, p0, Lb0o;->k:La0o;

    invoke-virtual {v0}, La0o;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxbf;

    iget-object v3, p0, Lb0o;->i:Lwv1;

    iget-object v3, v3, Lwv1;->b:Lb6h;

    invoke-interface {v3}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpch;

    iget-object p0, p0, Lb0o;->e:Ltzn;

    invoke-direct {v2, v0, v3, p0}, Lq0o;-><init>(Lxbf;Lpch;Ltzn;)V

    goto :goto_77

    :cond_76
    move-object v2, v1

    :goto_77
    if-nez v2, :cond_7a

    move-object v2, v1

    :cond_7a
    if-eqz v2, :cond_7d

    return-object v2

    :cond_7d
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "WelcomeActivityViewModelFactory doesn\'t know how to create "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1
.end method
