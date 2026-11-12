.class public final Lob6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;
.implements Lmkf;


# instance fields
.field public final synthetic a:B

.field public final b:Lgjm;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lgjm;Lgw3;Lojn;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lob6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lob6;->b:Lgjm;

    iput-object p2, p0, Lob6;->c:Ljava/lang/Object;

    iput-object p3, p0, Lob6;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lumi;Ldw3;Lgjm;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lob6;->a:B

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lob6;->c:Ljava/lang/Object;

    .line 15
    iput-object p2, p0, Lob6;->d:Ljava/lang/Object;

    .line 16
    iput-object p3, p0, Lob6;->b:Lgjm;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 4

    iget-byte v0, p0, Lob6;->a:B

    packed-switch v0, :pswitch_data_2c

    iget-object v0, p0, Lob6;->d:Ljava/lang/Object;

    check-cast v0, Lojn;

    const-class v1, Lyrk;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    iget-object p0, p0, Lob6;->b:Lgjm;

    if-eqz v1, :cond_19

    new-instance p1, Lyrk;

    invoke-direct {p1, p0, v0}, Lyrk;-><init>(Lgjm;Lojn;)V

    goto :goto_28

    :cond_19
    const-class v1, Lrrk;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_27

    new-instance p1, Lrrk;

    invoke-direct {p1, p0, v0}, Lrrk;-><init>(Lgjm;Lojn;)V

    goto :goto_28

    :cond_27
    const/4 p1, 0x0

    :goto_28
    return-object p1

    :pswitch_29
    const/4 p0, 0x0

    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method

.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 6

    iget-byte v0, p0, Lob6;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lob6;->c:Ljava/lang/Object;

    iget-object v3, p0, Lob6;->b:Lgjm;

    packed-switch v0, :pswitch_data_50

    const-class p0, Lxrk;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_18

    new-instance v1, Lxrk;

    invoke-direct {v1}, Lxrk;-><init>()V

    goto :goto_35

    :cond_18
    const-class p0, Lqrk;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_26

    new-instance v1, Lqrk;

    invoke-direct {v1, v3}, Lqrk;-><init>(Lgjm;)V

    goto :goto_35

    :cond_26
    const-class p0, Lvrk;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_35

    new-instance v1, Lvrk;

    check-cast v2, Lgw3;

    invoke-direct {v1, v3, v2}, Lvrk;-><init>(Lgjm;Lgw3;)V

    :cond_35
    :goto_35
    return-object v1

    :pswitch_36
    const-class v0, Lsb6;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    new-instance v1, Lsb6;

    check-cast v2, Lumi;

    iget-object p0, p0, Lob6;->d:Ljava/lang/Object;

    check-cast p0, Ldw3;

    iget-object p0, p0, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object p0

    invoke-direct {v1, v2, p0, v3}, Lsb6;-><init>(Lumi;Lr65;Lgjm;)V

    :cond_4f
    return-object v1

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method
