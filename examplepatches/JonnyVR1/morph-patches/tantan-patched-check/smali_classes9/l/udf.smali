.class public final synthetic Ll/udf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/Class;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/udf;->a:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/udf;->a:Ljava/lang/Class;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    invoke-static {p0, p1}, Ll/wdf;->c(Ljava/lang/Class;Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
