.class public final Lxbp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcn;


# direct methods
.method public synthetic constructor <init>(Lcn;B)V
    .registers 3

    iput-byte p2, p0, Lxbp;->a:B

    iput-object p1, p0, Lxbp;->b:Lcn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lxbp;->a:B

    packed-switch v0, :pswitch_data_40

    new-instance v0, Lcm;

    const/16 v1, 0x69

    const/4 v2, 0x0

    const-string v3, "Required min WebView version 63"

    invoke-direct {v0, v1, v3, v2}, Lcm;-><init>(ILjava/lang/String;B)V

    iget-object p0, p0, Lxbp;->b:Lcn;

    invoke-interface {p0, v0}, Lcn;->g(Lcm;)V

    return-void

    :pswitch_15
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Required min SDK API level 24, but current API is "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    invoke-static {v0, v1, v2}, Lfki;->s(Ljava/lang/StringBuilder;IC)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcm;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Lcm;-><init>(ILjava/lang/String;B)V

    iget-object p0, p0, Lxbp;->b:Lcn;

    invoke-interface {p0, v1}, Lcn;->g(Lcm;)V

    return-void

    :pswitch_31
    new-instance v0, Lcm;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const-string v3, "placement id is invalid"

    invoke-direct {v0, v1, v3, v2}, Lcm;-><init>(ILjava/lang/String;B)V

    iget-object p0, p0, Lxbp;->b:Lcn;

    invoke-interface {p0, v0}, Lcn;->g(Lcm;)V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_31
        :pswitch_15
    .end packed-switch
.end method
