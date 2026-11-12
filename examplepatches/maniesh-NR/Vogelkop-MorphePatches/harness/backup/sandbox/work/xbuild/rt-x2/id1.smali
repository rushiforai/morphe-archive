.class public final Lid1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvq5;


# instance fields
.field public final a:Lvk;

.field public final b:Lkd1;

.field public final c:Ldd1;

.field public final d:Led1;

.field public final e:Ldd1;

.field public final f:Led1;

.field public final g:Led1;

.field public final h:Led1;

.field public final i:Led1;

.field public j:Z


# direct methods
.method public constructor <init>()V
    .registers 11

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    .line 25
    invoke-direct/range {v0 .. v9}, Lid1;-><init>(Lvk;Lkd1;Ldd1;Led1;Ldd1;Led1;Led1;Led1;Led1;)V

    return-void
.end method

.method public constructor <init>(Lvk;Lkd1;Ldd1;Led1;Ldd1;Led1;Led1;Led1;Led1;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lid1;->j:Z

    iput-object p1, p0, Lid1;->a:Lvk;

    iput-object p2, p0, Lid1;->b:Lkd1;

    iput-object p3, p0, Lid1;->c:Ldd1;

    iput-object p4, p0, Lid1;->d:Led1;

    iput-object p5, p0, Lid1;->e:Ldd1;

    iput-object p6, p0, Lid1;->h:Led1;

    iput-object p7, p0, Lid1;->i:Led1;

    iput-object p8, p0, Lid1;->f:Led1;

    iput-object p9, p0, Lid1;->g:Led1;

    return-void
.end method


# virtual methods
.method public final a(Lf3d;Lp2d;Lc73;)Lwp5;
    .registers 4

    const/4 p0, 0x0

    return-object p0
.end method
