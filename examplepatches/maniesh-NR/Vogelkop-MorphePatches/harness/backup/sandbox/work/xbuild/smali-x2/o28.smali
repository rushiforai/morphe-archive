.class public final Lo28;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp3a;


# instance fields
.field public final a:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    packed-switch p1, :pswitch_data_24

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lo28;->a:Ljava/util/ArrayList;

    return-void

    :pswitch_e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lo28;->a:Ljava/util/ArrayList;

    return-void

    :pswitch_19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lo28;->a:Ljava/util/ArrayList;

    return-void

    :pswitch_data_24
    .packed-switch 0x3
        :pswitch_19
        :pswitch_e
    .end packed-switch
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 2

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo28;->a:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Lyq8;)V
    .registers 3

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lo28;->a:Ljava/util/ArrayList;

    .line 38
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final d()I
    .registers 1

    iget-object p0, p0, Lo28;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final e(I)J
    .registers 2

    iget-object p0, p0, Lo28;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwi5;

    iget-wide p0, p0, Lwi5;->d:J

    return-wide p0
.end method

.method public final f(I)Lta6;
    .registers 2

    iget-object p0, p0, Lo28;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lta6;

    return-object p0
.end method
