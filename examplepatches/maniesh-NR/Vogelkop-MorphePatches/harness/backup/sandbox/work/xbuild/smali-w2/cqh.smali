.class public final synthetic Lcqh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/RecyclerView;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:Lu5l;


# direct methods
.method public synthetic constructor <init>(Landroidx/recyclerview/widget/RecyclerView;IIIILu5l;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcqh;->a:Landroidx/recyclerview/widget/RecyclerView;

    iput p2, p0, Lcqh;->b:I

    iput p3, p0, Lcqh;->c:I

    iput p4, p0, Lcqh;->d:I

    iput p5, p0, Lcqh;->e:I

    iput-object p6, p0, Lcqh;->f:Lu5l;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-object v5, p0, Lcqh;->f:Lu5l;

    const/4 v6, 0x0

    iget-object v0, p0, Lcqh;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget v1, p0, Lcqh;->b:I

    iget v2, p0, Lcqh;->c:I

    iget v3, p0, Lcqh;->d:I

    iget v4, p0, Lcqh;->e:I

    invoke-static/range {v0 .. v6}, Lexg;->y(Landroidx/recyclerview/widget/RecyclerView;IIIILu5l;Z)V

    return-void
.end method
