.class public abstract Loy8;
.super Ldy8;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V
    .registers 5

    .line 46
    iput-byte p4, p0, Loy8;->c:B

    invoke-direct {p0, p1}, Ldy8;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Loy8;->d:Ljava/lang/String;

    iput-object p3, p0, Loy8;->e:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorb;B)V
    .registers 4

    iput-byte p3, p0, Loy8;->c:B

    packed-switch p3, :pswitch_data_2e

    invoke-direct {p0, p2, p1}, Ldy8;-><init>(Lorb;Ljava/lang/String;)V

    const-string p1, "request_id"

    invoke-virtual {p2, p1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Loy8;->d:Ljava/lang/String;

    const-string p1, "access_type"

    invoke-virtual {p2, p1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Loy8;->e:Ljava/lang/String;

    return-void

    :pswitch_19
    invoke-direct {p0, p2, p1}, Ldy8;-><init>(Lorb;Ljava/lang/String;)V

    const-string p1, "origin"

    invoke-virtual {p2, p1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Loy8;->d:Ljava/lang/String;

    const-string p1, "extra"

    const/4 p3, 0x0

    invoke-virtual {p2, p1, p3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Loy8;->e:Ljava/lang/String;

    return-void

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_19
    .end packed-switch
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 5

    iget-byte v0, p0, Loy8;->c:B

    iget-object v1, p0, Loy8;->e:Ljava/lang/String;

    iget-object v2, p0, Loy8;->d:Ljava/lang/String;

    packed-switch v0, :pswitch_data_2c

    invoke-super {p0, p1}, Ldy8;->a(Lorb;)V

    const-string p0, "origin"

    invoke-virtual {p1, v2, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1c

    const-string p0, "extra"

    invoke-virtual {p1, v1, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_1c
    return-void

    :pswitch_1d
    invoke-super {p0, p1}, Ldy8;->a(Lorb;)V

    const-string p0, "request_id"

    invoke-virtual {p1, v2, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "access_type"

    invoke-virtual {p1, v1, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
