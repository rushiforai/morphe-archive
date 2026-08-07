.class public final synthetic Ll/p03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function0;

.field public final synthetic b:Ll/r03;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;Ll/r03;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p03;->a:Lkotlin/jvm/functions/Function0;

    iput-object p2, p0, Ll/p03;->b:Ll/r03;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p03;->a:Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Ll/p03;->b:Ll/r03;

    invoke-static {v0, p0, p1}, Ll/r03;->c(Lkotlin/jvm/functions/Function0;Ll/r03;Landroid/view/View;)V

    return-void
.end method
