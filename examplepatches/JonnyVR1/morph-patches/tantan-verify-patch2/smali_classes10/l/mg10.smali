.class public final synthetic Ll/mg10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function1;

.field public final synthetic b:Ll/pg10;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;Ll/pg10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mg10;->a:Lkotlin/jvm/functions/Function1;

    iput-object p2, p0, Ll/mg10;->b:Ll/pg10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mg10;->a:Lkotlin/jvm/functions/Function1;

    iget-object p0, p0, Ll/mg10;->b:Ll/pg10;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/pg10;->T3(Lkotlin/jvm/functions/Function1;Ll/pg10;Ljava/util/List;)V

    return-void
.end method
