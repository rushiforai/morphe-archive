.class public final synthetic Ll/ber;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/der;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Ll/der;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ber;->a:Ll/der;

    iput-object p2, p0, Ll/ber;->b:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ber;->a:Ll/der;

    iget-object p0, p0, Ll/ber;->b:Lcom/p1/mobile/putong/data/Media;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/der;->F(Ll/der;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Integer;)V

    return-void
.end method
