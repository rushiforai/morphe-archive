.class public final synthetic Lp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lu2;


# direct methods
.method public synthetic constructor <init>(Lu2;B)V
    .registers 3

    iput-byte p2, p0, Lp2;->a:B

    iput-object p1, p0, Lp2;->b:Lu2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lp2;->a:B

    const/4 v1, 0x1

    const-wide/16 v2, 0x1

    packed-switch v0, :pswitch_data_104

    iget-object v6, p0, Lp2;->b:Lu2;

    invoke-virtual {v6}, Lu2;->o0()Ld3;

    move-result-object p0

    new-instance v4, Ls2;

    const/4 v10, 0x0

    const/4 v11, 0x3

    const/4 v5, 0x2

    const-class v7, Lu2;

    const-string v8, "openInFullscreen"

    const-string v9, "openInFullscreen(Ljava/lang/String;I)V"

    invoke-direct/range {v4 .. v11}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object p0, p0, Ld3;->e:Lorm;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_38

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-static {v0, v5}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v0

    iget-object v0, v0, Lhi0;->b:Lfi0;

    const/16 v6, 0xd

    invoke-virtual {v0, v6, v1, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    :cond_38
    const p0, 0x7f1410ca

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string v0, "chrome://about/"

    invoke-virtual {v4, v0, p0}, Ls2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_47
    iget-object v6, p0, Lp2;->b:Lu2;

    invoke-virtual {v6}, Lu2;->o0()Ld3;

    move-result-object p0

    new-instance v4, Ls2;

    const/4 v10, 0x0

    const/4 v11, 0x2

    const/4 v5, 0x2

    const-class v7, Lu2;

    const-string v8, "openInFullscreen"

    const-string v9, "openInFullscreen(Ljava/lang/String;I)V"

    invoke-direct/range {v4 .. v11}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object p0, p0, Ld3;->e:Lorm;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_77

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-static {v0, v5}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v0

    iget-object v0, v0, Lhi0;->b:Lfi0;

    const/16 v6, 0x10

    invoke-virtual {v0, v6, v1, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    :cond_77
    const p0, 0x7f14120d

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string v0, "https://www.opera.com/terms"

    invoke-virtual {v4, v0, p0}, Ls2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_86
    iget-object v6, p0, Lp2;->b:Lu2;

    invoke-virtual {v6}, Lu2;->o0()Ld3;

    move-result-object p0

    new-instance v4, Ls2;

    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v5, 0x2

    const-class v7, Lu2;

    const-string v8, "openInFullscreen"

    const-string v9, "openInFullscreen(Ljava/lang/String;I)V"

    invoke-direct/range {v4 .. v11}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object p0, p0, Ld3;->e:Lorm;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_b6

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-static {v0, v5}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v0

    iget-object v0, v0, Lhi0;->b:Lfi0;

    const/16 v6, 0xc

    invoke-virtual {v0, v6, v1, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    :cond_b6
    const p0, 0x7f141083

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string v0, "https://www.opera.com/privacy"

    invoke-virtual {v4, v0, p0}, Ls2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c5
    iget-object v6, p0, Lp2;->b:Lu2;

    invoke-virtual {v6}, Lu2;->o0()Ld3;

    move-result-object p0

    new-instance v4, Ls2;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v5, 0x2

    const-class v7, Lu2;

    const-string v8, "openInFullscreen"

    const-string v9, "openInFullscreen(Ljava/lang/String;I)V"

    invoke-direct/range {v4 .. v11}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object p0, p0, Ld3;->e:Lorm;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_f5

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-static {v0, v5}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v0

    iget-object v0, v0, Lhi0;->b:Lfi0;

    const/16 v6, 0xb

    invoke-virtual {v0, v6, v1, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    :cond_f5
    const p0, 0x7f140fda

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string v0, "https://www.opera.com/legal/eula-mobile"

    invoke-virtual {v4, v0, p0}, Ls2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_104
    .packed-switch 0x0
        :pswitch_c5
        :pswitch_86
        :pswitch_47
    .end packed-switch
.end method
