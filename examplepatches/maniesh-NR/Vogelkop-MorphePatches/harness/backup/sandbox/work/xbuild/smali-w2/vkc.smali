.class public final synthetic Lvkc;
.super Lkr;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic h:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lvkc;->h:B

    invoke-direct/range {p0 .. p6}, Lkr;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lvkc;->h:B

    iget-object p0, p0, Lkr;->a:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_72

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p3, Lmt5;

    check-cast p0, Lfpc;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p1, :cond_1f

    sget-object p0, Lvd0;->d:Lvd0;

    goto :goto_26

    :cond_1f
    if-eqz p2, :cond_24

    sget-object p0, Lvd0;->b:Lvd0;

    goto :goto_26

    :cond_24
    sget-object p0, Lvd0;->c:Lvd0;

    :goto_26
    return-object p0

    :pswitch_27
    check-cast p1, Lakc;

    check-cast p2, Lzmc;

    check-cast p3, Lmt5;

    check-cast p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    sget p3, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->f:I

    iget-boolean p0, p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->e:Z

    if-eqz p0, :cond_38

    sget-object p0, Lukc;->a:Lukc;

    goto :goto_70

    :cond_38
    if-nez p2, :cond_3d

    sget-object p0, Lukc;->a:Lukc;

    goto :goto_70

    :cond_3d
    invoke-interface {p2}, Lzmc;->a()Llmc;

    move-result-object p0

    iget-boolean p0, p0, Llmc;->j:Z

    if-nez p0, :cond_48

    sget-object p0, Lukc;->a:Lukc;

    goto :goto_70

    :cond_48
    instance-of p0, p1, Lzjc;

    if-eqz p0, :cond_67

    check-cast p1, Lzjc;

    iget-object p0, p1, Lzjc;->a:Ljava/lang/String;

    invoke-static {p0}, Lkotlin/text/StringsKt;->k0(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0

    invoke-interface {p2}, Lzmc;->a()Llmc;

    move-result-object p1

    iget-wide v0, p1, Llmc;->a:J

    if-eqz p0, :cond_67

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    cmp-long p0, p0, v0

    if-nez p0, :cond_67

    sget-object p0, Lukc;->c:Lukc;

    goto :goto_70

    :cond_67
    instance-of p0, p2, Lnmc;

    if-eqz p0, :cond_6e

    sget-object p0, Lukc;->a:Lukc;

    goto :goto_70

    :cond_6e
    sget-object p0, Lukc;->b:Lukc;

    :goto_70
    return-object p0

    nop

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
