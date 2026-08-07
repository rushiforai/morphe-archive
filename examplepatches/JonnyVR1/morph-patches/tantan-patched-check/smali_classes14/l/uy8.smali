.class public final synthetic Ll/uy8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uy8;->a:Ljava/util/List;

    iput-object p2, p0, Ll/uy8;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uy8;->a:Ljava/util/List;

    iget-object p0, p0, Ll/uy8;->b:Ljava/util/List;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/j;->X4(Ljava/util/List;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
