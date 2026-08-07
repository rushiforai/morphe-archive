.class public final synthetic Ll/w9v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/x9v;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/x9v;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w9v;->a:Ll/x9v;

    iput p2, p0, Ll/w9v;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w9v;->a:Ll/x9v;

    iget p0, p0, Ll/w9v;->b:I

    invoke-static {v0, p0, p1}, Ll/x9v;->a(Ll/x9v;ILandroid/view/View;)V

    return-void
.end method
