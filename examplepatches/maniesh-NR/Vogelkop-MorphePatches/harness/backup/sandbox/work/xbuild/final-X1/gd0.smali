.class public final Lgd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lgd0;

.field public static final c:Lgd0;

.field public static final d:Lgd0;

.field public static final e:Lgd0;

.field public static final f:Lgd0;

.field public static final g:Lgd0;

.field public static final h:Lgd0;

.field public static final i:Lgd0;

.field public static final j:Lgd0;

.field public static final k:Lgd0;

.field public static final l:Lgd0;

.field public static final m:Lgd0;

.field public static final n:Lgd0;

.field public static final o:Lgd0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lgd0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->b:Lgd0;

    new-instance v0, Lgd0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->c:Lgd0;

    new-instance v0, Lgd0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->d:Lgd0;

    new-instance v0, Lgd0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->e:Lgd0;

    new-instance v0, Lgd0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->f:Lgd0;

    new-instance v0, Lgd0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->g:Lgd0;

    new-instance v0, Lgd0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->h:Lgd0;

    new-instance v0, Lgd0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->i:Lgd0;

    new-instance v0, Lgd0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->j:Lgd0;

    new-instance v0, Lgd0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->k:Lgd0;

    new-instance v0, Lgd0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->l:Lgd0;

    new-instance v0, Lgd0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->m:Lgd0;

    new-instance v0, Lgd0;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->n:Lgd0;

    new-instance v0, Lgd0;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Lgd0;-><init>(I)V

    sput-object v0, Lgd0;->o:Lgd0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lgd0;->a:B

    return-void
.end method

.method public static final a(I)Lgd0;
    .registers 1

    packed-switch p0, :pswitch_data_32

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_8
    sget-object p0, Lgd0;->o:Lgd0;

    return-object p0

    :pswitch_b
    sget-object p0, Lgd0;->n:Lgd0;

    return-object p0

    :pswitch_e
    sget-object p0, Lgd0;->m:Lgd0;

    return-object p0

    :pswitch_11
    sget-object p0, Lgd0;->l:Lgd0;

    return-object p0

    :pswitch_14
    sget-object p0, Lgd0;->k:Lgd0;

    return-object p0

    :pswitch_17
    sget-object p0, Lgd0;->j:Lgd0;

    return-object p0

    :pswitch_1a
    sget-object p0, Lgd0;->i:Lgd0;

    return-object p0

    :pswitch_1d
    sget-object p0, Lgd0;->h:Lgd0;

    return-object p0

    :pswitch_20
    sget-object p0, Lgd0;->g:Lgd0;

    return-object p0

    :pswitch_23
    sget-object p0, Lgd0;->f:Lgd0;

    return-object p0

    :pswitch_26
    sget-object p0, Lgd0;->e:Lgd0;

    return-object p0

    :pswitch_29
    sget-object p0, Lgd0;->d:Lgd0;

    return-object p0

    :pswitch_2c
    sget-object p0, Lgd0;->c:Lgd0;

    return-object p0

    :pswitch_2f
    sget-object p0, Lgd0;->b:Lgd0;

    return-object p0

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_2c
        :pswitch_29
        :pswitch_26
        :pswitch_23
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

    iget-byte p0, p0, Lgd0;->a:B

    return p0
.end method
