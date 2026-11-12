.class public final synthetic Lax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcx;


# direct methods
.method public synthetic constructor <init>(Lcx;B)V
    .registers 3

    iput-byte p2, p0, Lax;->a:B

    iput-object p1, p0, Lax;->b:Lcx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lax;->a:B

    iget-object p0, p0, Lax;->b:Lcx;

    check-cast p1, Ljava/lang/String;

    packed-switch v0, :pswitch_data_26

    iget-object p0, p0, Lcx;->j:Lcom/opera/android/undo/UndoBar;

    if-eqz p0, :cond_14

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    :cond_14
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    iget-object p0, p0, Lcx;->j:Lcom/opera/android/undo/UndoBar;

    if-eqz p0, :cond_22

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    :cond_22
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
