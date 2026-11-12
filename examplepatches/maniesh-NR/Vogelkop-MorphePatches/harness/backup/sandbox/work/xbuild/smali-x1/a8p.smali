.class public final synthetic La8p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt8p;


# direct methods
.method public synthetic constructor <init>(Lt8p;B)V
    .registers 3

    iput-byte p2, p0, La8p;->a:B

    iput-object p1, p0, La8p;->b:Lt8p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, La8p;->a:B

    iget-object p0, p0, La8p;->b:Lt8p;

    packed-switch v0, :pswitch_data_32

    iget-object p1, p0, Lt8p;->z:Lxho;

    if-eqz p1, :cond_28

    iget-object p1, p1, Lxho;->s:Ljava/lang/String;

    if-eqz p1, :cond_28

    iget-object v0, p0, Lt8p;->u:Leuo;

    iget v1, v0, Leuo;->a:I

    const/4 v2, 0x7

    if-eq v1, v2, :cond_19

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1d

    :cond_19
    invoke-virtual {v0}, Leuo;->b()V

    goto :goto_25

    :cond_1d
    iput-object p1, v0, Leuo;->r:Ljava/lang/String;

    invoke-virtual {v0}, Leuo;->c()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lt8p;->H:Z

    :goto_25
    const/4 p0, 0x0

    sput-boolean p0, Lt8p;->J:Z

    :cond_28
    return-void

    :pswitch_29
    iget-object v0, p0, Laoo;->c:Lami;

    invoke-virtual {v0, p0}, Lami;->a(Landroid/view/View;)V

    invoke-virtual {p0, p1}, Laoo;->j(Landroid/view/View;)V

    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
