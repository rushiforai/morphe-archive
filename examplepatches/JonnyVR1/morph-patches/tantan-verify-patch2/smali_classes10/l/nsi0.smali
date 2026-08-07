.class public final synthetic Ll/nsi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/ygj0;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;

.field public final synthetic c:Landroid/widget/TextView;

.field public final synthetic d:Ljava/lang/CharSequence;

.field public final synthetic e:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Ll/ygj0;Lkotlin/jvm/functions/Function1;Landroid/widget/TextView;Ljava/lang/CharSequence;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nsi0;->a:Ll/ygj0;

    iput-object p2, p0, Ll/nsi0;->b:Lkotlin/jvm/functions/Function1;

    iput-object p3, p0, Ll/nsi0;->c:Landroid/widget/TextView;

    iput-object p4, p0, Ll/nsi0;->d:Ljava/lang/CharSequence;

    iput-object p5, p0, Ll/nsi0;->e:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/nsi0;->a:Ll/ygj0;

    iget-object v1, p0, Ll/nsi0;->b:Lkotlin/jvm/functions/Function1;

    iget-object v2, p0, Ll/nsi0;->c:Landroid/widget/TextView;

    iget-object v3, p0, Ll/nsi0;->d:Ljava/lang/CharSequence;

    iget-object v4, p0, Ll/nsi0;->e:Landroid/view/ViewGroup;

    move-object v5, p1

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static/range {v0 .. v5}, Ll/psi0;->a(Ll/ygj0;Lkotlin/jvm/functions/Function1;Landroid/widget/TextView;Ljava/lang/CharSequence;Landroid/view/ViewGroup;Ljava/lang/CharSequence;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
