.class public final synthetic Ll/yu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zu;

.field public final synthetic b:Ll/zu$b;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/zu;Ll/zu$b;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yu;->a:Ll/zu;

    iput-object p2, p0, Ll/yu;->b:Ll/zu$b;

    iput p3, p0, Ll/yu;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yu;->a:Ll/zu;

    iget-object v1, p0, Ll/yu;->b:Ll/zu$b;

    iget p0, p0, Ll/yu;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/zu;->y(Ll/zu;Ll/zu$b;ILandroid/view/View;)V

    return-void
.end method
