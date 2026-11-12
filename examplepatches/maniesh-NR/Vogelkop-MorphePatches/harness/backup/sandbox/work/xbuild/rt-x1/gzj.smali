.class public final synthetic Lgzj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lizj;


# direct methods
.method public synthetic constructor <init>(Lizj;B)V
    .registers 3

    iput-byte p2, p0, Lgzj;->a:B

    iput-object p1, p0, Lgzj;->b:Lizj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lgzj;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lgzj;->b:Lizj;

    packed-switch v0, :pswitch_data_66

    check-cast p1, Landroid/content/res/Configuration;

    iget-object p1, p0, Lizj;->d:Lpde;

    iget-object v0, p0, Lizj;->b:Landroid/content/Context;

    iget-object v2, p0, Lizj;->c:Likc;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v0, v2}, Lj14;->B(Landroid/content/Context;Z)Ltta;

    move-result-object v0

    invoke-static {p1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    move-result p1

    iget-object p0, p0, Lizj;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_28
    if-ge v1, v0, :cond_36

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lhzj;

    invoke-interface {v2, p1}, Lhzj;->a(Z)V

    goto :goto_28

    :cond_36
    return-void

    :pswitch_37
    check-cast p1, Ljava/lang/Boolean;

    iget-object p1, p0, Lizj;->d:Lpde;

    iget-object v0, p0, Lizj;->b:Landroid/content/Context;

    iget-object v2, p0, Lizj;->c:Likc;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v0, v2}, Lj14;->B(Landroid/content/Context;Z)Ltta;

    move-result-object v0

    invoke-static {p1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    move-result p1

    iget-object p0, p0, Lizj;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_57
    if-ge v1, v0, :cond_65

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lhzj;

    invoke-interface {v2, p1}, Lhzj;->a(Z)V

    goto :goto_57

    :cond_65
    return-void

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_37
    .end packed-switch
.end method
