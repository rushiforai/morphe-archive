.class public final synthetic Ll/r570;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v670;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/v670;Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r570;->a:Ll/v670;

    iput-object p2, p0, Ll/r570;->b:Ljava/util/List;

    iput-boolean p3, p0, Ll/r570;->c:Z

    iput-object p4, p0, Ll/r570;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r570;->a:Ll/v670;

    iget-object v1, p0, Ll/r570;->b:Ljava/util/List;

    iget-boolean v2, p0, Ll/r570;->c:Z

    iget-object p0, p0, Ll/r570;->d:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, v2, p0, p1}, Ll/v670;->n0(Ll/v670;Ljava/util/List;ZLcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    return-void
.end method
