.class public final synthetic Ll/saj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ibj;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/ibj;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/saj;->a:Ll/ibj;

    iput-wide p2, p0, Ll/saj;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/saj;->a:Ll/ibj;

    iget-wide v1, p0, Ll/saj;->b:J

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, v2, p1}, Ll/ibj;->I(Ll/ibj;JLl/pf60;)V

    return-void
.end method
