.class public final Lyn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lyn0;

.field public static final c:Lyn0;

.field public static final d:Lyn0;

.field public static final e:Lyn0;

.field public static final f:Lyn0;

.field public static final g:Lyn0;

.field public static final h:Lyn0;

.field public static final i:Lyn0;

.field public static final j:Lyn0;

.field public static final k:Lyn0;

.field public static final l:Lyn0;

.field public static final m:Lyn0;

.field public static final n:Lyn0;

.field public static final o:Lyn0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lyn0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->b:Lyn0;

    new-instance v0, Lyn0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->c:Lyn0;

    new-instance v0, Lyn0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->d:Lyn0;

    new-instance v0, Lyn0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->e:Lyn0;

    new-instance v0, Lyn0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->f:Lyn0;

    new-instance v0, Lyn0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->g:Lyn0;

    new-instance v0, Lyn0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->h:Lyn0;

    new-instance v0, Lyn0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->i:Lyn0;

    new-instance v0, Lyn0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->j:Lyn0;

    new-instance v0, Lyn0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->k:Lyn0;

    new-instance v0, Lyn0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->l:Lyn0;

    new-instance v0, Lyn0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->m:Lyn0;

    new-instance v0, Lyn0;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->n:Lyn0;

    new-instance v0, Lyn0;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Lyn0;-><init>(I)V

    sput-object v0, Lyn0;->o:Lyn0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lyn0;->a:B

    return-void
.end method

.method public static final a(I)Lyn0;
    .registers 1

    packed-switch p0, :pswitch_data_32

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_8
    sget-object p0, Lyn0;->o:Lyn0;

    return-object p0

    :pswitch_b
    sget-object p0, Lyn0;->n:Lyn0;

    return-object p0

    :pswitch_e
    sget-object p0, Lyn0;->m:Lyn0;

    return-object p0

    :pswitch_11
    sget-object p0, Lyn0;->l:Lyn0;

    return-object p0

    :pswitch_14
    sget-object p0, Lyn0;->k:Lyn0;

    return-object p0

    :pswitch_17
    sget-object p0, Lyn0;->j:Lyn0;

    return-object p0

    :pswitch_1a
    sget-object p0, Lyn0;->i:Lyn0;

    return-object p0

    :pswitch_1d
    sget-object p0, Lyn0;->h:Lyn0;

    return-object p0

    :pswitch_20
    sget-object p0, Lyn0;->g:Lyn0;

    return-object p0

    :pswitch_23
    sget-object p0, Lyn0;->f:Lyn0;

    return-object p0

    :pswitch_26
    sget-object p0, Lyn0;->e:Lyn0;

    return-object p0

    :pswitch_29
    sget-object p0, Lyn0;->d:Lyn0;

    return-object p0

    :pswitch_2c
    sget-object p0, Lyn0;->c:Lyn0;

    return-object p0

    :pswitch_2f
    sget-object p0, Lyn0;->b:Lyn0;

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

    iget-byte p0, p0, Lyn0;->a:B

    return p0
.end method
