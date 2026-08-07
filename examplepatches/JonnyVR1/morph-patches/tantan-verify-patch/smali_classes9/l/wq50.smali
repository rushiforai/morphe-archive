.class public final synthetic Ll/wq50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wq50;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wq50;->a:Ljava/lang/String;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/ar50;->b(Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
