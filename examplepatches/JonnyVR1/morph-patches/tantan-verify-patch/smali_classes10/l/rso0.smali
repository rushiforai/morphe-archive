.class public final synthetic Ll/rso0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/sso0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/sso0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rso0;->a:Ll/sso0;

    iput-object p2, p0, Ll/rso0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rso0;->a:Ll/sso0;

    iget-object p0, p0, Ll/rso0;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/sso0;->I(Ll/sso0;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
