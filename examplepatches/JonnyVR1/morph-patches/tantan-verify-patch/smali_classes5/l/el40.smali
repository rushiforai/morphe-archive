.class public final synthetic Ll/el40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/el40;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/el40;->a:I

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    invoke-static {p0, p1}, Ll/fl40;->s(ILcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
