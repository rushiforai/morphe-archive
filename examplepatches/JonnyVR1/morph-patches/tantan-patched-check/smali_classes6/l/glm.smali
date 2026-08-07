.class public final synthetic Ll/glm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nlm;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/nlm;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/glm;->a:Ll/nlm;

    iput p2, p0, Ll/glm;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/glm;->a:Ll/nlm;

    iget p0, p0, Ll/glm;->b:I

    invoke-static {v0, p0, p1}, Ll/nlm;->z(Ll/nlm;ILandroid/view/View;)V

    return-void
.end method
