.class public final synthetic Ll/vh20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/th20$c;

.field public final synthetic b:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public synthetic constructor <init>(Ll/th20$c;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vh20;->a:Ll/th20$c;

    iput-object p2, p0, Ll/vh20;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vh20;->a:Ll/th20$c;

    iget-object p0, p0, Ll/vh20;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0, p0}, Ll/th20$c;->b(Ll/th20$c;Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
