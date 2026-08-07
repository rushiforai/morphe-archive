.class public final synthetic Ll/shr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cir;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/cir;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/shr;->a:Ll/cir;

    iput-object p2, p0, Ll/shr;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/shr;->a:Ll/cir;

    iget-object p0, p0, Ll/shr;->b:Ll/x20;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/cir;->h0(Ll/cir;Ll/x20;Ljava/lang/Boolean;)V

    return-void
.end method
