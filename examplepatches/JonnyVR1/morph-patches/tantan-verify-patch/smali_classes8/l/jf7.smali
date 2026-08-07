.class public final synthetic Ll/jf7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/of7;


# direct methods
.method public synthetic constructor <init>(Ll/of7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jf7;->a:Ll/of7;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jf7;->a:Ll/of7;

    check-cast p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    invoke-static {p0, p1}, Ll/of7;->b(Ll/of7;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    return-void
.end method
