.class public final synthetic Le0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltah;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ltah;Ljava/io/File;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Le0a;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le0a;->b:Ltah;

    iput-object p2, p0, Le0a;->d:Ljava/io/File;

    iput-object p3, p0, Le0a;->c:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Ltah;Ljava/lang/String;Ljava/io/File;)V
    .registers 5

    .line 13
    const/4 v0, 0x1

    iput-byte v0, p0, Le0a;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le0a;->b:Ltah;

    iput-object p2, p0, Le0a;->c:Ljava/lang/String;

    iput-object p3, p0, Le0a;->d:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Le0a;->a:B

    iget-object v1, p0, Le0a;->d:Ljava/io/File;

    iget-object v2, p0, Le0a;->c:Ljava/lang/String;

    iget-object p0, p0, Le0a;->b:Ltah;

    packed-switch v0, :pswitch_data_74

    check-cast p1, Landroid/net/Uri;

    if-eqz p1, :cond_13

    invoke-virtual {p0, p1, v2}, Ltah;->a(Landroid/net/Uri;Ljava/lang/String;)V

    goto :goto_2a

    :cond_13
    iget-object p1, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p1, Lf0a;

    iget-object p1, p1, Lf0a;->a:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lysj;

    new-instance v0, Lrxh;

    const v2, 0x7f140800

    invoke-direct {v0, v2}, Lrxh;-><init>(I)V

    invoke-static {p1, v0}, Ljoh;->h(Lysj;Lpxh;)V

    :goto_2a
    iget-object p0, p0, Ltah;->j:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-interface {p0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_32
    check-cast p1, Lm32;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_6b

    const/4 v0, 0x1

    if-ne p1, v0, :cond_67

    new-instance p1, Lyo7;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v2, v1, v0}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v0, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v2, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Lwx1;

    const/4 v2, 0x5

    invoke-direct {p0, v1, v2}, Lwx1;-><init>(Ljava/io/File;B)V

    invoke-virtual {v0, p0}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance v0, Ltu7;

    const/16 v1, 0x13

    invoke-direct {v0, p1, v1}, Ltu7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    goto :goto_72

    :cond_67
    invoke-static {}, Lh9o;->p()V

    goto :goto_72

    :cond_6b
    iget-object p0, p0, Ltah;->j:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-interface {p0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :goto_72
    return-void

    nop

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
