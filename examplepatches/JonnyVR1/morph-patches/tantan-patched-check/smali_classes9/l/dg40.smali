.class public final synthetic Ll/dg40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ig40;

.field public final synthetic b:I

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/ig40;ILjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dg40;->a:Ll/ig40;

    iput p2, p0, Ll/dg40;->b:I

    iput-object p3, p0, Ll/dg40;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dg40;->a:Ll/ig40;

    iget v1, p0, Ll/dg40;->b:I

    iget-object p0, p0, Ll/dg40;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-static {v0, v1, p0, p1}, Ll/ig40;->t(Ll/ig40;ILjava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method
