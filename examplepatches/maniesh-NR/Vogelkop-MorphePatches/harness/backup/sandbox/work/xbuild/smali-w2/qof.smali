.class public final synthetic Lqof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnof;

.field public final synthetic c:Z

.field public final synthetic d:Lue5;


# direct methods
.method public synthetic constructor <init>(Lnof;ZLue5;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lqof;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqof;->b:Lnof;

    iput-boolean p2, p0, Lqof;->c:Z

    iput-object p3, p0, Lqof;->d:Lue5;

    return-void
.end method

.method public synthetic constructor <init>(Lnof;ZLue5;I)V
    .registers 5

    .line 13
    const/4 p4, 0x1

    iput-byte p4, p0, Lqof;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqof;->b:Lnof;

    iput-boolean p2, p0, Lqof;->c:Z

    iput-object p3, p0, Lqof;->d:Lue5;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lqof;->a:B

    iget-object v1, p0, Lqof;->d:Lue5;

    iget-boolean v2, p0, Lqof;->c:Z

    iget-object p0, p0, Lqof;->b:Lnof;

    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    packed-switch v0, :pswitch_data_40

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 p2, 0x181

    invoke-static {p2}, Laoh;->m(I)I

    move-result p2

    invoke-static {p0, v2, v1, p1, p2}, Lrof;->b(Lnof;ZLue5;Lih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1e
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    and-int/lit8 v0, p2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v0, v3, :cond_2a

    move v0, v4

    goto :goto_2b

    :cond_2a
    const/4 v0, 0x0

    :goto_2b
    and-int/2addr p2, v4

    check-cast p1, Lvt9;

    invoke-virtual {p1, p2, v0}, Lvt9;->N(IZ)Z

    move-result p2

    if-eqz p2, :cond_3a

    const/16 p2, 0x180

    invoke-static {p0, v2, v1, p1, p2}, Lrof;->b(Lnof;ZLue5;Lih5;I)V

    goto :goto_3d

    :cond_3a
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_3d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
