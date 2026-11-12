.class public final synthetic Lil4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhqk;


# direct methods
.method public synthetic constructor <init>(Lhqk;B)V
    .registers 3

    iput-byte p2, p0, Lil4;->a:B

    iput-object p1, p0, Lil4;->b:Lhqk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lil4;->a:B

    iget-object p0, p0, Lil4;->b:Lhqk;

    check-cast p1, Lcom/opera/android/suggestion/Suggestion;

    packed-switch v0, :pswitch_data_18

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_10
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
