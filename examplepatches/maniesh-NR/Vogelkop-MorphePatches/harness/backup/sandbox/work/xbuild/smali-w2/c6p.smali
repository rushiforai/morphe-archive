.class public final Lc6p;
.super Lsc;
.source "SourceFile"


# instance fields
.field public final d:Leuo;


# direct methods
.method public constructor <init>(Leuo;Ljava/lang/String;Loam;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lsc;-><init>(Landroid/view/View;Ljava/lang/String;Loam;)V

    iput-object p1, p0, Lc6p;->d:Leuo;

    return-void
.end method


# virtual methods
.method public final b(I)V
    .registers 6

    iget-object v0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast v0, Lqe6;

    if-eqz v0, :cond_17

    sget-object v0, Ly3p;->a:[I

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    aget p1, v0, p1

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    iget-object v2, p0, Lc6p;->d:Leuo;

    const/4 v3, 0x0

    packed-switch p1, :pswitch_data_13e

    :cond_17
    return-void

    :pswitch_18
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    invoke-virtual {p0, v0}, Lqe6;->V(F)V

    return-void

    :pswitch_20
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    invoke-virtual {p0, v1}, Lqe6;->V(F)V

    return-void

    :pswitch_28
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "skipped"

    invoke-virtual {p0, p1, v3}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :pswitch_3b
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "resume"

    invoke-virtual {p0, p1, v3}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :pswitch_4e
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "pause"

    invoke-virtual {p0, p1, v3}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :pswitch_61
    iget-object p1, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p1, Lqe6;

    sget-object v0, Lskg;->c:Lskg;

    invoke-virtual {p1, v0}, Lqe6;->Q(Lskg;)V

    iget-object p1, v2, Leuo;->f:Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Lsc;->c(Landroid/view/View;)V

    return-void

    :pswitch_70
    iget-object p1, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p1, Lqe6;

    sget-object v0, Lskg;->d:Lskg;

    invoke-virtual {p1, v0}, Lqe6;->Q(Lskg;)V

    iget-object p1, v2, Leuo;->f:Landroid/widget/FrameLayout;

    sget-object v0, Lpp9;->a:Lpp9;

    const-string v1, "full screen"

    invoke-virtual {p0, p1, v0, v1}, Lsc;->d(Landroid/view/View;Lpp9;Ljava/lang/String;)V

    return-void

    :pswitch_83
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    sget-object p1, Lskg;->b:Lskg;

    invoke-virtual {p0, p1}, Lqe6;->Q(Lskg;)V

    return-void

    :pswitch_8d
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "thirdQuartile"

    invoke-virtual {p0, p1, v3}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :pswitch_a0
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "midpoint"

    invoke-virtual {p0, p1, v3}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :pswitch_b3
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "firstQuartile"

    invoke-virtual {p0, p1, v3}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :pswitch_c6
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "complete"

    invoke-virtual {p0, p1, v3}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :pswitch_d9
    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    iget-object p1, v2, Leuo;->e:Lqoo;

    const/4 v3, 0x0

    if-eqz p1, :cond_e8

    :try_start_e2
    iget-object p1, p1, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v3
    :try_end_e8
    .catch Ljava/lang/IllegalStateException; {:try_start_e2 .. :try_end_e8} :catch_e8

    :catch_e8
    :cond_e8
    int-to-float p1, v3

    iget-boolean v2, v2, Leuo;->t:Z

    if-eqz v2, :cond_ef

    move v2, v1

    goto :goto_f0

    :cond_ef
    move v2, v0

    :goto_f0
    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    cmpg-float v3, p1, v1

    if-lez v3, :cond_137

    cmpg-float v1, v2, v1

    if-ltz v1, :cond_131

    cmpl-float v0, v2, v0

    if-gtz v0, :cond_131

    invoke-static {p0}, Lzch;->c(Luio;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const-string v1, "duration"

    invoke-static {v0, v1, p1}, Lyqo;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const-string v1, "mediaPlayerVolume"

    invoke-static {v0, v1, p1}, Lyqo;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lw5p;->b()Lw5p;

    move-result-object p1

    iget p1, p1, Lw5p;->b:F

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const-string v1, "deviceVolume"

    invoke-static {v0, v1, p1}, Lyqo;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string p1, "start"

    invoke-virtual {p0, p1, v0}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :cond_131
    const-string p0, "Invalid Media volume"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_137
    const-string p0, "Invalid Media duration"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_13e
    .packed-switch 0x1
        :pswitch_d9
        :pswitch_c6
        :pswitch_b3
        :pswitch_a0
        :pswitch_8d
        :pswitch_83
        :pswitch_70
        :pswitch_61
        :pswitch_4e
        :pswitch_4e
        :pswitch_3b
        :pswitch_28
        :pswitch_20
        :pswitch_18
    .end packed-switch
.end method
