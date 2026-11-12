.class public final synthetic Le4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lg4l;


# direct methods
.method public synthetic constructor <init>(Lg4l;B)V
    .registers 3

    iput-byte p2, p0, Le4l;->a:B

    iput-object p1, p0, Le4l;->b:Lg4l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 10

    iget-byte v0, p0, Le4l;->a:B

    packed-switch v0, :pswitch_data_38

    check-cast p1, La4l;

    sget-object v0, La4l;->d:La4l;

    iget-object p0, p0, Le4l;->b:Lg4l;

    if-eq p1, v0, :cond_f

    iput-object p1, p0, Lg4l;->o:La4l;

    :cond_f
    new-instance p1, Ld4l;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v0}, Ld4l;-><init>(Lg4l;B)V

    invoke-virtual {p0, p1}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_19
    check-cast p1, Lqyi;

    sget-object v0, Loyi;->a:Loyi;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_37

    new-instance v0, Lj1k;

    const/4 v6, 0x0

    const/16 v7, 0xc

    const/4 v1, 0x0

    iget-object v2, p0, Le4l;->b:Lg4l;

    const-class v3, Lg4l;

    const-string v4, "maybeShowOrScheduleSelectModeMenuHintBubble"

    const-string v5, "maybeShowOrScheduleSelectModeMenuHintBubble()V"

    invoke-direct/range {v0 .. v7}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v2, v0}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    :cond_37
    return-void

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
