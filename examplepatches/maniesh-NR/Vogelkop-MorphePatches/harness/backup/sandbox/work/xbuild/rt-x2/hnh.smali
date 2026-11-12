.class public final Lhnh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;
.implements Lmkf;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Lkotlin/jvm/functions/Function0;

.field public final d:Ljava/lang/Object;

.field public final e:Lkotlin/jvm/functions/Function0;

.field public final f:Lkotlin/jvm/functions/Function0;

.field public final g:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;B)V
    .registers 8

    iput-byte p7, p0, Lhnh;->a:B

    iput-object p1, p0, Lhnh;->b:Ljava/lang/Object;

    iput-object p2, p0, Lhnh;->c:Lkotlin/jvm/functions/Function0;

    iput-object p3, p0, Lhnh;->d:Ljava/lang/Object;

    iput-object p4, p0, Lhnh;->e:Lkotlin/jvm/functions/Function0;

    iput-object p5, p0, Lhnh;->f:Lkotlin/jvm/functions/Function0;

    iput-object p6, p0, Lhnh;->g:Lkotlin/jvm/functions/Function0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 2

    iget-byte p0, p0, Lhnh;->a:B

    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 16

    iget-byte v0, p0, Lhnh;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lhnh;->g:Lkotlin/jvm/functions/Function0;

    iget-object v3, p0, Lhnh;->f:Lkotlin/jvm/functions/Function0;

    iget-object v4, p0, Lhnh;->e:Lkotlin/jvm/functions/Function0;

    iget-object v5, p0, Lhnh;->d:Ljava/lang/Object;

    iget-object v6, p0, Lhnh;->c:Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Lhnh;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_8a

    const-class v0, Lgcj;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4a

    new-instance v7, Lgcj;

    move-object v8, p0

    check-cast v8, Ldx3;

    check-cast v6, Lcw3;

    invoke-virtual {v6}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    move-object v9, p0

    check-cast v9, Lag7;

    move-object v10, v5

    check-cast v10, Lumi;

    check-cast v4, Lcw3;

    invoke-virtual {v4}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    move-object v11, p0

    check-cast v11, Lnej;

    check-cast v3, Lcw3;

    invoke-virtual {v3}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    move-object v12, p0

    check-cast v12, Lysj;

    check-cast v2, Let3;

    invoke-virtual {v2}, Let3;->invoke()Ljava/lang/Object;

    move-result-object p0

    move-object v13, p0

    check-cast v13, Lorm;

    invoke-direct/range {v7 .. v13}, Lgcj;-><init>(Ldx3;Lag7;Lumi;Lnej;Lysj;Lorm;)V

    move-object v1, v7

    :cond_4a
    return-object v1

    :pswitch_4b
    const-class v0, Lknh;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_89

    new-instance v7, Lknh;

    move-object v8, p0

    check-cast v8, Lgjm;

    check-cast v6, Lcw3;

    invoke-virtual {v6}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    move-object v9, p0

    check-cast v9, Lfnh;

    check-cast v5, Lcw3;

    invoke-virtual {v5}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    move-object v10, p0

    check-cast v10, Lu4l;

    check-cast v4, Lcw3;

    invoke-virtual {v4}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    move-object v11, p0

    check-cast v11, Lyqa;

    check-cast v3, Lcw3;

    invoke-virtual {v3}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    move-object v12, p0

    check-cast v12, Lysj;

    check-cast v2, Lcw3;

    invoke-virtual {v2}, Lcw3;->invoke()Ljava/lang/Object;

    move-result-object p0

    move-object v13, p0

    check-cast v13, Linh;

    invoke-direct/range {v7 .. v13}, Lknh;-><init>(Lgjm;Lfnh;Lu4l;Lyqa;Lysj;Linh;)V

    move-object v1, v7

    :cond_89
    return-object v1

    :pswitch_data_8a
    .packed-switch 0x0
        :pswitch_4b
    .end packed-switch
.end method
