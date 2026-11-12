.class public Lkqo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkro;


# instance fields
.field public final synthetic b:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lkqo;->b:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Lkqo;->b:B

    packed-switch p0, :pswitch_data_c

    invoke-static {p1}, Ldyg;->c(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    const/4 p0, 0x0

    return-object p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
