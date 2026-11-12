.class public final Lgz2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic h:[Lxtb;


# instance fields
.field public final a:I

.field public b:Ljava/util/Set;

.field public final c:Lfz2;

.field public final synthetic d:Lxm6;

.field public final synthetic e:Lr2;

.field public final synthetic f:Lq2;

.field public final synthetic g:Lkotlin/jvm/functions/Function0;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Lgz2;

    const-string v2, "isEnabled"

    const-string v3, "isEnabled()Z"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lgz2;->h:[Lxtb;

    return-void
.end method

.method public constructor <init>(ZILxm6;Lr2;Lq2;Lkotlin/jvm/functions/Function0;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lgz2;->d:Lxm6;

    iput-object p4, p0, Lgz2;->e:Lr2;

    iput-object p5, p0, Lgz2;->f:Lq2;

    iput-object p6, p0, Lgz2;->g:Lkotlin/jvm/functions/Function0;

    iput p2, p0, Lgz2;->a:I

    sget-object p2, Lv08;->a:Lv08;

    iput-object p2, p0, Lgz2;->b:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    new-instance p2, Lfz2;

    const/4 p3, 0x0

    invoke-direct {p2, p1, p0, p3}, Lfz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lgz2;->c:Lfz2;

    return-void
.end method
