.class public final Li8d;
.super Lk24;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006\u00b2\u0006\u000c\u0010\u0005\u001a\u00020\u00048\nX\u008a\u0084\u0002"
    }
    d2 = {
        "Li8d;",
        "Lk24;",
        "<init>",
        "()V",
        "Lv8d;",
        "uiState",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final f:Lzyk;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lk24;-><init>()V

    new-instance v0, Lt2;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Li8d;->f:Lzyk;

    return-void
.end method


# virtual methods
.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const/4 p2, 0x0

    if-eqz p1, :cond_42

    const-string v0, "compose_highlight_target_key"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_42

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "compose_highlight_scroll_behavior"

    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    if-eqz v3, :cond_3a

    :try_start_21
    sget-object p1, Lt0i;->b:Lp0i;

    invoke-static {v3}, Lcg5;->valueOf(Ljava/lang/String;)Lcg5;

    move-result-object p1
    :try_end_27
    .catchall {:try_start_21 .. :try_end_27} :catchall_28

    goto :goto_31

    :catchall_28
    move-exception p1

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v0

    :goto_31
    instance-of v0, p1, Lq0i;

    if-nez v0, :cond_36

    move-object p2, p1

    :cond_36
    check-cast p2, Lcg5;

    if-nez p2, :cond_3c

    :cond_3a
    sget-object p2, Lcg5;->a:Lcg5;

    :cond_3c
    new-instance p1, Ldg5;

    invoke-direct {p1, v1, p2}, Ldg5;-><init>(ILcg5;)V

    move-object p2, p1

    :cond_42
    new-instance p1, Lrn9;

    const/16 v0, 0xc

    invoke-direct {p1, p0, v0}, Lrn9;-><init>(Lk24;B)V

    iput-object p2, p1, Lrn9;->d:Ljava/lang/Object;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lrn9;->b:Z

    new-instance v0, La7b;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, La7b;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lue5;

    const v1, 0x28aff8f3

    invoke-direct {p0, v1, v0, p2}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {p1, p0}, Lrn9;->j(Lue5;)Lch5;

    move-result-object p0

    return-object p0
.end method

.method public final o0()La9d;
    .registers 1

    iget-object p0, p0, Li8d;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La9d;

    return-object p0
.end method

.method public final onStart()V
    .registers 1

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    invoke-virtual {p0}, Li8d;->o0()La9d;

    move-result-object p0

    invoke-virtual {p0}, La9d;->f()V

    return-void
.end method
