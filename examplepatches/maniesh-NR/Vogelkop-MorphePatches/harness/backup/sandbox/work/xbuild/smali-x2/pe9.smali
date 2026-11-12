.class public final synthetic Lpe9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk5o;


# direct methods
.method public synthetic constructor <init>(Lk5o;B)V
    .registers 3

    iput-byte p2, p0, Lpe9;->a:B

    iput-object p1, p0, Lpe9;->b:Lk5o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lpe9;->a:B

    iget-object p0, p0, Lpe9;->b:Lk5o;

    packed-switch v0, :pswitch_data_58

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Lege;

    if-eqz p0, :cond_12

    invoke-virtual {p0}, Lege;->a()V

    :cond_12
    return-void

    :pswitch_13
    check-cast p1, Ljava/lang/Float;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Lege;

    if-eqz p0, :cond_30

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object p0, p0, Lege;->a:Lzb9;

    iget v0, p0, Lzb9;->i:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_30

    iput p1, p0, Lzb9;->i:F

    iget-object p0, p0, Lzb9;->j:Lac9;

    if-eqz p0, :cond_30

    invoke-virtual {p0}, Lac9;->e0()V

    :cond_30
    return-void

    :pswitch_31
    check-cast p1, Lq43;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Lege;

    if-eqz p0, :cond_3e

    iget-object p1, p1, Lq43;->b:Ljava/lang/String;

    invoke-virtual {p0}, Lege;->a()V

    :cond_3e
    return-void

    :pswitch_3f
    check-cast p1, Ljava/lang/Long;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Lege;

    if-eqz p0, :cond_56

    if-eqz p1, :cond_53

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lege;->d:Z

    iput-wide v0, p0, Lege;->e:J

    goto :goto_56

    :cond_53
    invoke-virtual {p0}, Lege;->a()V

    :cond_56
    :goto_56
    return-void

    nop

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_3f
        :pswitch_31
        :pswitch_13
    .end packed-switch
.end method
