.class public final synthetic Ll/y200;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/c300;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/c300;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y200;->a:Ll/c300;

    iput p2, p0, Ll/y200;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y200;->a:Ll/c300;

    iget p0, p0, Ll/y200;->b:I

    invoke-static {v0, p0, p1}, Ll/c300;->H(Ll/c300;ILandroid/view/View;)V

    return-void
.end method
