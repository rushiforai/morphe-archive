.class public final Lv50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lv50;

.field public static final c:Lv50;

.field public static final d:Lv50;

.field public static final e:Lv50;

.field public static final f:Lv50;

.field public static final g:Lv50;

.field public static final h:Lv50;

.field public static final i:Lv50;

.field public static final j:Lv50;

.field public static final k:Lv50;

.field public static final l:Lv50;

.field public static final m:Lv50;

.field public static final n:Lv50;

.field public static final o:Lv50;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lv50;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->b:Lv50;

    new-instance v0, Lv50;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->c:Lv50;

    new-instance v0, Lv50;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->d:Lv50;

    new-instance v0, Lv50;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->e:Lv50;

    new-instance v0, Lv50;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->f:Lv50;

    new-instance v0, Lv50;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->g:Lv50;

    new-instance v0, Lv50;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->h:Lv50;

    new-instance v0, Lv50;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->i:Lv50;

    new-instance v0, Lv50;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->j:Lv50;

    new-instance v0, Lv50;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->k:Lv50;

    new-instance v0, Lv50;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->l:Lv50;

    new-instance v0, Lv50;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->m:Lv50;

    new-instance v0, Lv50;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->n:Lv50;

    new-instance v0, Lv50;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Lv50;-><init>(I)V

    sput-object v0, Lv50;->o:Lv50;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lv50;->a:B

    return-void
.end method

.method public static final a(I)Lv50;
    .registers 1

    packed-switch p0, :pswitch_data_32

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_8
    sget-object p0, Lv50;->o:Lv50;

    return-object p0

    :pswitch_b
    sget-object p0, Lv50;->n:Lv50;

    return-object p0

    :pswitch_e
    sget-object p0, Lv50;->m:Lv50;

    return-object p0

    :pswitch_11
    sget-object p0, Lv50;->l:Lv50;

    return-object p0

    :pswitch_14
    sget-object p0, Lv50;->k:Lv50;

    return-object p0

    :pswitch_17
    sget-object p0, Lv50;->j:Lv50;

    return-object p0

    :pswitch_1a
    sget-object p0, Lv50;->i:Lv50;

    return-object p0

    :pswitch_1d
    sget-object p0, Lv50;->h:Lv50;

    return-object p0

    :pswitch_20
    sget-object p0, Lv50;->g:Lv50;

    return-object p0

    :pswitch_23
    sget-object p0, Lv50;->f:Lv50;

    return-object p0

    :pswitch_26
    sget-object p0, Lv50;->e:Lv50;

    return-object p0

    :pswitch_29
    sget-object p0, Lv50;->d:Lv50;

    return-object p0

    :pswitch_2c
    sget-object p0, Lv50;->c:Lv50;

    return-object p0

    :pswitch_2f
    sget-object p0, Lv50;->b:Lv50;

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

    iget-byte p0, p0, Lv50;->a:B

    return p0
.end method
