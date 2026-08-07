.class public final synthetic Ll/u7q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;

.field public final synthetic b:Landroid/util/Pair;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u7q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;

    iput-object p2, p0, Ll/u7q;->b:Landroid/util/Pair;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u7q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;

    iget-object p0, p0, Ll/u7q;->b:Landroid/util/Pair;

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;Landroid/util/Pair;[I)V

    return-void
.end method
