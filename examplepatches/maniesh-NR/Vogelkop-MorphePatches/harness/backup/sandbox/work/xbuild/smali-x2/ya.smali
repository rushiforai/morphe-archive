.class public final synthetic Lya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbb;


# direct methods
.method public synthetic constructor <init>(Lbb;B)V
    .registers 3

    iput-byte p2, p0, Lya;->a:B

    iput-object p1, p0, Lya;->b:Lbb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lya;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lya;->b:Lbb;

    check-cast p1, Landroid/content/SharedPreferences;

    packed-switch v0, :pswitch_data_16

    iput-boolean v1, p0, Lbb;->e:Z

    invoke-virtual {p0}, Lbb;->a()V

    return-void

    :pswitch_10
    iput-boolean v1, p0, Lbb;->d:Z

    invoke-virtual {p0}, Lbb;->a()V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
