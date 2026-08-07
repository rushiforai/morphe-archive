.class public final synthetic Ll/sk6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tk6;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/tk6;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sk6;->a:Ll/tk6;

    iput p2, p0, Ll/sk6;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sk6;->a:Ll/tk6;

    iget p0, p0, Ll/sk6;->b:I

    invoke-static {v0, p0, p1}, Ll/tk6;->E(Ll/tk6;ILandroid/view/View;)V

    return-void
.end method
