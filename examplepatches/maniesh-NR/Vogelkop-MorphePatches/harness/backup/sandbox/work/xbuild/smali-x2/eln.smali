.class public final Leln;
.super Lhln;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Lg7j;

.field public final e:Lm9f;

.field public final f:Lm9f;

.field public final synthetic g:B


# direct methods
.method public constructor <init>(Lorb;Ljava/lang/String;ILg7j;Lm9f;Lm9f;B)V
    .registers 8

    iput-byte p7, p0, Leln;->g:B

    invoke-direct {p0, p1}, Lhln;-><init>(Lorb;)V

    iput-object p2, p0, Leln;->b:Ljava/lang/String;

    iput p3, p0, Leln;->c:I

    iput-object p4, p0, Leln;->d:Lg7j;

    iput-object p5, p0, Leln;->e:Lm9f;

    iput-object p6, p0, Leln;->f:Lm9f;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Leln;->f:Lm9f;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Lg7j;
    .registers 1

    iget-object p0, p0, Leln;->d:Lg7j;

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lo2c;)Lxkn;
    .registers 3

    invoke-virtual {p0, p1, p2}, Lhln;->j(Landroid/content/Context;Lo2c;)Z

    move-result p1

    if-eqz p1, :cond_9

    iget-object p1, p0, Leln;->f:Lm9f;

    goto :goto_b

    :cond_9
    iget-object p1, p0, Leln;->e:Lm9f;

    :goto_b
    iget p2, p1, Lm9f;->a:I

    iget p1, p1, Lm9f;->b:I

    invoke-static {p0, p2, p1}, Lxkn;->a(Laln;II)Lxkn;

    move-result-object p0

    return-object p0
.end method

.method public final f()I
    .registers 1

    iget p0, p0, Leln;->c:I

    return p0
.end method

.method public final g(Landroid/content/Context;Lo2c;)Lh06;
    .registers 3

    invoke-virtual {p0, p1, p2}, Lhln;->j(Landroid/content/Context;Lo2c;)Z

    move-result p1

    if-eqz p1, :cond_d

    iget-object p0, p0, Leln;->f:Lm9f;

    :goto_8
    iget-object p0, p0, Lm9f;->c:Ljava/lang/Object;

    check-cast p0, Lh06;

    return-object p0

    :cond_d
    iget-object p0, p0, Leln;->e:Lm9f;

    goto :goto_8
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Leln;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final getType()I
    .registers 1

    iget-byte p0, p0, Leln;->g:B

    packed-switch p0, :pswitch_data_a

    const/4 p0, 0x0

    return p0

    :pswitch_7
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method
