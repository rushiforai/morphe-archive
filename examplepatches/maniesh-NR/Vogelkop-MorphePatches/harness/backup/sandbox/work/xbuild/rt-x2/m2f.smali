.class public final synthetic Lm2f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwub;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lwub;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Lm2f;->a:B

    iput-object p1, p0, Lm2f;->b:Lwub;

    iput-object p2, p0, Lm2f;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lm2f;->a:B

    iget-object v1, p0, Lm2f;->c:Ljava/lang/String;

    iget-object p0, p0, Lm2f;->b:Lwub;

    packed-switch v0, :pswitch_data_1c

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ll2f;

    iget-object p0, p0, Ll2f;->b:Landroid/app/NotificationManager;

    invoke-virtual {p0, v1}, Landroid/app/NotificationManager;->deleteNotificationChannel(Ljava/lang/String;)V

    return-void

    :pswitch_13
    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ll2f;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v1}, Ll2f;->a(ILjava/lang/String;)V

    return-void

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
