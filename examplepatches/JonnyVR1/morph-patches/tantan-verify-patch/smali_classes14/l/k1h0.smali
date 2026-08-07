.class public final synthetic Ll/k1h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/m1h0;


# direct methods
.method public synthetic constructor <init>(Ll/m1h0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1h0;->a:Ll/m1h0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k1h0;->a:Ll/m1h0;

    check-cast p1, Ll/t4u$a;

    invoke-static {p0, p1}, Ll/m1h0;->Y2(Ll/m1h0;Ll/t4u$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
