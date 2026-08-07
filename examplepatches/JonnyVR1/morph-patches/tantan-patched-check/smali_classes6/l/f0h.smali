.class public final synthetic Ll/f0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t0h;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/t0h;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f0h;->a:Ll/t0h;

    iput-wide p2, p0, Ll/f0h;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f0h;->a:Ll/t0h;

    iget-wide v1, p0, Ll/f0h;->b:J

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, v2, p1}, Ll/t0h;->N(Ll/t0h;JLl/pf60;)V

    return-void
.end method
