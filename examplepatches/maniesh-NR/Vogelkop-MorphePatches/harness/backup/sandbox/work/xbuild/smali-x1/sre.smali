.class public final Lsre;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;B)V
    .registers 4

    packed-switch p3, :pswitch_data_14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsre;->a:Ljava/lang/String;

    iput-object p2, p0, Lsre;->b:Ljava/lang/String;

    return-void

    :pswitch_b
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsre;->b:Ljava/lang/String;

    iput-object p2, p0, Lsre;->a:Ljava/lang/String;

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_b
    .end packed-switch
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lsre;->b:Ljava/lang/String;

    if-nez v0, :cond_c

    iget-object v0, p0, Lsre;->a:Ljava/lang/String;

    invoke-static {v0}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lsre;->b:Ljava/lang/String;

    :cond_c
    return-object v0
.end method
