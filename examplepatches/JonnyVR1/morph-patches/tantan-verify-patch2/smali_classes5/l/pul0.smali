.class public final synthetic Ll/pul0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sul0;


# direct methods
.method public synthetic constructor <init>(Ll/sul0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pul0;->a:Ll/sul0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pul0;->a:Ll/sul0;

    check-cast p1, Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {p0, p1}, Ll/sul0;->s(Ll/sul0;Lcom/p1/mobile/putong/data/MessageLocation;)V

    return-void
.end method
