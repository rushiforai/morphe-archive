.class public final synthetic Ll/eos;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/gos;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$ObjectRef;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/gos;Lkotlin/jvm/internal/Ref$ObjectRef;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eos;->a:Ll/gos;

    iput-object p2, p0, Ll/eos;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    iput p3, p0, Ll/eos;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eos;->a:Ll/gos;

    iget-object v1, p0, Ll/eos;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget p0, p0, Ll/eos;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/gos;->L(Ll/gos;Lkotlin/jvm/internal/Ref$ObjectRef;ILandroid/view/View;)V

    return-void
.end method
