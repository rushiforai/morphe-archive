.class public final synthetic Ll/x3c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/a4c0;


# direct methods
.method public synthetic constructor <init>(Ll/a4c0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x3c0;->a:Ll/a4c0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x3c0;->a:Ll/a4c0;

    check-cast p1, Ll/i1c0;

    invoke-static {p0, p1}, Ll/a4c0;->f0(Ll/a4c0;Ll/i1c0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
