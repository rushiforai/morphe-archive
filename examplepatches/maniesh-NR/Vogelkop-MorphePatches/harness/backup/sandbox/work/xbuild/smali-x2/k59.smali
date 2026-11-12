.class public final synthetic Lk59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ll59;


# direct methods
.method public synthetic constructor <init>(Ll59;B)V
    .registers 3

    iput-byte p2, p0, Lk59;->a:B

    iput-object p1, p0, Lk59;->b:Ll59;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .registers 5

    instance-of p1, p1, Ljava/io/IOException;

    const/4 v0, 0x2

    iget-object p0, p0, Lk59;->b:Ll59;

    const/4 v1, 0x0

    if-eqz p1, :cond_11

    new-instance p1, Lcm;

    invoke-direct {p1, v0, v1, v0}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-virtual {p0, p1}, Ll59;->a(Lcm;)V

    return-void

    :cond_11
    new-instance p1, Lcm;

    const/4 v2, 0x3

    invoke-direct {p1, v2, v1, v0}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-virtual {p0, p1}, Ll59;->a(Lcm;)V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lk59;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x1

    iget-object p0, p0, Lk59;->b:Ll59;

    packed-switch v0, :pswitch_data_20

    check-cast p1, Ljava/lang/Void;

    new-instance p1, Lcm;

    const/4 v0, 0x0

    invoke-direct {p1, v2, v0, v1}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-virtual {p0, p1}, Ll59;->a(Lcm;)V

    return-void

    :pswitch_15
    check-cast p1, Ljava/lang/String;

    new-instance v0, Lcm;

    invoke-direct {v0, v2, p1, v1}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-virtual {p0, v0}, Ll59;->a(Lcm;)V

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
