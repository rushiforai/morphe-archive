.class public final Lfp3;
.super Lr22;
.source "SourceFile"


# instance fields
.field public final synthetic e:B


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/BottomBar;Lw6j;B)V
    .registers 5

    iput-byte p4, p0, Lfp3;->e:B

    invoke-direct {p0, p1, p2, p3}, Lr22;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/BottomBar;Lw6j;)V

    return-void
.end method


# virtual methods
.method public final O()Z
    .registers 1

    iget-byte p0, p0, Lfp3;->e:B

    const/4 p0, 0x1

    return p0
.end method

.method public final d(Lrsg;)Lno3;
    .registers 3

    iget-byte p0, p0, Lfp3;->e:B

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_16

    iget-boolean p0, p1, Lrsg;->c:Z

    new-instance p1, Lno3;

    xor-int/lit8 p0, p0, 0x1

    invoke-direct {p1, v0, p0, v0}, Lno3;-><init>(ZZZ)V

    return-object p1

    :pswitch_10
    new-instance p0, Lno3;

    invoke-direct {p0, v0, v0, v0}, Lno3;-><init>(ZZZ)V

    return-object p0

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final i()Z
    .registers 1

    iget-byte p0, p0, Lfp3;->e:B

    const/4 p0, 0x0

    return p0
.end method
