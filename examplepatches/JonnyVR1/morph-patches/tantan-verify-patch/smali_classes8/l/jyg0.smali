.class public final synthetic Ll/jyg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uyg0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/ukg0;

.field public final synthetic d:Ll/bxg0;

.field public final synthetic e:Ll/axg0;


# direct methods
.method public synthetic constructor <init>(Ll/uyg0;Ljava/lang/String;Ll/ukg0;Ll/bxg0;Ll/axg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jyg0;->a:Ll/uyg0;

    iput-object p2, p0, Ll/jyg0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/jyg0;->c:Ll/ukg0;

    iput-object p4, p0, Ll/jyg0;->d:Ll/bxg0;

    iput-object p5, p0, Ll/jyg0;->e:Ll/axg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jyg0;->a:Ll/uyg0;

    iget-object v1, p0, Ll/jyg0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/jyg0;->c:Ll/ukg0;

    iget-object v3, p0, Ll/jyg0;->d:Ll/bxg0;

    iget-object p0, p0, Ll/jyg0;->e:Ll/axg0;

    invoke-virtual {v0, v1, v2, v3, p0}, Ll/uyg0;->n(Ljava/lang/String;Ll/ukg0;Ll/bxg0;Ll/axg0;)V

    return-void
.end method
