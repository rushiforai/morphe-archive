.class public final Ll/gqy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b7h0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/b7h0<",
        "Ll/lqy0;",
        ">;"
    }
.end annotation


# static fields
.field public static b:Ll/gqy0;


# instance fields
.field public final a:Ll/b7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b7h0<",
            "Ll/lqy0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/gqy0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gqy0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/gqy0;->b:Ll/gqy0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kqy0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/kqy0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lcom/google/common/base/Suppliers;->b(Ljava/lang/Object;)Ll/b7h0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/gqy0;->a:Ll/b7h0;

    .line 14
    .line 15
    return-void
.end method

.method public static a()Z
    .locals 1
    .annotation runtime Lorg/checkerframework/dataflow/qual/SideEffectFree;
    .end annotation

    .line 1
    sget-object v0, Ll/gqy0;->b:Ll/gqy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gqy0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/lqy0;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/lqy0;->zza()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static b()Z
    .locals 1
    .annotation runtime Lorg/checkerframework/dataflow/qual/SideEffectFree;
    .end annotation

    .line 1
    sget-object v0, Ll/gqy0;->b:Ll/gqy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gqy0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/lqy0;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/lqy0;->zzb()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static c()Z
    .locals 1
    .annotation runtime Lorg/checkerframework/dataflow/qual/SideEffectFree;
    .end annotation

    .line 1
    sget-object v0, Ll/gqy0;->b:Ll/gqy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gqy0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/lqy0;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/lqy0;->zzc()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static d()Z
    .locals 1
    .annotation runtime Lorg/checkerframework/dataflow/qual/SideEffectFree;
    .end annotation

    .line 1
    sget-object v0, Ll/gqy0;->b:Ll/gqy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gqy0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/lqy0;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/lqy0;->zzd()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static e()Z
    .locals 1
    .annotation runtime Lorg/checkerframework/dataflow/qual/SideEffectFree;
    .end annotation

    .line 1
    sget-object v0, Ll/gqy0;->b:Ll/gqy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gqy0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/lqy0;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/lqy0;->zze()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static f()Z
    .locals 1
    .annotation runtime Lorg/checkerframework/dataflow/qual/SideEffectFree;
    .end annotation

    .line 1
    sget-object v0, Ll/gqy0;->b:Ll/gqy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gqy0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/lqy0;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/lqy0;->zzf()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method


# virtual methods
.method public final synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gqy0;->a:Ll/b7h0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/b7h0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/lqy0;

    .line 8
    .line 9
    return-object p0
.end method
