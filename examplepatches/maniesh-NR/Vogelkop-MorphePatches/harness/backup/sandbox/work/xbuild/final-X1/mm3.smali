.class public final Lmm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# instance fields
.field public final synthetic a:B

.field public final b:Lesk;

.field public final c:Lesk;

.field public final d:Lesk;


# direct methods
.method public synthetic constructor <init>(Lesk;Lesk;Lesk;B)V
    .registers 5

    iput-byte p4, p0, Lmm3;->a:B

    iput-object p1, p0, Lmm3;->b:Lesk;

    iput-object p2, p0, Lmm3;->c:Lesk;

    iput-object p3, p0, Lmm3;->d:Lesk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 6

    iget-byte v0, p0, Lmm3;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lmm3;->d:Lesk;

    iget-object v3, p0, Lmm3;->c:Lesk;

    iget-object p0, p0, Lmm3;->b:Lesk;

    packed-switch v0, :pswitch_data_7a

    const-class v0, Lwg7;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31

    new-instance v1, Lwg7;

    check-cast p0, Ldw3;

    iget-object p0, p0, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    check-cast v3, Ldw3;

    invoke-virtual {v3}, Ldw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorm;

    check-cast v2, Lew3;

    invoke-virtual {v2}, Lew3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld8j;

    invoke-direct {v1, p0, p1, v0}, Lwg7;-><init>(Lsf7;Lorm;Ld8j;)V

    :cond_31
    return-object v1

    :pswitch_32
    check-cast v2, Lcom/opera/android/Lazy;

    const-class v0, Lim3;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    new-instance v1, Lim3;

    check-cast p0, Lyv3;

    invoke-virtual {p0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpm3;

    check-cast v3, Lyv3;

    invoke-virtual {v3}, Lyv3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lhxk;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgjm;

    invoke-direct {v1, p0, p1, v0}, Lim3;-><init>(Lpm3;Lhxk;Lgjm;)V

    goto :goto_79

    :cond_58
    const-class p0, Le2b;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_66

    new-instance v1, Le2b;

    invoke-direct {v1}, Le2b;-><init>()V

    goto :goto_79

    :cond_66
    const-class p0, Lqx7;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_79

    new-instance v1, Lqx7;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    invoke-direct {v1, p0}, Lqx7;-><init>(Lgjm;)V

    :cond_79
    :goto_79
    return-object v1

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
