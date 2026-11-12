.class public final synthetic Lxw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt5d;


# direct methods
.method public synthetic constructor <init>(Lt5d;B)V
    .registers 3

    iput-byte p2, p0, Lxw3;->a:B

    iput-object p1, p0, Lxw3;->b:Lt5d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lxw3;->a:B

    iget-object p0, p0, Lxw3;->b:Lt5d;

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    packed-switch v0, :pswitch_data_38

    invoke-virtual {p0, p1}, Ldx3;->G(Lcom/opera/android/browser/chromium/ChromiumContent;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    if-eqz p1, :cond_25

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1c

    new-instance p1, Lqz4;

    invoke-direct {p1, p0, v0}, Lqz4;-><init>(Ljava/lang/Object;B)V

    goto :goto_26

    :cond_1c
    const/4 p1, 0x0

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    move-object p1, p0

    check-cast p1, Lype;

    goto :goto_26

    :cond_25
    const/4 p1, 0x0

    :goto_26
    return-object p1

    :pswitch_27
    iget-object v0, p0, Ldx3;->n:Lhx3;

    iget-object v0, v0, Lhx3;->g:Lfx3;

    invoke-virtual {p0, p1}, Ldx3;->I(Lcom/opera/android/browser/chromium/ChromiumContent;)Ljava/util/List;

    move-result-object p0

    new-instance v1, Laeb;

    invoke-direct {v1, p1, v0, p0}, Laeb;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/android/Lazy;Ljava/util/List;)V

    iget-object p0, v1, Laeb;->g:Lzdb;

    return-object p0

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
