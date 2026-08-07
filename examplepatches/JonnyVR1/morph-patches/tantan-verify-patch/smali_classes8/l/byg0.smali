.class public final synthetic Ll/byg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uyg0;

.field public final synthetic b:Ll/ylg0;

.field public final synthetic c:Ll/ukg0;

.field public final synthetic d:Ll/bxg0;

.field public final synthetic e:Ll/vsg0;


# direct methods
.method public synthetic constructor <init>(Ll/uyg0;Ll/ylg0;Ll/ukg0;Ll/bxg0;Ll/vsg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/byg0;->a:Ll/uyg0;

    iput-object p2, p0, Ll/byg0;->b:Ll/ylg0;

    iput-object p3, p0, Ll/byg0;->c:Ll/ukg0;

    iput-object p4, p0, Ll/byg0;->d:Ll/bxg0;

    iput-object p5, p0, Ll/byg0;->e:Ll/vsg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/byg0;->a:Ll/uyg0;

    iget-object v1, p0, Ll/byg0;->b:Ll/ylg0;

    iget-object v2, p0, Ll/byg0;->c:Ll/ukg0;

    iget-object v3, p0, Ll/byg0;->d:Ll/bxg0;

    iget-object p0, p0, Ll/byg0;->e:Ll/vsg0;

    invoke-virtual {v0, v1, v2, v3, p0}, Ll/uyg0;->s(Ll/ylg0;Ll/ukg0;Ll/bxg0;Ll/vsg0;)V

    return-void
.end method
