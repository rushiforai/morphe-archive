.class public final Lje1;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# static fields
.field public static final j:Lje1;

.field public static final k:Lje1;


# instance fields
.field public final synthetic i:B


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 3

    new-instance v0, Lje1;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Lje1;-><init>(BI)V

    sput-object v0, Lje1;->j:Lje1;

    new-instance v0, Lje1;

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lje1;-><init>(BI)V

    sput-object v0, Lje1;->k:Lje1;

    return-void
.end method

.method public synthetic constructor <init>(BI)V
    .registers 3

    iput-byte p1, p0, Lje1;->i:B

    invoke-direct {p0, p2}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte p0, p0, Lje1;->i:B

    packed-switch p0, :pswitch_data_24

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12
    check-cast p1, Le48;

    check-cast p2, Le48;

    if-ne p1, p2, :cond_1e

    sget-object p0, Le48;->c:Le48;

    if-ne p2, p0, :cond_1e

    const/4 p0, 0x1

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
