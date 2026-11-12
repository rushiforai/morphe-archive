.class public final synthetic Lygf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/oauth2/OperaAccessSandbox;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/oauth2/OperaAccessSandbox;B)V
    .registers 3

    iput-byte p2, p0, Lygf;->a:B

    iput-object p1, p0, Lygf;->b:Lcom/opera/android/oauth2/OperaAccessSandbox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lygf;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x2

    iget-object p0, p0, Lygf;->b:Lcom/opera/android/oauth2/OperaAccessSandbox;

    packed-switch v0, :pswitch_data_2e

    check-cast p1, Lq43;

    iget-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    if-ne v0, v2, :cond_1f

    iget p1, p1, Lq43;->a:I

    if-lez p1, :cond_1c

    div-int/lit8 p1, p1, 0x64

    const/4 v0, 0x4

    if-ne p1, v0, :cond_1c

    invoke-virtual {p0, v2}, Lcom/opera/android/oauth2/OperaAccessSandbox;->a(I)V

    goto :goto_1f

    :cond_1c
    invoke-virtual {p0, v1}, Lcom/opera/android/oauth2/OperaAccessSandbox;->a(I)V

    :cond_1f
    :goto_1f
    return-void

    :pswitch_20
    check-cast p1, Ljava/lang/String;

    iget-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    if-ne v0, v2, :cond_2d

    iput-byte v1, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    iget-wide v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->d:J

    invoke-static {v0, v1, p1}, LJ/N;->MJ$$Z40w(JLjava/lang/Object;)V

    :cond_2d
    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method
