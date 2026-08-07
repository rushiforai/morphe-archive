.class public final synthetic Ll/jlm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nlm;

.field public final synthetic b:Landroidx/recyclerview/widget/RecyclerView$e0;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ll/nlm;Landroidx/recyclerview/widget/RecyclerView$e0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jlm;->a:Ll/nlm;

    iput-object p2, p0, Ll/jlm;->b:Landroidx/recyclerview/widget/RecyclerView$e0;

    iput-object p3, p0, Ll/jlm;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jlm;->a:Ll/nlm;

    iget-object v1, p0, Ll/jlm;->b:Landroidx/recyclerview/widget/RecyclerView$e0;

    iget-object p0, p0, Ll/jlm;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/nlm;->C(Ll/nlm;Landroidx/recyclerview/widget/RecyclerView$e0;Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method
