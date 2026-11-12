.class public final Lrte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;
.implements Lmkf;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lgjm;

.field public final c:Lfqe;

.field public final d:Lew3;

.field public final e:Lx5f;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lgjm;Lfqe;Lew3;Lx5f;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrte;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lrte;->b:Lgjm;

    iput-object p3, p0, Lrte;->c:Lfqe;

    iput-object p4, p0, Lrte;->d:Lew3;

    iput-object p5, p0, Lrte;->e:Lx5f;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 5

    const-class v0, Ldte;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    new-instance p1, Ldte;

    iget-object v0, p0, Lrte;->d:Lew3;

    invoke-virtual {v0}, Lew3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru9;

    iget-object v1, p0, Lrte;->e:Lx5f;

    iget-object v2, p0, Lrte;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lrte;->c:Lfqe;

    invoke-direct {p1, p0, v0, v1, v2}, Ldte;-><init>(Lfqe;Lru9;Lx5f;Landroid/content/Context;)V

    return-object p1

    :cond_1c
    const-class p0, Lsse;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2a

    new-instance p0, Lsse;

    invoke-direct {p0}, Lsse;-><init>()V

    return-object p0

    :cond_2a
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 4

    const-class v0, Lzse;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lrte;->b:Lgjm;

    if-eqz v0, :cond_14

    new-instance p1, Lzse;

    iget-object p0, p0, Lrte;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->l:Ltni;

    invoke-direct {p1, p0, v1}, Lzse;-><init>(Ltni;Lgjm;)V

    return-object p1

    :cond_14
    const-class p0, Lrse;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_22

    new-instance p0, Lrse;

    invoke-direct {p0, v1}, Lrse;-><init>(Lgjm;)V

    return-object p0

    :cond_22
    const/4 p0, 0x0

    return-object p0
.end method
