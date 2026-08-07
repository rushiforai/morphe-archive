.class public final synthetic Ll/cee0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/dee0;

.field public final synthetic b:I

.field public final synthetic c:Lkotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Ll/dee0;ILkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cee0;->a:Ll/dee0;

    iput p2, p0, Ll/cee0;->b:I

    iput-object p3, p0, Ll/cee0;->c:Lkotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cee0;->a:Ll/dee0;

    iget v1, p0, Ll/cee0;->b:I

    iget-object p0, p0, Ll/cee0;->c:Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-static {v0, v1, p0, p1}, Ll/dee0;->A(Ll/dee0;ILkotlin/jvm/internal/Ref$ObjectRef;Landroid/view/View;)V

    return-void
.end method
