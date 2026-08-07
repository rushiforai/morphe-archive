.class public final synthetic Ll/xgg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/chg0;

.field public final synthetic b:Ll/hrg0;

.field public final synthetic c:Ll/yng0;

.field public final synthetic d:Ll/hrg0;

.field public final synthetic e:Ll/yng0;


# direct methods
.method public synthetic constructor <init>(Ll/chg0;Ll/hrg0;Ll/yng0;Ll/hrg0;Ll/yng0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xgg0;->a:Ll/chg0;

    iput-object p2, p0, Ll/xgg0;->b:Ll/hrg0;

    iput-object p3, p0, Ll/xgg0;->c:Ll/yng0;

    iput-object p4, p0, Ll/xgg0;->d:Ll/hrg0;

    iput-object p5, p0, Ll/xgg0;->e:Ll/yng0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xgg0;->a:Ll/chg0;

    iget-object v1, p0, Ll/xgg0;->b:Ll/hrg0;

    iget-object v2, p0, Ll/xgg0;->c:Ll/yng0;

    iget-object v3, p0, Ll/xgg0;->d:Ll/hrg0;

    iget-object p0, p0, Ll/xgg0;->e:Ll/yng0;

    invoke-virtual {v0, v1, v2, v3, p0}, Ll/chg0;->c(Ll/hrg0;Ll/yng0;Ll/hrg0;Ll/yng0;)V

    return-void
.end method
