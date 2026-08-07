.class public final synthetic Ll/c0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/e0h;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:I

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/e0h;Ljava/util/List;ILl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c0h;->a:Ll/e0h;

    iput-object p2, p0, Ll/c0h;->b:Ljava/util/List;

    iput p3, p0, Ll/c0h;->c:I

    iput-object p4, p0, Ll/c0h;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c0h;->a:Ll/e0h;

    iget-object v1, p0, Ll/c0h;->b:Ljava/util/List;

    iget v2, p0, Ll/c0h;->c:I

    iget-object p0, p0, Ll/c0h;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0, p1}, Ll/e0h;->a(Ll/e0h;Ljava/util/List;ILl/y20;Landroid/view/View;)V

    return-void
.end method
