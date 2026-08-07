.class public final Ll/ovs0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/nds0;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public static final c:Ll/nds0;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field public final a:Ll/bvs0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/mvs0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mvs0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ovs0;->b:Ll/nds0;

    .line 7
    .line 8
    new-instance v0, Ll/nvs0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/nvs0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/ovs0;->c:Ll/nds0;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Ll/hew0;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bvs0;

    .line 5
    .line 6
    sget-object v4, Ll/ovs0;->b:Ll/nds0;

    .line 7
    .line 8
    sget-object v5, Ll/ovs0;->c:Ll/nds0;

    .line 9
    .line 10
    move-object v1, p1

    .line 11
    move-object v2, p2

    .line 12
    move-object v3, p3

    .line 13
    move-object v6, p4

    .line 14
    invoke-direct/range {v0 .. v6}, Ll/bvs0;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Ll/nds0;Ll/nds0;Ll/hew0;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/ovs0;->a:Ll/bvs0;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ll/hvs0;Ll/gvs0;)Ll/evs0;
    .locals 1

    .line 1
    new-instance v0, Ll/aws0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ovs0;->a:Ll/bvs0;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1, p2, p3}, Ll/aws0;-><init>(Ll/bvs0;Ljava/lang/String;Ll/hvs0;Ll/gvs0;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final b()Ll/fws0;
    .locals 1

    .line 1
    new-instance v0, Ll/fws0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ovs0;->a:Ll/bvs0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/fws0;-><init>(Ll/bvs0;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
