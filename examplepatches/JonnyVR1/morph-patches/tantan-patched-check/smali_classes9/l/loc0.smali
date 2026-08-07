.class public final synthetic Ll/loc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/soc0;


# direct methods
.method public synthetic constructor <init>(Ll/soc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/loc0;->a:Ll/soc0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/loc0;->a:Ll/soc0;

    check-cast p1, Ll/cwj;

    invoke-static {p0, p1}, Ll/soc0;->L3(Ll/soc0;Ll/cwj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
