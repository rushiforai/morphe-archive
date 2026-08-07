.class public final synthetic Ll/byk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/iyk0;


# direct methods
.method public synthetic constructor <init>(Ll/iyk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/byk0;->a:Ll/iyk0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/byk0;->a:Ll/iyk0;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/iyk0;->F(Ll/iyk0;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
