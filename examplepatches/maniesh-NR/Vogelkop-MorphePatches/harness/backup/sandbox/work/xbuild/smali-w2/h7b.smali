.class public final Lh7b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfji;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/String;

.field public c:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lh7b;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh7b;->b:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lh7b;->c:J

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;JB)V
    .registers 5

    .line 13
    iput-byte p4, p0, Lh7b;->a:B

    iput-object p1, p0, Lh7b;->b:Ljava/lang/String;

    iput-wide p2, p0, Lh7b;->c:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b()J
    .registers 3

    iget-byte v0, p0, Lh7b;->a:B

    packed-switch v0, :pswitch_data_c

    iget-wide v0, p0, Lh7b;->c:J

    return-wide v0

    :pswitch_8
    iget-wide v0, p0, Lh7b;->c:J

    return-wide v0

    nop

    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_8
    .end packed-switch
.end method

.method public final c()Ljava/lang/String;
    .registers 1

    iget-byte p0, p0, Lh7b;->a:B

    packed-switch p0, :pswitch_data_c

    const-string p0, "image/png"

    return-object p0

    :pswitch_8
    const-string p0, "application/pdf"

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_8
    .end packed-switch
.end method

.method public final d()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lh7b;->a:B

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Lh7b;->getFileName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-virtual {p0}, Lh7b;->getFileName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final getFileName()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lh7b;->a:B

    iget-object p0, p0, Lh7b;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_40

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Llg7;->f(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ".png"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-le v0, v1, :cond_2a

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_2a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Llg7;->f(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ".pdf"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_40
    .packed-switch 0x1
        :pswitch_1d
    .end packed-switch
.end method

.method public final i()Z
    .registers 5

    iget-byte v0, p0, Lh7b;->a:B

    packed-switch v0, :pswitch_data_1e

    iget-wide v0, p0, Lh7b;->c:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-lez p0, :cond_f

    const/4 p0, 0x1

    goto :goto_10

    :cond_f
    const/4 p0, 0x0

    :goto_10
    return p0

    :pswitch_11
    iget-wide v0, p0, Lh7b;->c:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-lez p0, :cond_1b

    const/4 p0, 0x1

    goto :goto_1c

    :cond_1b
    const/4 p0, 0x0

    :goto_1c
    return p0

    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_11
    .end packed-switch
.end method
