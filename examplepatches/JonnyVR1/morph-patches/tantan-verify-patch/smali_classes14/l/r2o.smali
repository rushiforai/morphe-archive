.class public final synthetic Ll/r2o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/h3o;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/h3o;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r2o;->a:Ll/h3o;

    iput-object p2, p0, Ll/r2o;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r2o;->a:Ll/h3o;

    iget-object p0, p0, Ll/r2o;->b:Ljava/util/List;

    check-cast p1, Ll/p5u;

    invoke-static {v0, p0, p1}, Ll/h3o;->h(Ll/h3o;Ljava/util/List;Ll/p5u;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
