.class public final synthetic Lrjc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltjc;


# direct methods
.method public synthetic constructor <init>(Ltjc;B)V
    .registers 3

    iput-byte p2, p0, Lrjc;->a:B

    iput-object p1, p0, Lrjc;->b:Ltjc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lrjc;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lrjc;->b:Ltjc;

    packed-switch v0, :pswitch_data_96

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_15

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :cond_15
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Ltjc;->g:Z

    if-eqz p1, :cond_36

    iget-object p1, p0, Ltjc;->a:Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lrjc;

    invoke-direct {p1, p0, v2}, Lrjc;-><init>(Ltjc;B)V

    invoke-virtual {v0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object v0, p0, Ltjc;->f:Lqie;

    invoke-virtual {p1, v0}, Lplk;->m(Lqie;)Lp1j;

    :cond_36
    iget-object p1, p0, Ltjc;->b:Lfx0;

    iget-boolean v0, p0, Ltjc;->g:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lfx0;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_44
    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Ltjc;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_4c
    if-ge v1, p1, :cond_5a

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_4c

    :cond_5a
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_60
    check-cast p1, Lkotlin/Unit;

    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Ltjc;->c:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object v0

    const-string v3, "app_opera"

    invoke-direct {p1, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v0, Ljava/io/File;

    const-string v3, "Login Data"

    invoke-direct {v0, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_91

    new-instance p1, Lg0d;

    iget-object v1, p0, Ltjc;->a:Lumi;

    new-instance v3, Lvx;

    const/16 v4, 0x16

    invoke-direct {v3, p0, v4}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v1, v3, v0}, Lg0d;-><init>(Lumi;Lvx;Ljava/lang/String;)V

    iput-object p1, p0, Ltjc;->h:Lg0d;

    move v1, v2

    :cond_91
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_60
        :pswitch_44
    .end packed-switch
.end method
