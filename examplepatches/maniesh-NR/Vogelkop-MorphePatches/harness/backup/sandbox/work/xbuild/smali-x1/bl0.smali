.class public final Lbl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lbl0;

.field public static final c:Lbl0;

.field public static final d:Lbl0;

.field public static final e:Lbl0;

.field public static final f:Lbl0;

.field public static final g:Lbl0;

.field public static final h:Lbl0;

.field public static final i:Lbl0;

.field public static final j:Lbl0;

.field public static final k:Lbl0;

.field public static final l:Lbl0;

.field public static final m:Lbl0;

.field public static final n:Lbl0;

.field public static final o:Lbl0;

.field public static final p:Lbl0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lbl0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->b:Lbl0;

    new-instance v0, Lbl0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->c:Lbl0;

    new-instance v0, Lbl0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->d:Lbl0;

    new-instance v0, Lbl0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->e:Lbl0;

    new-instance v0, Lbl0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->f:Lbl0;

    new-instance v0, Lbl0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->g:Lbl0;

    new-instance v0, Lbl0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->h:Lbl0;

    new-instance v0, Lbl0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->i:Lbl0;

    new-instance v0, Lbl0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->j:Lbl0;

    new-instance v0, Lbl0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->k:Lbl0;

    new-instance v0, Lbl0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->l:Lbl0;

    new-instance v0, Lbl0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->m:Lbl0;

    new-instance v0, Lbl0;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->n:Lbl0;

    new-instance v0, Lbl0;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->o:Lbl0;

    new-instance v0, Lbl0;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lbl0;-><init>(I)V

    sput-object v0, Lbl0;->p:Lbl0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lbl0;->a:B

    return-void
.end method

.method public static final a(I)Lbl0;
    .registers 1

    packed-switch p0, :pswitch_data_36

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_8
    sget-object p0, Lbl0;->p:Lbl0;

    return-object p0

    :pswitch_b
    sget-object p0, Lbl0;->o:Lbl0;

    return-object p0

    :pswitch_e
    sget-object p0, Lbl0;->n:Lbl0;

    return-object p0

    :pswitch_11
    sget-object p0, Lbl0;->m:Lbl0;

    return-object p0

    :pswitch_14
    sget-object p0, Lbl0;->l:Lbl0;

    return-object p0

    :pswitch_17
    sget-object p0, Lbl0;->k:Lbl0;

    return-object p0

    :pswitch_1a
    sget-object p0, Lbl0;->j:Lbl0;

    return-object p0

    :pswitch_1d
    sget-object p0, Lbl0;->i:Lbl0;

    return-object p0

    :pswitch_20
    sget-object p0, Lbl0;->h:Lbl0;

    return-object p0

    :pswitch_23
    sget-object p0, Lbl0;->g:Lbl0;

    return-object p0

    :pswitch_26
    sget-object p0, Lbl0;->f:Lbl0;

    return-object p0

    :pswitch_29
    sget-object p0, Lbl0;->e:Lbl0;

    return-object p0

    :pswitch_2c
    sget-object p0, Lbl0;->d:Lbl0;

    return-object p0

    :pswitch_2f
    sget-object p0, Lbl0;->c:Lbl0;

    return-object p0

    :pswitch_32
    sget-object p0, Lbl0;->b:Lbl0;

    return-object p0

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_32
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

    iget-byte p0, p0, Lbl0;->a:B

    return p0
.end method
