.class public final synthetic Ll/nyd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/ryd0;


# direct methods
.method public synthetic constructor <init>(Ll/ryd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nyd0;->a:Ll/ryd0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nyd0;->a:Ll/ryd0;

    invoke-static {p0}, Ll/oyd0$a;->a(Ll/ryd0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
