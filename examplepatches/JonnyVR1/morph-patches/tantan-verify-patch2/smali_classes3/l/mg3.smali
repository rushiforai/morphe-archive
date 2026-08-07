.class public final synthetic Ll/mg3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mg3;->a:Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;

    iput p2, p0, Ll/mg3;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mg3;->a:Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;

    iget p0, p0, Ll/mg3;->b:I

    check-cast p1, Ljava/lang/Float;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->F(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;ILjava/lang/Float;)V

    return-void
.end method
