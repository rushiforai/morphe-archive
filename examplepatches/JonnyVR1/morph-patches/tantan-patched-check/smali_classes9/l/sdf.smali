.class public final synthetic Ll/sdf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(ILjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/sdf;->a:I

    iput-object p2, p0, Ll/sdf;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/sdf;->a:I

    iget-object p0, p0, Ll/sdf;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    invoke-static {v0, p0, p1}, Ll/wdf;->b(ILjava/util/List;Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)V

    return-void
.end method
