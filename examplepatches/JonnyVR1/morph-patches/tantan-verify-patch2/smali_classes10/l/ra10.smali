.class public final synthetic Ll/ra10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/ua10;


# direct methods
.method public synthetic constructor <init>(Ll/ua10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ra10;->a:Ll/ua10;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ra10;->a:Ll/ua10;

    check-cast p1, Ll/s910;

    invoke-static {p0, p1}, Ll/ua10;->K3(Ll/ua10;Ll/s910;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
