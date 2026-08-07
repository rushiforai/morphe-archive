.class public final synthetic Ll/rnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/snj;


# direct methods
.method public synthetic constructor <init>(Ll/snj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rnj;->a:Ll/snj;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rnj;->a:Ll/snj;

    invoke-static {p0}, Ll/snj;->i(Ll/snj;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
