.class public final synthetic Ll/eq4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/dq4$b;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/dq4$b;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eq4;->a:Ll/dq4$b;

    iput p2, p0, Ll/eq4;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eq4;->a:Ll/dq4$b;

    iget p0, p0, Ll/eq4;->b:I

    invoke-static {v0, p0, p1}, Ll/dq4$b;->E(Ll/dq4$b;ILandroid/view/View;)V

    return-void
.end method
