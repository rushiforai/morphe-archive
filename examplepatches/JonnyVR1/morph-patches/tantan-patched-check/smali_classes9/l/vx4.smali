.class public final synthetic Ll/vx4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gt4;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:I

.field public final synthetic d:Landroid/widget/TextView;

.field public final synthetic e:Landroid/text/SpannableStringBuilder;


# direct methods
.method public synthetic constructor <init>(Ll/gt4;Lcom/p1/mobile/android/app/Act;ILandroid/widget/TextView;Landroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vx4;->a:Ll/gt4;

    iput-object p2, p0, Ll/vx4;->b:Lcom/p1/mobile/android/app/Act;

    iput p3, p0, Ll/vx4;->c:I

    iput-object p4, p0, Ll/vx4;->d:Landroid/widget/TextView;

    iput-object p5, p0, Ll/vx4;->e:Landroid/text/SpannableStringBuilder;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/vx4;->a:Ll/gt4;

    iget-object v1, p0, Ll/vx4;->b:Lcom/p1/mobile/android/app/Act;

    iget v2, p0, Ll/vx4;->c:I

    iget-object v3, p0, Ll/vx4;->d:Landroid/widget/TextView;

    iget-object v4, p0, Ll/vx4;->e:Landroid/text/SpannableStringBuilder;

    move-object v5, p1

    check-cast v5, Ll/hi20;

    invoke-static/range {v0 .. v5}, Ll/dy4;->k(Ll/gt4;Lcom/p1/mobile/android/app/Act;ILandroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ll/hi20;)V

    return-void
.end method
