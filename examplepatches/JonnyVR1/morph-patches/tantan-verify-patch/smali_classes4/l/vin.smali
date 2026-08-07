.class public final synthetic Ll/vin;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/fjn;


# direct methods
.method public synthetic constructor <init>(Ll/fjn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vin;->a:Ll/fjn;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vin;->a:Ll/fjn;

    check-cast p1, Ll/hin;

    invoke-static {p0, p1}, Ll/fjn;->V3(Ll/fjn;Ll/hin;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
