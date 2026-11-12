.class public final synthetic Ld0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltah;

.field public final synthetic c:Lzz9;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ltah;Lzz9;Ljava/lang/String;Ljava/io/File;B)V
    .registers 6

    iput-byte p5, p0, Ld0a;->a:B

    iput-object p1, p0, Ld0a;->b:Ltah;

    iput-object p2, p0, Ld0a;->c:Lzz9;

    iput-object p3, p0, Ld0a;->d:Ljava/lang/String;

    iput-object p4, p0, Ld0a;->e:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Ld0a;->a:B

    const-string v1, "image/webp"

    const/4 v2, 0x0

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    iget-object v6, p0, Ld0a;->e:Ljava/io/File;

    iget-object v7, p0, Ld0a;->d:Ljava/lang/String;

    iget-object v8, p0, Ld0a;->c:Lzz9;

    iget-object p0, p0, Ld0a;->b:Ltah;

    check-cast p1, Lt12;

    packed-switch v0, :pswitch_data_60

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_2d

    if-eq v0, v5, :cond_25

    if-eq v0, v4, :cond_25

    if-eq v0, v3, :cond_25

    invoke-static {}, Lh9o;->p()V

    goto :goto_39

    :cond_25
    iget-object p0, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Lf0a;

    invoke-virtual {p0, p1}, Lf0a;->a(Lt12;)V

    goto :goto_37

    :cond_2d
    new-instance p1, La0a;

    sget-object v0, Lo29;->k:Lo29;

    invoke-direct {p1, v7, v6, v0, v1}, La0a;-><init>(Ljava/lang/String;Ljava/io/File;Lo29;Ljava/lang/String;)V

    invoke-virtual {p0, v8, p1}, Ltah;->I(Lb0a;La0a;)V

    :goto_37
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_39
    return-object v2

    :pswitch_3a
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_52

    if-eq v0, v5, :cond_4a

    if-eq v0, v4, :cond_4a

    if-eq v0, v3, :cond_4a

    invoke-static {}, Lh9o;->p()V

    goto :goto_5e

    :cond_4a
    iget-object p0, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Lf0a;

    invoke-virtual {p0, p1}, Lf0a;->a(Lt12;)V

    goto :goto_5c

    :cond_52
    new-instance p1, La0a;

    sget-object v0, Lo29;->k:Lo29;

    invoke-direct {p1, v7, v6, v0, v1}, La0a;-><init>(Ljava/lang/String;Ljava/io/File;Lo29;Ljava/lang/String;)V

    invoke-virtual {p0, v8, p1}, Ltah;->I(Lb0a;La0a;)V

    :goto_5c
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_5e
    return-object v2

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
