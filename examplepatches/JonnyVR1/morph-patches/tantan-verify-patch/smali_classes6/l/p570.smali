.class public final synthetic Ll/p570;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v670;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:I

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/v670;Ljava/util/List;IZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p570;->a:Ll/v670;

    iput-object p2, p0, Ll/p570;->b:Ljava/util/List;

    iput p3, p0, Ll/p570;->c:I

    iput-boolean p4, p0, Ll/p570;->d:Z

    iput-object p5, p0, Ll/p570;->e:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/p570;->a:Ll/v670;

    iget-object v1, p0, Ll/p570;->b:Ljava/util/List;

    iget v2, p0, Ll/p570;->c:I

    iget-boolean v3, p0, Ll/p570;->d:Z

    iget-object v4, p0, Ll/p570;->e:Lcom/p1/mobile/putong/data/User;

    move-object v5, p1

    check-cast v5, Ll/pbi;

    invoke-static/range {v0 .. v5}, Ll/v670;->x0(Ll/v670;Ljava/util/List;IZLcom/p1/mobile/putong/data/User;Ll/pbi;)V

    return-void
.end method
