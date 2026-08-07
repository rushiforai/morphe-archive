.class public final synthetic Ll/f960;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f960;->a:Landroid/view/View;

    iput-object p2, p0, Ll/f960;->b:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f960;->a:Landroid/view/View;

    iget-object p0, p0, Ll/f960;->b:Lkotlin/jvm/functions/Function0;

    invoke-static {v0, p0}, Ll/l960;->d(Landroid/view/View;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method
