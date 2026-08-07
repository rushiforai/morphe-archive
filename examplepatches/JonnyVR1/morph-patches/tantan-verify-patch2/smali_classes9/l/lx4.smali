.class public final synthetic Ll/lx4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Ll/gt4;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Landroid/text/SpannableStringBuilder;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Ll/gt4;Lcom/p1/mobile/android/app/Act;Landroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lx4;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/lx4;->b:Ll/gt4;

    iput-object p3, p0, Ll/lx4;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/lx4;->d:Landroid/text/SpannableStringBuilder;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lx4;->a:Landroid/widget/TextView;

    iget-object v1, p0, Ll/lx4;->b:Ll/gt4;

    iget-object v2, p0, Ll/lx4;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/lx4;->d:Landroid/text/SpannableStringBuilder;

    check-cast p1, Ll/t5g;

    invoke-static {v0, v1, v2, p0, p1}, Ll/dy4;->p(Landroid/widget/TextView;Ll/gt4;Lcom/p1/mobile/android/app/Act;Landroid/text/SpannableStringBuilder;Ll/t5g;)V

    return-void
.end method
