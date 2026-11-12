.class public final Ltl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ltl0;

.field public static final c:Ltl0;

.field public static final d:Ltl0;

.field public static final e:Ltl0;

.field public static final f:Ltl0;

.field public static final g:Ltl0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ltl0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ltl0;-><init>(I)V

    sput-object v0, Ltl0;->b:Ltl0;

    new-instance v0, Ltl0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ltl0;-><init>(I)V

    sput-object v0, Ltl0;->c:Ltl0;

    new-instance v0, Ltl0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ltl0;-><init>(I)V

    sput-object v0, Ltl0;->d:Ltl0;

    new-instance v0, Ltl0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ltl0;-><init>(I)V

    sput-object v0, Ltl0;->e:Ltl0;

    new-instance v0, Ltl0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ltl0;-><init>(I)V

    sput-object v0, Ltl0;->f:Ltl0;

    new-instance v0, Ltl0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ltl0;-><init>(I)V

    sput-object v0, Ltl0;->g:Ltl0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ltl0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Ltl0;->a:B

    return p0
.end method
