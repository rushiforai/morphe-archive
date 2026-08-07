.class public final synthetic Ll/au;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/du;

.field public final synthetic b:I

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/du;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/au;->a:Ll/du;

    iput p2, p0, Ll/au;->b:I

    iput-boolean p3, p0, Ll/au;->c:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/au;->a:Ll/du;

    iget v1, p0, Ll/au;->b:I

    iget-boolean p0, p0, Ll/au;->c:Z

    invoke-static {v0, v1, p0, p1}, Ll/du;->d(Ll/du;IZLandroid/view/View;)V

    return-void
.end method
