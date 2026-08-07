.class public final synthetic Ll/e0v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/g4s;

.field public final synthetic b:Ll/gqo0;


# direct methods
.method public synthetic constructor <init>(Ll/g4s;Ll/gqo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e0v;->a:Ll/g4s;

    iput-object p2, p0, Ll/e0v;->b:Ll/gqo0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e0v;->a:Ll/g4s;

    iget-object p0, p0, Ll/e0v;->b:Ll/gqo0;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/g0v;->d(Ll/g4s;Ll/gqo0;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
