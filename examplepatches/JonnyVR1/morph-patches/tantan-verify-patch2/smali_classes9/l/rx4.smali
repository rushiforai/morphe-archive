.class public final synthetic Ll/rx4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Landroid/text/SpannableStringBuilder;

.field public final synthetic c:Ll/t5g;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/t5g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rx4;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/rx4;->b:Landroid/text/SpannableStringBuilder;

    iput-object p3, p0, Ll/rx4;->c:Ll/t5g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rx4;->a:Landroid/widget/TextView;

    iget-object v1, p0, Ll/rx4;->b:Landroid/text/SpannableStringBuilder;

    iget-object p0, p0, Ll/rx4;->c:Ll/t5g;

    check-cast p1, Ll/ruf0;

    invoke-static {v0, v1, p0, p1}, Ll/dy4;->c(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/t5g;Ll/ruf0;)V

    return-void
.end method
