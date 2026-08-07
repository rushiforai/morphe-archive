.class Ll/d610$b;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d610;->j(Ll/o7m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/d610;


# direct methods
.method public constructor <init>(Ll/d610;Ll/o7m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d610$b;->a:Ll/d610;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/d610$b;->a:Ll/d610;

    .line 2
    .line 3
    iget-object v0, p0, Ll/d610;->e:Ll/puq0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/d610;->c:Ljava/util/HashMap;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, p0, v1}, Ll/puq0;->f(Ljava/util/HashMap;Ll/o7m;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
