.class public final synthetic Lpy5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:S

.field public final synthetic d:B

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;IIZ)V
    .registers 7

    .line 17
    const/4 v0, 0x0

    iput-byte v0, p0, Lpy5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpy5;->e:Ljava/lang/Object;

    iput-object p2, p0, Lpy5;->f:Ljava/lang/Object;

    iput-boolean p5, p0, Lpy5;->b:Z

    iput-short p3, p0, Lpy5;->c:S

    iput-byte p4, p0, Lpy5;->d:B

    return-void
.end method

.method public synthetic constructor <init>(Lnof;ZLue5;II)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lpy5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpy5;->e:Ljava/lang/Object;

    iput-boolean p2, p0, Lpy5;->b:Z

    iput-object p3, p0, Lpy5;->f:Ljava/lang/Object;

    iput-short p4, p0, Lpy5;->c:S

    iput-byte p5, p0, Lpy5;->d:B

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lpy5;->a:B

    iget-short v1, p0, Lpy5;->c:S

    iget-object v2, p0, Lpy5;->f:Ljava/lang/Object;

    iget-object v3, p0, Lpy5;->e:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_48

    move-object v4, v3

    check-cast v4, Lnof;

    move-object v6, v2

    check-cast v6, Lue5;

    move-object v7, p1

    check-cast v7, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    or-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Laoh;->m(I)I

    move-result v8

    iget-boolean v5, p0, Lpy5;->b:Z

    iget-byte v9, p0, Lpy5;->d:B

    invoke-static/range {v4 .. v9}, Lrof;->c(Lnof;ZLue5;Lih5;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29
    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    check-cast v2, Ljava/lang/String;

    move-object v3, p1

    check-cast v3, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    or-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Laoh;->m(I)I

    move-result v4

    move-object v1, v2

    iget-boolean v2, p0, Lpy5;->b:Z

    iget-byte v5, p0, Lpy5;->d:B

    invoke-static/range {v0 .. v5}, Lxy5;->j(Ljava/lang/String;Ljava/lang/String;ZLih5;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
