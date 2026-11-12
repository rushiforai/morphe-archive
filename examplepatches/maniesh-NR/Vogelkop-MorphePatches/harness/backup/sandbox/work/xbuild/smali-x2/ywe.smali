.class public final Lywe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lnw3;

.field public final c:Lnw3;

.field public final d:Lnw3;

.field public final e:Lgx3;

.field public final f:Lnw3;

.field public final g:Lfx3;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lnw3;Lnw3;Lnw3;Lgx3;Lnw3;Lfx3;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lywe;->a:Landroid/content/Context;

    iput-object p2, p0, Lywe;->b:Lnw3;

    iput-object p3, p0, Lywe;->c:Lnw3;

    iput-object p4, p0, Lywe;->d:Lnw3;

    iput-object p5, p0, Lywe;->e:Lgx3;

    iput-object p6, p0, Lywe;->f:Lnw3;

    iput-object p7, p0, Lywe;->g:Lfx3;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 11

    const-class v0, Lxwe;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lywe;->g:Lfx3;

    if-eqz v0, :cond_1c

    new-instance p1, Lxwe;

    iget-object p0, p0, Lywe;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->a(Landroid/content/Context;)Z

    move-result p0

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgjm;

    invoke-direct {p1, p0, v0}, Lxwe;-><init>(ZLgjm;)V

    return-object p1

    :cond_1c
    const-class v0, Lkxe;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5b

    new-instance v2, Lkxe;

    iget-object p1, p0, Lywe;->b:Lnw3;

    iget-object p1, p1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    iget-object p1, p0, Lywe;->c:Lnw3;

    iget-object p1, p1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v4

    iget-object p1, p0, Lywe;->d:Lnw3;

    iget-object p1, p1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->p()Lxt8;

    move-result-object v5

    iget-object p1, p0, Lywe;->e:Lgx3;

    invoke-virtual {p1}, Lgx3;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v6, p1

    check-cast v6, Lz77;

    iget-object p0, p0, Lywe;->f:Lnw3;

    invoke-virtual {p0}, Lnw3;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Lorm;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v8, p0

    check-cast v8, Lgjm;

    invoke-direct/range {v2 .. v8}, Lkxe;-><init>(Lcom/opera/android/settings/SettingsManager;Lqwe;Lxt8;Lz77;Lorm;Lgjm;)V

    return-object v2

    :cond_5b
    const/4 p0, 0x0

    return-object p0
.end method
