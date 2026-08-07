.class public final synthetic Ll/yso0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/dum;

.field public final synthetic b:Ll/fto0;


# direct methods
.method public synthetic constructor <init>(Ll/dum;Ll/fto0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yso0;->a:Ll/dum;

    iput-object p2, p0, Ll/yso0;->b:Ll/fto0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yso0;->a:Ll/dum;

    iget-object p0, p0, Ll/yso0;->b:Ll/fto0;

    invoke-static {v0, p0}, Ll/fto0;->c4(Ll/dum;Ll/fto0;)Ll/g0q;

    move-result-object p0

    return-object p0
.end method
