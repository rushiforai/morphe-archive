.class public final synthetic Ll/q4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/r4h;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/r4h;Landroid/view/View;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q4h;->a:Ll/r4h;

    iput-object p2, p0, Ll/q4h;->b:Landroid/view/View;

    iput-object p3, p0, Ll/q4h;->c:Ljava/lang/Object;

    iput p4, p0, Ll/q4h;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q4h;->a:Ll/r4h;

    iget-object v1, p0, Ll/q4h;->b:Landroid/view/View;

    iget-object v2, p0, Ll/q4h;->c:Ljava/lang/Object;

    iget p0, p0, Ll/q4h;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Ll/r4h;->s(Ll/r4h;Landroid/view/View;Ljava/lang/Object;ILandroid/view/View;)V

    return-void
.end method
