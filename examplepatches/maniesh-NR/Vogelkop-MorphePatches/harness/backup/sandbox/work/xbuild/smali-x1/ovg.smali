.class public final Lovg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# instance fields
.field public final a:Llw3;

.field public final b:Lwv1;

.field public final c:Lew3;

.field public final d:Llw3;

.field public final e:Lcom/opera/android/Lazy;

.field public final f:Lcom/opera/android/Lazy;

.field public final g:Lcom/opera/android/Lazy;

.field public final h:Llw3;

.field public final i:Lwv1;

.field public final j:Lcom/opera/android/Lazy;


# direct methods
.method public constructor <init>(Llw3;Lwv1;Lew3;Llw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Llw3;Ltvg;Lwv1;Lcom/opera/android/Lazy;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lovg;->a:Llw3;

    iput-object p2, p0, Lovg;->b:Lwv1;

    iput-object p3, p0, Lovg;->c:Lew3;

    iput-object p4, p0, Lovg;->d:Llw3;

    iput-object p5, p0, Lovg;->e:Lcom/opera/android/Lazy;

    iput-object p6, p0, Lovg;->f:Lcom/opera/android/Lazy;

    iput-object p7, p0, Lovg;->g:Lcom/opera/android/Lazy;

    iput-object p8, p0, Lovg;->h:Llw3;

    iput-object p10, p0, Lovg;->i:Lwv1;

    iput-object p11, p0, Lovg;->j:Lcom/opera/android/Lazy;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 15

    iget-object v0, p0, Lovg;->a:Llw3;

    iget-object v0, v0, Llw3;->b:Lcom/opera/android/OperaApplication;

    const-class v1, Lhtg;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    iget-object v2, p0, Lovg;->e:Lcom/opera/android/Lazy;

    if-eqz v1, :cond_1e

    new-instance p0, Lhtg;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnvg;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lhtg;-><init>(Lnvg;Ldb;)V

    return-object p0

    :cond_1e
    const-class v1, Litg;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    new-instance p0, Litg;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnvg;

    const v0, 0x7f1411b5

    const v1, 0x7f140968

    invoke-direct {p0, p1, v0, v1}, Lh83;-><init>(Lnvg;II)V

    return-object p0

    :cond_38
    const-class v1, Lcvg;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_93

    new-instance v3, Lcvg;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Lnvg;

    iget-object p1, p0, Lovg;->c:Lew3;

    invoke-virtual {p1}, Lew3;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v5, p1

    check-cast v5, Lz77;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v6

    iget-object p1, p0, Lovg;->b:Lwv1;

    iget-object p1, p1, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v7, p1

    check-cast v7, Lxb;

    iget-object p1, p0, Lovg;->f:Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v8, p1

    check-cast v8, Lfmk;

    iget-object p1, p0, Lovg;->g:Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v9, p1

    check-cast v9, Laf3;

    iget-object p1, p0, Lovg;->h:Llw3;

    iget-object p1, p1, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v10

    iget-object p1, p0, Lovg;->d:Llw3;

    invoke-virtual {p1}, Llw3;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v11, p1

    check-cast v11, Lskm;

    iget-object p0, p0, Lovg;->i:Lwv1;

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v12, p0

    check-cast v12, Lebh;

    invoke-direct/range {v3 .. v12}, Lcvg;-><init>(Lnvg;Lz77;Ldb;Lxb;Lfmk;Laf3;Lslk;Lskm;Lebh;)V

    return-object v3

    :cond_93
    const-class v0, Li8d;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a1

    new-instance p0, Li8d;

    invoke-direct {p0}, Li8d;-><init>()V

    return-object p0

    :cond_a1
    const-class v0, Lxtg;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b7

    new-instance p1, Lxtg;

    iget-object p0, p0, Lovg;->j:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    invoke-direct {p1, p0}, Lxtg;-><init>(Lgjm;)V

    return-object p1

    :cond_b7
    const/4 p0, 0x0

    return-object p0
.end method
