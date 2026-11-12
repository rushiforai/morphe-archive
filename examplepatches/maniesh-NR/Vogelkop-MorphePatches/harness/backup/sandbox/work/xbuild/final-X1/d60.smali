.class public final Ld60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ld60;

.field public static final c:Ld60;

.field public static final d:Ld60;

.field public static final e:Ld60;

.field public static final f:Ld60;

.field public static final g:Ld60;

.field public static final h:Ld60;

.field public static final i:Ld60;

.field public static final j:Ld60;

.field public static final k:Ld60;

.field public static final l:Ld60;

.field public static final m:Ld60;

.field public static final n:Ld60;

.field public static final o:Ld60;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ld60;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->b:Ld60;

    new-instance v0, Ld60;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->c:Ld60;

    new-instance v0, Ld60;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->d:Ld60;

    new-instance v0, Ld60;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->e:Ld60;

    new-instance v0, Ld60;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->f:Ld60;

    new-instance v0, Ld60;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->g:Ld60;

    new-instance v0, Ld60;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->h:Ld60;

    new-instance v0, Ld60;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->i:Ld60;

    new-instance v0, Ld60;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->j:Ld60;

    new-instance v0, Ld60;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->k:Ld60;

    new-instance v0, Ld60;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->l:Ld60;

    new-instance v0, Ld60;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->m:Ld60;

    new-instance v0, Ld60;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->n:Ld60;

    new-instance v0, Ld60;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Ld60;-><init>(I)V

    sput-object v0, Ld60;->o:Ld60;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ld60;->a:B

    return-void
.end method

.method public static final a(I)Ld60;
    .registers 1

    packed-switch p0, :pswitch_data_32

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_8
    sget-object p0, Ld60;->o:Ld60;

    return-object p0

    :pswitch_b
    sget-object p0, Ld60;->n:Ld60;

    return-object p0

    :pswitch_e
    sget-object p0, Ld60;->m:Ld60;

    return-object p0

    :pswitch_11
    sget-object p0, Ld60;->l:Ld60;

    return-object p0

    :pswitch_14
    sget-object p0, Ld60;->k:Ld60;

    return-object p0

    :pswitch_17
    sget-object p0, Ld60;->j:Ld60;

    return-object p0

    :pswitch_1a
    sget-object p0, Ld60;->i:Ld60;

    return-object p0

    :pswitch_1d
    sget-object p0, Ld60;->h:Ld60;

    return-object p0

    :pswitch_20
    sget-object p0, Ld60;->g:Ld60;

    return-object p0

    :pswitch_23
    sget-object p0, Ld60;->f:Ld60;

    return-object p0

    :pswitch_26
    sget-object p0, Ld60;->e:Ld60;

    return-object p0

    :pswitch_29
    sget-object p0, Ld60;->d:Ld60;

    return-object p0

    :pswitch_2c
    sget-object p0, Ld60;->c:Ld60;

    return-object p0

    :pswitch_2f
    sget-object p0, Ld60;->b:Ld60;

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

    iget-byte p0, p0, Ld60;->a:B

    return p0
.end method
