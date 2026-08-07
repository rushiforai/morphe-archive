.class public final synthetic Ll/g6w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g6w;->a:Lkotlin/jvm/functions/Function2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g6w;->a:Lkotlin/jvm/functions/Function2;

    invoke-static {p0, p1, p2}, Ll/p6w;->k(Lkotlin/jvm/functions/Function2;Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
