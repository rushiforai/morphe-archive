.class public final synthetic Ll/e0g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qm50;


# instance fields
.field public final synthetic a:Ll/f0g0;


# direct methods
.method public synthetic constructor <init>(Ll/f0g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e0g0;->a:Ll/f0g0;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e0g0;->a:Ll/f0g0;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return-void
.end method
