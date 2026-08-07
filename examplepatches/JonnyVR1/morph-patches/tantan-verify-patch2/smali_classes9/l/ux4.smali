.class public final synthetic Ll/ux4;
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

.field public final synthetic f:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/gt4;Lcom/p1/mobile/android/app/Act;ILandroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ux4;->a:Ll/gt4;

    iput-object p2, p0, Ll/ux4;->b:Lcom/p1/mobile/android/app/Act;

    iput p3, p0, Ll/ux4;->c:I

    iput-object p4, p0, Ll/ux4;->d:Landroid/widget/TextView;

    iput-object p5, p0, Ll/ux4;->e:Landroid/text/SpannableStringBuilder;

    iput-object p6, p0, Ll/ux4;->f:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ux4;->a:Ll/gt4;

    iget-object v1, p0, Ll/ux4;->b:Lcom/p1/mobile/android/app/Act;

    iget v2, p0, Ll/ux4;->c:I

    iget-object v3, p0, Ll/ux4;->d:Landroid/widget/TextView;

    iget-object v4, p0, Ll/ux4;->e:Landroid/text/SpannableStringBuilder;

    iget-object v5, p0, Ll/ux4;->f:Ljava/util/ArrayList;

    move-object v6, p1

    check-cast v6, Ll/rnd0;

    invoke-static/range {v0 .. v6}, Ll/dy4;->d(Ll/gt4;Lcom/p1/mobile/android/app/Act;ILandroid/widget/TextView;Landroid/text/SpannableStringBuilder;Ljava/util/ArrayList;Ll/rnd0;)V

    return-void
.end method
