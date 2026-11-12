.class public final Lgr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lgr0;

.field public static final c:Lgr0;

.field public static final d:Lgr0;

.field public static final e:Lgr0;

.field public static final f:Lgr0;

.field public static final g:Lgr0;

.field public static final h:Lgr0;

.field public static final i:Lgr0;

.field public static final j:Lgr0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lgr0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lgr0;-><init>(I)V

    sput-object v0, Lgr0;->b:Lgr0;

    new-instance v0, Lgr0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lgr0;-><init>(I)V

    sput-object v0, Lgr0;->c:Lgr0;

    new-instance v0, Lgr0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lgr0;-><init>(I)V

    sput-object v0, Lgr0;->d:Lgr0;

    new-instance v0, Lgr0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lgr0;-><init>(I)V

    sput-object v0, Lgr0;->e:Lgr0;

    new-instance v0, Lgr0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lgr0;-><init>(I)V

    sput-object v0, Lgr0;->f:Lgr0;

    new-instance v0, Lgr0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lgr0;-><init>(I)V

    sput-object v0, Lgr0;->g:Lgr0;

    new-instance v0, Lgr0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lgr0;-><init>(I)V

    sput-object v0, Lgr0;->h:Lgr0;

    new-instance v0, Lgr0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lgr0;-><init>(I)V

    sput-object v0, Lgr0;->i:Lgr0;

    new-instance v0, Lgr0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lgr0;-><init>(I)V

    sput-object v0, Lgr0;->j:Lgr0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lgr0;->a:B

    return-void
.end method

.method public static final a(I)Lgr0;
    .registers 1

    packed-switch p0, :pswitch_data_24

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_8
    sget-object p0, Lgr0;->j:Lgr0;

    return-object p0

    :pswitch_b
    sget-object p0, Lgr0;->i:Lgr0;

    return-object p0

    :pswitch_e
    sget-object p0, Lgr0;->h:Lgr0;

    return-object p0

    :pswitch_11
    sget-object p0, Lgr0;->g:Lgr0;

    return-object p0

    :pswitch_14
    sget-object p0, Lgr0;->f:Lgr0;

    return-object p0

    :pswitch_17
    sget-object p0, Lgr0;->e:Lgr0;

    return-object p0

    :pswitch_1a
    sget-object p0, Lgr0;->d:Lgr0;

    return-object p0

    :pswitch_1d
    sget-object p0, Lgr0;->c:Lgr0;

    return-object p0

    :pswitch_20
    sget-object p0, Lgr0;->b:Lgr0;

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lgr0;->a:B

    return p0
.end method
