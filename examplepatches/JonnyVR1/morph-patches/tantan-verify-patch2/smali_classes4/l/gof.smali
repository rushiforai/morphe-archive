.class public final synthetic Ll/gof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hof;

.field public final synthetic b:Ll/ox2;


# direct methods
.method public synthetic constructor <init>(Ll/hof;Ll/ox2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gof;->a:Ll/hof;

    iput-object p2, p0, Ll/gof;->b:Ll/ox2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gof;->a:Ll/hof;

    iget-object p0, p0, Ll/gof;->b:Ll/ox2;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/hof;->c(Ll/hof;Ll/ox2;Landroid/util/Pair;)V

    return-void
.end method
