.class public final synthetic Ll/cx50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/bx50$c;

.field public final synthetic b:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public synthetic constructor <init>(Ll/bx50$c;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cx50;->a:Ll/bx50$c;

    iput-object p2, p0, Ll/cx50;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cx50;->a:Ll/bx50$c;

    iget-object p0, p0, Ll/cx50;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0, p0}, Ll/bx50$c;->a(Ll/bx50$c;Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
