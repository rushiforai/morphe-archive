.class public final synthetic Ll/wyn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bzn;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/util/List;

.field public final synthetic e:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/bzn;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wyn;->a:Ll/bzn;

    iput-object p2, p0, Ll/wyn;->b:Ljava/util/List;

    iput-object p3, p0, Ll/wyn;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/wyn;->d:Ljava/util/List;

    iput-object p5, p0, Ll/wyn;->e:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wyn;->a:Ll/bzn;

    iget-object v1, p0, Ll/wyn;->b:Ljava/util/List;

    iget-object v2, p0, Ll/wyn;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/wyn;->d:Ljava/util/List;

    iget-object p0, p0, Ll/wyn;->e:Ll/y20;

    invoke-static {v0, v1, v2, v3, p0}, Ll/bzn;->i(Ll/bzn;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ll/y20;)V

    return-void
.end method
