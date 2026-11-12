.class public final synthetic Lyh2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(JB)V
    .registers 4

    iput-byte p3, p0, Lyh2;->a:B

    iput-wide p1, p0, Lyh2;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lyh2;->a:B

    iget-wide v1, p0, Lyh2;->b:J

    packed-switch v0, :pswitch_data_20

    check-cast p1, Lcom/opera/android/autofill/Address;

    if-eqz p1, :cond_d

    const/4 p0, 0x1

    goto :goto_e

    :cond_d
    const/4 p0, 0x2

    :goto_e
    invoke-static {v1, v2, p0, p1}, LJ/N;->Mf9jHO_s(JILjava/lang/Object;)V

    return-void

    :pswitch_12
    check-cast p1, Lcom/opera/android/oauth2/OperaAccessToken;

    sget-object p0, Lcom/opera/android/account/AuthExtension;->a:Li7f;

    if-eqz p1, :cond_1b

    iget-object p0, p1, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    goto :goto_1c

    :cond_1b
    const/4 p0, 0x0

    :goto_1c
    invoke-static {v1, v2, p0}, LJ/N;->MG9GgC1E(JLjava/lang/Object;)V

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
