.class public final Lx70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lx70;

.field public static final c:Lx70;

.field public static final d:Lx70;

.field public static final e:Lx70;

.field public static final f:Lx70;

.field public static final g:Lx70;

.field public static final h:Lx70;

.field public static final i:Lx70;

.field public static final j:Lx70;

.field public static final k:Lx70;

.field public static final l:Lx70;

.field public static final m:Lx70;

.field public static final n:Lx70;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lx70;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->b:Lx70;

    new-instance v0, Lx70;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->c:Lx70;

    new-instance v0, Lx70;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->d:Lx70;

    new-instance v0, Lx70;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->e:Lx70;

    new-instance v0, Lx70;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->f:Lx70;

    new-instance v0, Lx70;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->g:Lx70;

    new-instance v0, Lx70;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->h:Lx70;

    new-instance v0, Lx70;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->i:Lx70;

    new-instance v0, Lx70;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->j:Lx70;

    new-instance v0, Lx70;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->k:Lx70;

    new-instance v0, Lx70;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->l:Lx70;

    new-instance v0, Lx70;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->m:Lx70;

    new-instance v0, Lx70;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lx70;-><init>(I)V

    sput-object v0, Lx70;->n:Lx70;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lx70;->a:B

    return-void
.end method

.method public static final a(I)Lx70;
    .registers 1

    packed-switch p0, :pswitch_data_30

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_8
    sget-object p0, Lx70;->n:Lx70;

    return-object p0

    :pswitch_b
    sget-object p0, Lx70;->m:Lx70;

    return-object p0

    :pswitch_e
    sget-object p0, Lx70;->l:Lx70;

    return-object p0

    :pswitch_11
    sget-object p0, Lx70;->k:Lx70;

    return-object p0

    :pswitch_14
    sget-object p0, Lx70;->j:Lx70;

    return-object p0

    :pswitch_17
    sget-object p0, Lx70;->i:Lx70;

    return-object p0

    :pswitch_1a
    sget-object p0, Lx70;->h:Lx70;

    return-object p0

    :pswitch_1d
    sget-object p0, Lx70;->g:Lx70;

    return-object p0

    :pswitch_20
    sget-object p0, Lx70;->f:Lx70;

    return-object p0

    :pswitch_23
    sget-object p0, Lx70;->e:Lx70;

    return-object p0

    :pswitch_26
    sget-object p0, Lx70;->d:Lx70;

    return-object p0

    :pswitch_29
    sget-object p0, Lx70;->c:Lx70;

    return-object p0

    :pswitch_2c
    sget-object p0, Lx70;->b:Lx70;

    return-object p0

    nop

    :pswitch_data_30
    .packed-switch 0x0
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

    iget-byte p0, p0, Lx70;->a:B

    return p0
.end method
