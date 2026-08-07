.class public final synthetic Ll/ikm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/jkm;


# direct methods
.method public synthetic constructor <init>(Ll/jkm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ikm;->a:Ll/jkm;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikm;->a:Ll/jkm;

    invoke-static {p0}, Ll/jkm;->m(Ll/jkm;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
