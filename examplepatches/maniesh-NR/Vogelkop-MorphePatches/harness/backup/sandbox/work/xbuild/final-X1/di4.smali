.class public final synthetic Ldi4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lav4;
.implements Ltj9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgi4;


# direct methods
.method public synthetic constructor <init>(Lgi4;B)V
    .registers 3

    iput-byte p2, p0, Ldi4;->a:B

    iput-object p1, p0, Ldi4;->b:Lgi4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final E(Lcom/opera/android/custom_views/CheckBox;)V
    .registers 2

    iget-object p0, p0, Ldi4;->b:Lgi4;

    iget-boolean p1, p1, Lcom/opera/android/custom_views/CheckBox;->n:Z

    iput-boolean p1, p0, Lgi4;->f:Z

    return-void
.end method

.method public final d(I)V
    .registers 3

    iget-byte v0, p0, Ldi4;->a:B

    iget-object p0, p0, Ldi4;->b:Lgi4;

    packed-switch v0, :pswitch_data_22

    iget-object v0, p0, Lgi4;->b:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfi4;

    iget-object p1, p1, Lfi4;->a:Ljava/lang/String;

    iput-object p1, p0, Lgi4;->e:Ljava/lang/String;

    return-void

    :pswitch_14
    iget-object v0, p0, Lgi4;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfi4;

    iget-object p1, p1, Lfi4;->a:Ljava/lang/String;

    iput-object p1, p0, Lgi4;->d:Ljava/lang/String;

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_14
    .end packed-switch
.end method
