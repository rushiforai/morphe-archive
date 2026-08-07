.class public final synthetic Ll/jxs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/kxs;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/kxs;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jxs;->a:Ll/kxs;

    iput p2, p0, Ll/jxs;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jxs;->a:Ll/kxs;

    iget p0, p0, Ll/jxs;->b:I

    invoke-static {v0, p0, p1}, Ll/kxs;->c(Ll/kxs;ILandroid/view/View;)V

    return-void
.end method
