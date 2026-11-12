.class public final Lzol;
.super Ltx7;
.source "SourceFile"


# instance fields
.field public final e:Lxol;

.field public f:Z


# direct methods
.method public constructor <init>(Lxol;)V
    .registers 2

    invoke-direct {p0}, Ltx7;-><init>()V

    iput-object p1, p0, Lzol;->e:Lxol;

    return-void
.end method


# virtual methods
.method public final f(I)I
    .registers 3

    iget-boolean v0, p0, Lzol;->f:Z

    if-nez v0, :cond_1a

    iget-object p0, p0, Lzol;->e:Lxol;

    invoke-virtual {p0, p1}, Lygc;->G(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwol;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_1c

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0

    :pswitch_18
    const/4 p0, 0x1

    return p0

    :cond_1a
    :pswitch_1a
    const/4 p0, 0x2

    return p0

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
    .end packed-switch
.end method
