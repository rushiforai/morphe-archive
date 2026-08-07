.class public final synthetic Ll/pwb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qwb0;

.field public final synthetic b:I

.field public final synthetic c:Ll/nwb0;


# direct methods
.method public synthetic constructor <init>(Ll/qwb0;ILl/nwb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pwb0;->a:Ll/qwb0;

    iput p2, p0, Ll/pwb0;->b:I

    iput-object p3, p0, Ll/pwb0;->c:Ll/nwb0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pwb0;->a:Ll/qwb0;

    iget v1, p0, Ll/pwb0;->b:I

    iget-object p0, p0, Ll/pwb0;->c:Ll/nwb0;

    invoke-static {v0, v1, p0, p1}, Ll/qwb0;->E(Ll/qwb0;ILl/nwb0;Landroid/view/View;)V

    return-void
.end method
