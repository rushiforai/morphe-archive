.class public final synthetic Ll/rxs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/sxs;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/sxs;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rxs;->a:Ll/sxs;

    iput p2, p0, Ll/rxs;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rxs;->a:Ll/sxs;

    iget p0, p0, Ll/rxs;->b:I

    invoke-static {v0, p0, p1}, Ll/sxs;->a(Ll/sxs;ILandroid/view/View;)V

    return-void
.end method
