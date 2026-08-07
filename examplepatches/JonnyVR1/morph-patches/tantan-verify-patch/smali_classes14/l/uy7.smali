.class public final synthetic Ll/uy7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:D

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;DI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uy7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/uy7;->b:Ljava/lang/String;

    iput-wide p3, p0, Ll/uy7;->c:D

    iput p5, p0, Ll/uy7;->d:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/uy7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/uy7;->b:Ljava/lang/String;

    iget-wide v2, p0, Ll/uy7;->c:D

    iget p0, p0, Ll/uy7;->d:I

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/g;->Q3(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;DI)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
