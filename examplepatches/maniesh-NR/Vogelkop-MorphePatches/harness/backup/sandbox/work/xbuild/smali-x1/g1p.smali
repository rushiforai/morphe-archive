.class public abstract Lg1p;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:I = 0x2

.field public static b:I = 0x1

.field public static c:Ljava/lang/String;

.field public static d:Ljava/lang/String;

.field public static e:Ljava/lang/String;

.field public static f:Ljava/lang/String;

.field public static g:Ljava/lang/String;

.field public static h:Ljava/lang/String;

.field public static i:Z

.field public static j:Z

.field public static final k:Ljava/util/EnumSet;

.field public static l:Ljava/lang/String;

.field public static m:Ljava/lang/String;

.field public static final n:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0x13

    new-array v0, v0, [Lw06;

    sget-object v1, Lw06;->c:Lw06;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lw06;->d:Ll06;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lw06;->e:Lm06;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lw06;->f:Lw06;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lw06;->g:Ln06;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lw06;->h:Lw06;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lw06;->i:Lw06;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lw06;->j:Lw06;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lw06;->k:Lw06;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lw06;->m:Lp06;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lw06;->n:Lq06;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lw06;->l:Lo06;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lw06;->q:Lw06;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lw06;->p:Lw06;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lw06;->o:Lw06;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lw06;->r:Lr06;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lw06;->s:Ls06;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lw06;->t:Lt06;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lw06;->u:Lw06;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lw06;->b:Lw06;

    invoke-static {v1, v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;[Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/EnumSet;->copyOf(Ljava/util/EnumSet;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lg1p;->k:Ljava/util/EnumSet;

    const-string v0, "https://s-odx.oleads.com/"

    sput-object v0, Lg1p;->l:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-static {}, Lc0p;->values()[Lc0p;

    move-result-object v1

    array-length v1, v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lg1p;->n:Ljava/util/HashMap;

    return-void
.end method
