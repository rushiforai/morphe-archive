.class public final Ljpc;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lfpc;


# instance fields
.field public final a:Lxnc;

.field public final b:Ljze;

.field public final c:Lrlh;

.field public final d:Lxoc;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lfpc;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ljpc;->e:Lfpc;

    return-void
.end method

.method public constructor <init>(Lxnc;Ljze;Lrlh;Lxoc;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljpc;->a:Lxnc;

    iput-object p2, p0, Ljpc;->b:Ljze;

    iput-object p3, p0, Ljpc;->c:Lrlh;

    iput-object p4, p0, Ljpc;->d:Lxoc;

    return-void
.end method
