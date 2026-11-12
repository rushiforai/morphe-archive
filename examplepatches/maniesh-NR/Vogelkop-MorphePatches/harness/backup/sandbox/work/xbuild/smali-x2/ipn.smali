.class public final synthetic Lipn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/weather/ui/WeatherWidgetActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V
    .registers 3

    iput-byte p2, p0, Lipn;->a:B

    iput-object p1, p0, Lipn;->b:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lipn;->a:B

    iget-object p0, p0, Lipn;->b:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    packed-switch v0, :pswitch_data_1e

    sget v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->e0:I

    iget-object p0, p0, Lhjf;->h:Lsz4;

    if-nez p0, :cond_13

    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_13
    return-object p0

    :pswitch_14
    sget v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->e0:I

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    return-object p0

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
