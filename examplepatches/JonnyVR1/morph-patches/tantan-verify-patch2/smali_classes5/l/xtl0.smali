.class public final synthetic Ll/xtl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eul0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/eul0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xtl0;->a:Ll/eul0;

    iput-boolean p2, p0, Ll/xtl0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xtl0;->a:Ll/eul0;

    iget-boolean p0, p0, Ll/xtl0;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/eul0;->j(Ll/eul0;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
