.class public final synthetic Ll/y56;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/b66$a;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/b66$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y56;->a:Ll/b66$a;

    iput-object p2, p0, Ll/y56;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y56;->a:Ll/b66$a;

    iget-object p0, p0, Ll/y56;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/b66$a;->O(Ll/b66$a;Landroid/view/View;)V

    return-void
.end method
