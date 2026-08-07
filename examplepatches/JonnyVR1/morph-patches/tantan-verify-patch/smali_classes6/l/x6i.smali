.class public final synthetic Ll/x6i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dj70;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/dj70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x6i;->a:Ll/dj70;

    iput-object p2, p0, Ll/x6i;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x6i;->a:Ll/dj70;

    iget-object p0, p0, Ll/x6i;->b:Landroid/view/View;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, p0, p1}, Ll/f7i;->b(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
