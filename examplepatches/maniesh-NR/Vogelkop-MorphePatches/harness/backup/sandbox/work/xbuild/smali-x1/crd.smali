.class public final Lcrd;
.super Lk24;
.source "SourceFile"

# interfaces
.implements Lo37;


# instance fields
.field public final f:Lua7;

.field public final g:Lzyk;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 3

    invoke-direct {p0}, Lk24;-><init>()V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lcrd;->f:Lua7;

    new-instance p1, Lt2;

    const/16 v0, 0x1c

    invoke-direct {p1, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lcrd;->g:Lzyk;

    return-void
.end method


# virtual methods
.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    iget-object p1, p0, Lcrd;->f:Lua7;

    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object p1

    check-cast p1, Lbrd;

    iget-object p1, p1, Lbrd;->a:Loba;

    iget-object p1, p1, Loba;->a:[I

    invoke-static {p1}, Le82;->r([I)Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    new-instance p2, Ldg5;

    invoke-direct {p2, p1}, Ldg5;-><init>(I)V

    goto :goto_1d

    :cond_1c
    const/4 p2, 0x0

    :goto_1d
    new-instance p1, Lrn9;

    const/16 v0, 0xc

    invoke-direct {p1, p0, v0}, Lrn9;-><init>(Lk24;B)V

    iput-object p2, p1, Lrn9;->d:Ljava/lang/Object;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lrn9;->b:Z

    new-instance v1, La7b;

    invoke-direct {v1, p0, v0}, La7b;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lue5;

    const v0, -0x374546e5

    invoke-direct {p0, v0, v1, p2}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {p1, p0}, Lrn9;->j(Lue5;)Lch5;

    move-result-object p0

    return-object p0
.end method

.method public final onStart()V
    .registers 5

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-object p0, p0, Lcrd;->g:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfrd;

    iget-object v0, p0, Lfrd;->g:Lnak;

    new-instance v1, Lerd;

    iget-object v2, p0, Lfrd;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v3, "media_background_play"

    invoke-virtual {v2, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    iget-object v3, p0, Lfrd;->e:Lj3i;

    invoke-virtual {v3}, Lj3i;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iget-boolean p0, p0, Lfrd;->f:Z

    invoke-direct {v1, v2, v3, p0}, Lerd;-><init>(ZZZ)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lcrd;->f:Lua7;

    return-object p0
.end method
