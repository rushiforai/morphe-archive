.class public final synthetic Ll/ssi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/vsi0;

.field public final synthetic b:Ll/ygj0;


# direct methods
.method public synthetic constructor <init>(Ll/vsi0;Ll/ygj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ssi0;->a:Ll/vsi0;

    iput-object p2, p0, Ll/ssi0;->b:Ll/ygj0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ssi0;->a:Ll/vsi0;

    iget-object p0, p0, Ll/ssi0;->b:Ll/ygj0;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p0, p1}, Ll/vsi0;->c(Ll/vsi0;Ll/ygj0;Ljava/lang/CharSequence;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
