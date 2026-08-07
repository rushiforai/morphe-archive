.class public final synthetic Ll/j6b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j6b;->a:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j6b;->a:Ljava/util/HashMap;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivateCustomCard;

    invoke-static {p0, p1}, Ll/y6b;->h3(Ljava/util/HashMap;Lcom/p1/mobile/putong/core/data/PrivateCustomCard;)V

    return-void
.end method
