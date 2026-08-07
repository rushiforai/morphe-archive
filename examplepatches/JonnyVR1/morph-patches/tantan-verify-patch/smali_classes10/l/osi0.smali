.class public final synthetic Ll/osi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Ljava/lang/CharSequence;

.field public final synthetic c:I

.field public final synthetic d:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Ljava/lang/CharSequence;ILkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/osi0;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/osi0;->b:Ljava/lang/CharSequence;

    iput p3, p0, Ll/osi0;->c:I

    iput-object p4, p0, Ll/osi0;->d:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/osi0;->a:Landroid/widget/TextView;

    iget-object v1, p0, Ll/osi0;->b:Ljava/lang/CharSequence;

    iget v2, p0, Ll/osi0;->c:I

    iget-object p0, p0, Ll/osi0;->d:Lkotlin/jvm/functions/Function1;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, v1, v2, p0, p1}, Ll/psi0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILkotlin/jvm/functions/Function1;Ljava/lang/CharSequence;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
