.class public final synthetic Lu7j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/opera/android/settings/SettingsManager;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Lbr9;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/Object;Lbr9;Lcom/opera/android/settings/SettingsManager;B)V
    .registers 6

    iput-byte p5, p0, Lu7j;->a:B

    iput-object p1, p0, Lu7j;->b:Ljava/lang/String;

    iput-object p2, p0, Lu7j;->d:Ljava/lang/Object;

    iput-object p3, p0, Lu7j;->e:Lbr9;

    iput-object p4, p0, Lu7j;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 6

    iget-byte v0, p0, Lu7j;->a:B

    iget-object v1, p0, Lu7j;->c:Lcom/opera/android/settings/SettingsManager;

    iget-object v2, p0, Lu7j;->e:Lbr9;

    iget-object v3, p0, Lu7j;->d:Ljava/lang/Object;

    iget-object p0, p0, Lu7j;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_32

    check-cast v3, Lv7j;

    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1e

    invoke-interface {v2, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {v3, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_1e
    return-void

    :pswitch_1f
    check-cast v3, Lz1h;

    check-cast v2, Lkotlin/jvm/functions/Function2;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    invoke-interface {v2, p0, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v3, p0}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_30
    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method
