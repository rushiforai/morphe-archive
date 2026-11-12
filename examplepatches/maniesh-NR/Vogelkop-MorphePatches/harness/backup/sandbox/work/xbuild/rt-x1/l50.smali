.class public final Ll50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ll50;

.field public static final c:Ll50;

.field public static final d:Ll50;

.field public static final e:Ll50;

.field public static final f:Ll50;

.field public static final g:Ll50;

.field public static final h:Ll50;

.field public static final i:Ll50;

.field public static final j:Ll50;

.field public static final k:Ll50;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ll50;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->b:Ll50;

    new-instance v0, Ll50;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->c:Ll50;

    new-instance v0, Ll50;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->d:Ll50;

    new-instance v0, Ll50;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->e:Ll50;

    new-instance v0, Ll50;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->f:Ll50;

    new-instance v0, Ll50;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->g:Ll50;

    new-instance v0, Ll50;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->h:Ll50;

    new-instance v0, Ll50;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->i:Ll50;

    new-instance v0, Ll50;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->j:Ll50;

    new-instance v0, Ll50;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Ll50;-><init>(I)V

    sput-object v0, Ll50;->k:Ll50;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ll50;->a:B

    return-void
.end method

.method public static final a(I)Ll50;
    .registers 1

    packed-switch p0, :pswitch_data_26

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_8
    sget-object p0, Ll50;->k:Ll50;

    return-object p0

    :pswitch_b
    sget-object p0, Ll50;->j:Ll50;

    return-object p0

    :pswitch_e
    sget-object p0, Ll50;->i:Ll50;

    return-object p0

    :pswitch_11
    sget-object p0, Ll50;->h:Ll50;

    return-object p0

    :pswitch_14
    sget-object p0, Ll50;->g:Ll50;

    return-object p0

    :pswitch_17
    sget-object p0, Ll50;->f:Ll50;

    return-object p0

    :pswitch_1a
    sget-object p0, Ll50;->e:Ll50;

    return-object p0

    :pswitch_1d
    sget-object p0, Ll50;->d:Ll50;

    return-object p0

    :pswitch_20
    sget-object p0, Ll50;->c:Ll50;

    return-object p0

    :pswitch_23
    sget-object p0, Ll50;->b:Ll50;

    return-object p0

    :pswitch_data_26
    .packed-switch 0x0
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

    iget-byte p0, p0, Ll50;->a:B

    return p0
.end method
