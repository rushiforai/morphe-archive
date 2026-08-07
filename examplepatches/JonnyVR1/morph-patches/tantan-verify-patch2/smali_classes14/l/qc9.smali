.class public final synthetic Ll/qc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cd9;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/cd9;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qc9;->a:Ll/cd9;

    iput-object p2, p0, Ll/qc9;->b:Ljava/util/List;

    iput-object p3, p0, Ll/qc9;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qc9;->a:Ll/cd9;

    iget-object v1, p0, Ll/qc9;->b:Ljava/util/List;

    iget-object p0, p0, Ll/qc9;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlVisitor;

    invoke-static {v0, v1, p0, p1}, Ll/cd9;->i3(Ll/cd9;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/IntlVisitor;)V

    return-void
.end method
