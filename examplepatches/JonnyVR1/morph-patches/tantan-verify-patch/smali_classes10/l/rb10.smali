.class public final synthetic Ll/rb10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function0;

.field public final synthetic b:Ll/i6t;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;Ll/i6t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rb10;->a:Lkotlin/jvm/functions/Function0;

    iput-object p2, p0, Ll/rb10;->b:Ll/i6t;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rb10;->a:Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Ll/rb10;->b:Ll/i6t;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p0, p1}, Ll/vb10;->f(Lkotlin/jvm/functions/Function0;Ll/i6t;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
