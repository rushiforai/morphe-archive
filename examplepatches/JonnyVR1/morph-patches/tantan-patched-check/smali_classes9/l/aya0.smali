.class public final synthetic Ll/aya0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/cya0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/cya0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aya0;->a:Ll/cya0;

    iput p2, p0, Ll/aya0;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aya0;->a:Ll/cya0;

    iget p0, p0, Ll/aya0;->b:I

    invoke-static {v0, p0, p1}, Ll/cya0;->y(Ll/cya0;ILandroid/view/View;)V

    return-void
.end method
