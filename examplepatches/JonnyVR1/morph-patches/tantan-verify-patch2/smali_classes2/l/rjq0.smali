.class public final synthetic Ll/rjq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/sjq0;


# direct methods
.method public synthetic constructor <init>(Ll/sjq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rjq0;->a:Ll/sjq0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rjq0;->a:Ll/sjq0;

    check-cast p1, Ljava/util/HashMap;

    invoke-static {p0, p1}, Ll/sjq0;->H(Ll/sjq0;Ljava/util/HashMap;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
