.class public final Lj/a;
.super LD/g;
.source "SourceFile"


# static fields
.field public static volatile p:Lj/a;


# instance fields
.field public final o:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    packed-switch p1, :pswitch_data_0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lj/a;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lj/a;-><init>(I)V

    iput-object p1, p0, Lj/a;->o:Ljava/lang/Object;

    return-void

    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj/a;->o:Ljava/lang/Object;

    new-instance p1, Lj/b;

    invoke-direct {p1}, Lj/b;-><init>()V

    const/4 v0, 0x4

    invoke-static {v0, p1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
