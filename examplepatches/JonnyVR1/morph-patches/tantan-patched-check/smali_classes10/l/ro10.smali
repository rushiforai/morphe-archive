.class public final synthetic Ll/ro10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wo10;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/wo10;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ro10;->a:Ll/wo10;

    iput p2, p0, Ll/ro10;->b:I

    iput p3, p0, Ll/ro10;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ro10;->a:Ll/wo10;

    iget v1, p0, Ll/ro10;->b:I

    iget p0, p0, Ll/ro10;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/wo10;->J3(Ll/wo10;IILandroid/view/View;)V

    return-void
.end method
