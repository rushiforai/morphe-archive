.class public final synthetic Ll/bye;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/cye;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/cye;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bye;->a:Ll/cye;

    iput p2, p0, Ll/bye;->b:I

    iput p3, p0, Ll/bye;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bye;->a:Ll/cye;

    iget v1, p0, Ll/bye;->b:I

    iget p0, p0, Ll/bye;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/cye;->y(Ll/cye;IILandroid/view/View;)V

    return-void
.end method
