.class public final synthetic Ll/raf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/taf;

.field public final synthetic b:Landroidx/recyclerview/widget/n;


# direct methods
.method public synthetic constructor <init>(Ll/taf;Landroidx/recyclerview/widget/n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/raf;->a:Ll/taf;

    iput-object p2, p0, Ll/raf;->b:Landroidx/recyclerview/widget/n;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/raf;->a:Ll/taf;

    iget-object p0, p0, Ll/raf;->b:Landroidx/recyclerview/widget/n;

    invoke-static {v0, p0}, Ll/taf;->a(Ll/taf;Landroidx/recyclerview/widget/n;)V

    return-void
.end method
