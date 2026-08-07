.class public final synthetic Ll/td2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ud2;

.field public final synthetic b:Ll/od2;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Landroid/view/View;

.field public final synthetic e:[I


# direct methods
.method public synthetic constructor <init>(Ll/ud2;Ll/od2;Landroid/view/View;Landroid/view/View;[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/td2;->a:Ll/ud2;

    iput-object p2, p0, Ll/td2;->b:Ll/od2;

    iput-object p3, p0, Ll/td2;->c:Landroid/view/View;

    iput-object p4, p0, Ll/td2;->d:Landroid/view/View;

    iput-object p5, p0, Ll/td2;->e:[I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/td2;->a:Ll/ud2;

    iget-object v1, p0, Ll/td2;->b:Ll/od2;

    iget-object v2, p0, Ll/td2;->c:Landroid/view/View;

    iget-object v3, p0, Ll/td2;->d:Landroid/view/View;

    iget-object p0, p0, Ll/td2;->e:[I

    invoke-static {v0, v1, v2, v3, p0}, Ll/ud2;->a(Ll/ud2;Ll/od2;Landroid/view/View;Landroid/view/View;[I)V

    return-void
.end method
