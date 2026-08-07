.class public final synthetic Ll/wsm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wsm0;->a:Lcom/p1/mobile/putong/data/User;

    iput p2, p0, Ll/wsm0;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wsm0;->a:Lcom/p1/mobile/putong/data/User;

    iget p0, p0, Ll/wsm0;->b:I

    check-cast p1, Ll/uwl;

    invoke-static {v0, p0, p1}, Ll/atm0;->U3(Lcom/p1/mobile/putong/data/User;ILl/uwl;)V

    return-void
.end method
