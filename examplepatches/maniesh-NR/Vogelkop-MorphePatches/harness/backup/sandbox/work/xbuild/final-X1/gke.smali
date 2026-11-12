.class public final Lgke;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/browser/NavigationEntry;


# instance fields
.field public final synthetic a:B

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Z

.field public final g:[B

.field public final h:[B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[BB)V
    .registers 9

    iput-byte p8, p0, Lgke;->a:B

    iput p1, p0, Lgke;->b:I

    iput-object p2, p0, Lgke;->c:Ljava/lang/String;

    iput-object p3, p0, Lgke;->d:Ljava/lang/String;

    iput-object p4, p0, Lgke;->e:Ljava/lang/String;

    iput-boolean p5, p0, Lgke;->f:Z

    iput-object p6, p0, Lgke;->g:[B

    iput-object p7, p0, Lgke;->h:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-byte v0, p0, Lgke;->a:B

    packed-switch v0, :pswitch_data_c

    iget-boolean p0, p0, Lgke;->f:Z

    return p0

    :pswitch_8
    iget-boolean p0, p0, Lgke;->f:Z

    return p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final b()Z
    .registers 1

    iget-byte p0, p0, Lgke;->a:B

    const/4 p0, 0x1

    return p0
.end method

.method public final c()[B
    .registers 2

    iget-byte v0, p0, Lgke;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lgke;->g:[B

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lgke;->g:[B

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final d()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lgke;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lgke;->d:Ljava/lang/String;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lgke;->d:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final e()[B
    .registers 2

    iget-byte v0, p0, Lgke;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lgke;->h:[B

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lgke;->h:[B

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final getId()I
    .registers 2

    iget-byte v0, p0, Lgke;->a:B

    packed-switch v0, :pswitch_data_c

    iget p0, p0, Lgke;->b:I

    return p0

    :pswitch_8
    iget p0, p0, Lgke;->b:I

    return p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lgke;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lgke;->e:Ljava/lang/String;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lgke;->e:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lgke;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lgke;->c:Ljava/lang/String;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lgke;->c:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
