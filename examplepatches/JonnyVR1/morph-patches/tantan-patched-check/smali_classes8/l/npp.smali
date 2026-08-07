.class public final synthetic Ll/npp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/npp;->a:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/npp;->a:Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p1}, Ll/eqp;->k0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
