.class public final synthetic Ll/ep70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/hp70;


# direct methods
.method public synthetic constructor <init>(Ll/hp70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ep70;->a:Ll/hp70;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ep70;->a:Ll/hp70;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/hp70;->b(Ll/hp70;Ljava/lang/Long;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
